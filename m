Return-Path: <shuagr@microsoft.com>
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr680110.outbound.protection.outlook.com [40.107.68.110])
	by mail.openembedded.org (Postfix) with ESMTP id 075C67DF61
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 21:28:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=KYloj8DIRfwWj/uFe18C2yG5AmuYdW6q6UIHiQFi90Hsa9VyflbnP8OC4S+EMjv0zjvhPeHJb172Drkzot5EiQg/Jy3aOjkLPpIPnBZxBBApLB5RHPOwl+U4rBnaTSIVZyhqV9i37rq3WaUQnQpGdx9YoAMUVnoPzw5wxGw+b3RnKHdUQZ0wnti4rhpN0IljZlAMk6Hwl9N1A1Sd6vbnPczUWjhKhNIXkIrMm4FtxDf8CwReEyWN31gUVpsS4yNb0dGqx7C4+AHL3CE81ET1pHuVY1yc8B3lNAChzDmkqSgrxTP2ShBafG5rsFvQ6D6Nj1UpaQ0dy5mGVaZkvCuiKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=24XybyVwyXjrC7npgvh7HAZzAaWtC2yklYZkaYNjku8=;
	b=KXwp7ZF9WAYLccy31chRCFbhZbp5vP/I5RBAITwPHvYL93QBKCa074t78qhVKfgqtf/x8oqAN87LZo+fFZiODUFnUyql1/K1W0p6Vl7cDxe182RqpR1atWbuNjkOxcGDSU+j4Pue4kMIREwfz6zfx/pM/1lgJXf/8yPq4IYasYp4dv5OY/9aKOLbNubwhldrutekHxmbjYSxRdsPkpQXwKpE3qoHSK/HImiT7X4o4vcZ9qV69S57F+twvSQ9WAywsdPb80fky3CdIyF973+aQ9rGi7Rg1g282uaj06VCvZzXDJmUWOvOD9HzvBwoqZwYhR7Ikcry+vbGHSxaiOSSqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=microsoft.com; dmarc=pass action=none
	header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=24XybyVwyXjrC7npgvh7HAZzAaWtC2yklYZkaYNjku8=;
	b=aE2DxEvr3bA7zjwWtmPrD3RSR/Q26SNRnPI2oa1M30ZkAE6RgAldJZcZa4A8bP1pmYptp6FRM6pYwBuf87BgJIqUC7+hlUAVqUiF2u/YUvbfeabIOoKVmTqDWtCaJEijopZYI4BYhSD4Z7fKzaxQ10dqBNOo10FRUhQuCZarVjw=
Received: from MW2PR2101MB0891.namprd21.prod.outlook.com (52.132.152.23) by
	MW2PR2101MB1132.namprd21.prod.outlook.com (52.132.146.17) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2305.3; Mon, 23 Sep 2019 21:28:50 +0000
Received: from MW2PR2101MB0891.namprd21.prod.outlook.com
	([fe80::e0ac:ec6d:b5cf:35ae]) by
	MW2PR2101MB0891.namprd21.prod.outlook.com
	([fe80::e0ac:ec6d:b5cf:35ae%9]) with mapi id 15.20.2305.013;
	Mon, 23 Sep 2019 21:28:50 +0000
From: Shubham Agrawal <shuagr@microsoft.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: =?Windows-1252?Q?[OE-core]_[=94OE-core][thud][PATCH=94]_elfutils:_CVE_fix?=
	=?Windows-1252?Q?_for_elfutils?=
Thread-Index: AQHVclPdga/aDcXvDU6FJRTP0k3Jqac5xZ+AgAABces=
Date: Mon, 23 Sep 2019 21:28:50 +0000
Message-ID: <MW2PR2101MB08918889602F23311640FF18DB850@MW2PR2101MB0891.namprd21.prod.outlook.com>
References: <1569273251-128066-1-git-send-email-shuagr@microsoft.com>,
	<20190923212327.GA1808@jama>
In-Reply-To: <20190923212327.GA1808@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=shuagr@microsoft.com; 
x-originating-ip: [167.220.2.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2992ce1-01cd-4747-df53-08d7406d06b9
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MW2PR2101MB1132:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MW2PR2101MB11329D2D0EB79D6D58110454DB850@MW2PR2101MB1132.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(199004)(189003)(54534003)(4326008)(476003)(14444005)(6246003)(76116006)(186003)(66946007)(2906002)(99286004)(11346002)(14454004)(3846002)(66476007)(316002)(53546011)(52536014)(86362001)(6116002)(74316002)(22452003)(66446008)(66556008)(102836004)(26005)(8936002)(6506007)(8990500004)(7696005)(64756008)(236005)(6436002)(446003)(4001150100001)(54896002)(229853002)(9686003)(6306002)(71190400001)(486006)(7736002)(10090500001)(6916009)(71200400001)(256004)(76176011)(81166006)(33656002)(10290500003)(66066001)(25786009)(81156014)(5660300002)(478600001)(55016002)(606006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MW2PR2101MB1132;
	H:MW2PR2101MB0891.namprd21.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c/5Q2ffau84bNlIvPwChfpFbOAcN33vYKz/je7RTvRHsf4AV7sIwRSRIIW84uZhXIHVRbuBYO1kfmPnixosEhg5PmnidCdzRhMA0UoMJ/gsXBE1kVAGEZ7iStwa1t+JIKAAHUme3cIVZ6+IJp2i3FIJThwwA3fhOHOY3Cn/zXoXVMDtxhSbActpJnpVycMeZGYAe8HLKivZZpJVV2XtvggVXpmVQu1Aht9LAlbcyVxPP1OJzmWjIWXTUOZ7w2iU0ZJL/ds4sQfquP76ukm0+EZ90JqlOjvRijNaDSQOLRSxdghSN2gA9qE3xDY4yO0p4pIRaf0hMU6YMaFvE7odBrS9WitDGqmjgDevRC7JkKel6mFa2m/DC3+ExqjMlpUc2t9TX4/wNviCzMedKOkIB9weY+ese/tkCxs+DLf5go8I=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2992ce1-01cd-4747-df53-08d7406d06b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 21:28:50.3722 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: efRal+ZnrOAxXWnRnBQh7wfzkR3Q7XkbF8Vv3zbbyI6WocGIn+6P+cuaVY/6zbUVAyok/TlSSPqDZB6v+6INzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR2101MB1132
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IFvigJ1PRS1jb3JlXVt0aHVkXVtQQVRDSOKAnV0gZWxmdXRpbHM6IENWRSBmaXggZm9yIGVsZnV0aWxz?=
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
X-List-Received-Date: Mon, 23 Sep 2019 21:28:51 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MW2PR2101MB08918889602F23311640FF18DB850MW2PR2101MB0891_"

--_000_MW2PR2101MB08918889602F23311640FF18DB850MW2PR2101MB0891_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Thanks

Sent from Mail<https://go.microsoft.com/fwlink/?LinkId=3D550986> for Window=
s 10

From: Martin Jansa<mailto:martin.jansa@gmail.com>
Sent: Monday, September 23, 2019 2:23 PM
To: Shubham Agrawal<mailto:shuagr@microsoft.com>
Cc: openembedded-core@lists.openembedded.org<mailto:openembedded-core@lists=
.openembedded.org>
Subject: Re: [OE-core] [=94OE-core][thud][PATCH=94] elfutils: CVE fix for e=
lfutils

On Mon, Sep 23, 2019 at 09:14:11PM +0000, shuagr97@gmail.com wrote:
> From: Shubham Agrawal <shuagr@microsoft.com>

Drop the quotes in the e-mail subject.

>
> CVE: CVE-2019-7664.patch
> CVE: CVE-2019-7665.patch
>
> Sign off: Shubham Agrawal <shuagr@microsoft.com>
> ---
>  meta/recipes-devtools/elfutils/elfutils_0.175.bb   |   2 +
>  .../elfutils/files/CVE-2019-7664.patch             |  65 +++++++++
>  .../elfutils/files/CVE-2019-7665.patch             | 154 +++++++++++++++=
++++++
>  3 files changed, 221 insertions(+)
>  create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7664.pa=
tch
>  create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7665.pa=
tch

....

> +diff --git a/libelf/ChangeLog b/libelf/ChangeLog
> +index 68c4fbd..892e6e7 100644
> +--- a/libelf/ChangeLog
> ++++ b/libelf/ChangeLog
> +@@ -1,3 +1,16 @@
> ++<<<<<<< HEAD
> ++=3D=3D=3D=3D=3D=3D=3D
> ++2019-01-16  Mark Wielaard  <mark@klomp.org>
> ++
> ++      * note_xlate.h (elf_cvt_note): Check n_namesz and n_descsz don't
> ++      overflow note_len into note header.
> ++
> ++2018-11-17  Mark Wielaard  <mark@klomp.org>
> ++
> ++      * elf32_updatefile.c (updatemmap): Make sure to call convert
> ++      function on a properly aligned destination.
> ++
> ++>>>>>>> e65d91d... libelf: Correct overflow check in note_xlate.

You should resolve these conflicts (or drop the ChangeLog updates
completely from the backports as they will conflict with any other
backport as well.


--_000_MW2PR2101MB08918889602F23311640FF18DB850MW2PR2101MB0891_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Thanks</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Sent from <a href=3D"https://go.microsoft.com/fwlink=
/?LinkId=3D550986">
Mail</a> for Windows 10</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0in 0in 0in">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><b>From: </b><a hr=
ef=3D"mailto:martin.jansa@gmail.com">Martin Jansa</a><br>
<b>Sent: </b>Monday, September 23, 2019 2:23 PM<br>
<b>To: </b><a href=3D"mailto:shuagr@microsoft.com">Shubham Agrawal</a><br>
<b>Cc: </b><a href=3D"mailto:openembedded-core@lists.openembedded.org">open=
embedded-core@lists.openembedded.org</a><br>
<b>Subject: </b>Re: [OE-core] [=94OE-core][thud][PATCH=94] elfutils: CVE fi=
x for elfutils</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">On Mon, Sep 23, 2019 at 09:14:11PM &#43;0000, shuagr=
97@gmail.com wrote:</p>
<p class=3D"MsoNormal">&gt; From: Shubham Agrawal &lt;shuagr@microsoft.com&=
gt;</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Drop the quotes in the e-mail subject.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; </p>
<p class=3D"MsoNormal">&gt; CVE: CVE-2019-7664.patch</p>
<p class=3D"MsoNormal">&gt; CVE: CVE-2019-7665.patch</p>
<p class=3D"MsoNormal">&gt; </p>
<p class=3D"MsoNormal">&gt; Sign off: Shubham Agrawal &lt;shuagr@microsoft.=
com&gt;</p>
<p class=3D"MsoNormal">&gt; ---</p>
<p class=3D"MsoNormal">&gt;&nbsp; meta/recipes-devtools/elfutils/elfutils_0=
.175.bb&nbsp;&nbsp; |&nbsp;&nbsp; 2 &#43;</p>
<p class=3D"MsoNormal">&gt;&nbsp; .../elfutils/files/CVE-2019-7664.patch&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbs=
p; 65 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;</p>
<p class=3D"MsoNormal">&gt;&nbsp; .../elfutils/files/CVE-2019-7665.patch&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 154=
 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;</p>
<p class=3D"MsoNormal">&gt;&nbsp; 3 files changed, 221 insertions(&#43;)</p=
>
<p class=3D"MsoNormal">&gt;&nbsp; create mode 100644 meta/recipes-devtools/=
elfutils/files/CVE-2019-7664.patch</p>
<p class=3D"MsoNormal">&gt;&nbsp; create mode 100644 meta/recipes-devtools/=
elfutils/files/CVE-2019-7665.patch</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">....</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&gt; &#43;diff --git a/libelf/ChangeLog b/libelf/Cha=
ngeLog</p>
<p class=3D"MsoNormal">&gt; &#43;index 68c4fbd..892e6e7 100644</p>
<p class=3D"MsoNormal">&gt; &#43;--- a/libelf/ChangeLog</p>
<p class=3D"MsoNormal">&gt; &#43;&#43;&#43;&#43; b/libelf/ChangeLog</p>
<p class=3D"MsoNormal">&gt; &#43;@@ -1,3 &#43;1,16 @@</p>
<p class=3D"MsoNormal">&gt; &#43;&#43;&lt;&lt;&lt;&lt;&lt;&lt;&lt; HEAD</p>
<p class=3D"MsoNormal">&gt; &#43;&#43;=3D=3D=3D=3D=3D=3D=3D</p>
<p class=3D"MsoNormal">&gt; &#43;&#43;2019-01-16&nbsp; Mark Wielaard&nbsp; =
&lt;mark@klomp.org&gt;</p>
<p class=3D"MsoNormal">&gt; &#43;&#43;</p>
<p class=3D"MsoNormal">&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * note=
_xlate.h (elf_cvt_note): Check n_namesz and n_descsz don't</p>
<p class=3D"MsoNormal">&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; overfl=
ow note_len into note header.</p>
<p class=3D"MsoNormal">&gt; &#43;&#43;</p>
<p class=3D"MsoNormal">&gt; &#43;&#43;2018-11-17&nbsp; Mark Wielaard&nbsp; =
&lt;mark@klomp.org&gt;</p>
<p class=3D"MsoNormal">&gt; &#43;&#43;</p>
<p class=3D"MsoNormal">&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * elf3=
2_updatefile.c (updatemmap): Make sure to call convert</p>
<p class=3D"MsoNormal">&gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; functi=
on on a properly aligned destination.</p>
<p class=3D"MsoNormal">&gt; &#43;&#43;</p>
<p class=3D"MsoNormal">&gt; &#43;&#43;&gt;&gt;&gt;&gt;&gt;&gt;&gt; e65d91d.=
.. libelf: Correct overflow check in note_xlate.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">You should resolve these conflicts (or drop the Chan=
geLog updates</p>
<p class=3D"MsoNormal">completely from the backports as they will conflict =
with any other</p>
<p class=3D"MsoNormal">backport as well.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_MW2PR2101MB08918889602F23311640FF18DB850MW2PR2101MB0891_--
