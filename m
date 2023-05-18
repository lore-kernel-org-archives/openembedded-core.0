Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB72C77B7D
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 10:50:26 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.14041.1684407022280404158
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 May 2023 03:50:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "iso-8859-2";
 spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: kubiznak@2n.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6Eu4wKHl7sjoHYij8FeV0LqInwbn6Y/5c8KZ4qEHQsZ+/EOqAcPo9EJhTmhh0h3Jj3RBD9Cp4z2Rvh/Plsy1g8UB5S1Y4DrPN1VP+Q34deYlsRXyLcdQaLS2ysLxzNMf3L/GG/gJLytVVC04TQ3BI8UQ3BqKNk4F+LQUTZWIbJoelR4SJjdYr4Bxl77CMUJ93tK8BP5BFOwi40FDyZbjPHenBw1xpuUfdLj6qDg5BTuafsNEsr8GPBR0dRo+KGvMY3R1vxgbyS56k8zqtYj30Cu0iIwZETbnj7is0PIw1k8um4bf0HCq7bpxDb7CwI796Ww7xflQZmyLOkdZYu49g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oC5fTodEo5vmaNv9X/FhRh7U92Ioo/vfrptLVUDdcQw=;
 b=Xmbbvbth8XS5TRdTsWP866KqfmfWV7hYVGEwY9Jpe5k8yCCKRfdLyd0rYAsli/1T2ryJqKUGkHRY7J56x7z2N0V67+ZezjmY1E1qKYeEHkYjvOQBe3ilYEuSVnTyaqdxP7eNzxQLqMAtpoPnZMjKncyH/SBfgh7LrQdnycTRxwlEoaUDinPZTLRU78UpqyGJxdkl54khKBuOStMKPDaqkHh6sukOnEfp0tmnH7D92fQnQRwMvAtyAH/Uy0s2ZpWztVdGN2kw7kgjT3y/ZxO8JrpqfA734tOJ+sl6xnH9zMNI+7KypsFFH09LI3tp9yUsM2fMwLguwJ3uDU73tZfQtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=2n.com; dmarc=pass action=none header.from=2n.com; dkim=pass
 header.d=2n.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oC5fTodEo5vmaNv9X/FhRh7U92Ioo/vfrptLVUDdcQw=;
 b=dQrQaG0hb0QeBopqNcl0lfUiQi2G4jyZ5s4PgUVmVmAASCqbPO0wJNglc/hqmsIK6J8RpUquBvMr1l196suln2X5P+G0RzXAFzStC26ibVCM/yBGZl5i922FJwMSZiUg+sT7hc7uJPZaQoWhHJfdGU0YyxdPrF0tOPXJGIwfq7s=
From: =?iso-8859-2?Q?Petr_Kubiz=F2=E1k_-_2N?= <Kubiznak@2n.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
Subject: Re: [PATCH 5/7] gi-docgen.bbclass: depends on
 gobject-introspection-data being enabled
Thread-Topic: [PATCH 5/7] gi-docgen.bbclass: depends on
 gobject-introspection-data being enabled
Thread-Index: AQHZiCXsiEZx18rC/UuJmj7xBA/tFK9f3IUs
Date: Thu, 18 May 2023 10:50:18 +0000
Message-ID: <DB4PR02MB1003060B86876277006364F93E27F9@DB4PR02MB10030.eurprd02.prod.outlook.com>
References: <20230516184031.2255171-1-ross.burton@arm.com>
 <20230516184031.2255171-5-ross.burton@arm.com>
In-Reply-To: <20230516184031.2255171-5-ross.burton@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=2n.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR02MB10030:EE_|DU0PR02MB9822:EE_
x-ms-office365-filtering-correlation-id: 00c25360-a698-4560-bd97-08db578dab96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HoPcwIDmjCq7Ui95XhVIqE9CUyipEZFAbZ5s+nOg0jVWU9ss1LareyAScPvpXPP21ObR60xQBgV/ymElCKA1vYzYg5CpSTNn5bKMPwfK+XOmf8WawahbxaFV4l6WfZdkN6Rf3rc/g4bsnYLFjNyHWy/zhdGElKB97dnLf/1dac6HcWu31xfwi6PgqByHTwm5hGaFPqVMgblEm3OB6SiHjZsUF/l6KBd3IBdjpHUdE34SiCCxeDA9x6JUz/26hHzlrivMEHamSDFn0BrKboIoR59m+aL0OoZ3B3ENOWu57PpRPl41fRKsjOVC6UIQFmsMshvUwrgkP2zlLhyCQ7WSCi2JWbm32a5OmnYFihCw+BhOv2fUrocvHeTr8NfDcl12ijmozEfGdmniDurWBWH19epVBpbEX7Xgq/z3hYAG8lJT8Ku++HUiUu8Oou1Ts9v8Y18dFA7S/bCVMtG+pxqfceibvdMD/jQGbYlxQOPuPBD5jfwLjktyAaF+D5YPM9OglvizAHcSbWNl0EDezqBk/94D13td1ocBOC/aTQICeONgxyoO7p+ZsM0ZDMBEWJpNybZpvRIx5/Q1oCl3sl4ntTUGx9A761UPDlOTepR3N8veAZFstFHjebHbcoW478zc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR02MB10030.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199021)(9686003)(53546011)(6506007)(38070700005)(186003)(33656002)(2906002)(86362001)(26005)(83380400001)(55016003)(38100700002)(122000001)(41300700001)(71200400001)(7696005)(66946007)(4326008)(66476007)(76116006)(316002)(66446008)(66556008)(64756008)(110136005)(478600001)(91956017)(5660300002)(8676002)(8936002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?XV+nUJRlsg7zhnoYpsyhxpMtaiUIPNLEaI79I4nT4mpv+aS64bte0KGJ1S?=
 =?iso-8859-2?Q?/OSgcxbDXAEqNb5X2wN1EMsP3TORb0jH6ybpi+cn4JeuNS75xRAtvdysB8?=
 =?iso-8859-2?Q?lJov4m2bhSHBLU8XNE3zDC6DIgL0fEuTyGmdRGTFVUScXT61Gv+y1IcIKv?=
 =?iso-8859-2?Q?CIlc2gLvX8hqLXY1p16dUYnvTHLz0IAp9PL3IPX8cThLz03YPVRsTwht6L?=
 =?iso-8859-2?Q?A03wmUS6hiz3UH2k2dSAJQlSNjZgPnEtG0uuVM/X+qRhR0kRNeRJsnOJ2/?=
 =?iso-8859-2?Q?J9jfrJUWSjHwTNI2/6pJvjVvfbH36XwfXzqw6HbPQvdcUiCbHc0snMLvEN?=
 =?iso-8859-2?Q?f9pJGLR1R3fSSZyWKzU2iMGpd9e4UBYRPXcOzUuMCLlMYIa8pV3odM5NvO?=
 =?iso-8859-2?Q?pva6GKxUKhRDo9QhDqOKg9IJrNzImfrpPePkw0MtnEiMztlGYZeaFL8mQt?=
 =?iso-8859-2?Q?uFIOsgjcSKvA16faO8D7fKmNa+33ETo9hVfnwWidTlGhWRqfFp8rg3Gk6u?=
 =?iso-8859-2?Q?pq2jjEZ12ZPlTt9o1Ly297F0uO59MCF4LR1RmvIHPzGiBcLvl09nhVn3fl?=
 =?iso-8859-2?Q?tTutvVAUnP2Erhz/5Qm4HKDFLXYFgr8JX7RKYYROtjx2DIo60fkGnIlYTg?=
 =?iso-8859-2?Q?+NUkdtQ+kaImhSdiriWggGNmn9zy4WZtbYgwAQ7EHsO+H60Ia9QXMAEQ/3?=
 =?iso-8859-2?Q?Nnk3dGoyzk1PbBs7Ykw5hWIKG1s7LGQW8rYNAJt47+hqvXRxeVmrL22Evc?=
 =?iso-8859-2?Q?loKMYZen4fl1d4TodtEH8ErsqoyKuUwSc4/jgbutX7SLa99cmOAjEUTgXJ?=
 =?iso-8859-2?Q?XZmzu2T2yjAyW1tmhJjtzD403nFn8QAvWweq0cf8ezVewiXeL9N1WIjxYZ?=
 =?iso-8859-2?Q?ResiHXdpgTtJ/u1Oa0yNcG9ofP2OqV0yxshFSMl9f3aUdLNcBhQsxnUKZc?=
 =?iso-8859-2?Q?YtYwCUHM8cvmTDlvNZTMLeqza4vsuZtQyZeXDBJWhIE5TCdG3ihIM0QeMA?=
 =?iso-8859-2?Q?VFwhhkMIpA8A1MrTnQfLlUDuX+A3hbpxmwYAok1D9JS2HVPOrnfWDxy+8I?=
 =?iso-8859-2?Q?FJHeksr50pn4ZPjelPOk11SW14iGd7sI4mMZGpezRYaYAxEHzwfw0eDAIV?=
 =?iso-8859-2?Q?1MaI+oqy8/0nQciVXLctvOg4oRXsrzuGvRW6Mmg55C1UycV8z6U+FOVHwj?=
 =?iso-8859-2?Q?xmR8UFhO+HQkUKXDszKqclHJ/7x+Lfg35+YxL3WBU+P+vsQx/X14ZY+/8x?=
 =?iso-8859-2?Q?bjDZQRvW5s2+WsjHoKXnJNR9/7l25+9dX6jd9w4S9Li+gmPRXQmUlBtkNx?=
 =?iso-8859-2?Q?rJ+v322CIcAOviKqWUH0nADnouHvtY4/KXYrFV/2Dtea/UOCAbF8dQMd+z?=
 =?iso-8859-2?Q?Dr8FFC24bIykrEBLUFi4qOjnVA5LER2VbCFybNP8uhp+yPd7hX+YScmJeS?=
 =?iso-8859-2?Q?azNS2RwPShEHQWF0oTHpdk0FU61LZonsNPGmZy3Al92ZkCxQXxZJbekCML?=
 =?iso-8859-2?Q?4C1MuPAvveHPqZelW97lWvVQ4m9DGlPlEWJZNlx8zJ+yoO6+VT/Jvvu2Yx?=
 =?iso-8859-2?Q?jYp1Flwb13tP6fXSvmwWwLwcFtsvCFHwJPB6G9XuZYeNCzW2P89lDGoA2d?=
 =?iso-8859-2?Q?d1pfz8jkELcmo=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR02MB10030.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c25360-a698-4560-bd97-08db578dab96
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2023 10:50:18.3628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HsaBYKpAIDTqMjasxsEagKaIJB4gSvAImXfQLG241kJ0+9HLxKzxaIePAtMz6N94
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9822
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 10:50:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181518

The comment before the modified line does not match now.

Petr

________________________________________
From: ross.burton@arm.com <ross.burton@arm.com>
Sent: Tuesday, May 16, 2023 8:40 PM
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com; Petr Kubiz=F2=E1k - 2N
Subject: [PATCH 5/7] gi-docgen.bbclass: depends on gobject-introspection-da=
ta being enabled

From: Ross Burton <ross.burton@arm.com>

The gi-docgen tool depends, as it's name suggests, on
gobject-introspection being available.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/gi-docgen.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/gi-docgen.bbclass b/meta/classes-recipe/gi=
-docgen.bbclass
index 8b7eaacea3f..eb30c6011f8 100644
--- a/meta/classes-recipe/gi-docgen.bbclass
+++ b/meta/classes-recipe/gi-docgen.bbclass
@@ -10,7 +10,8 @@

 # This variable is set to True if api-documentation is in
 # DISTRO_FEATURES, and False otherwise.
-GIDOCGEN_ENABLED ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'api-docume=
ntation', 'True', 'False', d)}"
+GIDOCGEN_ENABLED ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'api-docume=
ntation gobject-introspection-data', 'True', 'False', d)}"
+
 # When building native recipes, disable gi-docgen, as it is not necessary,
 # pulls in additional dependencies, and makes build times longer
 GIDOCGEN_ENABLED:class-native =3D "False"
--
2.34.1


