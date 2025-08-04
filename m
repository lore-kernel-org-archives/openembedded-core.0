Return-Path: <nikhil.r@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32912C87FDA
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 04:42:42 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.69])
 by mx.groups.io with SMTP id smtpd.web10.10804.1754282554035027769
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Aug 2025 21:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=oBaYOTYx;
 spf=pass (domain: kpit.com, ip: 40.107.57.69, mailfrom: nikhil.r@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIDbzhjKkR3TRnOoEgciT9rMClM9Q0KZNf4ti+miP9mnRjp6ednTaaw9xnYizEAC47Adkvponr5FPSTRop3xih26jmRg3YO+GGs8OdHdTWr8HSqgJeyBlZZh5SGb75o1edcRVmqka5p2EZ8fVnSNYxSC3TwtTRpJPMQP3LwdNisKppfkGrmxyC0wRue/2793Z92xGfKJxqHvoY10XO7TnMyZQVq3RVMgeB+sqPqztcBPGIsGE3LANgcpwZVRfYiTMdcNU9Z1dzVsdOLVcWasoywL9EqIqhm/JUiX1StWHhQH7wHX9Fc2yKcP7rMb5OCFUHYx3tnoXsUFNu9DRYkwCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0iVcEOtwmWtz3Y1bC9yQzJMvFHpQdweDSzO9uD6wDU=;
 b=fojId2q23T0dKzBOotWzQKW7uv7oJEw8xmrW5NaIzbwwQQx/lz+JoGfx12ksUnM/QYzGeoFQHh+h+I5+KAHs4xi9t04lmruSjgkMZ0fQ+Vs6XDkpP5vEI6hJUhHvXWp4YgexYCJ2PfoodI34HKlH5ungyU82gR0oIzGdbgq5d2hRdunWhOI2T/ytzZJbLMItw+t7coHrWBBISYdN9EbbjgPrU2pPbTqhgVS89ijsU0Cbr0v0737vUiTPNBXvSNONjQXbPAaGaCotHv9/4bFkawE7Bes7ifpEUilQ8cczIWapUsHyXMsF/qsDtJbw6nXXjQ8qg82kexYoQK1f+lZ0Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0iVcEOtwmWtz3Y1bC9yQzJMvFHpQdweDSzO9uD6wDU=;
 b=oBaYOTYxoeajYjxGrYtcGs0BMIPHCtyCH/V7w++8hU0xSOXxWqVzoXe7psAQ53dtMijBu8f6fy+HrpL7eeHauZSKiXrSO5iDsuN96Ada0/FhFcZEoBS2OZo+9Wetsf6NwNSWfxPfZ1LCnUubZQYWd7AlmO/RjE/4dMrrio6F2fE=
Received: from MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d1::12)
 by MAZPR01MB7480.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:53::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 04:42:25 +0000
Received: from MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d793:8439:6db7:9272]) by MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d793:8439:6db7:9272%4]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 04:42:25 +0000
From: Nikhil R <Nikhil.R@kpit.com>
To: Steve Sakoman <steve@sakoman.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: 
 =?Windows-1252?Q?Re:_[oe-core][ltp]_LTP_20250130_fails_to_run_due_to_miss?=
 =?Windows-1252?Q?ing_kirk_=96_should_kirk_be_packaged_separately=3F?=
Thread-Topic: 
 =?Windows-1252?Q?[oe-core][ltp]_LTP_20250130_fails_to_run_due_to_missing_?=
 =?Windows-1252?Q?kirk_=96_should_kirk_be_packaged_separately=3F?=
Thread-Index: AQHcAiPtZhslxtHV+06ypYe/0O0xErRR7zDB
Date: Mon, 4 Aug 2025 04:42:25 +0000
Message-ID: 
 <MAZPR01MB89508173F18D95C17C741C98EE23A@MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM>
References: 
 <MAZPR01MB8950AA2D5C8F86D05817FDB9EE27A@MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: 
 <MAZPR01MB8950AA2D5C8F86D05817FDB9EE27A@MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAZPR01MB8950:EE_|MAZPR01MB7480:EE_
x-ms-office365-filtering-correlation-id: e882df00-3749-4d45-663e-08ddd3114f0c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|31052699007|39142699007|366016|376014|1800799024|8096899003|38070700018|13003099007;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?p9RlHiO1eqITDP+Vv0yzuKv94v25PKx1fptrmB2jdIumowS9/CpbwCMw?=
 =?Windows-1252?Q?CTVijL7YE+rWGR+AoYzWrcyPezeDfh9xXjRN7jnDxY+3y7youHuidNWY?=
 =?Windows-1252?Q?Xg+nu8YOApLigjsd45quPjusSdEoUty/w5iSt24qxRNrL3UQUFYmSLQK?=
 =?Windows-1252?Q?7MbXVCfup+SeRL65rjIWsokUYAnglhZeWVh76v3By2hZGo1+P5+bDgdS?=
 =?Windows-1252?Q?cuPDDfDnImUQntloMzdrp7I/FnH/A0q3jxnEGmBLFDUBkNwifTiEtuV4?=
 =?Windows-1252?Q?J5+uwCrPcyL34W8IKIE9hUYMEDXEF2XdaEPO2K3hOcxONRSds3dvbRyc?=
 =?Windows-1252?Q?3vbLglbSue+NV/M8u+9WDTU6GQ3Kr2rHs3hOKyZK0k2f3hZqQALIpbcC?=
 =?Windows-1252?Q?GAJ7zIr4Ts0Ygdm4nzQeI8LLblhAijq/pZfE0j4AyUJ0HRg1fRqg/JaP?=
 =?Windows-1252?Q?sB5CWI6aMhylbhK1//aJk32MSp/0TeFfAfdD/d+Lwc21DuPtyIHphCGQ?=
 =?Windows-1252?Q?/hauU6czHYN1nUMUj7T+Y1kCguV1ahg1QlnNu3xFlpBjdD/fdxHaWlMv?=
 =?Windows-1252?Q?7Rq7Eiak1VcZ/cfHw7ac7ds68s5wNY+QzEUFhIPS7mqn6a2DSaJZY1/3?=
 =?Windows-1252?Q?CVv03OSJiwZVo3WiGFxTBxYDp2e8F5tFYM2i95AMFLwK84x7sNa/YQHp?=
 =?Windows-1252?Q?vRQQ5cne+hjslMrjYzx2SfCih7nGcutZEiuDayGgVeasu+dMbyc9xB29?=
 =?Windows-1252?Q?7LzilSxifeajj2Ycxv80lAPqvMnc/BIIY25iQ22F+7OGG/arQ3KFXs8w?=
 =?Windows-1252?Q?NdcxIirt+nZgC6YaI9s0Lzko/y5KPgyIEpSQqZJS7rZ/EsWYlrXkf3YR?=
 =?Windows-1252?Q?fJgWFgdHYDn1+Nsbz8QI8Pe11D5apBaHL10quxkaDfVcEjOgf82SLy0M?=
 =?Windows-1252?Q?kgAcG0Le4kHuXH323x5L5Re9kodOii6qhxyYZld7i8j75SdBHWiclo7g?=
 =?Windows-1252?Q?dZ4LF0BvobCyVQ7iKPziNOTzqnoKV6pNgeeNs3Z3GSrj6xd0nxTgjdV7?=
 =?Windows-1252?Q?//UtYMQHO1GNhOcpx7g99+rnTOm3Ig6BDZGcNq9fBm5r8JzMQYlkNx71?=
 =?Windows-1252?Q?kG9H0KP5xyL8XeMEa5eFbUFrwEIRVaTeTQN9pNTUFR/c3U2io6vSsvFF?=
 =?Windows-1252?Q?kmQ0YtsrTrlsq5DkKapdEmGda7D46796VY2SC+7F1LVF6fIX4usA0YJ/?=
 =?Windows-1252?Q?yZwxGyB912rxpPlAwVimFACbRgf3glw/NoB7aaV3v+6cBkiRbCBaKvK4?=
 =?Windows-1252?Q?WE/fSdFkZJdQZDz4QwubXVVJCKadIMXGvX/ESkQYItUuFvwkqtJwe7of?=
 =?Windows-1252?Q?spKiIruyKXP5JSXbQPiepIeGG114M6tZeJkhysAcnmS0lIl1JojqBQOh?=
 =?Windows-1252?Q?0KakvruW4Wx1di1KwerCUwZhK8+TMUQWx9AdYmcjnTAaO/+F4vJok3ST?=
 =?Windows-1252?Q?msWhJnG5Ga3LQVQH5peBWEptY8wj+wJscYgzOKk/Y7O2xAweG9ErzHxN?=
 =?Windows-1252?Q?kcEskT+g4PpeDu+rvbucJwGZ836MOLZp3P9FDGJY6EPXxuVydfR7bG/b?=
 =?Windows-1252?Q?2c8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(31052699007)(39142699007)(366016)(376014)(1800799024)(8096899003)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?kjE/K+rD8NrL9Y1AcW5uDaJYB0FOfgGUNy2KgcsmjByMVhZmtIpsPhvP?=
 =?Windows-1252?Q?XG0aa1ze5LhTmIFfh4PyOF3fyI+ukkMXuiO7ucw4ooHThy4r5JtUbEsw?=
 =?Windows-1252?Q?F3CEPMjQ6hOFpYSzCZS2AON9iJ2yxbDyaPUCL9oPmJL4njxqD+TGFXVx?=
 =?Windows-1252?Q?lOrzEGGs0g/CMaCHqzOR5Ua0+S7TcfONiaM+NkzvozneemeZQ9icjEz9?=
 =?Windows-1252?Q?eCBZE8bl8GD4Eq7QL/WvxA5fRSt/pXDoyPiFJt98LCWpAdxziVhUtyeH?=
 =?Windows-1252?Q?bHn1LJMMYnF5GF1wa6/TfzHi3oEtBne8DA35JzLT/BhboGeIOm+jDgoI?=
 =?Windows-1252?Q?wOyccsCTxz/U4NmuXgKktLm4uV3c92aqtyuQUOJjRpyx9xUkWvfZPMwY?=
 =?Windows-1252?Q?fvUTrEN/EdygWkHqoSHnUDzRSIfREOf8nZ/BGTEtSsldZ0ALC4sBlVbo?=
 =?Windows-1252?Q?zby/d55I7prKaYI7Emk22yZvxyrBF46jygAd1HkuAYxbPkxAZdlj7We2?=
 =?Windows-1252?Q?/ngiJ+DfuuNhU+cL+QTrV2hIqyalIJnX3dULZSTwRcCjUgTgTkCa1RIJ?=
 =?Windows-1252?Q?iBkhre3eGvkNTCwLg+u4adLx3xTsHvlh/+pBRJVwUkIadCU0qMl0STsQ?=
 =?Windows-1252?Q?6n2/nNeZKQz7VSKX7sQ2NPtlPFG7o4FSs0eTILgwHxhbUkInga25sAhe?=
 =?Windows-1252?Q?XiUO+Q+Cf2ZJCPOQGOxPkJVwPhVQrYX6i2hVu/+9oVEKd1sJNw2+Av4W?=
 =?Windows-1252?Q?eayxNPkgLC0WEMF2GEwCqscuoHlRX07A34AIAI0lswAdvZShF9m3tv8s?=
 =?Windows-1252?Q?dOiGR9jCdgCM4oQMe1bP494Ad8Vi/tUX8+BuL2gGY8va57fbPeYVU8R3?=
 =?Windows-1252?Q?WU0hjtaWveDm7X9cKSr4koULupRj4AfIsVsfPKeCXkB7YZIqFS/EAqz7?=
 =?Windows-1252?Q?mHQWDMcDboUZVgVcZ8UdBqLc2mtdplU15fwFfek3EC3uNJZ0jPaxJtPf?=
 =?Windows-1252?Q?k+Z/ixGVKfq0AEDVZ+wHd6ht7uGnzNMihjqks+FFtMN4F3pMP2Rrq3Su?=
 =?Windows-1252?Q?N642RXVRBk8y5kMWYcszYtneY2+KKtllwYs211sW9tZHwQtyZv/vBx6u?=
 =?Windows-1252?Q?z61gCAPZaXIZ9x5QNZHUfwyIoKRFwyYKIcOQkwxjWenb1h8NvlMlx7eH?=
 =?Windows-1252?Q?PzmM7+4BObXUsKq2GPa3e4zKPt9OL0dMEopj8HApuQzQ8EqOncZqzvjR?=
 =?Windows-1252?Q?U+zrpGQCykoCSx9kT8wl2Ob6gLlHxastz7rmfgoP33P971pGx1o0nEXQ?=
 =?Windows-1252?Q?3DMBTPW7C9lZ8bhQumk4jw3Qq4Ink+AX1h4r9UMs15u4RDavOGUZBZPJ?=
 =?Windows-1252?Q?TSszoilVssO8h7K1lcJ0yXesQjFo4qBg1eNrsveEsuTmmAbmF3igeQXp?=
 =?Windows-1252?Q?T0G+b5Li2GiD6yMtl1McjgKgtPSIG28to52Yu2WboUor76y0Nlu19GJh?=
 =?Windows-1252?Q?9XyYaW5UhhaQL+fI5X6pAPDpfNJQ8meWaHCgsV6IbQ2B1IlIgQHnn4PN?=
 =?Windows-1252?Q?+JWXmS2eq6IZA33KOJtJKo69+cRUa47nwT5dXkqFmmMv9lIEuXYzvqz+?=
 =?Windows-1252?Q?kr9+zDdk05l6M01IZbu/ZXlvjSP0LR7QSg2REk8Rl3GADtON//8SnooH?=
 =?Windows-1252?Q?2IsUo/ai4sA=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MAZPR01MB89508173F18D95C17C741C98EE23AMAZPR01MB8950INDP_"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e882df00-3749-4d45-663e-08ddd3114f0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2025 04:42:25.0160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 21/wVbQD2Cyso/JLu4e575/Bn2qqXZNh7MZQ0PWLwYutDLqXnLNUipxwgXqmFMT8PITzJQYoVu1F69Vpt4hIaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB7480
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 04:42:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221413

--_000_MAZPR01MB89508173F18D95C17C741C98EE23AMAZPR01MB8950INDP_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


Hi Steve,

Could you please help here?


 Regards,

 Nikhil R

 KPIT Technologies Limited

________________________________
From: Nikhil R
Sent: Thursday, July 31, 2025 7:38 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: [oe-core][ltp] LTP 20250130 fails to run due to missing kirk =96 s=
hould kirk be packaged separately?

I=92m using the LTP 20250130 recipe from Poky (meta/recipes-extended/ltp) m=
aster branch, and running into an issue where the test framework doesn=92t =
work as expected.

While run the ltp tests via 'runltp', we get the following messages:

sh-5.1# ./runltp
-------------------------------------------
INFO: runltp script is deprecated, try kirk
https://github.com/linux-test-project/kirk


./runltp: line 804: /var/data/opt/ltp/bin/ltp-pan: No such file or director=
y
INFO: ltp-pan reported some tests FAIL
LTP Version: 20250130

       ###############################################################

            Done executing testcases.
            LTP Version:  20250130
       ###############################################################

-------------------------------------------
INFO: runltp script is deprecated, try kirk
https://github.com/linux-test-project/kirk
-------------------------------------------


It appears that the 'kirk' binary is expected for running the test scenario=
s, but it is not present in the installed in current LTP package

Do we need to add a separate recipe for 'kirk' support for ltp in Yocto?
Or is there a plan to integrate kirk directly into the existing LTP recipe?

Looking forward to your guidance.

 Regards,

 Nikhil R

 KPIT Technologies Limited

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MAZPR01MB89508173F18D95C17C741C98EE23AMAZPR01MB8950INDP_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div class=3D"elementToProof" id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi Steve,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Could you please help here?</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; backgroun=
d-color: white; margin: 0px; font-family: Arial, sans-serif; font-size: 10p=
t; color: rgb(0, 51, 102);" class=3D"elementToProof">
<span style=3D"background-color: white;">&nbsp;Regards,</span></div>
<div style=3D"background-color: white; margin: 0px;" class=3D"elementToProo=
f">
<p style=3D"direction: ltr; text-align: left; text-indent: 0px; margin: 0px=
; font-family: Calibri, sans-serif; font-size: 11pt;" class=3D"elementToPro=
of">
<span style=3D"font-family: Arial, sans-serif; font-size: 10pt; color: blac=
k; background-color: white;">&nbsp;Nikhil R</span></p>
<p style=3D"direction: ltr; text-align: left; text-indent: 0px; margin: 0px=
; font-family: Calibri, sans-serif; font-size: 11pt;" class=3D"elementToPro=
of">
<span style=3D"font-family: Arial, sans-serif; font-size: 10pt; color: rgb(=
0, 51, 102); background-color: white;">&nbsp;KPIT Technologies Limited</spa=
n></p>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Nikhil R<br>
<b>Sent:</b> Thursday, July 31, 2025 7:38 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> [oe-core][ltp] LTP 20250130 fails to run due to missing kir=
k =96 should kirk be packaged separately?</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
I=92m using the LTP 20250130 recipe from Poky (meta/recipes-extended/ltp) m=
aster branch, and running into an issue where the test framework doesn=92t =
work as expected.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
While run the ltp tests via 'runltp', we get the following messages:</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
sh-5.1# ./runltp</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
-------------------------------------------</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
INFO: runltp script is deprecated, try kirk</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
https://github.com/linux-test-project/kirk</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
./runltp: line 804: /var/data/opt/ltp/bin/ltp-pan: No such file or director=
y</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
INFO: ltp-pan reported some tests FAIL</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
LTP Version: 20250130</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
&nbsp; &nbsp; &nbsp; &nbsp;################################################=
###############</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Done executing testcases.</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; LTP Version: &nbsp;20250130</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
&nbsp; &nbsp; &nbsp; &nbsp;################################################=
###############</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
-------------------------------------------</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
INFO: runltp script is deprecated, try kirk</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
https://github.com/linux-test-project/kirk</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
-------------------------------------------</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
It appears that the 'kirk' binary is expected for running the test scenario=
s, but it is not present in the installed in current LTP package</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
Do we need to add a separate recipe for 'kirk' support for ltp in Yocto? &n=
bsp;</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
Or is there a plan to integrate kirk directly into the existing LTP recipe?=
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
Looking forward to your guidance.</div>
<div class=3D"x_elementToProof" id=3D"x_Signature">
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"direction:ltr; text-align:left; te=
xt-indent:0px; background-color:white; margin:0px; font-family:Arial,sans-s=
erif; font-size:10pt; color:rgb(0,51,102)">
<span style=3D"background-color:white">&nbsp;Regards,</span></div>
<div class=3D"x_elementToProof" style=3D"background-color:white; margin:0px=
">
<p class=3D"x_elementToProof" style=3D"direction:ltr; text-align:left; text=
-indent:0px; margin:0px; font-family:Calibri,sans-serif; font-size:11pt">
<span style=3D"font-family:Arial,sans-serif; font-size:10pt; color:black; b=
ackground-color:white">&nbsp;Nikhil R</span></p>
<p class=3D"x_elementToProof" style=3D"direction:ltr; text-align:left; text=
-indent:0px; margin:0px; font-family:Calibri,sans-serif; font-size:11pt">
<span style=3D"font-family:Arial,sans-serif; font-size:10pt; color:rgb(0,51=
,102); background-color:white">&nbsp;KPIT Technologies Limited</span></p>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
</div>
</div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_MAZPR01MB89508173F18D95C17C741C98EE23AMAZPR01MB8950INDP_--

