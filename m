Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13289.1793284199572262892
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 07:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=dW3YYKMR;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91c7b00a75fso24414076d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 07:29:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793284198; cv=none;
        d=google.com; s=arc-20260327;
        b=HxBL1q1qbLHcJjjnRUNGS3pbIRkHX+SpdRKoMxQNo0xPtUFQ5oIA+0sXsl7HEYGJMz
         tGPtwc8MifTYPMfozXIlbC0kqtoUSRYndR3+RxrAKqm2iNTsL4Wi03KSXsVVKwl0hP+K
         gZ2rQo9x3LuREKVqUskiKMgbTHF8NYJdSbxzIoZlMS54rwD/tGLELdaJ9n/QWC1p+Qgh
         +w38ucTO8LTi9AinLhOQba+jHf9otn/syLxsr9Pz2BpxBmf+TtWdBBF8LcNoE91PUC7S
         gogi/6eSrq13BJI3XY24wqUzJdX1XZlSEUUVM0mn/MlYp4uT78T8hypc9iTl46ToHJDy
         l8dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ip3zxE/VhY8+EDdUWsGmsjUjomqAo4BgfUqh2JqxD4o=;
        fh=LgVvNdBDyFg6OKd5RxQxbC/Gqbrp/ntTOykYYbCcy3Y=;
        b=GNGJ2ByqVVfMU2iXRzZMuNpgO0Q6aMDhO/YlqNW5TG+ffvP0HILnruU50M2zS2w66c
         EQoKP+dewoqHXZV0P0RSDQDtQWJGhGJ5Kn3Q9mhWsVd+h84wPkvMgd2KNN5j1+KZ9qGE
         VijD4cGGE5fQdetvGwXGc8G1Qdbup+LqJ2QUkpBFPATL4VIgbpXVMU5Q1HR7HPwkdxxz
         tLQKvFQfU717H+CPR6T3wj5DR6r16yB+KYNVYVJAQU8jOl51KsU82fHQyQnI9uK6rpgf
         O1tGIzWL7gjFVtOSmTycaKiykjLoFMBtsq2xXr0Ka84Hev9fuXemuv6QP4gsaZqgxweQ
         r5Ww==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793284198; x=1793888998; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ip3zxE/VhY8+EDdUWsGmsjUjomqAo4BgfUqh2JqxD4o=;
        b=dW3YYKMRnO+mW5col4SdlBBeNVG/CpCDj7iTnJXigOsTaSCYeEzmhE2m+4jV4HUIge
         leHQaF4ben2XhRoZkZe1Cs9Oqnf5aO6ME+0a0k6yOeO5dvOFmdCD61+JW3wnmS2my37t
         W+yaB3FN5BopI7o1AJvB65r1hnGL5poNMFKJKiRx6ogfFzG07B1Zsyeo6Fzue+uGeOjL
         cL1CBiF73ZRyZ5mZSaAQgjDM3uCOW1fDFlrRnYG/08S0YbUbKGTV9IdVEakz4j99jSyg
         x0zrSHrx+yRufAFNDSiOMMlVCmMnYHQOJnumDga+xb4f93KwLPsXxBlhFiRw3aIppVb7
         +v9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284198; x=1793888998;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ip3zxE/VhY8+EDdUWsGmsjUjomqAo4BgfUqh2JqxD4o=;
        b=WRDPs+7UU/8P6ODPNsBvrh4gxrxLEygNld3xmwufrvRnC7nJ+vMW0iHgn0xA5GCWT5
         DVMHN0aM8NQsE4szry4X8g3lrv4Ilcewsncb/bNMZk5VAtht6Z/itA1jdCRsDGesbnLq
         y0LHMGu8xKGw4lqaBU5PXteCkDRz6CjU9Qn2R1Rp80KVIVcv6xobts4JcQMEl20a02Ym
         Mm1xBkzpsBQEzUG8DXdXFc1yJQsrM3G1IBb7kRtpSPsBLQh6r6RDkHh5PMqcKtM6NxIJ
         +M5XXkTzSW4WRk0NTe0IFg2ufO6yf5wEamfM6q2useqZgtTuPb+X3fjkOiGeIwW44+Fp
         FCuw==
X-Gm-Message-State: AFq9FYKa++Hl1DSIYXtr2EWhrWlzk1yV+aexj/2E/RIODCX07tkmtB93
	1v2FKFNFxA28ImgxtbTm20IXFcTxPv5/5cye5M3e4sBtk8lfL/lDRGNbE57zPw95bO6MP/6Fgd7
	vp8FBSrwv/aM1BF+mRjqrl1XoMi9WiZY=
X-Gm-Gg: AYBFou2bAqRsgeaXJHZ4CXR77G+Fh+qMEBgHNZ1jjf1y3H3RnZUUk0HNPHQ6+JJi1K/
	w+XmvigungpmwfJ5mseUulMCeK1ZahNqr126QaKvGwFgpdTbUNdadeqNowA1XrS0AlV94TS0Fty
	FRuzxiRwVDcfzjyB+uJBLJiyZQsb5xsuu8woBAybUlNL9AOJMszjtP+4XnFIxjsa3C5ejBZPUpa
	RRzC02eZIACX9iQDIn+vvy3jKGhtkqGi6ehauXR60gNNs+0qY2gPjhE0jJZB4pOTssp5z/WTSdc
	kPX78kzF7krYzz/2MNFCFay2z5epR1OxsuSaPcTQCp1OYZ6aTUIhaiMAKRRJAwhQmKF6JyHzVjv
	nQpet5FdRjlyyTTbNRZKrZvrguOf4O7uUqUwKtOQ8wCMplD8ShRnRq7ViB/wteSEvXHqzWN4=
X-Received: by 2002:a05:620a:28d6:b0:93f:3978:481a with SMTP id
 af79cd13be357-94408cb9a50mr899003385a.51.1793284198112; Thu, 29 Oct 2026
 07:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <20261022084635.3702905-1-roshs@qti.qualcomm.com>
In-Reply-To: <20261022084635.3702905-1-roshs@qti.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 29 Oct 2026 15:29:45 +0100
X-Gm-Features: AclHuK_9D1sdlG6QxaW-oKtd2fEq5WofeyVD_VBdTQpF8kGtG87YdF9aJdI7mSc
Message-ID: <CANNYZj8v+Tk5zkt8tjPvyN31jKhYBLXm9eJgZgawYDiYo3-=hg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] rpm: disable the RPM 6 script interpreter
 dependency generator
To: roshs@qti.qualcomm.com
Cc: openembedded-core@lists.openembedded.org, 
	Sumanth Gavini <sumanth.gavini@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Paul Barker <paul@pbarker.dev>
Content-Type: multipart/alternative; boundary="0000000000009c25d2065efb8324"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 14:30:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248950

--0000000000009c25d2065efb8324
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Oct 2026 at 12:12, Roshan Sivakumar via lists.openembedded.org
<roshs=qti.qualcomm.com@lists.openembedded.org> wrote:

> RPM 4 generated dependencies with the external __find_requires /
> __find_provides generator, which OE disabled entirely via
> _use_internal_dependency_generator 0. RPM 6 removed that mechanism; for
> v6-format packages only the internal fileattr generators run.
>

I don't understand. What was enabled in rpm 4 and what was not? What ran
and what didn't? The above seems to say that rpm 4 used external generator,
which was disabled by oe, but then the disabling statement refers to
internal generator.


> rpm's script.attr generator therefore runs for the first time in OE
> builds. For every packaged executable whose first line is a #! shebang
> it emits an interpreter dependency. kernel-devsrc ships
> scripts/mksysmap (#!/bin/sed -f) as an executable, so its package gains:
>
>   Requires: /bin/sed
>
> OE manages build and runtime dependencies explicitly through
> DEPENDS / RDEPENDS and does not want these. They break real use cases:
>
> - The interpreter path is taken verbatim from the shebang. A #!/bin/sed
>   script requires /bin/sed, but under usrmerge the only provider
>   (busybox) offers /usr/bin/sed. The literal paths never match and the
>   package becomes uninstallable.
>

But if the script in a target package refers to /bin/sed, and the target
root filesystem is not providing that, then the problem is not with the
dependency checker, it's with the script and/or filesystem layout.
Disabling the check does not address that problem, it just sweeps it under
the carpet. Am I missing something? How does this work on Fedora for
example, which also uses usrmerge?


> - In the SDK the sole interpreter providers (busybox, coreutils, bash,
>   perl) are deliberately banned by target-sdk-provides-dummy, so these
>   auto-generated requires make -dev/-src packages uninstallable during
>   do_populate_sdk ("nothing provides /bin/sed needed by kernel-devsrc").
>

This probably needs steps to reproduce, so we can better understand the
issue.


> - The requires are non-reproducible: they are only emitted when the
>   interpreter is scanned from the shebang during packaging, so the same
>   recipe can produce different packages between the reproducible A and
>   B builds.
>

I also don't understand this. How does the non-reproducibility happen
exactly? Why would it produce different requires?


> This is the same class of regression already handled for the pkgconfig
> generator; see "rpm: disable the RPM 6 pkgconfig dependency generator".
>

There was also a concern during patch review that the checks that the
generator does are useful to catch missing runtime dependencies in recipes,
and disabling this would regress the packaging quality. Something like this
checker should be made generic (e.g. run in do_package, regardless of
specific packaging backend). How does this check work exactly, and where is
it implemented? Do we have an equivalent in do_package (I vaguely remember
that we do)? If there's an equivalent, then why it doesn't complain but the
rpm-specific check does?

This needs further investigation.

Alex

--0000000000009c25d2065efb8324
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 22 Oct 2026 at 12:12, Roshan Siva=
kumar via <a href=3D"http://lists.openembedded.org">lists.openembedded.org<=
/a> &lt;roshs=3D<a href=3D"mailto:qti.qualcomm.com@lists.openembedded.org">=
qti.qualcomm.com@lists.openembedded.org</a>&gt; wrote:</div><div class=3D"g=
mail_quote gmail_quote_container"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">RPM 4 generated dependencies with the external __find_requires /=
<br>
__find_provides generator, which OE disabled entirely via<br>
_use_internal_dependency_generator 0. RPM 6 removed that mechanism; for<br>
v6-format packages only the internal fileattr generators run.<br></blockquo=
te><div><br></div><div>I don&#39;t understand. What was enabled in rpm 4 an=
d what was not? What ran and what didn&#39;t? The above seems to say that r=
pm 4 used external generator, which was disabled by oe, but then the disabl=
ing statement refers to internal generator.</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
rpm&#39;s script.attr generator therefore runs for the first time in OE<br>
builds. For every packaged executable whose first line is a #! shebang<br>
it emits an interpreter dependency. kernel-devsrc ships<br>
scripts/mksysmap (#!/bin/sed -f) as an executable, so its package gains:<br=
>
<br>
=C2=A0 Requires: /bin/sed<br>
<br>
OE manages build and runtime dependencies explicitly through<br>
DEPENDS / RDEPENDS and does not want these. They break real use cases:<br>
<br>
- The interpreter path is taken verbatim from the shebang. A #!/bin/sed<br>
=C2=A0 script requires /bin/sed, but under usrmerge the only provider<br>
=C2=A0 (busybox) offers /usr/bin/sed. The literal paths never match and the=
<br>
=C2=A0 package becomes uninstallable.<br></blockquote><div><br></div><div>B=
ut if the script in a target package refers to /bin/sed, and the target roo=
t filesystem is not providing that, then the problem is not with the depend=
ency checker, it&#39;s with the script and/or filesystem layout. Disabling =
the check does not address that problem, it just sweeps it under the carpet=
. Am I missing something? How does this work on Fedora for example, which a=
lso uses usrmerge?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
- In the SDK the sole interpreter providers (busybox, coreutils, bash,<br>
=C2=A0 perl) are deliberately banned by target-sdk-provides-dummy, so these=
<br>
=C2=A0 auto-generated requires make -dev/-src packages uninstallable during=
<br>
=C2=A0 do_populate_sdk (&quot;nothing provides /bin/sed needed by kernel-de=
vsrc&quot;).<br></blockquote><div><br></div><div>This probably needs steps =
to reproduce, so we can better understand the issue.</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
- The requires are non-reproducible: they are only emitted when the<br>
=C2=A0 interpreter is scanned from the shebang during packaging, so the sam=
e<br>
=C2=A0 recipe can produce different packages between the reproducible A and=
<br>
=C2=A0 B builds.<br></blockquote><div><br></div><div>I also don&#39;t under=
stand this. How does the non-reproducibility happen exactly? Why would it p=
roduce different requires?</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
This is the same class of regression already handled for the pkgconfig<br>
generator; see &quot;rpm: disable the RPM 6 pkgconfig dependency generator&=
quot;.<br></blockquote><div><br></div><div>There was also a concern during =
patch review that the checks that the generator does are useful to catch mi=
ssing runtime dependencies in recipes, and disabling this would regress the=
 packaging quality. Something like this checker should be made generic (e.g=
. run in do_package, regardless of specific packaging backend). How does th=
is check work exactly, and where is it implemented? Do we have an equivalen=
t in do_package (I vaguely remember that we do)? If there&#39;s an equivale=
nt, then why it doesn&#39;t complain but the rpm-specific check does?</div>=
<div><br></div><div>This needs further investigation.</div><div><br></div><=
div>Alex</div></div></div>

--0000000000009c25d2065efb8324--
