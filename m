Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A461C87FC9
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 07:41:18 +0000 (UTC)
Subject: Re: [PATCH] binutils: Upgrade to 2.45 release
To: openembedded-core@lists.openembedded.org
From: "Varatharajan, Deepesh" <deepesh.varatharajan@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 138
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 30 Jul 2025 00:41:08 -0700
References: <20250729163655.3076122-1-raj.khem@gmail.com>
In-Reply-To: <20250729163655.3076122-1-raj.khem@gmail.com>
Message-ID: <24681.1753861268208129492@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="u32l9Tq7wLf578oLyJOK"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 07:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221107

--u32l9Tq7wLf578oLyJOK
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

Below are the test results for binutils v2.45 upgrade

qemuarm64
v2.44=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v2.45
No. of expected passes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 258=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 259
No. of unexpected failures=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1
No. of expected failures=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1
No. of untested testcases=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1
No. of unsupported tests=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11

qemux86-64
v2.44 =E2=80=83=E2=80=83v2.45
No. of expected passes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 310=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 315
No. of unexpected failures=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 1
No. of untested testcases=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5
No. of unsupported tests=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 9=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8

UNTESTED testcases:
Below tests are the newly added testcases with v2.45 (specific to x86-64 ar=
ch)
+UNTESTED: pr33198 with -R .gnu.lto_* -R .gnu.debuglto_* -R .llvm.lto -N __=
gnu_lto_v1
+UNTESTED: pr33198-fat with -R .gnu.lto_* -R .gnu.debuglto_* -R .llvm.lto -=
N __gnu_lto_v1
+UNTESTED: pr33198 with -R .llvm.lto
+UNTESTED: pr33198-fat with -R .llvm.lto

Regards,
Deepesh

--u32l9Tq7wLf578oLyJOK
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi All,<br /><br /><span data-teams=3D"true">Below are the test result=
s for binutils v2.45 upgrade</span><br /><br />
<p>qemuarm64&nbsp;<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;v2.44&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; v2.45&nbsp;&nbsp;&nbsp;&nbsp;<br />No. of expected passes&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 258&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 259<br />No. of unexpected failures&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; 1&nbsp;<br />No. of expected failures&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; 1<br />No. of untested testcases&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
1<br />No. of unsupported tests&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;12&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11</p>
<p>&nbsp;</p>
<p>qemux86-64<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; v2.44 &emsp;&emsp;v2.45&emsp;&emsp;&em=
sp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;=
&emsp;<br />No. of expected passes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 310&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; 315<br />No. of unexpected failures&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br />No. of untested testcases&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; 5<br />No. of unsupported tests&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; 9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
8</p>
<p>&nbsp;</p>
<p>UNTESTED testcases:<br />Below tests are the newly added testcases with =
v2.45 (specific to x86-64 arch)<br />+UNTESTED: pr33198 with -R .gnu.lto_* =
-R .gnu.debuglto_* -R .llvm.lto -N __gnu_lto_v1<br />+UNTESTED: pr33198-fat=
 with -R .gnu.lto_* -R .gnu.debuglto_* -R .llvm.lto -N __gnu_lto_v1<br />+U=
NTESTED: pr33198 with -R .llvm.lto<br />+UNTESTED: pr33198-fat with -R .llv=
m.lto<br /><br />Regards,<br />Deepesh</p>
</div>

--u32l9Tq7wLf578oLyJOK--

