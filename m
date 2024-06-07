Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E44C27C53
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 11:47:19 +0000 (UTC)
Subject: Re: [scarthgap][PATCH V3] gcc : upgrade to v13.3
To: openembedded-core@lists.openembedded.org
From: "Hemraj, Deepthi" <Deepthi.Hemraj@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 125
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 07 Jun 2024 04:47:19 -0700
References: <20240607113850.3386116-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20240607113850.3386116-1-Deepthi.Hemraj@windriver.com>
Message-ID: <7313.1717760839267894431@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="OQTaXst8NJOJzACzZBql"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 11:47:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200438

--OQTaXst8NJOJzACzZBql
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Regression testing is done and below are the test results:

After update (v13.3)
=3D=3D=3D gcc Summary =3D=3D=3D

# of expected passes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 148863
# of unexpected failures=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 14
# of expected failures=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1415
# of unresolved testcases=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25378
# of unsupported tests=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 2698

Before update (v13.2)
=3D=3D=3D gcc Summary =3D=3D=3D

# of expected passes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 148314
# of unexpected failures=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 15
# of expected failures=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1420
# of unresolved testcases=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 25129
# of unsupported tests=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 2685

Diff:
# of expected passes=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +549
# of unexpected failures =C2=A0 =C2=A0 -1
# of expected failures=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-5
# of unresolved testcases=C2=A0 =C2=A0+249
# of unsupported tests=C2=A0 =C2=A0 =C2=A0 =C2=A0+13

--OQTaXst8NJOJzACzZBql
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Regression testing is done and below are the test results:<br /><br />
<p>After update (v13.3)<br />=3D=3D=3D gcc Summary =3D=3D=3D</p>
<p># of expected passes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; 148863<br /># of unexpected failures&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 14<br /># of expected failures&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 1415<br /># of unresolved testcases&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 25378<br /># of unsupported tests&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2698</p>
<p>&nbsp;</p>
<p>Before update (v13.2)<br />=3D=3D=3D gcc Summary =3D=3D=3D</p>
<p># of expected passes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; 148314<br /># of unexpected failures&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 15<br /># of expected failures&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 1420<br /># of unresolved testcases&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 25129<br /># of unsupported tests&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2685<br /><br /></p>
<p>Diff:<br /># of expected passes&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; +549<b=
r /># of unexpected failures &nbsp; &nbsp; -1<br /># of expected failures&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;-5<br /># of unresolved testcases&nbsp; &nb=
sp;+249<br /># of unsupported tests&nbsp; &nbsp; &nbsp; &nbsp;+13</p>

--OQTaXst8NJOJzACzZBql--

