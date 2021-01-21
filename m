Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.web11.3932.1611214015266333723
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jan 2021 23:26:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=PUqxCrNC;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=7470; q=dns/txt; s=iport;
  t=1611214015; x=1612423615;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=1Urb61UAcGJW8QdinBe08xSHDHH2/XRQiLIUt0gSGN0=;
  b=PUqxCrNCCZS9B/9jFVHWS4djMxDO4822cmlQxAtpIgS9gvMqkp8EFRLZ
   6BznS6W7bhKye2zhbRqLjst5cT8XegP0Qtui29iv2PUTy13/3+D4F2kSD
   xLVQkWLEfU6KsmFVI8dfEVNQXXGSezTrMreYpxpuTZts8E+dOcK3Z+KC2
   g=;
X-IPAS-Result: =?us-ascii?q?A0DKAgCtKwlgmIgNJK1fAx4BAQsSDECBRAuBIwEvUX1bL?=
 =?us-ascii?q?y8Kh34DjgYDihyKB4RzgS6BJQNUCwEBAQ0BARgBCgoCBAEBhEoCgXcCJTYHD?=
 =?us-ascii?q?gIDAQEBAwIDAQEBAQUBAQECAQYEFAEBAQEBAQEBhjYMhXMBAQEEAT8BAQwrA?=
 =?us-ascii?q?Q8CAQgRBAEBAS4hBwkBHQgCBAENBQgVBIMFAYF+UgUDLgEOpmcCiiV0gTSDB?=
 =?us-ascii?q?QEBBoEzAQsBg1kNC4IRCYE4gnaCbxI9NoZQJhuCAIFUglY+ghtCBAGBXh8ME?=
 =?us-ascii?q?QmDBoIsg38BgRAJTRpimjqBRptaWAohglaJL4tDgViFQIRanhWUHYscgnuOZ?=
 =?us-ascii?q?IRWAgICAgQFAg4BAQaBQxkBMSyBLXAVgyQJRxcCDY4hGoJuaYUUhUR0AjUCB?=
 =?us-ascii?q?gEJAQEDCXyJeAGBEAEB?=
IronPort-PHdr: =?us-ascii?q?9a23=3AfY96SRH5dkanHseDbU3oKJ1GYnJ96bzpIg4Y7I?=
 =?us-ascii?q?YmgLtSc6Oluo7vJ1Hb+e401QObUoDS6vYCgO3T4OjsWm0FtJCGtn1KMJlBTA?=
 =?us-ascii?q?QMhshemQs8SNWEBkv2IL+PDWQ6Ec1OWUUj8yS9Nk5YS8n7blzW5Ha16G1aFh?=
 =?us-ascii?q?D2LwEgIOPzF8bbhNi20Obn/ZrVbk1IiTOxbKk0Ig+xqFDat9Idhs1pLaNixw?=
 =?us-ascii?q?=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.79,363,1602547200"; 
   d="scan'208,217";a="632027889"
Received: from alln-core-3.cisco.com ([173.36.13.136])
  by alln-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 21 Jan 2021 07:26:54 +0000
Received: from XCH-ALN-002.cisco.com (xch-aln-002.cisco.com [173.36.7.12])
	by alln-core-3.cisco.com (8.15.2/8.15.2) with ESMTPS id 10L7Qq4n005154
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 21 Jan 2021 07:26:53 GMT
Received: from xfe-rcd-004.cisco.com (173.37.227.252) by XCH-ALN-002.cisco.com
 (173.36.7.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 21 Jan
 2021 01:26:52 -0600
Received: from xhs-rtp-001.cisco.com (64.101.210.228) by xfe-rcd-004.cisco.com
 (173.37.227.252) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; Thu, 21 Jan 2021
 01:26:52 -0600
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (64.101.32.56) by
 xhs-rtp-001.cisco.com (64.101.210.228) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Thu, 21 Jan 2021 02:26:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7NBzvdpTw+0c5yEK3+xgPWTFOJ2RlKVX+eFs5MShYx6lYOV48K+eXambBmSLFs8mjI2j9t+8PTPJuAfTcOn8p7041ZyodlHQpA3DXV+oSs2+C4op2ZCY+hqrwr1c23ZkCF2AQwO9naSNlOGYJmHSwMOQ4NZ+rfxUIn2X1hoxoQ8LQWwAayJlr0pJoxBjQrQ+ZKPPL+zDJQuyFUwqrE+/xkAbKfigZ6kzPdsXJ5lEjTIrK10zNtWRzN9/2xsOkO10WDPnrFZlmHe75AfAe6V+56cFNwktuq9PmqRisF+kli6yyU/HSvljopeinkFXlpFk3M8MEsvwwcuuXUlLf7T0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+dqibGSF5J8R+5swHFLojOOA/UYp7EjEs6bDuv0Ofc=;
 b=mAEsmJ9F6xRy56AHxYbrhDt5iYJWnb0VRD562g9qAblCTO0FovVBvfct02fVw9C/uakaPkdcq6z7U88/quuxhWkathxN6kbBy5Uju+XH4d7J0bX2/leaC3xdY6Ft2yKsVopmQCyRHoHflmVVtTIlefK0cpMVlvWryynnYaH2DZFH/zljG3jlmLgngS6tCQKvJy+PoYkSfutBOx5iV/zYEITQo4gOpsKDChLir9rte8XA2bH3qa+13cF/0PuZ4t9cn51SLh7Mr5Dpt4AlzE+WL+pBWlQbVGVaNGMoXZondgCz8Jj+CttOqtv0YRRRXT8ZxN5fC/wxJ1sHAva9wi2FAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+dqibGSF5J8R+5swHFLojOOA/UYp7EjEs6bDuv0Ofc=;
 b=PF3qUwL435Fuy6ZYRj1A5nx77HGhUqmdUVGMGN9llfduEn3LvQyf7g805V1+tZ4l7rLdiOFbSHg8Qi9ONwzxAhprNY6LOzpJuwxKBfvD3qybX305my7F0qWLYFQ1OjbZJR8mbAQXFqjW7gbMl7I7AJnzJFlusHQavFxtckC1Rog=
Received: from SJ0PR11MB5088.namprd11.prod.outlook.com (2603:10b6:a03:2df::17)
 by SJ0PR11MB4815.namprd11.prod.outlook.com (2603:10b6:a03:2dd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Thu, 21 Jan
 2021 07:26:51 +0000
Received: from SJ0PR11MB5088.namprd11.prod.outlook.com
 ([fe80::adf2:ff40:84e8:fe79]) by SJ0PR11MB5088.namprd11.prod.outlook.com
 ([fe80::adf2:ff40:84e8:fe79%5]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 07:26:51 +0000
From: "Oleksiy Obitotskyy" <oobitots@cisco.com>
To: Khem Raj <raj.khem@gmail.com>,
        Otavio Salvador
	<otavio.salvador@ossystems.com.br>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] dtc: improve reproducibility
Thread-Topic: [OE-core] [PATCH] dtc: improve reproducibility
Thread-Index: AQHW71jrDaoSUmBG2Uq3CdeGhWkZTaoxEHEAgAAE5gCAAJcMzw==
Date: Thu, 21 Jan 2021 07:26:51 +0000
Message-ID: <SJ0PR11MB508821FFC16D1AC3736CC355D7A10@SJ0PR11MB5088.namprd11.prod.outlook.com>
References: <20210120182001.20523-1-oobitots@cisco.com>
 <CAP9ODKok0YUiD2rgJfZYFS0-oP1w-GS8s-KeuV2HUG2skSSKnA@mail.gmail.com>,<CAMKF1sqJxR=HfCW10jFdjENi8Rj-BFML4qgrRKdLQa=q2gvx7Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqJxR=HfCW10jFdjENi8Rj-BFML4qgrRKdLQa=q2gvx7Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [173.38.209.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20fc00a2-bae2-42d6-05a5-08d8bdddebbd
x-ms-traffictypediagnostic: SJ0PR11MB4815:
x-microsoft-antispam-prvs: <SJ0PR11MB481563AE1F5ABD1722926652D7A19@SJ0PR11MB4815.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XaWSqPxaPrRE6S2IFrC0Jwtal1jMMoxlWUVi9JGMb+koZY/F0+2oX59dDeYaKRNvV4rxfdBpEkKFkq1B3Fk7k+phqeHcKdbfSMHKHbHyjH97YhjHCwTfChDs45qsd+fUlb9vbB/H3Nef2zd+7ED60hKrRj33/WRYRf8TikxCbFQsqIDl1aJweTalnP4fUcCp8h+X/sphoymr0jyaUBcrN606NsNXQcsTtqnhwIBsHvRVIkGAv1gQ3RtzfuqWuGY9uDlq5wiNcBy9pade8lvfVe4qiMkP677sNWu7AV20SdHDYm8P7Y16lVrB42gUk4MHiPNuRHMf7uMzrN4dV5Gak6TU0dWUYVsAK+cBBq+7ZBguIUCCcPsQp2xDqauj9bvGjhcFnZn3ruU1gZg5i+ohrHxKsaSF99JER0cPjSk7uyWeXFlRxEZukRV6bBgDiya0OODbyZnFF7+gUf3l2E6khQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5088.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(39860400002)(346002)(376002)(366004)(478600001)(966005)(8676002)(33656002)(8936002)(53546011)(7696005)(71200400001)(4326008)(316002)(6506007)(83380400001)(110136005)(26005)(166002)(186003)(91956017)(19627405001)(55016002)(66446008)(64756008)(86362001)(2906002)(9686003)(66556008)(76116006)(66946007)(52536014)(5660300002)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?X6nl2MHhHOKYGMYdEL4imGHlcAM9cDDYxGaq/KzxG7Fxw11Evf2PfCn3Vi?=
 =?iso-8859-1?Q?S1zuh9oxlmUJ3vajYpl2ULQB47QLPXHkBOBtvAyj6pcOnctdp8gdW0fceL?=
 =?iso-8859-1?Q?KzsX6b08Ut6HR6eSItMRZi//5/gtbGs1G/XVkrH6jP7tDtSVw12Vg2jzI7?=
 =?iso-8859-1?Q?AJ/h87/r7YAE9sLjQ7upgVopZpfzDK2fv4eRSFaJMGhJ9P7hICKCJJCadG?=
 =?iso-8859-1?Q?6QGjTmabur0jWQL9FEVFGhzjd/0toJE7T5xMFN1ugMiuXQkn9T0h5XNp+f?=
 =?iso-8859-1?Q?MQp+9ZvBg8BvrxvySl9/OjpIHN0ZcE7J0o/+f2+9Bk/3fM3U10Ut/PH50r?=
 =?iso-8859-1?Q?i4Z5jZb3jRj+JQ/c3WtV7/yieAFM/dmz+pD85sqMj1AsYlIpNQLPJtcGV3?=
 =?iso-8859-1?Q?z112Atl8whf3BAczyGL/X6utWxcJrrI9ETbbV0LnlEfDVs12q1v7yfAAdY?=
 =?iso-8859-1?Q?3U9lktG8rFnGfz1/Ae/P+UEniyCBT4g9XlHxHyeFHtM2/eP20Aooj5fegC?=
 =?iso-8859-1?Q?sTKUYC9L0jthkX/04/TTl3K8ItjHRk4izcG/9Dj611/90TiUIVxDtdwjcb?=
 =?iso-8859-1?Q?1DdsIGQsuL4hkANCZCQRuKJHQeBe4QkEaRfJcf28PRgmsX1l9UEOnHCO+t?=
 =?iso-8859-1?Q?8slVnnNWVlzD2e3jqhSwo0IBNZ0Tm+cXJJ+s5z8ClmKlossZyXpcWIYe03?=
 =?iso-8859-1?Q?al8LfANk+7ELVBU8Vs1NDaOWPGlKMNuob90bGxJ0t2ttYw1YrrYGBFSBV3?=
 =?iso-8859-1?Q?QchMijXgqvzobfLg3sIGh5EHgcoXoF5d+HznBULKTSkEqxWkB2VjKk56aX?=
 =?iso-8859-1?Q?SxNI2i/Sj5bNp/N4aqHvfEEY2DP9d+mkX/9LQNlbb0JyqZOW4D04KbLPSD?=
 =?iso-8859-1?Q?a49KesJals2ldZfNAv3hWvC5KZTnXWimTj6/bDrFGaVtz8EW/EC2OpJFLM?=
 =?iso-8859-1?Q?ziq1a3MvimfQRI0PbmbMH3z+b5NF0F4Jvh5CcZBLAKuWArGQsW84TIz55V?=
 =?iso-8859-1?Q?+Xf7PkT0VLd2brY1J9FdG7nWcmuKDyXZc+iuXV4qkdUcnklB+1uFNDm3GC?=
 =?iso-8859-1?Q?ftNm/cmBfxXkRiHEyQFSQdU=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5088.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20fc00a2-bae2-42d6-05a5-08d8bdddebbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2021 07:26:51.1976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BYr+5Dp/MDb6vhhsw4Jc/qBVcta8+/5C5Vvkn2G5YHw72qNS0+RAI6g7ZIpg8s4sBeur6NfIBZLIy3YNLR4fWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4815
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.12, xch-aln-002.cisco.com
X-Outbound-Node: alln-core-3.cisco.com
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR11MB508821FFC16D1AC3736CC355D7A10SJ0PR11MB5088namp_"

--_000_SJ0PR11MB508821FFC16D1AC3736CC355D7A10SJ0PR11MB5088namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,


Should I rework (add patch unconditional) and resubmit patch?
Or should I try to submit it to the dtc directly?

Regards,
Oleksiy
________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: Thursday, January 21, 2021 00:17
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco) <oobitots@=
cisco.com>; Patches and discussions about the oe-core layer <openembedded-c=
ore@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] dtc: improve reproducibility

it perhaps should be sent upstream too.

On Wed, Jan 20, 2021 at 2:00 PM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> Hello,
>
> Em qua., 20 de jan. de 2021 =E0s 15:20, Oleksiy Obitotskyy via
> lists.openembedded.org <oobitots=3Dcisco.com@lists.openembedded.org>
> escreveu:
> >
> > Makefile override CFLAGS, so -fmacro/debug-prefix-map
> > optiions was omitted and binaries contains absolute
> > patch to sources.
> >
> > Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
> > ---
> >  meta/recipes-kernel/dtc/dtc.inc               | 10 +++++-
> >  ...-Makefile-to-add-CFLAGS-not-override.patch | 36 ++++++++++++++++++=
+
> > ...
>
> The patch can be applied unconditionally as it essentially allow new
> flags to be added and should not harm. In fact, applying it seems to
> be the correct fix IMO.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
>
>=20
>

--_000_SJ0PR11MB508821FFC16D1AC3736CC355D7A10SJ0PR11MB5088namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859=
-1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-b=
ottom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Should I rework (add patch unconditional) and resubmit patch?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Or should I try to submit it to the dtc directly?<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Oleksiy<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" s=
tyle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Khem Raj &lt;raj.khe=
m@gmail.com&gt;<br>
<b>Sent:</b> Thursday, January 21, 2021 00:17<br>
<b>To:</b> Otavio Salvador &lt;otavio.salvador@ossystems.com.br&gt;<br>
<b>Cc:</b> Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco) &lt=
;oobitots@cisco.com&gt;; Patches and discussions about the oe-core layer &l=
t;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] dtc: improve reproducibility</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt=
;">
<div class=3D"PlainText">it perhaps should be sent upstream too.<br>
<br>
On Wed, Jan 20, 2021 at 2:00 PM Otavio Salvador<br>
&lt;otavio.salvador@ossystems.com.br&gt; wrote:<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt; Em qua., 20 de jan. de 2021 =E0s 15:20, Oleksiy Obitotskyy via<br>
&gt; lists.openembedded.org &lt;oobitots=3Dcisco.com@lists.openembedded.or=
g&gt;<br>
&gt; escreveu:<br>
&gt; &gt;<br>
&gt; &gt; Makefile override CFLAGS, so -fmacro/debug-prefix-map<br>
&gt; &gt; optiions was omitted and binaries contains absolute<br>
&gt; &gt; patch to sources.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Oleksiy Obitotskyy &lt;oobitots@cisco.com&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp; meta/recipes-kernel/dtc/dtc.inc&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 10 +++++-<br>
&gt; &gt;&nbsp; ...-Makefile-to-add-CFLAGS-not-override.patch | 36 +++++++=
++++++++++++<br>
&gt; &gt; ...<br>
&gt;<br>
&gt; The patch can be applied unconditionally as it essentially allow new<=
br>
&gt; flags to be added and should not harm. In fact, applying it seems to<=
br>
&gt; be the correct fix IMO.<br>
&gt;<br>
&gt; --<br>
&gt; Otavio Salvador&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; O.S. Systems<br>
&gt; <a href=3D"http://www.ossystems.com.br">http://www.ossystems.com.br</=
a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"http://code.ossyste=
ms.com.br">
http://code.ossystems.com.br</a><br>
&gt; Mobile: +55 (53) 9 9981-7854&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; Mobile: +1 (347) 903-9750<br>
&gt;<br>
&gt; <br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_SJ0PR11MB508821FFC16D1AC3736CC355D7A10SJ0PR11MB5088namp_--
