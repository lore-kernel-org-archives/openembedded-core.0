Return-Path: <Hugues.Kamba@arm.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0077.outbound.protection.outlook.com [104.47.2.77])
	by mail.openembedded.org (Postfix) with ESMTP id C20B779CCC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 17:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QAB9hj2uEsAkM8Qh9tnz71VE+68hUOgfCoR/b3J5WEk=;
	b=XbefCCVUg3pcMVT9SJonly8Z2rTUgaJfUeNrYFe8j7C8bIuSzENxCwjpnlaxf6EBrRjJXf+hmBow/PZYlPXAQYzaZ+xo8+d2GnxfxGNSKMjHJVIW93t3J/flDl9AxZn2coZkWwMx5i6Aq2j/3v763oHsnpslho+NgTpQhDZvs08=
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com (20.177.61.82) by
	VI1PR08MB3645.eurprd08.prod.outlook.com (20.177.61.84) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.20; Tue, 30 Oct 2018 16:13:09 +0000
Received: from VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::545d:f7d:7c9e:bf11]) by VI1PR08MB3631.eurprd08.prod.outlook.com
	([fe80::545d:f7d:7c9e:bf11%2]) with mapi id 15.20.1273.025;
	Tue, 30 Oct 2018 16:13:09 +0000
From: Hugues Kamba <Hugues.Kamba@arm.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH v2] python3: Fix python3-pyvenv run-time
	dependency
Thread-Index: AQHUcDQqfCB08Ue58EaZPet6Df5zN6U39K0AgAAB0K8=
Date: Tue, 30 Oct 2018 16:13:09 +0000
Message-ID: <VI1PR08MB36316D19DEB81B04D36EE6C798CC0@VI1PR08MB3631.eurprd08.prod.outlook.com>
References: <20181030093655.26251-1-hugues.kamba@arm.com>,
	<CAJTo0LZsRLrwRTDyU6iFHjdm6PwajpLjRN3RbufZLuik0bCdxw@mail.gmail.com>
In-Reply-To: <CAJTo0LZsRLrwRTDyU6iFHjdm6PwajpLjRN3RbufZLuik0bCdxw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Hugues.Kamba@arm.com; 
x-originating-ip: [40.119.148.42]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR08MB3645;
	6:DgkIPKhp83mB3ECg11ResskV0WCX+mZCac9lKdJvl1WBAMJC5MaHSnxJ/8NlNe9fLJlg3WC67Q+ilukj8ZDaqb+QK7W1NhgNhtmIQyEJ42PlS46okDvwO2G0H1Ml+e54xOPPAERkqzuLIENbGQWbO6uc0a59F9ef0+sCyFPx2DUuO3BIyOYbTUnl5ZKyBnt9cxKfBNuekY2EuMe50+GEEeoN2QiUC/g74osLbsHQKbds+6+x5HWD3fzTt4Yh1VIppCad1qmuBVD7nYcHVCei309s2y5Ip7+LfFFq2C3itovmqvU4qhJ0WZI6/cO4T9MZQEETNOiX2k06EmvWS7N+eDkfsTKnHnF5eYH3TLY664Eq+uCmSRyFqWDvEM1rloSP0QJ0neAtJHO32n4V4zOjNg2uQvc6vYoRKhDb1p3JhOJ0Ggy/49zNLXedErcAqALg6mnzV6MA4u2AOXwzLduYxw==;
	5:fR1w7ww1b+xXD9Y3zzKVAANooM8oLgWuDP3etLmnvsgBB+5gW6lfr0N53+V+E+3OsHV+vdtPKtFkY2t0tgnSLB/GowdrPYfMQN6faMpW9Bg88Y7iBWu/EEDBNCoF8CG4zKDwAt6xBxD/ZgVznTn50/y7IqCal3hDfWCewwCIXIU=;
	7:p783MeEsosXPDtM6/cE41etD7pqSxw2u9VAkhoPR33PgGEqQpS6i/K3wCS1p9YVJA3XIVuJCeo92e7qaT9U61tM3DjCgbrUX4fJCYG/+PJ5cqwSthxRyUJ+DVKDjk7ku7fqcdoCIi/hpxZXWIX7KXw==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 4ed41391-e923-47ef-4b81-08d63e82958d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR08MB3645; 
x-ms-traffictypediagnostic: VI1PR08MB3645:
x-microsoft-antispam-prvs: <VI1PR08MB3645918DC8D66CC7F356AD2298CC0@VI1PR08MB3645.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(228905959029699)(180628864354917)(264703809997249)(158342451672863)(265313219721884);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231382)(944501410)(4982022)(52105095)(93006095)(93001095)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR08MB3645; BCL:0; PCL:0; RULEID:; SRVR:VI1PR08MB3645; 
x-forefront-prvs: 08417837C5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(136003)(346002)(396003)(376002)(366004)(199004)(189003)(40434004)(6306002)(7736002)(74316002)(606006)(105586002)(106356001)(5250100002)(966005)(2900100001)(2906002)(14454004)(72206003)(76176011)(7696005)(68736007)(8936002)(8676002)(81166006)(81156014)(66066001)(86362001)(99286004)(53546011)(102836004)(6506007)(33656002)(26005)(14971765001)(45080400002)(3846002)(6116002)(25786009)(478600001)(345774005)(21615005)(5024004)(14444005)(256004)(486006)(476003)(186003)(71200400001)(71190400001)(5660300001)(6246003)(316002)(6436002)(97736004)(11346002)(446003)(53936002)(54896002)(55016002)(236005)(9686003)(6916009)(229853002)(4326008);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3645;
	H:VI1PR08MB3631.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: 0J/uuYIXuw0ZrT07vP9w+s+rgKzNcaQcub4Xs79Yab3XHs60yheEfVbo2T0NidiFakKmZNo6E6PP/n+PGza5mUPV33WfyjpMOOfpwQORL0DdR9MV5cxfQYfvHdZxssB2uRIS4cie+3RGiAWJstGJB5QSCYLCmTs6VDFiI0hR5e6NU0VuFBddeDsltMlI2EW7CExabLLcpZLMTPH2yNRIA1oniEG/+cxKLamBpk9tL7dUgT2vRBMHZNYurgK284HYpUt7qR2AI1xHOWIktqWO0LzhlASTx8mAOLfa7zs3qTLRILQ6L/QXxrPfl5mS864wyELfEv4kV+n9RotSFxOjBhVDg5llX4HLmHp9ADgwkkc=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed41391-e923-47ef-4b81-08d63e82958d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2018 16:13:09.4145 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3645
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python3: Fix python3-pyvenv run-time dependency
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
X-List-Received-Date: Tue, 30 Oct 2018 17:45:58 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR08MB36316D19DEB81B04D36EE6C798CC0VI1PR08MB3631eurp_"

--_000_VI1PR08MB36316D19DEB81B04D36EE6C798CC0VI1PR08MB3631eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Ross,

Thank you for reviewing.

I am not sure where you saw the commit message say that pyvenv has been rem=
oved.

What it says about pyvenv is that it is deprecated in python3.6 (to explain=
 why it has been provided via the newly created venv package).

Regards
Hugues

Get Outlook for Android<https://aka.ms/ghei36>

________________________________
From: Burton, Ross <ross.burton@intel.com>
Sent: Tuesday, October 30, 2018 4:06:40 PM
To: Hugues Kamba
Cc: OE-core
Subject: Re: [OE-core] [PATCH v2] python3: Fix python3-pyvenv run-time depe=
ndency

Patch looks good, but the commit message contradicts itself a few
times.  python3-pyvenv is removed, but:

"   This patch adds the python3-venv module as a self-contained package whi=
ch
    python3-pyvenv must depend on at run-time."
    This patch specifies the newly created
    python3-venv as a run-time dependency of python3-pyvenv."

Ross
On Tue, 30 Oct 2018 at 13:08, Hugues Kamba <Hugues.Kamba@arm.com> wrote:
>
> Pyvenv is just a small script that uses venv to create virtual
> environments.
> https://www.python.org/dev/peps/pep-0405/#creating-virtual-environments
>
> This patch adds the python3-venv module as a self-contained package which
> python3-pyvenv must depend on at run-time.
>
> The patch also provides the package python3-pyvenv from the pyhton3-venv
> package.This is good for future-proofing since python3-pyvenv has been
> deprecated and only python3-venv is now available in Python 3.6.
> https://docs.python.org/3/library/venv.html.
>
> Without this patch python3-pyvenv is broken because it is missing the
> venv module at run-time. This patch specifies the newly created
> python3-venv as a run-time dependency of python3-pyvenv.
>
> Signed-off-by: Hugues Kamba <hugues.kamba@arm.com>
> ---
>  .../python/python3/python3-manifest.json         | 16 ++++++++++++++++
>  meta/recipes-devtools/python/python3_3.5.6.bb    |  4 ++--
>  2 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
> index f922561368..ef7fa4ecaf 100644
> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> @@ -1107,6 +1107,22 @@
>              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.pyc"
>          ]
>      },
> +    "venv": {
> +        "summary": "Provides support for creating lightweight virtual en=
vironments with their own site directories, optionally isolated from system=
 site directories.",
> +        "rdepends": [
> +            "compression",
> +            "core",
> +            "logging",
> +            "shell",
> +            "stringold",
> +            "unixadmin"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/venv",
> +            "${bindir}/pyvenv*"
> +        ],
> +        "cached": []
> +    },
>      "xml": {
>          "summary": "Python basic XML support",
>          "rdepends": [
> diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes=
-devtools/python/python3_3.5.6.bb
> index 2a4547694a..31f8eada11 100644
> --- a/meta/recipes-devtools/python/python3_3.5.6.bb
> +++ b/meta/recipes-devtools/python/python3_3.5.6.bb
> @@ -226,8 +226,8 @@ FILES_${PN}-2to3 +=3D "${bindir}/2to3-${PYTHON_MAJMIN=
}"
>  FILES_${PN}-pydoc +=3D "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3=
"
>  FILES_${PN}-idle +=3D "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
>
> -PACKAGES =3D+ "${PN}-pyvenv"
> -FILES_${PN}-pyvenv +=3D "${bindir}/pyvenv-${PYTHON_MAJMIN} ${bindir}/pyv=
env"
> +# provide python-pyvenv from python3-venv
> +RPROVIDES_${PN}-venv +=3D "${PN}-pyvenv"
>
>  # package libpython3
>  PACKAGES =3D+ "libpython3 libpython3-staticdev"
> --
> 2.18.0
>
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_VI1PR08MB36316D19DEB81B04D36EE6C798CC0VI1PR08MB3631eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
Hello Ross, <br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
Thank you for reviewing. <br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
I am not sure where you saw the commit message say that pyvenv has been rem=
oved.<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
What it says about pyvenv is that it is deprecated in python3.6 (to explain=
 why it has been provided via the newly created venv package).<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
Regards<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
Hugues<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
Get <a href=3D"https://aka.ms/ghei36">Outlook for Android</a></div>
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Burton, Ross &lt;ro=
ss.burton@intel.com&gt;<br>
<b>Sent:</b> Tuesday, October 30, 2018 4:06:40 PM<br>
<b>To:</b> Hugues Kamba<br>
<b>Cc:</b> OE-core<br>
<b>Subject:</b> Re: [OE-core] [PATCH v2] python3: Fix python3-pyvenv run-ti=
me dependency</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">Patch looks good, but the commit message contradic=
ts itself a few<br>
times.&nbsp; python3-pyvenv is removed, but:<br>
<br>
&quot;&nbsp;&nbsp; This patch adds the python3-venv module as a self-contai=
ned package which<br>
&nbsp;&nbsp;&nbsp; python3-pyvenv must depend on at run-time.&quot;<br>
&nbsp;&nbsp;&nbsp; This patch specifies the newly created<br>
&nbsp;&nbsp;&nbsp; python3-venv as a run-time dependency of python3-pyvenv.=
&quot;<br>
<br>
Ross<br>
On Tue, 30 Oct 2018 at 13:08, Hugues Kamba &lt;Hugues.Kamba@arm.com&gt; wro=
te:<br>
&gt;<br>
&gt; Pyvenv is just a small script that uses venv to create virtual<br>
&gt; environments.<br>
&gt; <a href=3D"https://www.python.org/dev/peps/pep-0405/#creating-virtual-=
environments">
https://www.python.org/dev/peps/pep-0405/#creating-virtual-environments</a>=
<br>
&gt;<br>
&gt; This patch adds the python3-venv module as a self-contained package wh=
ich<br>
&gt; python3-pyvenv must depend on at run-time.<br>
&gt;<br>
&gt; The patch also provides the package python3-pyvenv from the pyhton3-ve=
nv<br>
&gt; package.This is good for future-proofing since python3-pyvenv has been=
<br>
&gt; deprecated and only python3-venv is now available in Python 3.6.<br>
&gt; <a href=3D"https://docs.python.org/3/library/venv.html">https://docs.p=
ython.org/3/library/venv.html</a>.<br>
&gt;<br>
&gt; Without this patch python3-pyvenv is broken because it is missing the<=
br>
&gt; venv module at run-time. This patch specifies the newly created<br>
&gt; python3-venv as a run-time dependency of python3-pyvenv.<br>
&gt;<br>
&gt; Signed-off-by: Hugues Kamba &lt;hugues.kamba@arm.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../python/python3/python3-manifest.json&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; | 16 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp; meta/recipes-devtools/python/python3_3.5.6.bb&nbsp;&nbsp;&nbsp; =
|&nbsp; 4 &#43;&#43;--<br>
&gt;&nbsp; 2 files changed, 18 insertions(&#43;), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3/python3-manifest.jso=
n b/meta/recipes-devtools/python/python3/python3-manifest.json<br>
&gt; index f922561368..ef7fa4ecaf 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3/python3-manifest.json<br>
&gt; &#43;&#43;&#43; b/meta/recipes-devtools/python/python3/python3-manifes=
t.json<br>
&gt; @@ -1107,6 &#43;1107,22 @@<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; &quot;${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.pyc&qu=
ot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ]<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; },<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; &quot;venv&quot;: {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;summary&quot;: &=
quot;Provides support for creating lightweight virtual environments with th=
eir own site directories, optionally isolated from system site directories.=
&quot;,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rdepends&quot;: =
[<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;compression&quot;,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;core&quot;,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;logging&quot;,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;shell&quot;,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;stringold&quot;,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;unixadmin&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ],<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;files&quot;: [<b=
r>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;${libdir}/python${PYTHON_MAJMIN}/venv&quot;,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;${bindir}/pyvenv*&quot;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ],<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;cached&quot;: []=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp; },<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;xml&quot;: {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;summary&qu=
ot;: &quot;Python basic XML support&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;rdepends&q=
uot;: [<br>
&gt; diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/reci=
pes-devtools/python/python3_3.5.6.bb<br>
&gt; index 2a4547694a..31f8eada11 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3_3.5.6.bb<br>
&gt; &#43;&#43;&#43; b/meta/recipes-devtools/python/python3_3.5.6.bb<br>
&gt; @@ -226,8 &#43;226,8 @@ FILES_${PN}-2to3 &#43;=3D &quot;${bindir}/2to3=
-${PYTHON_MAJMIN}&quot;<br>
&gt;&nbsp; FILES_${PN}-pydoc &#43;=3D &quot;${bindir}/pydoc${PYTHON_MAJMIN}=
 ${bindir}/pydoc3&quot;<br>
&gt;&nbsp; FILES_${PN}-idle &#43;=3D &quot;${bindir}/idle3 ${bindir}/idle${=
PYTHON_MAJMIN}&quot;<br>
&gt;<br>
&gt; -PACKAGES =3D&#43; &quot;${PN}-pyvenv&quot;<br>
&gt; -FILES_${PN}-pyvenv &#43;=3D &quot;${bindir}/pyvenv-${PYTHON_MAJMIN} $=
{bindir}/pyvenv&quot;<br>
&gt; &#43;# provide python-pyvenv from python3-venv<br>
&gt; &#43;RPROVIDES_${PN}-venv &#43;=3D &quot;${PN}-pyvenv&quot;<br>
&gt;<br>
&gt;&nbsp; # package libpython3<br>
&gt;&nbsp; PACKAGES =3D&#43; &quot;libpython3 libpython3-staticdev&quot;<br=
>
&gt; --<br>
&gt; 2.18.0<br>
&gt;<br>
&gt; IMPORTANT NOTICE: The contents of this email and any attachments are c=
onfidential and may also be privileged. If you are not the intended recipie=
nt, please notify the sender immediately and do not disclose the contents t=
o any other person, use it for any
 purpose, or store or copy the information in any medium. Thank you.<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; Openembedded-core@lists.openembedded.org<br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</div>
</span></font>IMPORTANT NOTICE: The contents of this email and any attachme=
nts are confidential and may also be privileged. If you are not the intende=
d recipient, please notify the sender immediately and do not disclose the c=
ontents to any other person, use
 it for any purpose, or store or copy the information in any medium. Thank =
you.
</body>
</html>

--_000_VI1PR08MB36316D19DEB81B04D36EE6C798CC0VI1PR08MB3631eurp_--
