Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com [209.85.222.68])
 by mx.groups.io with SMTP id smtpd.web09.5373.1604570210342300056
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 01:56:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZZf3401k;
 spf=pass (domain: gmail.com, ip: 209.85.222.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f68.google.com with SMTP id w3so345443uau.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2020 01:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E6dlvDrF5sJPu3Hgp6575Y/a2rMjR3+sbYf8aDN90rQ=;
        b=ZZf3401kst2a8vYcs70iMf/L9r4xHeqOkL1ZBynKRkO6rnWQwO0DoVZCjFyEqBF9L3
         t/3I2R4sJuAMQvMc12w+c+7j+IgescfyOWbs0Fd35q2FS5M5jlBfJHoHFAQ2pUsQWNZe
         fBs7dvyVnRMicFF1n0N+POUeuQMIBQ0V95hRZyInxcEYITXon1Afe7qh3ggl6Dd+D23h
         IzpBU2G4MBxjffuaiuMrCKJPGA64Nl6/2nwikLv7CGMjOZJFBuvaxFPXWpKSKSboG0+G
         fHOjBLgwf4NxxogFd6vCI5IBmJeqPMzA7M5iuIOUb4iq9TzBg5kParS3pEzWHEqa8BxS
         8gHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E6dlvDrF5sJPu3Hgp6575Y/a2rMjR3+sbYf8aDN90rQ=;
        b=makQmCBE19iHvl6qSgJZqJ8cVz2r+fiuvigEJ3jGx8nhhKWi/zm6Qd4bs/w5569eMe
         Fhui/DySuQyPC+HuFYs/ukwMFJuzZZPjOl2pc+M3QDl1AehpgdO9Y+mJqqC9ZpgoEtjw
         l5a8eaX5KMxHZhTXsRLW4+J8W1wUUUSJgy+UKS0HE329N42mmEzznpT1oLLYT/fmGJYT
         fdzUx7FGTsgdL7h28Vs1d6M0d3OqGjjeBFcMORk55E5Qh5tq8EM7YTaF0ZUW0DqMKMag
         kQATNH3g+4bUUYIm1htWiDNRAEJXr6cFOSX+Fo0N7DFmmh4I730NEZdwu5N6YJfwl1Ei
         z5mw==
X-Gm-Message-State: AOAM531Dp/fj+dQp2JjmR5253bwny+OVVrMP9nrleyLhqb6YAGBQYPWu
	lsuQJiHw1IBbRpMLhyFkazXFPemGD3FvEwJpdXY=
X-Google-Smtp-Source: ABdhPJzllW8r5ON3r6+0NSWx4SKGFsB9FiILKQunQfq7aWV6wvcT2AKjRnshn/EoHTi6ayVhMgdG2/R60+yEB0P/i/A=
X-Received: by 2002:ab0:20b0:: with SMTP id y16mr521298ual.93.1604570209511;
 Thu, 05 Nov 2020 01:56:49 -0800 (PST)
MIME-Version: 1.0
References: <20200830201522.23701-1-vvavrychuk@gmail.com> <CANNYZj-fw2YVGczSP+c7gjor6eKhYsjDgM1w-1AYD6MpDHQscA@mail.gmail.com>
 <CAGj4m+5EuBics6xTxo1PeKnwTR8ChBwm-ZEtP1j3eQR6VwcdVA@mail.gmail.com>
In-Reply-To: <CAGj4m+5EuBics6xTxo1PeKnwTR8ChBwm-ZEtP1j3eQR6VwcdVA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 5 Nov 2020 10:56:36 +0100
Message-ID: <CANNYZj8ptj5nJsQssEH9paz6dSEL5wp=RfBeTPPddzmu5PQB6A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: Change virtio-vga to virtio-gpu.
To: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005aee0005b3591d6f"

--0000000000005aee0005b3591d6f
Content-Type: text/plain; charset="UTF-8"

Checking x86_64 and aarch64 would be fine (aarch64 may fail for other
reasons, but x86_64 should keep working).

Alex

On Thu, 5 Nov 2020 at 10:52, Vasyl Vavrychuk <vvavrychuk@gmail.com> wrote:

> Which MACHINE do you want me to test? _Without_ may changes test
>
> oe-selftest -r runtime_test.TestImage.test_testimage_virgl_gtk_sdl
>
> fails for qemuarm64 MACHINE with
>
> qemu-system-aarch64: Virtio VGA not available
>
> On Sun, Aug 30, 2020 at 11:44 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Do the virgl selftests still pass with this change? Please run
> >
> > oe-selftest -r runtime_test.TestImage.test_testimage_virgl_gtk_sdl
> >
> > and
> >
> > oe-selftest -r runtime_test.TestImage.test_testimage_virgl_headless
> >
> > Alex
> >
> >
> > On Sun, 30 Aug 2020 at 22:15, Vasyl Vavrychuk <vvavrychuk@gmail.com>
> wrote:
> >>
> >> virtio-vga is available in QEMU only for hppa, i386, and ppc
> >> architectures. On the other hand, virtio-gpu is available for all
> >> architectures.
> >>
> >> Signed-off-by: Vasyl Vavrychuk <vvavrychuk@gmail.com>
> >> ---
> >>  scripts/runqemu | 10 +++++-----
> >>  1 file changed, 5 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/scripts/runqemu b/scripts/runqemu
> >> index 7fb5f7db57..5d6b35ffe4 100755
> >> --- a/scripts/runqemu
> >> +++ b/scripts/runqemu
> >> @@ -461,19 +461,19 @@ class BaseConfig(object):
> >>              elif arg == 'sdl':
> >>                  if 'gl' in sys.argv[1:]:
> >>                      self.set_dri_path()
> >> -                    self.qemu_opt_script += ' -vga virtio -display
> sdl,gl=on,show-cursor=on'
> >> +                    self.qemu_opt_script += ' -device virtio-gpu
> -display sdl,gl=on,show-cursor=on'
> >>                  elif 'gl-es' in sys.argv[1:]:
> >>                      self.set_dri_path()
> >> -                    self.qemu_opt_script += ' -vga virtio -display
> sdl,gl=es,show-cursor=on'
> >> +                    self.qemu_opt_script += ' -device virtio-gpu
> -display sdl,gl=es,show-cursor=on'
> >>                  else:
> >>                      self.qemu_opt_script += ' -display
> sdl,show-cursor=on'
> >>              elif arg == 'gtk':
> >>                  if 'gl' in sys.argv[1:]:
> >>                      self.set_dri_path()
> >> -                    self.qemu_opt_script += ' -vga virtio -display
> gtk,gl=on,show-cursor=on'
> >> +                    self.qemu_opt_script += ' -device virtio-gpu
> -display gtk,gl=on,show-cursor=on'
> >>                  elif 'gl-es' in sys.argv[1:]:
> >>                      self.set_dri_path()
> >> -                    self.qemu_opt_script += ' -vga virtio -display
> gtk,gl=es,show-cursor=on'
> >> +                    self.qemu_opt_script += ' -device virtio-gpu
> -display gtk,gl=es,show-cursor=on'
> >>                  else:
> >>                      self.qemu_opt_script += ' -display
> gtk,show-cursor=on'
> >>              elif arg == 'gl' or arg == 'gl-es':
> >> @@ -482,7 +482,7 @@ class BaseConfig(object):
> >>                      raise RunQemuError('Option %s also needs gtk or
> sdl option.' % (arg))
> >>              elif arg == 'egl-headless':
> >>                  self.set_dri_path()
> >> -                self.qemu_opt_script += ' -vga virtio -display
> egl-headless,show-cursor=on'
> >> +                self.qemu_opt_script += ' -device virtio-gpu -display
> egl-headless,show-cursor=on'
> >>              elif arg == 'serial':
> >>                  self.kernel_cmdline_script += ' console=ttyS0'
> >>                  self.serialconsole = True
> >> --
> >> 2.23.0
> >>
> >> 
>

--0000000000005aee0005b3591d6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Checking x86_64 and aarch64 would be fine (aarch64 ma=
y fail for other reasons, but x86_64 should keep working).</div><div><br></=
div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Thu, 5 Nov 2020 at 10:52, Vasyl Vavrychuk &lt;<a =
href=3D"mailto:vvavrychuk@gmail.com">vvavrychuk@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Which MACHINE do y=
ou want me to test? _Without_ may changes test<br>
<br>
oe-selftest -r runtime_test.TestImage.test_testimage_virgl_gtk_sdl<br>
<br>
fails for qemuarm64 MACHINE with<br>
<br>
qemu-system-aarch64: Virtio VGA not available<br>
<br>
On Sun, Aug 30, 2020 at 11:44 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Do the virgl selftests still pass with this change? Please run<br>
&gt;<br>
&gt; oe-selftest -r runtime_test.TestImage.test_testimage_virgl_gtk_sdl<br=
>
&gt;<br>
&gt; and<br>
&gt;<br>
&gt; oe-selftest -r runtime_test.TestImage.test_testimage_virgl_headless<b=
r>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt;<br>
&gt; On Sun, 30 Aug 2020 at 22:15, Vasyl Vavrychuk &lt;<a href=3D"mailto:v=
vavrychuk@gmail.com" target=3D"_blank">vvavrychuk@gmail.com</a>&gt; wrote:<=
br>
&gt;&gt;<br>
&gt;&gt; virtio-vga is available in QEMU only for hppa, i386, and ppc<br>
&gt;&gt; architectures. On the other hand, virtio-gpu is available for all=
<br>
&gt;&gt; architectures.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Vasyl Vavrychuk &lt;<a href=3D"mailto:vvavrychuk@g=
mail.com" target=3D"_blank">vvavrychuk@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 scripts/runqemu | 10 +++++-----<br>
&gt;&gt;=C2=A0 1 file changed, 5 insertions(+), 5 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/scripts/runqemu b/scripts/runqemu<br>
&gt;&gt; index 7fb5f7db57..5d6b35ffe4 100755<br>
&gt;&gt; --- a/scripts/runqemu<br>
&gt;&gt; +++ b/scripts/runqemu<br>
&gt;&gt; @@ -461,19 +461,19 @@ class BaseConfig(object):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif arg =3D=3D &=
#39;sdl&#39;:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
&#39;gl&#39; in sys.argv[1:]:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 self.set_dri_path()<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 self.qemu_opt_script +=3D &#39; -vga virtio -display sdl,gl=3Don,sh=
ow-cursor=3Don&#39;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 self.qemu_opt_script +=3D &#39; -device virtio-gpu -display sdl,gl=
=3Don,show-cursor=3Don&#39;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eli=
f &#39;gl-es&#39; in sys.argv[1:]:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 self.set_dri_path()<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 self.qemu_opt_script +=3D &#39; -vga virtio -display sdl,gl=3Des,sh=
ow-cursor=3Don&#39;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 self.qemu_opt_script +=3D &#39; -device virtio-gpu -display sdl,gl=
=3Des,show-cursor=3Don&#39;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 els=
e:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 self.qemu_opt_script +=3D &#39; -display sdl,show-cursor=3Don&#=
39;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif arg =3D=3D &=
#39;gtk&#39;:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
&#39;gl&#39; in sys.argv[1:]:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 self.set_dri_path()<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 self.qemu_opt_script +=3D &#39; -vga virtio -display gtk,gl=3Don,sh=
ow-cursor=3Don&#39;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 self.qemu_opt_script +=3D &#39; -device virtio-gpu -display gtk,gl=
=3Don,show-cursor=3Don&#39;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eli=
f &#39;gl-es&#39; in sys.argv[1:]:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 self.set_dri_path()<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 self.qemu_opt_script +=3D &#39; -vga virtio -display gtk,gl=3Des,sh=
ow-cursor=3Don&#39;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 self.qemu_opt_script +=3D &#39; -device virtio-gpu -display gtk,gl=
=3Des,show-cursor=3Don&#39;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 els=
e:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 self.qemu_opt_script +=3D &#39; -display gtk,show-cursor=3Don&#=
39;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif arg =3D=3D &=
#39;gl&#39; or arg =3D=3D &#39;gl-es&#39;:<br>
&gt;&gt; @@ -482,7 +482,7 @@ class BaseConfig(object):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 raise RunQemuError(&#39;Option %s also needs gtk or sdl option.=
&#39; % (arg))<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif arg =3D=3D &=
#39;egl-headless&#39;:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sel=
f.set_dri_path()<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.qem=
u_opt_script +=3D &#39; -vga virtio -display egl-headless,show-cursor=3Don&=
#39;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.qem=
u_opt_script +=3D &#39; -device virtio-gpu -display egl-headless,show-curso=
r=3Don&#39;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif arg =3D=3D &=
#39;serial&#39;:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sel=
f.kernel_cmdline_script +=3D &#39; console=3DttyS0&#39;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sel=
f.serialconsole =3D True<br>
&gt;&gt; --<br>
&gt;&gt; 2.23.0<br>
&gt;&gt;<br>
&gt;&gt; <br>
</blockquote></div>

--0000000000005aee0005b3591d6f--
