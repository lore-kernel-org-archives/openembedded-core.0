Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 31DE07F36A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 11:24:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x76BOpe7021685
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Aug 2019 04:24:51 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.205]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0468.000;
	Tue, 6 Aug 2019 04:24:51 -0700
From: "Yang, Liezhi" <Liezhi.Yang@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/1] stress-ng: Add bash to DEPENDS
Thread-Index: AQHVTCHU7avU+L5cOUqhdbQVfhE0E6buZLeAgAAFB4CAAAN3gP//jaZR
Date: Tue, 6 Aug 2019 11:24:50 +0000
Message-ID: <1434D6A2-2799-43C4-B715-05F4D8EC67BB@windriver.com>
References: <cover.1565075067.git.liezhi.yang@windriver.com>
	<e5519d97e195842c793f688162919b21851d1dcb.1565075067.git.liezhi.yang@windriver.com>
	<4f3b75ada0eae73855b43347a56ea89042ab6aae.camel@linuxfoundation.org>
	<18287a98-33b5-c788-946e-5b5338c1c204@windriver.com>,
	<CANNYZj8nk8q7VscomyLkaLYcNy-2gH+nwgsKgAO7x59i7uDgHw@mail.gmail.com>
In-Reply-To: <CANNYZj8nk8q7VscomyLkaLYcNy-2gH+nwgsKgAO7x59i7uDgHw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] stress-ng: Add bash to DEPENDS
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
X-List-Received-Date: Tue, 06 Aug 2019 11:24:53 -0000
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_1434D6A2279943C4B71505F4D8EC67BBwindrivercom_"

--_000_1434D6A2279943C4B71505F4D8EC67BBwindrivercom_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable



Sent from mobile phone

=1B$B:_=1B(B 2019=1B$BG/=1B(B8=1B$B7n=1B(B6=1B$BF|!$=1B(B19:14=1B$B!$=1B(BA=
lexander Kanavin <alex.kanavin@gmail.com<mailto:alex.kanavin@gmail.com>> =
=1B$B<LF;!'=1B(B

On Tue, 6 Aug 2019 at 13:01, Robert Yang <liezhi.yang@windriver.com<mailto:=
liezhi.yang@windriver.com>> wrote:

Yes, exactly, I will send a V2 for it. What mis-leaded me was that
stress-ng-bash-completion RDEPENDS on bash-completion, and bash-completion
RDEPENDS on bash, so bash is on the dependencies chain, but stress-ng can't
find it, and there is no qa issues if we build bash firstly:

$ bitbake bash
$ bitbake stress-ng
No qa issues.

So the reproducer is:
$ bitbake stress-ng bash -ccleansstate && bitbake stress-ng

This might be a bug?

Note that bash-completion files are not executable, and we do not observe t=
his with other recipes. We might have a false positive here - can you look =
at the actual contents of the package please and see why _qa thinks it need=
s /bin/bash?

I had checked it, the completion file has a #/bin/bash header. I will check=
 its details tomorrow.

// Robert



Alex

--_000_1434D6A2279943C4B71505F4D8EC67BBwindrivercom_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
</head>
<body dir=3D"auto">
<br>
<br>
<div dir=3D"ltr" id=3D"AppleMailSignature">Sent from mobile phone</div>
<div dir=3D"ltr"><br>
=1B$B:_=1B(B 2019=1B$BG/=1B(B8=1B$B7n=1B(B6=1B$BF|!$=1B(B19:14=1B$B!$=1B(BA=
lexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin=
@gmail.com</a>&gt; =1B$B<LF;!'=1B(B<br>
<br>
</div>
<blockquote type=3D"cite">
<div dir=3D"ltr">
<div dir=3D"ltr">
<div dir=3D"ltr">On Tue, 6 Aug 2019 at 13:01, Robert Yang &lt;<a href=3D"ma=
ilto:liezhi.yang@windriver.com">liezhi.yang@windriver.com</a>&gt; wrote:<br=
>
</div>
<div class=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Yes, exactly, I will send a V2 for it. What mis-leaded me was that<br>
stress-ng-bash-completion RDEPENDS on bash-completion, and bash-completion<=
br>
RDEPENDS on bash, so bash is on the dependencies chain, but stress-ng can't=
<br>
find it, and there is no qa issues if we build bash firstly:<br>
<br>
$ bitbake bash<br>
$ bitbake stress-ng<br>
No qa issues.<br>
<br>
So the reproducer is:<br>
$ bitbake stress-ng bash -ccleansstate &amp;&amp; bitbake stress-ng<br>
<br>
This might be a bug?<br>
</blockquote>
<div><br>
</div>
<div>Note that bash-completion files are not executable, and we do not obse=
rve this with other recipes. We might have a false positive here - can you =
look at the actual contents of the package please and see why _qa thinks it=
 needs /bin/bash?</div>
</div>
</div>
</div>
</blockquote>
<div><br>
</div>
<div>I had checked it, the completion file has a #/bin/bash header. I will =
check its details tomorrow.</div>
<div><br>
</div>
<div>// Robert</div>
<div><br>
</div>
<br>
<blockquote type=3D"cite">
<div dir=3D"ltr">
<div dir=3D"ltr">
<div class=3D"gmail_quote">
<div><br>
</div>
<div>Alex<br>
</div>
</div>
</div>
</div>
</blockquote>
</body>
</html>

--_000_1434D6A2279943C4B71505F4D8EC67BBwindrivercom_--
