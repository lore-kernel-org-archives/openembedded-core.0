Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web12.13932.1599290418029949315
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2020 00:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tEz+kwTJ;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id y194so4867397vsc.4
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2020 00:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bemalbLWm1NkDPkWf+PpOqrG8yD39b3vFoYZ9f42TpI=;
        b=tEz+kwTJzBsiSRbnnKzvK0yslBfXSuC0IbwRlYEUJ+kP1iNUB7OG4JvyDyHJ0YtnhO
         ScNSDUYk6YtpMYnQXkIPkLnRhzkp6U0f+nGIrTFfoXE3mBf0fyCSWUHS/ag5cIC8GaWq
         eHQpXC+1WYZ0ZJgUMLMGceT7NGIFf6EUaqej/g5tLMm3Jl1OWz1guy1RKfX1tBbPbqnX
         z5ql9c6cFHd6vCuOEH8Ugp1j8giojDTvISzvgwZ+VlvSQrEtUYYtGhIqq+zIWub7c/MN
         iIqeyV2NByb8cPO6SqsG8OpQc9dEK2xGmk6MCTDCq8ta+DS28RazY5KKq8SosHNhdZCL
         HWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bemalbLWm1NkDPkWf+PpOqrG8yD39b3vFoYZ9f42TpI=;
        b=CH0eGixLQF+FlE7ioWhGAkkoYzvb7qODXqOb9AGTHTk8plcNGTW3PQamK1AvzRq4ch
         zqMtInAiBoBnJSibPgj2qQLeSFqQrtnmdZG1bYXSB9Zpk4EUVop08xlzJTRWarNUadgj
         xWfvxwkOY3BBOHAU8j1rsDmME9+VuX4L4tcbM+nsL+F8MMSFJxZCVtOsheXO8GDd5Fcl
         lXchIGlnP4uH5o54siq1ii5m6xFTgdMUei6mNmdxy73MsMrVV+zRUwGnrOJc7h2rWeDU
         0XVDdGo8HoWVd6zjyCc7kX6iyMlykdrkuBctUdhh6X+aPjUQcNaiCrCtvDJrQQ1vuXr5
         eMvg==
X-Gm-Message-State: AOAM532SdhI2LkJLw0dLsfEJ/he5bH+O4NSizkUIiK18daAsau+HysZr
	RuA0BrIQm9xBk0MOdGWVxp1q7TlVnza4aHAv88c=
X-Google-Smtp-Source: ABdhPJx2VGZJtXtuxDnNXs3dZeMEHFC4fw/hCSOJeaR7Zu8BVwqBz4GgvMVSnymmEvPL44AkdTyu9imTNdu4/4H7dRc=
X-Received: by 2002:a67:6bc7:: with SMTP id g190mr8461866vsc.145.1599290417025;
 Sat, 05 Sep 2020 00:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1srFUkD9s+5628fb_xeRTy9KQEwWQT8esK5dsQOqDL1MiA@mail.gmail.com>
In-Reply-To: <CAMKF1srFUkD9s+5628fb_xeRTy9KQEwWQT8esK5dsQOqDL1MiA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 5 Sep 2020 09:20:06 +0200
Message-ID: <CANNYZj-vBN0cT+R5ry700Hb4apCV8R6=y_RT_4b09xPB3xTFQw@mail.gmail.com>
Subject: Re: core-image-weston testimage fails
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003316dd05ae8bd183"

--0000000000003316dd05ae8bd183
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Khem,

No idea, other than maybe it=E2=80=99s a out of memory situation?

Alex

On Sat 5. Sep 2020 at 7.17, Khem Raj <raj.khem@gmail.com> wrote:

> Hi Alex
>
>
>
> I am seeing below error with core-image-weston/qemuarm64 using oe-core
>
> master. Any ideas before I debug this?
>
>
>
> NOTE:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> NOTE: FAIL: test_weston_can_initialize_new_wayland_compositor
>
> (weston.WestonTest)
>
> NOTE:
> ----------------------------------------------------------------------
>
> NOTE: Traceback (most recent call last):
>
>   File
> "/mnt/b/yoe/master/sources/openembedded-core/meta/lib/oeqa/core/decorator=
/__init__.py",
>
> line 36, in wrapped_f
>
>     return func(*args, **kwargs)
>
>   File
> "/mnt/b/yoe/master/sources/openembedded-core/meta/lib/oeqa/runtime/cases/=
weston.py",
>
> line 69, in test_weston_can_initialize_new_wayland_compositor
>
>     self.assertTrue(new_wl_processes, msg=3D'Could not get new
>
> weston-desktop-shell processes (%s, try_cnt:%s) weston log: %s' %
>
> (new_wl_processes, try_cnt, weston_log))
>
> AssertionError: [] is not true : Could not get new
>
> weston-desktop-shell processes ([], try_cnt:5) weston log: Date:
>
> 2020-09-05 UTC
>
> [05:06:35.986] weston 8.0.0
>
>                https://wayland.freedesktop.org
>
>                Bug reports to:
>
> https://gitlab.freedesktop.org/wayland/weston/issues/
>
>                Build: 8.0.0
>
> [05:06:35.988] Command line: weston --log=3D/tmp/weston.log
>
> [05:06:35.989] OS: Linux, 5.8.5-yocto-standard, #1 SMP PREEMPT Thu Sep
>
> 3 20:37:49 UTC 2020, aarch64
>
> [05:06:35.991] Using config file '/etc/xdg/weston/weston.ini'
>
> [05:06:35.994] Output repaint window is 7 ms maximum.
>
> [05:06:35.997] Loading module '/usr/lib/libweston-8/fbdev-backend.so'
>
> [05:06:36.004] initializing fbdev backend
>
> [05:06:36.029] logind: not running in a systemd session
>
> [05:06:36.029] logind: cannot setup systemd-logind helper (-61), using
>
> legacy fallback
>
> [05:06:36.029] <stdin> not a vt
>
> [05:06:36.029] if running weston from ssh, use --tty to specify a tty
>
> [05:06:36.030] fatal: fbdev backend should be run using weston-launch
>
> binary, or your system should provide the logind D-Bus API.
>
> [05:06:36.030] fatal: failed to create compositor backend
>
>

--0000000000003316dd05ae8bd183
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello Khem,</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">No idea, other than maybe it=E2=80=99s a out of memory situation?</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat 5. Sep 2020=
 at 7.17, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding=
-left:1ex;border-left-color:rgb(204,204,204)">Hi Alex<br><br><br><br>I am s=
eeing below error with core-image-weston/qemuarm64 using oe-core<br><br>mas=
ter. Any ideas before I debug this?<br><br><br><br>NOTE: =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><br>NOTE: FAIL: test_weston_c=
an_initialize_new_wayland_compositor<br><br>(weston.WestonTest)<br><br>NOTE=
: ----------------------------------------------------------------------<br=
><br>NOTE: Traceback (most recent call last):<br><br>=C2=A0 File &quot;/mnt=
/b/yoe/master/sources/openembedded-core/meta/lib/oeqa/core/decorator/__init=
__.py&quot;,<br><br>line 36, in wrapped_f<br><br>=C2=A0 =C2=A0 return func(=
*args, **kwargs)<br><br>=C2=A0 File &quot;/mnt/b/yoe/master/sources/openemb=
edded-core/meta/lib/oeqa/runtime/cases/weston.py&quot;,<br><br>line 69, in =
test_weston_can_initialize_new_wayland_compositor<br><br>=C2=A0 =C2=A0 self=
.assertTrue(new_wl_processes, msg=3D&#39;Could not get new<br><br>weston-de=
sktop-shell processes (%s, try_cnt:%s) weston log: %s&#39; %<br><br>(new_wl=
_processes, try_cnt, weston_log))<br><br>AssertionError: [] is not true : C=
ould not get new<br><br>weston-desktop-shell processes ([], try_cnt:5) west=
on log: Date:<br><br>2020-09-05 UTC<br><br>[05:06:35.986] weston 8.0.0<br><=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https:=
//wayland.freedesktop.org" rel=3D"noreferrer" target=3D"_blank">https://way=
land.freedesktop.org</a><br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0Bug reports to:<br><br><a href=3D"https://gitlab.freedesktop.o=
rg/wayland/weston/issues/" rel=3D"noreferrer" target=3D"_blank">https://git=
lab.freedesktop.org/wayland/weston/issues/</a><br><br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Build: 8.0.0<br><br>[05:06:35.988] Comman=
d line: weston --log=3D/tmp/weston.log<br><br>[05:06:35.989] OS: Linux, 5.8=
.5-yocto-standard, #1 SMP PREEMPT Thu Sep<br><br>3 20:37:49 UTC 2020, aarch=
64<br><br>[05:06:35.991] Using config file &#39;/etc/xdg/weston/weston.ini&=
#39;<br><br>[05:06:35.994] Output repaint window is 7 ms maximum.<br><br>[0=
5:06:35.997] Loading module &#39;/usr/lib/libweston-8/fbdev-backend.so&#39;=
<br><br>[05:06:36.004] initializing fbdev backend<br><br>[05:06:36.029] log=
ind: not running in a systemd session<br><br>[05:06:36.029] logind: cannot =
setup systemd-logind helper (-61), using<br><br>legacy fallback<br><br>[05:=
06:36.029] &lt;stdin&gt; not a vt<br><br>[05:06:36.029] if running weston f=
rom ssh, use --tty to specify a tty<br><br>[05:06:36.030] fatal: fbdev back=
end should be run using weston-launch<br><br>binary, or your system should =
provide the logind D-Bus API.<br><br>[05:06:36.030] fatal: failed to create=
 compositor backend<br><br></blockquote></div></div>

--0000000000003316dd05ae8bd183--
