Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1F903605BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 12:27:21 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id h22so51761431lfk.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 05:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HxNnxxY2CjiaX+Vy43zYHByOTapG23ZDM/ZInjPNBTw=;
	b=JetcRBtZq3EUfx8luGkkiScTqepGvmRR67PAyc6Nr4XW1CoT931sjmGVSM70AdH23B
	le2BKhTFBGOnMS7W5e/xd6/GPtjqFa1dxQlxhMEEvsmfj58ffbe8tc6wW+7VB0bWXw3p
	C5sjv+2SZ3d4je70n/lIWAZriEMSTGS1oJP46+jhPCNCr3EDK/FugCauqSelNYWLexSP
	qoiaXg13c3qXw4aBsBOFY96LEzJYXbjWTW8mh+plBJHmTqMKtzM64Cc+Qkh51knd2p1Q
	ucWnglm1ngsgPr48+UIA3b6G9WQRLCholOiyEJ5IO2U3jeiiJwbPMjz+JwQPLJSqksdL
	YqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HxNnxxY2CjiaX+Vy43zYHByOTapG23ZDM/ZInjPNBTw=;
	b=DfVYQ96p9NB3G5BArvkREkn7XJVncVRm2TQK7QHQSVNf1e9SjYJ+BObYtOmjIPfAn4
	fVJPJSxUQ0dSk0mikXZfV7CLnAaiXgxnWWuUrhA9o3focg0P9hZbpti/lmpPwc/vyzc8
	IMaWF8TdG2gx4M9UcJT5f8XVNnARxVgkuZ91Rx/qob7NVO9T/BXVGySPgmRl8HonHJCG
	A7rYa0RRMlivRzlAgQGznxXRiYyINvjepDxYpKNLzZrJ76xbl9VqCnoDR+WkWkw+VjKC
	fYtqpjf74TlSZCp9PzwTbpiNbLxYdOfA9tdKXpqdGKYTFiYB54PvZZMRtNxIRPCRFRrp
	kr9Q==
X-Gm-Message-State: AKS2vOwZl9EE94rUpT5yds0IygWrvanItotXVaRHxjj+kqV8EtgTs52y
	EKkUWmrTye5WA8etIPIJdZG+Ehsi9w==
X-Received: by 10.25.27.2 with SMTP id b2mr4573053lfb.24.1498739242275; Thu,
	29 Jun 2017 05:27:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Thu, 29 Jun 2017 05:27:21 -0700 (PDT)
In-Reply-To: <20170629093124.2381.27372@do.openembedded.org>
References: <1498727946-3229-1-git-send-email-zhe.he@windriver.com>
	<20170629093124.2381.27372@do.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Jun 2017 08:27:21 -0400
Message-ID: <CADkTA4N+6USZboM2OrbB5XzFAz9nOHn17bkXAiG=yhO3QHU=0Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHNjaGVkdG9vbC1kbDogRml4IFNDSEVEX0RFQURMSU5FIHZhbHVlIG91dCBvZiByYW5nZQ==?=
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
X-List-Received-Date: Thu, 29 Jun 2017 12:27:23 -0000
Content-Type: multipart/alternative; boundary="001a1140244c259ac00553186c1c"

--001a1140244c259ac00553186c1c
Content-Type: text/plain; charset="UTF-8"

Zhe emailed me, and this is actually for meta-realtime. The README
indicates that
changes should be sent to oe-core .. but obviously that isn't accurate
anymore.

I'm updating the README, and this can be resent to the yocto mailing list
with
[meta-realtime] in the subject.

Cheers,

Bruce

On Thu, Jun 29, 2017 at 5:31 AM, Patchwork <
patchwork@patchwork.openembedded.org> wrote:

> == Series Details ==
>
> Series: schedtool-dl: Fix SCHED_DEADLINE value out of range
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/7507/
> State : failure
>
> == Summary ==
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Issue             Series does not apply on top of target branch
> [test_series_merge_on_head]
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at c594cacc88)
>
>
>
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your
> concerns.
> Otherwise we would appreciate you correcting the issues and submitting a
> new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1140244c259ac00553186c1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Zhe emailed me, and this is actually for meta-realtime. Th=
e README indicates that<div>changes should be sent to oe-core .. but obviou=
sly that isn&#39;t accurate anymore.</div><div><br></div><div>I&#39;m updat=
ing the README, and this can be resent to the yocto mailing list with</div>=
<div>[meta-realtime] in the subject.</div><div><br></div><div>Cheers,</div>=
<div><br></div><div>Bruce</div></div><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">On Thu, Jun 29, 2017 at 5:31 AM, Patchwork <span dir=3D=
"ltr">&lt;<a href=3D"mailto:patchwork@patchwork.openembedded.org" target=3D=
"_blank">patchwork@patchwork.openembedded.org</a>&gt;</span> wrote:<br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">=3D=3D Series Details =3D=3D<br>
<br>
Series: schedtool-dl: Fix SCHED_DEADLINE value out of range<br>
Revision: 1<br>
URL=C2=A0 =C2=A0: <a href=3D"https://patchwork.openembedded.org/series/7507=
/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.<wbr>openembedded=
.org/series/7507/</a><br>
State : failure<br>
<br>
=3D=3D Summary =3D=3D<br>
<br>
<br>
Thank you for submitting this patch series to OpenEmbedded Core. This is<br=
>
an automated response. Several tests have been executed on the proposed<br>
series by patchtest resulting in the following failures:<br>
<br>
<br>
<br>
* Issue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Series does not appl=
y on top of target branch [test_series_merge_on_head]<br>
=C2=A0 Suggested fix=C2=A0 =C2=A0 Rebase your series on top of targeted bra=
nch<br>
=C2=A0 Targeted branch=C2=A0 master (currently at c594cacc88)<br>
<br>
<br>
<br>
If you believe any of these test results are incorrect, please reply to the=
<br>
mailing list (<a href=3D"mailto:openembedded-core@lists.openembedded.org">o=
penembedded-core@lists.<wbr>openembedded.org</a>) raising your concerns.<br=
>
Otherwise we would appreciate you correcting the issues and submitting a ne=
w<br>
version of the patchset if applicable. Please ensure you add/increment the<=
br>
version number when sending the new version (i.e. [PATCH] -&gt; [PATCH v2] =
-&gt;<br>
[PATCH v3] -&gt; ...).<br>
<br>
---<br>
Test framework: <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/patcht=
est" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproject.org/<wbr>=
cgit/cgit.cgi/patchtest</a><br>
Test suite:=C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit/=
cgit.cgi/patchtest-oe" rel=3D"noreferrer" target=3D"_blank">http://git.yoct=
oproject.org/<wbr>cgit/cgit.cgi/patchtest-oe</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--001a1140244c259ac00553186c1c--
