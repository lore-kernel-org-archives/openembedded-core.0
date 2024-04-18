Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19123C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 11:38:53 +0000 (UTC)
Subject: Re: [PATCH 1/2] gcc: fix for host key verfication & kex exchange identification failures
To: openembedded-core@lists.openembedded.org
From: "Sadineni, Harish" <Harish.Sadineni@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 123
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 18 Apr 2024 04:38:46 -0700
References: <20240418113416.93878-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20240418113416.93878-1-Harish.Sadineni@windriver.com>
Message-ID: <5531.1713440326264332128@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="pP0v10SBJ5I3GqX5CLT6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 11:38:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198514

--pP0v10SBJ5I3GqX5CLT6
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

testresults before applying patch for x86_64 :
|=C2=A0 gcc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0g++=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 libatomic=C2=A0 =C2=A0 |=C2=
=A0 =C2=A0libgomp=C2=A0 |=C2=A0 =C2=A0 libitm=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0libstdc++ |=C2=A0 Total (Sum of all modules)
expected passes=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 148313=C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A0218545=C2=A0 =C2=A0 =C2=A0 |=C2=A0 27=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 3369=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 24=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 96=
93=C2=A0 =C2=A0 =C2=A0|=C2=A0 379971
unexpected failures=C2=A0 =C2=A0 =C2=A0|=C2=A0 15=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A020=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 35
expected failures=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1419=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02052=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A0 30=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 6=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3507
unresolved testcases=C2=A0 |=C2=A0 25130=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A010816=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 27=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1579=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 =C2=A022=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 4869=C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 42443
unsupported tests=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2686=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A010420=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =
410=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A02=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 643=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 14161

testresults after applying patch for x86_64:
|=C2=A0 gcc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0g++=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 libatomic=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0libgomp=C2=A0 |=C2=A0 =C2=A0 libitm=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0li=
bstdc++ |=C2=A0 Total (Sum of all modules)
expected passes=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 177610=C2=A0 =C2=
=A0 |=C2=A0 =C2=A0230158=C2=A0 =C2=A0 =C2=A0|=C2=A0 54=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 5033=C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A0 24=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 13695=C2=A0 =C2=
=A0 |=C2=A0 426574
unexpected failures=C2=A0 =C2=A0 =C2=A0|=C2=A0 99=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A020=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 19=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 7=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 146
expected failures=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1422=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02063=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 3=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 106=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 3626
unresolved testcases=C2=A0 |=C2=A0 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 112=
5=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1129
unsupported tests=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2147=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A010350=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 429=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A0 805=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 13733

Unresolved cases are reduced to ~1000 (i.e., More than 41K tests are newly =
executed)
More than 45000 tests cases are passed newly.

Thanks,
Harish

--pP0v10SBJ5I3GqX5CLT6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>testresults before applying patch for x86_64 :</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; gcc&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp;g++&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;|&nbsp; libatomic&nbsp; &nbsp; |&nbsp; &nbsp;libgomp&nbsp;=
 |&nbsp; &nbsp; libitm&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp;libstdc++ |&nbsp; =
Total (Sum of all modules)</div>
<div>expected passes&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 148313&nbsp; =
&nbsp; &nbsp;|&nbsp; &nbsp;218545&nbsp; &nbsp; &nbsp; |&nbsp; 27&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; 3369&nbsp; &nbsp; &nbs=
p; |&nbsp; &nbsp; 24&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; &nbsp;=
 9693&nbsp; &nbsp; &nbsp;|&nbsp; 379971</div>
<div>unexpected failures&nbsp; &nbsp; &nbsp;|&nbsp; 15&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; &nbsp;20&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 35</div=
>
<div>expected failures&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 1419&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; &nbsp;2052&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 |&nbsp; &nbsp; 30&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; &nbsp; 6&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 3507&nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>unresolved testcases&nbsp; |&nbsp; 25130&nbsp; &nbsp; &nbsp; &nbsp; |&=
nbsp; &nbsp;10816&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 27&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; 1579&nbsp; &nbsp; &nbsp; |&nbsp;=
 &nbsp; &nbsp;22&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; 4869&nbsp=
; &nbsp; &nbsp; |&nbsp; 42443&nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>unsupported tests&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 2686&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp;10420&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbs=
p; 410&nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp;2&nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; &nbsp; 643&nbsp; &nbsp; &nbsp; &nbsp;|=
&nbsp; 14161&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>testresults after applying patch for x86_64:</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; gcc&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp;g++&nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;|&nbsp; libatomic&nbsp; &nbsp; |&nbsp; &nbsp;libgomp&nbsp; |&nbsp=
; &nbsp; libitm&nbsp; &nbsp; &nbsp; |&nbsp; &nbsp;libstdc++ |&nbsp; Total (=
Sum of all modules)&nbsp;</div>
<div>expected passes&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 177610&nbsp; =
&nbsp; |&nbsp; &nbsp;230158&nbsp; &nbsp; &nbsp;|&nbsp; 54&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; 5033&nbsp; &nbsp; &nbsp; |&nb=
sp; &nbsp; 24&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; 13695&nbsp; =
&nbsp; |&nbsp; 426574&nbsp;</div>
<div>unexpected failures&nbsp; &nbsp; &nbsp;|&nbsp; 99&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;|&nbsp; &nbsp;20&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; |&nbsp; &nbsp; 1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nb=
sp; 19&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; 7&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; |&nbsp; 146</div>
<div>expected failures&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 1422&nbsp; =
&nbsp; &nbsp; &nbsp;|&nbsp; &nbsp;2063&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp=
; &nbsp; 32&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; 3&nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; 106&nbsp; &nbsp; &nbsp; &nbsp; =
|&nbsp; 3626&nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>unresolved testcases&nbsp; |&nbsp; 4&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; |&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; =
1125&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 1129&nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>unsupported tests&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 2147&nbsp; &nbsp; =
&nbsp; &nbsp; |&nbsp; &nbsp;10350&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; 429&=
nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp; 2&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; |&nbsp; &nbsp; 805&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 13733=
&nbsp; &nbsp;&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Unresolved cases are reduced to ~1000 (i.e., More than 41K tests are n=
ewly executed)</div>
<div>More than 45000 tests cases are passed newly.</div>
<div>&nbsp;</div>
<div>Thanks,</div>
<div>Harish</div>
<div>&nbsp;</div>

--pP0v10SBJ5I3GqX5CLT6--

