Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16575.1792647377441836111
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 22:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S4jfDkIy;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8ad98c3fb15so12752227b3.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 22:36:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792647376; cv=none;
        d=google.com; s=arc-20260327;
        b=F5Bt08JSGvSx9+NXeRr4uKUZ2Zeg2IfSmRk7hC7XfrQySKcZaN5RzWQdbWOqdSK+Bs
         oFQ7VrKzIm8BX1y+GnZXHAZeAeIWr8YDkuukOtMWz7sVOEzy1VsI77eYt2bUVyPjI0Sv
         G0phO102rd1tHQCpZIlggLf1zCnz/0pHO1kA0lVU5iJCrl1sgVagBXlmJIbjg9P2/RTa
         pymlyRdIVg8EGxU3gMGRtDB4vt3kgSCnY5MiWrYTyQq6Rm8qI6kxrjrDrtjV9AFN4Pps
         gIGwNElWvTu2JtrsptPq6FDM8iTcYU3m6bROEPNDxEZ27NxGuO487SZFn6zgQY850qDi
         tv+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4wBmmR76T9L31yquuEVvVgaQD1UnyZdQRW5ldkbo91Q=;
        fh=TGAJ7QN59OjB8lo9bvDUHuorkqAYrWv9Infvq7Fr0k0=;
        b=g0rfQfaPhlYhorMVzNW80Xnkd0tzcQXulS/b9F534LJMPLfW61VhqLHbCVgZ04ElkK
         uqIYMXGD3V2olg7c4GSFvkHldWvMVF0aBSe/l4mER/X0LNBzbfjkdZMGuHisBJs8UyN2
         I6okO+tGHiGnFjmjLIxJXby8AEhUCDsLXMXgTGwVV2iURPajwtVkdnAMBtIGV5yRhiLN
         431HF1Z5biXDdc+1SE16AMwKHE7u/WddBJfPM/TsoBDwEWJJQMpk62B/82FcjbgbiAxR
         8E9GrBupTg/F1awLny9/v3FrZy3apKcAefUVZpU9L44gs9hSpVXbyzIcXGBpu24MqsAe
         fsgQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792647376; x=1793252176; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wBmmR76T9L31yquuEVvVgaQD1UnyZdQRW5ldkbo91Q=;
        b=S4jfDkIylK+ykXU8E4DEuRfBtI3RYszyEBEL4rAaWQgaF32QS0d8yX+y6cNL7r2lyA
         ECysmPb6Z8oStRXjrZpf4vj43Kfz9vh5/FNaSiZRewbtv/h1gRp9YvQ9RgIrSZ+3f3Z+
         ZUQfgWf9ZhPO3C0EbF4ya2eECwTSUexHxRCAhN+JcOK8HO2uG2d0wvq5DWyCWTOU+Fzd
         SH1UaUXwwP7JJlgpZZi7UMWQZuBfHN4P6i/dkbtlGCnce1omcr7gxzDMuHgZ4I+VKstR
         ZlLpOhgQSCCFczeIqXAsBiK4TqxKxU+IUbcB3Heao7zEk8VlivwWCeByud1NiH/2Udkt
         1h6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792647376; x=1793252176;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4wBmmR76T9L31yquuEVvVgaQD1UnyZdQRW5ldkbo91Q=;
        b=dnDf7EmQP2e7gXCauAd4L9Cn/jVg1Ac7FPVW0zKLz9xdDi9fp/XYsKBC6XH3wpIqs+
         k8I2BNgrG1B8LB7BpmLcd4LjGAa9SxuGMOdcTXEZYuBoepT8eRImm2Nq30p+bCUZn7r0
         kCbx2Yp+csriFe0ZpBg4iYRqEfs/JzbBZEfkHyvNGhH9NXojT2DCQOvuKDehJ7vFXHth
         bN2vbN/jOqMq37VPDYN5kLieqGRzXrjpREudhZlUhtQdDfD/DRsnM+8JcEydapjruDSk
         05OakNGy/3zZgvJ2dryhXWfBuxZnB3UKgFpid6ei9TWdINNA3G+A+UiFQlVfVt5Gjukf
         OPHw==
X-Gm-Message-State: AFq9FYLsjEAPptrPuXQljqfeGfariO1Y6PDghfOQOmD7XlYJdBmU5o0T
	ROfgN8gqQ3dCqNQv21FynWftoPhkn2aPa/cBVonctBGhtj8kbetDPaEaTLidJnsMeMiAIrmiLOI
	Ej81vfBM7xRuTv9uxOcqR20NP5Z9ux0Y=
X-Gm-Gg: AYBFou0hGetSs2z+FiHrEauCXzmZ+a6A9sAse3MaM+zFg4NMVljtk1dxJdqY+1uh1XL
	lFy69exKj21xq9JsnwfNlW0Xk4PeUfIwsoGCOWwxOWOblqqd49kI0Bm9BG1vIZnW03d0L3wE7/H
	zsPUlEtDILdhpSArdAfcBjS0dAIaBxPmK4IYJD5pRy7PAybH1hPcvRov+ntV+0H+vHqpNoLbK1n
	VUh0PimolSU3SBPueazdVt2VZAQmia6yIVRaHC4ZIPKUQxb7ifNN8Lkc3ralYQa4pbCCNp27uq9
	qdq+d715hcLK0L+OdteJ+0yiWhvyWB6G/hxwXvyldZgLyz6nLb14TxyNkoUWRpNAKCc2F1q49bi
	LoaxOlv3DE8EbaygOhE24pH3nueY+1GpQHHabSWfSwo6g173LJEHtixj+/KK8f9WhPBKmZm/DEm
	tuiyWJw0/AbTqYl/8xKnyBn4ueF7yjGNeA9L7kWVteWyagHiSh8keESUnHzh6MCPuEYfqMwExmP
	KwQfSMhAKzrDZAcZHY/ersHPqrGeERqceLVdh/vctNnLKVT2AtTegJwpRBHGMXxqrj23x5vShbL
	S6DfeqbUgkO+7xXbsc1Ttf9KKEcK9pdnKTF/nwHn81i0580rzsUPXmVJyWSDgaJc
X-Received: by 2002:a05:690c:6d83:b0:8ab:436f:6e77 with SMTP id
 00721157ae682-8b133e0458bmr27638467b3.55.1792647376429; Wed, 21 Oct 2026
 22:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20261022025520.234942-2-mark.yang@lge.com>
In-Reply-To: <20261022025520.234942-2-mark.yang@lge.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Oct 2026 22:35:49 -0700
X-Gm-Features: AclHuK8VwiCgc9eRHpx4KCvFC6lDMNJXT_KfukwyiQbBSOZx-J5Q9gd2LKe0A8Q
Message-ID: <CAMKF1srjJm7zthpz6xCnA4ffY2kObmqyEy5M5zqS2WYc-+sQwQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] musl: read ld-musl-$ARCH.path from /etc with usrmerge
To: mark.yang@lge.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001464b9065e673e76"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 05:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248421

--0000000000001464b9065e673e76
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think you might want to look
into 0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch
The recipe sets --syslibdir=3D${nonarch_base_libdir}, which is right for
where the loader lives
this patch then builds the fallback search path from that same value,
giving /usr/lib:/usr/lib64 for a 64-bit multilib build.
That fallback is wrong whenever the .path file is missing or unreadable. I
wonder if this patch
should use ${base_libdir} for the search path. then you wont need this
patch.

instead of hardcoding /usr A sturdier option is to pass
-DSYSCONFDIR=3D'"${sysconfdir}"'

Upstream-status says Inappropriate but I think any distro that uses
usrmerge will have this problem
worth checking with upstream musl community.

On Wed, Oct 21, 2026 at 7:55=E2=80=AFPM mark.yang via lists.openembedded.or=
g
<mark.yang=3Dlge.com@lists.openembedded.org> wrote:

> From: "mark.yang" <mark.yang@lge.com>
>
> Make the dynamic linker read /etc/ld-musl-$ARCH.path when PT_INTERP
> points to /usr/lib.
>
> Non-multilib builds do not notice the problem today. We are working
> towards musl with multilib. There a 64-bit program with /usr/lib in
> PT_INTERP loads the lib32 copy of a library from /usr/lib and fails
> with "Exec format error".
>
> With usrmerge the dynamic linker is /usr/lib/ld-musl-$ARCH.so.1, and
> gcc and clang put this path into PT_INTERP. musl drops the last two
> components of PT_INTERP and appends /etc/ld-musl-$ARCH.path to the
> rest. This gives /usr/etc/ld-musl-$ARCH.path, which does not exist.
>
> ld-musl-$ARCH.path is the musl counterpart of ld.so.conf. It lists the
> directories where the dynamic linker looks for shared libraries after
> LD_LIBRARY_PATH and RPATH, and when present it replaces the built-in
> default path.
>
> The musl recipe installs it in /etc with base_libdir and libdir of the
> variant. The file name carries the architecture, so each multilib
> variant has its own list, and a 64-bit program would search
> /usr/lib64 only.
>
> When the file is not found, musl falls back to its default path.
> Patch 0002 sets it to syslibdir:libdir, see 2da79f021b ("musl: Create
> default library search path based on configuration").
>
> Reference:
> https://git.openembedded.org/openembedded-core/commit/?id=3D2da79f021b552=
5ea5b56a86563905a67fc958fa5
>
> Without multilib the libraries are in /usr/lib, which the default path
> covers, so nothing shows. A 64-bit multilib build gets
> /usr/lib:/usr/lib64 and looks in /usr/lib first, so a 64-bit program
> loads the lib32 copies of its libraries from there and fails.
>
> Treat a /usr prefix as the root, so /usr/lib/ld-musl-$ARCH.so.1 reads
> /etc/ld-musl-$ARCH.path like /lib/ld-musl-$ARCH.so.1 does. Without
> usrmerge PT_INTERP starts with /lib, and nothing changes.
>
>   PT_INTERP                        file musl opens
>                                    before
>    after
>   /usr/lib/ld-musl-aarch64.so.1    /usr/etc/ld-musl-aarch64.path
> (missing)    /etc/ld-musl-aarch64.path
>   /lib/ld-musl-aarch64.so.1        /etc/ld-musl-aarch64.path
>     /etc/ld-musl-aarch64.path
>
> Signed-off-by: mark.yang <mark.yang@lge.com>
> ---
>  ...ath-file-from-etc-when-the-loader-is.patch | 35 +++++++++++++++++++
>  meta/recipes-core/musl/musl_git.bb            |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644
> meta/recipes-core/musl/musl/0004-ldso-read-the-.path-file-from-etc-when-t=
he-loader-is.patch
>
> diff --git
> a/meta/recipes-core/musl/musl/0004-ldso-read-the-.path-file-from-etc-when=
-the-loader-is.patch
> b/meta/recipes-core/musl/musl/0004-ldso-read-the-.path-file-from-etc-when=
-the-loader-is.patch
> new file mode 100644
> index 0000000000..bcc0c71c3b
> --- /dev/null
> +++
> b/meta/recipes-core/musl/musl/0004-ldso-read-the-.path-file-from-etc-when=
-the-loader-is.patch
> @@ -0,0 +1,35 @@
> +From 29727534313c4955d2231344711fddd1e93af1c2 Mon Sep 17 00:00:00 2001
> +From: "mark.yang" <mark.yang@lge.com>
> +Date: Wed, 21 Oct 2026 18:57:49 +0900
> +Subject: [PATCH] ldso: read the .path file from /etc when the loader is =
in
> + /usr/lib
> +
> +musl looks for ld-musl-$ARCH.path in the etc directory next to the
> +directory of the dynamic linker, as named by PT_INTERP. With usrmerge
> +OE puts /usr/lib/ld-musl-$ARCH.so.1 into PT_INTERP, so musl opens
> +/usr/etc/ld-musl-$ARCH.path while the file is installed in /etc.
> +
> +Treat a /usr prefix as the root, so /usr/lib/ld-musl-$ARCH.so.1 reads
> +/etc/ld-musl-$ARCH.path like /lib/ld-musl-$ARCH.so.1 does.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: mark.yang <mark.yang@lge.com>
> +---
> + ldso/dynlink.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/ldso/dynlink.c b/ldso/dynlink.c
> +index 0fdc9e7c..dfc772e3 100644
> +--- a/ldso/dynlink.c
> ++++ b/ldso/dynlink.c
> +@@ -1136,6 +1136,10 @@ static struct dso *load_library(const char *name,
> struct dso *needed_by)
> +                                       for (s=3Dt=3Dz=3Dldso.name; *s; s=
++)
> +                                               if (*s=3D=3D'/') z=3Dt, t=
=3Ds;
> +                                       prefix_len =3D z-ldso.name;
> ++                                      /* With usrmerge the loader is
> /usr/lib/ld-musl-*,
> ++                                       * but the .path file stays in
> /etc. */
> ++                                      if (prefix_len =3D=3D 4 && !memcm=
p(
> ldso.name, "/usr", 4))
> ++                                              prefix_len =3D 0;
> +                                       if (prefix_len < PATH_MAX)
> +                                               prefix =3D ldso.name;
> +                               }
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/
> musl_git.bb
> index 212bda1f29..f901b6e8da 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -14,6 +14,7 @@ SRC_URI =3D "git://git.musl-libc.org/musl;branch=3Dmast=
er \
>
> file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
>
> file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
>
> file://0003-tools-version.sh-fall-back-to-VERSION-when-git-descr.patch \
> +
>  file://0004-ldso-read-the-.path-file-from-etc-when-the-loader-is.patch \
>            "
>
>  PROVIDES +=3D "virtual/libc virtual/libiconv virtual/libintl virtual/cry=
pt"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248409):
> https://lists.openembedded.org/g/openembedded-core/message/248409
> Mute This Topic: https://lists.openembedded.org/mt/121878787/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001464b9065e673e76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think you might want to look into=C2=A00002-ldso-Use-sys=
libdir-and-libdir-as-default-pathes-to-l.patch<div>The recipe sets --syslib=
dir=3D${nonarch_base_libdir}, which is right for where the loader lives</di=
v><div>this patch then builds the fallback search path from that same value=
, giving /usr/lib:/usr/lib64 for a 64-bit multilib build.</div><div>That fa=
llback is wrong whenever the .path file is missing or unreadable. I wonder =
if this patch</div><div>should use ${base_libdir} for the search path. then=
 you wont=C2=A0need this patch.</div><div><br></div><div>instead of hardcod=
ing /usr=C2=A0A sturdier option is to pass -DSYSCONFDIR=3D&#39;&quot;${sysc=
onfdir}&quot;&#39;</div><div><br></div><div>Upstream-status says=C2=A0Inapp=
ropriate but I think any distro that uses usrmerge will have this problem</=
div><div>worth checking with upstream musl community.</div></div><br><div c=
lass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_=
attr">On Wed, Oct 21, 2026 at 7:55=E2=80=AFPM mark.yang via <a href=3D"http=
://lists.openembedded.org">lists.openembedded.org</a> &lt;mark.yang=3D<a hr=
ef=3D"mailto:lge.com@lists.openembedded.org">lge.com@lists.openembedded.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
From: &quot;mark.yang&quot; &lt;<a href=3D"mailto:mark.yang@lge.com" target=
=3D"_blank">mark.yang@lge.com</a>&gt;<br>
<br>
Make the dynamic linker read /etc/ld-musl-$ARCH.path when PT_INTERP<br>
points to /usr/lib.<br>
<br>
Non-multilib builds do not notice the problem today. We are working<br>
towards musl with multilib. There a 64-bit program with /usr/lib in<br>
PT_INTERP loads the lib32 copy of a library from /usr/lib and fails<br>
with &quot;Exec format error&quot;.<br>
<br>
With usrmerge the dynamic linker is /usr/lib/ld-musl-$ARCH.so.1, and<br>
gcc and clang put this path into PT_INTERP. musl drops the last two<br>
components of PT_INTERP and appends /etc/ld-musl-$ARCH.path to the<br>
rest. This gives /usr/etc/ld-musl-$ARCH.path, which does not exist.<br>
<br>
ld-musl-$ARCH.path is the musl counterpart of ld.so.conf. It lists the<br>
directories where the dynamic linker looks for shared libraries after<br>
LD_LIBRARY_PATH and RPATH, and when present it replaces the built-in<br>
default path.<br>
<br>
The musl recipe installs it in /etc with base_libdir and libdir of the<br>
variant. The file name carries the architecture, so each multilib<br>
variant has its own list, and a 64-bit program would search<br>
/usr/lib64 only.<br>
<br>
When the file is not found, musl falls back to its default path.<br>
Patch 0002 sets it to syslibdir:libdir, see 2da79f021b (&quot;musl: Create<=
br>
default library search path based on configuration&quot;).<br>
<br>
Reference: <a href=3D"https://git.openembedded.org/openembedded-core/commit=
/?id=3D2da79f021b5525ea5b56a86563905a67fc958fa5" rel=3D"noreferrer" target=
=3D"_blank">https://git.openembedded.org/openembedded-core/commit/?id=3D2da=
79f021b5525ea5b56a86563905a67fc958fa5</a><br>
<br>
Without multilib the libraries are in /usr/lib, which the default path<br>
covers, so nothing shows. A 64-bit multilib build gets<br>
/usr/lib:/usr/lib64 and looks in /usr/lib first, so a 64-bit program<br>
loads the lib32 copies of its libraries from there and fails.<br>
<br>
Treat a /usr prefix as the root, so /usr/lib/ld-musl-$ARCH.so.1 reads<br>
/etc/ld-musl-$ARCH.path like /lib/ld-musl-$ARCH.so.1 does. Without<br>
usrmerge PT_INTERP starts with /lib, and nothing changes.<br>
<br>
=C2=A0 PT_INTERP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 file musl opens<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0before=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0after<br>
=C2=A0 /usr/lib/ld-musl-aarch64.so.1=C2=A0 =C2=A0 /usr/etc/ld-musl-aarch64.=
path (missing)=C2=A0 =C2=A0 /etc/ld-musl-aarch64.path<br>
=C2=A0 /lib/ld-musl-aarch64.so.1=C2=A0 =C2=A0 =C2=A0 =C2=A0 /etc/ld-musl-aa=
rch64.path=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /e=
tc/ld-musl-aarch64.path<br>
<br>
Signed-off-by: mark.yang &lt;<a href=3D"mailto:mark.yang@lge.com" target=3D=
"_blank">mark.yang@lge.com</a>&gt;<br>
---<br>
=C2=A0...ath-file-from-etc-when-the-loader-is.patch | 35 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"noreferr=
er" target=3D"_blank">musl_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 36 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/musl/musl/0004-ldso-read-the-.pa=
th-file-from-etc-when-the-loader-is.patch<br>
<br>
diff --git a/meta/recipes-core/musl/musl/0004-ldso-read-the-.path-file-from=
-etc-when-the-loader-is.patch b/meta/recipes-core/musl/musl/0004-ldso-read-=
the-.path-file-from-etc-when-the-loader-is.patch<br>
new file mode 100644<br>
index 0000000000..bcc0c71c3b<br>
--- /dev/null<br>
+++ b/meta/recipes-core/musl/musl/0004-ldso-read-the-.path-file-from-etc-wh=
en-the-loader-is.patch<br>
@@ -0,0 +1,35 @@<br>
+From 29727534313c4955d2231344711fddd1e93af1c2 Mon Sep 17 00:00:00 2001<br>
+From: &quot;mark.yang&quot; &lt;<a href=3D"mailto:mark.yang@lge.com" targe=
t=3D"_blank">mark.yang@lge.com</a>&gt;<br>
+Date: Wed, 21 Oct 2026 18:57:49 +0900<br>
+Subject: [PATCH] ldso: read the .path file from /etc when the loader is in=
<br>
+ /usr/lib<br>
+<br>
+musl looks for ld-musl-$ARCH.path in the etc directory next to the<br>
+directory of the dynamic linker, as named by PT_INTERP. With usrmerge<br>
+OE puts /usr/lib/ld-musl-$ARCH.so.1 into PT_INTERP, so musl opens<br>
+/usr/etc/ld-musl-$ARCH.path while the file is installed in /etc.<br>
+<br>
+Treat a /usr prefix as the root, so /usr/lib/ld-musl-$ARCH.so.1 reads<br>
+/etc/ld-musl-$ARCH.path like /lib/ld-musl-$ARCH.so.1 does.<br>
+<br>
+Upstream-Status: Inappropriate [oe-core specific]<br>
+Signed-off-by: mark.yang &lt;<a href=3D"mailto:mark.yang@lge.com" target=
=3D"_blank">mark.yang@lge.com</a>&gt;<br>
+---<br>
+ ldso/dynlink.c | 4 ++++<br>
+ 1 file changed, 4 insertions(+)<br>
+<br>
+diff --git a/ldso/dynlink.c b/ldso/dynlink.c<br>
+index 0fdc9e7c..dfc772e3 100644<br>
+--- a/ldso/dynlink.c<br>
++++ b/ldso/dynlink.c<br>
+@@ -1136,6 +1136,10 @@ static struct dso *load_library(const char *name, s=
truct dso *needed_by)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (s=3D=
t=3Dz=3D<a href=3D"http://ldso.name" rel=3D"noreferrer" target=3D"_blank">l=
dso.name</a>; *s; s++)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if (*s=3D=3D&#39;/&#39;) z=3Dt, t=3Ds;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prefix_le=
n =3D <a href=3D"http://z-ldso.name" rel=3D"noreferrer" target=3D"_blank">z=
-ldso.name</a>;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* With usrmerg=
e the loader is /usr/lib/ld-musl-*,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* but the=
 .path file stays in /etc. */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (prefix_len =
=3D=3D 4 &amp;&amp; !memcmp(<a href=3D"http://ldso.name" rel=3D"noreferrer"=
 target=3D"_blank">ldso.name</a>, &quot;/usr&quot;, 4))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 prefix_len =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (prefi=
x_len &lt; PATH_MAX)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0prefix =3D <a href=3D"http://ldso.name" rel=3D"noreferr=
er" target=3D"_blank">ldso.name</a>;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">musl_git.bb</a> b/meta/recipes-core/musl/<a hr=
ef=3D"http://musl_git.bb" rel=3D"noreferrer" target=3D"_blank">musl_git.bb<=
/a><br>
index 212bda1f29..f901b6e8da 100644<br>
--- a/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"noreferr=
er" target=3D"_blank">musl_git.bb</a><br>
+++ b/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"noreferr=
er" target=3D"_blank">musl_git.bb</a><br>
@@ -14,6 +14,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.musl-libc.o=
rg/musl;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">git.musl-libc=
.org/musl;branch=3Dmaster</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Make-dynamic-linker-a=
-relative-symlink-to-libc.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-ldso-Use-syslibdir-an=
d-libdir-as-default-pathes-to-l.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-tools-version.sh-fall=
-back-to-VERSION-when-git-descr.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-ldso-read-the-.path-f=
ile-from-etc-when-the-loader-is.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0PROVIDES +=3D &quot;virtual/libc virtual/libiconv virtual/libintl vir=
tual/crypt&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#248409): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/248409" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/248409</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121878787/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121878787/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000001464b9065e673e76--
