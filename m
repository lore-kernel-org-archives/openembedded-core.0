Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.74])
 by mx.groups.io with SMTP id smtpd.web11.125.1585001682937268713
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2020 15:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mc55e32f;
 spf=pass (domain: windriver.com, ip: 40.107.220.74, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PV0RQle7A6K2egLlgtCVOnT4dxtCVG4KUQuZHAWyqTpG1qqF36jRYLym21nFVT1SMpa+P/m6x/JCIeLTUp/Eik9qaq/Ttt+/J1h9J0nXKcGCuv8SibD2LVJmyeedEQIGAXJO1hBk1TyjHT4oRESMufzvdYL9K5Xl8Ghfn0ZbpUVajqJburqrRtxTI9aK0Rag5Gp9XcwetV1mbTa+8v4OJcwy7jGNq/rwDJS57peWMc0gY1mV1SyOswyxlfbHnZ0C7yPo3GVtNwAimFIRvjfF7hE5OBHMmvWfwZZ3GHROX9t6r7U5aqFIU6EDyBrsPDLQjluH9F6JlGzjlMJg+IPGuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=leuY2My7p2RQDQZPsfVrz/Nws36rykHy0ghvFpxalv8=;
 b=iJE95TOhalISufRKu/iwrR6ak9mvq+rbg9bnIiM5xpAFscbhaP/5eqNbDVJQfFIn4uxIJJXEt2rRu4HQIxQ/hJMQ1xGNU3hjXrNr98Rs/gFCw/G0LIW8zADXX0sndCJ4K/HfXUHiBXdcXF3JwcrBmM6ntnnA7FrFn21Cjvnsq3Phdb3hTdcs9iqmYdC/r7NenmgG7kc9kWoxf06KmwLP/C7YOZsGWrS0wP90Y+S96qY8dFbNwSLo5cnM2PCN2IfRqrv0pxnRQo/PgTuOMjsDYSQzCYXOQnrf2aIwi3f5gUBw+QXXtzvSg39swN1QsLdKur7sWYlWVVVDUf4tp/Z0/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=leuY2My7p2RQDQZPsfVrz/Nws36rykHy0ghvFpxalv8=;
 b=mc55e32fdbaDbcHgJ/7z/boXW8ZUjBTn6qqhX0CEJ4A1HJtU5PDHxfX8LpukTbl4vbHM7FDJWk6nozh608OCzxs6CtPBAsMz0cqGIgT6qyKTwFEvX0KfK6go1Ns4Ggpr7elS4btGzlSxfetsBCyeXk04OTexMzQ+n38T1thYdz0=
Received: from MN2PR11MB4269.namprd11.prod.outlook.com (2603:10b6:208:190::32)
 by MN2PR11MB3568.namprd11.prod.outlook.com (2603:10b6:208:ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Mon, 23 Mar
 2020 22:14:40 +0000
Received: from MN2PR11MB4269.namprd11.prod.outlook.com
 ([fe80::ef:e9a9:8618:bc9f]) by MN2PR11MB4269.namprd11.prod.outlook.com
 ([fe80::ef:e9a9:8618:bc9f%7]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 22:14:40 +0000
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libpng: Fix CVE-2019-6129
Thread-Topic: [OE-core] [PATCH] libpng: Fix CVE-2019-6129
Thread-Index: AQHWAVqpkF6mGS0GXku4iZdfNKxW1KhWvU+U
Date: Mon, 23 Mar 2020 22:14:40 +0000
Message-ID: 
 <MN2PR11MB42693FC4B0A9DA4BC35EC50DF2F00@MN2PR11MB4269.namprd11.prod.outlook.com>
References: 
 <20200323212823.104190-1-sakib.sajal@windriver.com>,<20200323213244.GV1578@denix.org>
In-Reply-To: <20200323213244.GV1578@denix.org>
Accept-Language: en-CA, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Sakib.Sajal@windriver.com; 
x-originating-ip: [64.229.138.221]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 665caf15-af4f-40ea-cfc7-08d7cf77950d
x-ms-traffictypediagnostic: MN2PR11MB3568:
x-microsoft-antispam-prvs: 
 <MN2PR11MB3568E62CF47A870EBE0275FDF2F00@MN2PR11MB3568.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:291;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: 
 SFV:NSPM;SFS:(10009020)(366004)(19627405001)(66446008)(966005)(66556008)(66946007)(64756008)(76116006)(4326008)(66476007)(53546011)(55016002)(7696005)(9686003)(6506007)(498600001)(52536014)(5660300002)(2906002)(33656002)(6916009)(86362001)(19627235002)(8936002)(186003)(8676002)(81156014)(71200400001)(81166006)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR11MB3568;H:MN2PR11MB4269.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: windriver.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 EmLTgpzlnGYcCcyZFN9qIYR1z9anLzlUlFD08C6h0oxx02Txdlb4cGzWYxbvNSxlB7hYvGo6jSqFiUONR3625detsRKO/Rb0TayaaNIs5ZLY7pndQnLMmqlOfNrPtNI6C/Lhlqj/tJhoxdSGWJecO4c0YlBJ/BHHgeF0tB6xG0NIIEnmGgCbez7hzK8MAXMuhfGmuaeUJflVQiLvTTyXUPJ7q7xINtD+VItIHFKfKJbhZKiySTaDV96O7ykoOKx7fXYrMUpwkYJi15qjE21kZQF1QDFXzcPJLdLmEBQmFEbJ6ZCZbcp1U2Cp4s3w6xxfAvAohfqLUEbWOcPQwU7NvvgKmK5oKLatBkOkYCM43lEUeo36NETmnOI04JN+KYlmNqtL0XqgkGRlqgbWmmhjaQbtTrGYryV9I4oIGbFwkTFabur8LU0XtX7ncFHm4sOXv8y0Z+iFad3n/9Gqfs2MZIeGTuymL6ekeF/ZPtwYlxLMw6aPHxqY9fD1lK9VGoHBay0CdZF+Ga8xXnRsxDeLdw==
x-ms-exchange-antispam-messagedata: 
 9egft6ynDL+5ymeTbAN1iqUOr44Xnhe7hz1kE8GU2nY9+IscOStbXmHVl8MEE2Yzv4+KCaakxZYSl/HUO+PgQYW09EsoYfmPde1lgoMbS/q8Qg1tcWrEvCMrVRWB4fqF28XZ9L9vv/Zr7fpCS4jmrg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 665caf15-af4f-40ea-cfc7-08d7cf77950d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 22:14:40.1284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B+WVKipi3z3XgPzaCaJezWGx9uZR+LLSQuN5C+BXzlqM9qXTTQ3Uvs5ilQumsNnt0hE7EEuzZp4nvzJiu9AwrCpo76bMo7J6hnxTy492GZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3568
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_MN2PR11MB42693FC4B0A9DA4BC35EC50DF2F00MN2PR11MB4269namp_"

--_000_MN2PR11MB42693FC4B0A9DA4BC35EC50DF2F00MN2PR11MB4269namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Yes that was the V2. Changes included adding the CVE tag and Signed-off-by=
 in the included patch.
________________________________
From: Denys Dmytriyenko <denis@denix.org>
Sent: March 23, 2020 4:32 PM
To: Sajal, Sakib <Sakib.Sajal@windriver.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.open=
embedded.org>
Subject: Re: [OE-core] [PATCH] libpng: Fix CVE-2019-6129

Hi,

Is this v2? Should say so in the subject. Also, should mention the changes
from v1 under the commit log.


On Mon, Mar 23, 2020 at 02:28:23PM -0700, Sakib Sajal wrote:
> Fix memory leak in png_create_info_struct.
>
> Upstream-Status: Submitted [https://github.com/glennrp/libpng/pull/293]

BTW, Upstream-Status: should be in the patch, not in the commit log.


> CVE: CVE-2019-6129
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  .../libpng/0001-Repair-of-CVE-2019-6129.patch | 27 +++++++++++++++++++
>  .../libpng/libpng_1.6.37.bb                   |  5 +++-
>  2 files changed, 31 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-multimedia/libpng/libpng/0001-Repair-of=
-CVE-2019-6129.patch
>
> diff --git a/meta/recipes-multimedia/libpng/libpng/0001-Repair-of-CVE-20=
19-6129.patch b/meta/recipes-multimedia/libpng/libpng/0001-Repair-of-CVE-20=
19-6129.patch
> new file mode 100644
> index 0000000000..1bb2da1984
> --- /dev/null
> +++ b/meta/recipes-multimedia/libpng/libpng/0001-Repair-of-CVE-2019-6129=
.patch
> @@ -0,0 +1,27 @@
> +From ed73b082d0296c6181f2ac11e8dd78e8f7c6d66b Mon Sep 17 00:00:00 2001
> +From: tangyaofang <tangyaofang6666@163.com>
> +Date: Mon, 10 Jun 2019 11:30:15 +0800
> +Subject: [PATCH] Repair of CVE-2019-6129
> +
> +CVE: CVE-2019-6129
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + contrib/tools/pngcp.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/contrib/tools/pngcp.c b/contrib/tools/pngcp.c
> +index 16d4e7f4d..a02d5b7ff 100644
> +--- a/contrib/tools/pngcp.c
> ++++ b/contrib/tools/pngcp.c
> +@@ -506,7 +506,7 @@ static void
> + display_clean_read(struct display *dp)
> + {
> +    if (dp->read_pp !=3D NULL)
> +-      png_destroy_read_struct(&dp->read_pp, NULL, NULL);
> ++      png_destroy_read_struct(&dp->read_pp, (dp->ip!=3DNULL ? &dp->ip =
: NULL), NULL);
> +
> +    if (dp->fp !=3D NULL)
> +    {
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/reci=
pes-multimedia/libpng/libpng_1.6.37.bb
> index 8c53d11642..f33b942cd7 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
> @@ -7,7 +7,10 @@ DEPENDS =3D "zlib"
>
>  LIBV =3D "16"
>
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
> +           file://0001-Repair-of-CVE-2019-6129.patch \
> +          "
> +
>  SRC_URI[md5sum] =3D "015e8e15db1eecde5f2eb9eb5b6e59e9"
>  SRC_URI[sha256sum] =3D "505e70834d35383537b6491e7ae8641f1a4bed1876dbfe3=
61201fc80868d88ca"
>
> --
> 2.24.1
>

>=20


--_000_MN2PR11MB42693FC4B0A9DA4BC35EC50DF2F00MN2PR11MB4269namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii=
">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-b=
ottom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Hello,<br>
<br>
Yes that was the V2. Changes included adding the CVE tag and Signed-off-by=
 in the included patch.
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" s=
tyle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Denys Dmytriyenko &l=
t;denis@denix.org&gt;<br>
<b>Sent:</b> March 23, 2020 4:32 PM<br>
<b>To:</b> Sajal, Sakib &lt;Sakib.Sajal@windriver.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@=
lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] libpng: Fix CVE-2019-6129</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt=
;">
<div class=3D"PlainText">Hi,<br>
<br>
Is this v2? Should say so in the subject. Also, should mention the changes=
 <br>
from v1 under the commit log.<br>
<br>
<br>
On Mon, Mar 23, 2020 at 02:28:23PM -0700, Sakib Sajal wrote:<br>
&gt; Fix memory leak in png_create_info_struct.<br>
&gt; <br>
&gt; Upstream-Status: Submitted [<a href=3D"https://github.com/glennrp/lib=
png/pull/293">https://github.com/glennrp/libpng/pull/293</a>]<br>
<br>
BTW, Upstream-Status: should be in the patch, not in the commit log.<br>
<br>
<br>
&gt; CVE: CVE-2019-6129<br>
&gt; <br>
&gt; Signed-off-by: Sakib Sajal &lt;sakib.sajal@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../libpng/0001-Repair-of-CVE-2019-6129.patch | 27 &#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;<br>
&gt;&nbsp; .../libpng/libpng_1.6.37.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&=
nbsp; 5 &#43;&#43;&#43;-<br>
&gt;&nbsp; 2 files changed, 31 insertions(&#43;), 1 deletion(-)<br>
&gt;&nbsp; create mode 100644 meta/recipes-multimedia/libpng/libpng/0001-R=
epair-of-CVE-2019-6129.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-multimedia/libpng/libpng/0001-Repair-of-CVE=
-2019-6129.patch b/meta/recipes-multimedia/libpng/libpng/0001-Repair-of-CVE=
-2019-6129.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1bb2da1984<br>
&gt; --- /dev/null<br>
&gt; &#43;&#43;&#43; b/meta/recipes-multimedia/libpng/libpng/0001-Repair-o=
f-CVE-2019-6129.patch<br>
&gt; @@ -0,0 &#43;1,27 @@<br>
&gt; &#43;From ed73b082d0296c6181f2ac11e8dd78e8f7c6d66b Mon Sep 17 00:00:0=
0 2001<br>
&gt; &#43;From: tangyaofang &lt;tangyaofang6666@163.com&gt;<br>
&gt; &#43;Date: Mon, 10 Jun 2019 11:30:15 &#43;0800<br>
&gt; &#43;Subject: [PATCH] Repair of CVE-2019-6129<br>
&gt; &#43;<br>
&gt; &#43;CVE: CVE-2019-6129<br>
&gt; &#43;Signed-off-by: Sakib Sajal &lt;sakib.sajal@windriver.com&gt;<br>
&gt; &#43;---<br>
&gt; &#43; contrib/tools/pngcp.c | 2 &#43;-<br>
&gt; &#43; 1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
&gt; &#43;<br>
&gt; &#43;diff --git a/contrib/tools/pngcp.c b/contrib/tools/pngcp.c<br>
&gt; &#43;index 16d4e7f4d..a02d5b7ff 100644<br>
&gt; &#43;--- a/contrib/tools/pngcp.c<br>
&gt; &#43;&#43;&#43;&#43; b/contrib/tools/pngcp.c<br>
&gt; &#43;@@ -506,7 &#43;506,7 @@ static void<br>
&gt; &#43; display_clean_read(struct display *dp)<br>
&gt; &#43; {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; if (dp-&gt;read_pp !=3D NULL)<br>
&gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; png_destroy_read_struct(&amp;dp-=
&gt;read_pp, NULL, NULL);<br>
&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; png_destroy_read_struct(&amp=
;dp-&gt;read_pp, (dp-&gt;ip!=3DNULL ? &amp;dp-&gt;ip : NULL), NULL);<br>
&gt; &#43; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp; if (dp-&gt;fp !=3D NULL)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; {<br>
&gt; &#43;-- <br>
&gt; &#43;2.20.1<br>
&gt; &#43;<br>
&gt; diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/r=
ecipes-multimedia/libpng/libpng_1.6.37.bb<br>
&gt; index 8c53d11642..f33b942cd7 100644<br>
&gt; --- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb<br>
&gt; &#43;&#43;&#43; b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb<br>
&gt; @@ -7,7 &#43;7,10 @@ DEPENDS =3D &quot;zlib&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; LIBV =3D &quot;16&quot;<br>
&gt;&nbsp; <br>
&gt; -SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.t=
ar.xz&quot;<br>
&gt; &#43;SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${B=
P}.tar.xz \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a =
href=3D"file://0001-Repair-of-CVE-2019-6129.patch">file://0001-Repair-of-CV=
E-2019-6129.patch</a> \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br=
>
&gt; &#43;<br>
&gt;&nbsp; SRC_URI[md5sum] =3D &quot;015e8e15db1eecde5f2eb9eb5b6e59e9&quot=
;<br>
&gt;&nbsp; SRC_URI[sha256sum] =3D &quot;505e70834d35383537b6491e7ae8641f1a=
4bed1876dbfe361201fc80868d88ca&quot;<br>
&gt;&nbsp; <br>
&gt; -- <br>
&gt; 2.24.1<br>
&gt; <br>
<br>
&gt; <br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR11MB42693FC4B0A9DA4BC35EC50DF2F00MN2PR11MB4269namp_--
