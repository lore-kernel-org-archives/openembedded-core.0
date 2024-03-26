Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A6FC6FD1F
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 17:46:50 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.16467.1711475204972691915
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Mar 2024 10:46:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XPmqubZt;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5d8b70b39efso4025007a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 10:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711475204; x=1712080004; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lZvQmFvaNBjx8CLnjsamdSROQGd3kfmYo7zJkzGH8N0=;
        b=XPmqubZtkZRfjtEp3+1gAfJyUX9nHja/yplARqpIbbgFm5KUiGD/hx8frgNbv+yT9q
         ZxLf5a/Ms8AFS2mzGY3wFesRqZ9w4oSxjqCmazzmFjxEkKOC+o/VZQDX/rVnNDsHKf+X
         WXbOqAWlL3lEX7YFUP1N5XMgrg8ooDf2ErgtgFndR7UdMxPSwgy+bvr0AJrSdeBWm2G4
         Km9K22M8VO4DL91c1q+ppLXgRvLCCHMvmwxG2LWCo8A6j0yF7ZWZPXX3pNzt0JEoG6Ar
         x75jO6eqzUDOFt0kLwEIMEanBgW3cxo1AgwfGppitclek+UjsBOUBUaH6l+dFZ8JLAJC
         WFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711475204; x=1712080004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZvQmFvaNBjx8CLnjsamdSROQGd3kfmYo7zJkzGH8N0=;
        b=ekCq2zhj3uZtL9GIdny7vlA95ubHvWkgdOXApDh2gnoeBiOpcLY5PRFM7H9giMofCk
         7dvX9yDHrAwWsoATQsVvTxJKXFZnekTJWA+2N9IMRPiLbLB4JWibFAwrhweYnTgNbbOU
         Q6F27sdZ4J6ufDFSjEQL47TC1MDGQkgJjfnLDK2NqpggEHtEWcQM9nD2E6cuOmG9de1c
         wW4MWzKrnR4il0cFbPUaes/GJoW8jyI6fBWW4tHMXvZPE6ss1yIGSviLaUWBDkMvXAvE
         +VRWhUKkiAzRXVwQChQ0qzENY4/7LDxf3iyw/uxaQm1YXPhVg0uZoEG6SteGBlWEQ9XZ
         2fUg==
X-Gm-Message-State: AOJu0Yw0lG3HUzOJbvXccNsH0eSf46NTTwMAMrW3Awux5/qAlVt668DT
	iUOsCAMHZpzywuN2+HzNL5MoD7xZFb3IziUe68tqcDRJj9Z0dHqCZ3eY0fTk9IElEEby68s7AcV
	PpwuKsyjxIsUiJ1xvmjdPiUsel/c=
X-Google-Smtp-Source: AGHT+IHY89Bm25Fn57Kch1cn836TTUgrkWVyFplbX4WqnuBLNWoeQoL6nToHAV1Rtc17c1tyhm7MuV4q+ZXb+d3A1aE=
X-Received: by 2002:a17:90a:fb53:b0:29f:a0e0:3aef with SMTP id
 iq19-20020a17090afb5300b0029fa0e03aefmr510600pjb.17.1711475204123; Tue, 26
 Mar 2024 10:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240325102055.1037135-1-max.oss.09@gmail.com>
In-Reply-To: <20240325102055.1037135-1-max.oss.09@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 26 Mar 2024 13:46:32 -0400
Message-ID: <CADkTA4PYLUCck7Y0evO_597xOvwooe1vn5kSvJ1pqq+ew98FKg@mail.gmail.com>
Subject: Re: [OE-core][Patch v1 1/2] perf: fix build with latest kernel
To: max.oss.09@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: multipart/alternative; boundary="000000000000957496061493dfef"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 17:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197537

--000000000000957496061493dfef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 6:21=E2=80=AFAM <max.oss.09@gmail.com> wrote:

> From: Max Krummenacher <max.krummenacher@toradex.com>
>
> Kernel commit 9eea8fafe33e ("libbpf: fix __arg_ctx type enforcement for
> perf_event programs") added with 6.9-rc1
> tools/include/uapi/asm/bpf_perf_event.h
> which for arc, arm64, loongarch, riscv and s390 includes headers from
> the arch/${ARCH}/... directories.
> Thus the build in OE fails as those headers are not present.
>
> Fix this by additioanly copying all files in arch/${ARCH}/include/.
>
> Fixes:
> ERROR: perf-1.0-r0 do_compile: oe_runmake failed
> | In file included from
> work/verdin_imx8mm-tdx-linux/perf/1.0/perf-1.0/tools/include/uapi/linux/b=
pf_perf_event.h:11,
> |                  from libbpf.c:36:
> |
> work/verdin_imx8mm-tdx-linux/perf/1.0/perf-1.0/tools/include/uapi/asm/bpf=
_perf_event.h:2:10:
> fatal error: ../../arch/arm64/include/uapi/asm/bpf_perf_event.h: No such
> file or directory
> |     2 | #include "../../arch/arm64/include/uapi/asm/bpf_perf_event.h"
> |       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/
> perf.bb
> index 4f26813de0..6408c65462 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -139,6 +139,7 @@ PERF_SRC ?=3D "Makefile \
>               tools/scripts \
>               scripts/ \
>               arch/arm64/tools \
> +             arch/${ARCH}/include \
>

We've always tried to stay within the tools/ source umbrella since we reall=
y
don't want to copy any more of the kernel than we have to, since otherwise,
we might as well go back to simplifying things and just building against th=
e
entire kernel source tree.

I'd like to see if there's a way that we could limit this to the uapi (and
hence
use our uapi headers), and avoid needing to make the copy. If we need a
copy, then being as specific as possible would be the goal.

I'm not moving linux-yocto-dev to the latest -dev until next week, but I
can
look into this more then.

Bruce



>               arch/${ARCH}/Makefile \
>  "
>
> --
> 2.42.0
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000957496061493dfef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Mar 25, 2024 at 6:21=E2=80=AFAM &lt;<a href=
=3D"mailto:max.oss.09@gmail.com">max.oss.09@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">From: Max Krummenacher=
 &lt;<a href=3D"mailto:max.krummenacher@toradex.com" target=3D"_blank">max.=
krummenacher@toradex.com</a>&gt;<br>
<br>
Kernel commit 9eea8fafe33e (&quot;libbpf: fix __arg_ctx type enforcement fo=
r<br>
perf_event programs&quot;) added with 6.9-rc1 tools/include/uapi/asm/bpf_pe=
rf_event.h<br>
which for arc, arm64, loongarch, riscv and s390 includes headers from<br>
the arch/${ARCH}/... directories.<br>
Thus the build in OE fails as those headers are not present.<br>
<br>
Fix this by additioanly copying all files in arch/${ARCH}/include/.<br>
<br>
Fixes:<br>
ERROR: perf-1.0-r0 do_compile: oe_runmake failed<br>
| In file included from work/verdin_imx8mm-tdx-linux/perf/1.0/perf-1.0/tool=
s/include/uapi/linux/bpf_perf_event.h:11,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from libbpf=
.c:36:<br>
| work/verdin_imx8mm-tdx-linux/perf/1.0/perf-1.0/tools/include/uapi/asm/bpf=
_perf_event.h:2:10: fatal error: ../../arch/arm64/include/uapi/asm/bpf_perf=
_event.h: No such file or directory<br>
|=C2=A0 =C2=A0 =C2=A02 | #include &quot;../../arch/arm64/include/uapi/asm/b=
pf_perf_event.h&quot;<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
<br>
Signed-off-by: Max Krummenacher &lt;<a href=3D"mailto:max.krummenacher@tora=
dex.com" target=3D"_blank">max.krummenacher@toradex.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nor=
eferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a href=
=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a><br>
index 4f26813de0..6408c65462 100644<br>
--- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
@@ -139,6 +139,7 @@ PERF_SRC ?=3D &quot;Makefile \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tools/scripts \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 scripts/ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm64/tools \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arch/${ARCH}/include \<br>=
</blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font=
-size:small">We&#39;ve always tried to stay within the tools/ source umbrel=
la since we really</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">don&#39;t want to copy any more of the kernel than we have to, since ot=
herwise,=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small">=
we might as well go back to simplifying things and just building against th=
e</div><div class=3D"gmail_default" style=3D"font-size:small">entire kernel=
 source tree.</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;d lik=
e to see if there&#39;s a way that we could limit this to the uapi (and hen=
ce</div><div class=3D"gmail_default" style=3D"font-size:small">use our uapi=
 headers), and avoid needing to make the copy. If we need a=C2=A0</div><div=
 class=3D"gmail_default" style=3D"font-size:small">copy, then being as spec=
ific as possible would be the goal.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">I&#39;m not moving linux-yocto-dev to the latest -dev until next=
 week, but I=C2=A0 can</div><div class=3D"gmail_default" style=3D"font-size=
:small">look into this more then.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/${ARCH}/Makefile \<br=
>
=C2=A0&quot;<br>
<br>
-- <br>
2.42.0<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--000000000000957496061493dfef--

