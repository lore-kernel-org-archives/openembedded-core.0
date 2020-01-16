Return-Path: <Saloni.Jain@kpit.com>
Received: from IND01-BO1-obe.outbound.protection.outlook.com
	(mail-eopbgr1390042.outbound.protection.outlook.com [40.107.139.42])
	by mail.openembedded.org (Postfix) with ESMTP id 79BB77F9AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 07:37:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Nh+UYVIjHjUV9Ulfl/7cJkDQxeqfkNZFFMqIF/y+f1iw/hTpAuVKFKvTTwnAhZiWZuOPbdAij6lh5Ofgux9EZooZ1ik7OGGnrLiRxQtNJq3TDlvTfi8YyM+ze3o11A1MocOWn51jtRKeq6ibn2c6sjA8IK6phUfTwtq1BlSf2jT1iWpcn09d9rY2HjKoxEQS1OHuk+1Cya9GSmKTcYUGL5jU75oiryi00syI4ttmoESb7kN5ZJGZusgtc2jPJY/b5Ld9LLAjGM/b3aSLYfYOJORxzGxYyOiNVsGujcV4RaC+4ObGfBrQjTtc4HrrABbePX2IA6YFrC+8fRjn/CD3RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=L/k1bXs4h/Z16IXhtOrS+nT4BgC0I3Y+HoE7lMqM37Q=;
	b=e4dUdYkCcjUwcQM6HDMzMzaE3JQ+O5yuV9rcNG7ywjPnRN4EhEGGEr5yhp1b+JX/JTITQc59oIv8LzgAbCZjQik5a5Q04iS4i8YIturjfz2PjKJPhJ/rDxMhJyrdu/sFH8Zma5hC5ZkFEctdBNduOhXWJhXIOCJu0+v9xwKJhDC9IT2vUG6idp/XBJTRCXOsf16Xe4qoXtfI8oz+BIZ7TaWRIlbUcj4HiSr0846/oOdevDvcgxxKvno2mMzqWy+UH91wgOBe9j4qxzDnbgEeHpfmdpLO3s/0LYzz0TBMdygyz2EfiXi4Yw+D2DxuQaJR0TLxzirmZJnfWGKS9HbfIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
	dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=L/k1bXs4h/Z16IXhtOrS+nT4BgC0I3Y+HoE7lMqM37Q=;
	b=M5UYyIxVQ9L+UQvLtk1q2b2LGJXhUqcpmxX2qiV9aPTyQjyaqcyC6KolIHbzDDzBFn5dIv6TcgOk0pdyIwgPESjiNLfHDS8e/Txac8b201T9/ALobXOimf5KoC2ZfHRIFHmsyQZMdjr/1vf+EOje92x2AEeZugrX8PWSzbpfrgs=
Received: from MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM (52.134.152.22) by
	MAXPR01MB3101.INDPRD01.PROD.OUTLOOK.COM (52.134.153.83) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2623.12; Thu, 16 Jan 2020 07:37:49 +0000
Received: from MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	([fe80::7d91:96c5:dd37:1d5e]) by
	MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM
	([fe80::7d91:96c5:dd37:1d5e%5]) with mapi id 15.20.2623.017;
	Thu, 16 Jan 2020 07:37:48 +0000
From: Saloni Jain <Saloni.Jain@kpit.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [poky][zeus][PATCH] bzip2: Fix CVE-2019-12900
Thread-Index: AQHVy7uYUABs8BjSnk2eRQVIZ92eS6fr9MCAgADyn/I=
Date: Thu, 16 Jan 2020 07:37:48 +0000
Message-ID: <MAXPR01MB22713939E7245C895B8D0C1A87360@MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM>
References: <1579103456-31723-1-git-send-email-Saloni.Jain@kpit.com>,
	<CAMKF1so0kG6MVrxjNdFywxDwJsA6o7kUhGPFQt7N07Bd8yw6YA@mail.gmail.com>
In-Reply-To: <CAMKF1so0kG6MVrxjNdFywxDwJsA6o7kUhGPFQt7N07Bd8yw6YA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Saloni.Jain@kpit.com; 
x-originating-ip: [115.110.145.106]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5b5d51a5-3371-46f1-a849-08d79a56fc79
x-ms-traffictypediagnostic: MAXPR01MB3101:|MAXPR01MB3101:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MAXPR01MB3101367C7FFA243820AF83B087360@MAXPR01MB3101.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 02843AA9E0
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(346002)(396003)(376002)(366004)(39850400004)(136003)(189003)(199004)(478600001)(33656002)(966005)(71200400001)(86362001)(8676002)(81166006)(53546011)(9686003)(186003)(81156014)(4326008)(6916009)(26005)(6506007)(7696005)(45080400002)(54906003)(5660300002)(66556008)(66574012)(66476007)(76116006)(2906002)(66446008)(19627405001)(107886003)(316002)(66946007)(8936002)(55016002)(64756008)(52536014);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MAXPR01MB3101;
	H:MAXPR01MB2271.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: kpit.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9iZGfom2rdMvAqXhIs0hGVARC7jSPLeMDOjQS0mvsqTze5FMdSvjvJrqvnxkrSn6+xIEAfVlHREFx3tdel+cvsEandkFHtgJDF0MYq/ocCn7ytmf+xTsQlcWleWtI65nSj7ijNhsUROBerrr3nmDkeJADxDyqhE/zwuKh/kzxYYxHOhU5pnUt4owdZTGmYl9yl3ewGVBF3xmgTAoqF3hllc98ZVF3ATD4J8c3rQPqqFi/edOd8t9IukfdRNfknicUh/fbrZgRjemir1eJsP087/wbNX4nK5L+OJYuZDrfy1HjL3pfSOjBlxz71PNLwFSKvFJnp6vJxDwDhczMwzJ4jJ/Ym3ESSPySS7KARXsg+lVKspREmyhu3sy+X29tFYcXTzUqKErQv/1KeGg8+53NE2bF9WZCVFBk/lzHF+J/yjI50zJaZVjo0sVmQQ/ja77O/zitQO/9FSkFzUAOoaO25ajNAv5PP4G840xOB8q1D8=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5d51a5-3371-46f1-a849-08d79a56fc79
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2020 07:37:48.8281 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +MU4fv4H3k5RtQ9CbfJIeyQ0ptxXhYuaoiNB3MeuzakIRLHkeTRGLdr6f7izRnRuDIFTfs82Hw/plCX2cIR1eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB3101
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>, Sana Kazi <Sana.Kazi@kpit.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][zeus][PATCH] bzip2: Fix CVE-2019-12900
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jan 2020 07:37:54 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAXPR01MB22713939E7245C895B8D0C1A87360MAXPR01MB2271INDP_"

--_000_MAXPR01MB22713939E7245C895B8D0C1A87360MAXPR01MB2271INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Khem Raj,

We have tested the applicability for this patch on master as well and as pe=
r analysis it is applicable.
I've sent the same patch for master branch as well in a separate mail.

Thanks & Regards,
Saloni
________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: Wednesday, January 15, 2020 10:36 PM
To: Saloni Jain <Saloni.Jain@kpit.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; Nisha Parrakat <Nisha.Parrakat@kpit.com>; Sana Kazi <Sana.Kaz=
i@kpit.com>
Subject: Re: [poky][zeus][PATCH] bzip2: Fix CVE-2019-12900

On Wed, Jan 15, 2020 at 7:51 AM Saloni Jain <Saloni.Jain@kpit.com> wrote:
>
> From: Sana Kazi <Sana.Kazi@kpit.com>
>
> Added patch for CVE-2019-12900 as backport from upstream.
> Fixes out of bound access discovered while fuzzying karchive.
>

is this fix already present in the bzip2 version we have in master ?

> Tested by: Sana.Kazi@kpit.com
>
> Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
> ---
>  .../bzip2/bzip2-1.0.6/CVE-2019-12900.patch         | 34 ++++++++++++++++=
++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-1290=
0.patch
>
> diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch=
 b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
> new file mode 100644
> index 0000000..cab41e0
> --- /dev/null
> +++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
> @@ -0,0 +1,34 @@
> +From 74de1e2e6ffc9d51ef9824db71a8ffee5962cdbc Mon Sep 17 00:00:00 2001
> +From: Albert Astals Cid <aacid@kde.org>
> +Date: Tue, 28 May 2019 19:35:18 +0200
> +Subject: [PATCH] Make sure nSelectors is not out of range
> +
> +nSelectors is used in a loop from 0 to nSelectors to access selectorMtf
> +which is
> +UChar    selectorMtf[BZ_MAX_SELECTORS];
> +so if nSelectors is bigger than BZ_MAX_SELECTORS it'll do an invalid mem=
ory
> +access
> +Fixes out of bounds access discovered while fuzzying karchive
> +
> +Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fgitlab.com%2Ffedericomenaquintero%2Fbzip2%2Fcommit%2F74de1e2e6ffc9d51ef98=
24db71a8ffee5962cdbc.patch&amp;data=3D02%7C01%7CSaloni.Jain%40kpit.com%7C37=
0b10dc1f7a4288166208d799dd5023%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7=
C637147048150016848&amp;sdata=3Dm%2B9a%2FxYEqAA7JLjimmgLtLfvvBV2WtyInZf9a7D=
CfQg%3D&amp;reserved=3D0
> +
> +Upstream-Status: Backport
> +---
> + decompress.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/decompress.c b/decompress.c
> +index ab6a624..f3db91d 100644
> +--- a/decompress.c
> ++++ b/decompress.c
> +@@ -287,7 +287,7 @@ Int32 BZ2_decompress ( DState* s )
> +       GET_BITS(BZ_X_SELECTOR_1, nGroups, 3);
> +       if (nGroups < 2 || nGroups > 6) RETURN(BZ_DATA_ERROR);
> +       GET_BITS(BZ_X_SELECTOR_2, nSelectors, 15);
> +-      if (nSelectors < 1) RETURN(BZ_DATA_ERROR);
> ++      if (nSelectors < 1 || nSelectors > BZ_MAX_SELECTORS) RETURN(BZ_DA=
TA_ERROR);
> +       for (i =3D 0; i < nSelectors; i++) {
> +          j =3D 0;
> +          while (True) {
> +--
> +2.22.0
> --
> 2.7.4
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MAXPR01MB22713939E7245C895B8D0C1A87360MAXPR01MB2271INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hello Khem Raj,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
We have tested the applicability for this patch on master as well and as pe=
r analysis it is applicable.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I've sent the same patch for master branch as well in a separate mail.<br>
</div>
<div id=3D"Signature">
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helve=
tica,sans-serif; font-size:; margin:0">
<div><br>
</div>
<div>Thanks &amp; Regards,</div>
<div>Saloni <br>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Khem Raj &lt;raj.khem=
@gmail.com&gt;<br>
<b>Sent:</b> Wednesday, January 15, 2020 10:36 PM<br>
<b>To:</b> Saloni Jain &lt;Saloni.Jain@kpit.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;; =
Sana Kazi &lt;Sana.Kazi@kpit.com&gt;<br>
<b>Subject:</b> Re: [poky][zeus][PATCH] bzip2: Fix CVE-2019-12900</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, Jan 15, 2020 at 7:51 AM Saloni Jain &lt;Sa=
loni.Jain@kpit.com&gt; wrote:<br>
&gt;<br>
&gt; From: Sana Kazi &lt;Sana.Kazi@kpit.com&gt;<br>
&gt;<br>
&gt; Added patch for CVE-2019-12900 as backport from upstream.<br>
&gt; Fixes out of bound access discovered while fuzzying karchive.<br>
&gt;<br>
<br>
is this fix already present in the bzip2 version we have in master ?<br>
<br>
&gt; Tested by: Sana.Kazi@kpit.com<br>
&gt;<br>
&gt; Signed-off-by: Saloni Jain &lt;Saloni.Jain@kpit.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../bzip2/bzip2-1.0.6/CVE-2019-12900.patch&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; | 34 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp; 1 file changed, 34 insertions(&#43;)<br>
&gt;&nbsp; create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2=
019-12900.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.pa=
tch b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..cab41e0<br>
&gt; --- /dev/null<br>
&gt; &#43;&#43;&#43; b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-129=
00.patch<br>
&gt; @@ -0,0 &#43;1,34 @@<br>
&gt; &#43;From 74de1e2e6ffc9d51ef9824db71a8ffee5962cdbc Mon Sep 17 00:00:00=
 2001<br>
&gt; &#43;From: Albert Astals Cid &lt;aacid@kde.org&gt;<br>
&gt; &#43;Date: Tue, 28 May 2019 19:35:18 &#43;0200<br>
&gt; &#43;Subject: [PATCH] Make sure nSelectors is not out of range<br>
&gt; &#43;<br>
&gt; &#43;nSelectors is used in a loop from 0 to nSelectors to access selec=
torMtf<br>
&gt; &#43;which is<br>
&gt; &#43;UChar&nbsp;&nbsp;&nbsp; selectorMtf[BZ_MAX_SELECTORS];<br>
&gt; &#43;so if nSelectors is bigger than BZ_MAX_SELECTORS it'll do an inva=
lid memory<br>
&gt; &#43;access<br>
&gt; &#43;Fixes out of bounds access discovered while fuzzying karchive<br>
&gt; &#43;<br>
&gt; &#43;Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?=
url=3Dhttps%3A%2F%2Fgitlab.com%2Ffedericomenaquintero%2Fbzip2%2Fcommit%2F74=
de1e2e6ffc9d51ef9824db71a8ffee5962cdbc.patch&amp;amp;data=3D02%7C01%7CSalon=
i.Jain%40kpit.com%7C370b10dc1f7a4288166208d799dd5023%7C3539451eb46e4a26a242=
ff61502855c7%7C0%7C0%7C637147048150016848&amp;amp;sdata=3Dm%2B9a%2FxYEqAA7J=
LjimmgLtLfvvBV2WtyInZf9a7DCfQg%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.=
com%2Ffedericomenaquintero%2Fbzip2%2Fcommit%2F74de1e2e6ffc9d51ef9824db71a8f=
fee5962cdbc.patch&amp;amp;data=3D02%7C01%7CSaloni.Jain%40kpit.com%7C370b10d=
c1f7a4288166208d799dd5023%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6371=
47048150016848&amp;amp;sdata=3Dm%2B9a%2FxYEqAA7JLjimmgLtLfvvBV2WtyInZf9a7DC=
fQg%3D&amp;amp;reserved=3D0</a><br>
&gt; &#43;<br>
&gt; &#43;Upstream-Status: Backport<br>
&gt; &#43;---<br>
&gt; &#43; decompress.c | 2 &#43;-<br>
&gt; &#43; 1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
&gt; &#43;<br>
&gt; &#43;diff --git a/decompress.c b/decompress.c<br>
&gt; &#43;index ab6a624..f3db91d 100644<br>
&gt; &#43;--- a/decompress.c<br>
&gt; &#43;&#43;&#43;&#43; b/decompress.c<br>
&gt; &#43;@@ -287,7 &#43;287,7 @@ Int32 BZ2_decompress ( DState* s )<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GET_BITS(BZ_X_SELECTOR_1, nG=
roups, 3);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (nGroups &lt; 2 || nGroup=
s &gt; 6) RETURN(BZ_DATA_ERROR);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GET_BITS(BZ_X_SELECTOR_2, nS=
electors, 15);<br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (nSelectors &lt; 1) RETURN(BZ_=
DATA_ERROR);<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (nSelectors &lt; 1 || nSel=
ectors &gt; BZ_MAX_SELECTORS) RETURN(BZ_DATA_ERROR);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; nSelect=
ors; i&#43;&#43;) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; j =3D 0;<b=
r>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (Tru=
e) {<br>
&gt; &#43;--<br>
&gt; &#43;2.22.0<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; This message contains information that may be privileged or confidenti=
al and is the property of the KPIT Technologies Ltd. It is intended only fo=
r the person to whom it is addressed. If you are not the intended recipient=
, you are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.<br>
</div>
</span></font></div>
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

--_000_MAXPR01MB22713939E7245C895B8D0C1A87360MAXPR01MB2271INDP_--
