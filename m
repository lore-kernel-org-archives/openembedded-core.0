Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC01F7ED57
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 11:25:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x76BQ0Se021781
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Aug 2019 04:26:00 -0700 (PDT)
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.205]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0468.000;
	Tue, 6 Aug 2019 04:26:00 -0700
From: "Yang, Liezhi" <Liezhi.Yang@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Thread-Topic: [OE-core] [PATCH v2 1/1] stress-ng: Add bash to
	RDEPENDS_stress-ng-bash-completion
Thread-Index: AQHVTElutA6NV1bBJUyaiNvuAxyja6bt+t8R
Date: Tue, 6 Aug 2019 11:25:59 +0000
Message-ID: <5AEF30BA-F0C4-4ABE-9982-F1C32C707A0A@windriver.com>
References: <cover.1565090985.git.liezhi.yang@windriver.com>
	<b1f29c78cdca27e574a89d9dd9b750e6a43cc7de.1565090985.git.liezhi.yang@windriver.com>,
	<CANNYZj-x4O4rtFhZi9j+h09AmJy4tqP-hLqFnZksT-xwvCCuCA@mail.gmail.com>
In-Reply-To: <CANNYZj-x4O4rtFhZi9j+h09AmJy4tqP-hLqFnZksT-xwvCCuCA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] stress-ng: Add bash to RDEPENDS_stress-ng-bash-completion
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
X-List-Received-Date: Tue, 06 Aug 2019 11:25:59 -0000
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_5AEF30BAF0C44ABE9982F1C32C707A0Awindrivercom_"

--_000_5AEF30BAF0C44ABE9982F1C32C707A0Awindrivercom_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Got it, thanks, will send a v3 tomorrow.

// Robert

Sent from mobile phone

=1B$B:_=1B(B 2019=1B$BG/=1B(B8=1B$B7n=1B(B6=1B$BF|!$=1B(B19:23=1B$B!$=1B(BA=
lexander Kanavin <alex.kanavin@gmail.com<mailto:alex.kanavin@gmail.com>> =
=1B$B<LF;!'=1B(B

On Tue, 6 Aug 2019 at 13:06, Robert Yang <liezhi.yang@windriver.com<mailto:=
liezhi.yang@windriver.com>> wrote:
Fixed:
$ bitbake stress-ng bash -ccleansstate && bitbake stress-ng
ERROR: stress-ng-0.10.00-r0 do_package_qa: QA Issue: /usr/share/bash-comple=
tion/completions/stress-ng contained in package stress-ng-bash-completion r=
equires /bin/bash, but no providers found in RDEPENDS_stress-ng-bash-comple=
tion? [file-rdeps]

 /usr/share/bash-completion/completions/stress-ng has an unnecessary #!/bin=
/bash at the start. The correct way to address this is to patch it out at t=
he source level.

Alex

--_000_5AEF30BAF0C44ABE9982F1C32C707A0Awindrivercom_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
</head>
<body dir=3D"auto">
Got it, thanks, will send a v3 tomorrow.
<div><br>
</div>
<div>// Robert<br>
<br>
<div dir=3D"ltr" id=3D"AppleMailSignature">Sent from mobile phone</div>
<div dir=3D"ltr"><br>
=1B$B:_=1B(B 2019=1B$BG/=1B(B8=1B$B7n=1B(B6=1B$BF|!$=1B(B19:23=1B$B!$=1B(BA=
lexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin=
@gmail.com</a>&gt; =1B$B<LF;!'=1B(B<br>
<br>
</div>
<blockquote type=3D"cite">
<div dir=3D"ltr">
<div dir=3D"ltr">
<div dir=3D"ltr">On Tue, 6 Aug 2019 at 13:06, Robert Yang &lt;<a href=3D"ma=
ilto:liezhi.yang@windriver.com">liezhi.yang@windriver.com</a>&gt; wrote:<br=
>
</div>
<div class=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Fixed:<br>
$ bitbake stress-ng bash -ccleansstate &amp;&amp; bitbake stress-ng<br>
ERROR: stress-ng-0.10.00-r0 do_package_qa: QA Issue: /usr/share/bash-comple=
tion/completions/stress-ng contained in package stress-ng-bash-completion r=
equires /bin/bash, but no providers found in RDEPENDS_stress-ng-bash-comple=
tion? [file-rdeps]<br>
</blockquote>
<div><br>
</div>
<div>&nbsp;/usr/share/bash-completion/completions/stress-ng has an unnecess=
ary #!/bin/bash at the start. The correct way to address this is to patch i=
t out at the source level.</div>
<div><br>
</div>
<div>Alex<br>
</div>
</div>
</div>
</div>
</blockquote>
</div>
</body>
</html>

--_000_5AEF30BAF0C44ABE9982F1C32C707A0Awindrivercom_--
