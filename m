Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com [209.85.217.65])
 by mx.groups.io with SMTP id smtpd.web10.9399.1604147246376594288
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 05:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=urS/ygYV;
 spf=pass (domain: gmail.com, ip: 209.85.217.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f65.google.com with SMTP id b129so4899932vsb.1
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 05:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7CHpk0ldbhHeYiHmfQe/anqWvj1cdtzQw/HGWfy7pyg=;
        b=urS/ygYVXFu6sO+Ndj4Y9nxyRZrnHeODOhsOeIfPIEA3rAM9DHvEoCggpDvb4od9rr
         5j776ACqOCNqkigCnagWuQ7iOGoxGs5tz2C3g1u8KmVresSOi4+Ml/Tae6+u7/lJeVSs
         DNryYdHe+2px0wUz+0vZgSYOx7+RAFBNpXTQzYKNOwNVusspEC/tnsTDLea+BiJ3W50Q
         jaIMuKngWFJOYhKxUDgsWkOthD3CGOAL7z00FBE7KEUVX1NpnEAG8/sUTr+n3deyOUsS
         NJg3m2o2EhKVw9s+5vXMrCwYbO7wx9YKVjBk8ctgv4hD55aU9vWwA5fcpW0Mak+Ofl2q
         0peg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7CHpk0ldbhHeYiHmfQe/anqWvj1cdtzQw/HGWfy7pyg=;
        b=hgk2CKK9ndg3ILoO6YSFIc/XyW+gEuDi6A2REVzr0eIlT0LfX8KmEblKiFWxh+bQYr
         ly/VbHIGXsZKn/nQnIQ6P3fb2g6cQRR2KWYAm8iGJP6+N0eTAZ3cFhibbho/WjMf3Gnp
         QB5aRDDZVmF17kHcKQTFlAAPiFY0UyRVb90VL155wNRp6AyFABf7+SkIEuWDK7cpK6dJ
         1jjuOdCN+WTVEjaaHrQfF4DRzGY1CNMbpSSIcJbESBp86xanwLph3nmhSS9XWsDgql0U
         NzOo4sMBW/Brd/y17iMdYl+Woc1KV0BZs7cQNiENvmYvZs6tvYaM2WBP4stTxLSSSDw+
         b9ag==
X-Gm-Message-State: AOAM532IkJGLZmdHEp2kBJ90dkaLCNOOXVgijm6FDlXwADZYnusLvQ//
	9EHRiNRMFRi9hz1/mPXq7zU4OeIYtxDC4H2tnsg=
X-Google-Smtp-Source: ABdhPJw31x9kTFznTVGQXzHCB0NdQEcmU4iTp5cSSVsJNl+BepG1nZEJtm7Mre0uqgUa9d2+/0jWTjnyRUgW1gzt3+8=
X-Received: by 2002:a67:1087:: with SMTP id 129mr10262430vsq.41.1604147245587;
 Sat, 31 Oct 2020 05:27:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200830201522.23701-1-vvavrychuk@gmail.com> <CANNYZj-fw2YVGczSP+c7gjor6eKhYsjDgM1w-1AYD6MpDHQscA@mail.gmail.com>
 <CAGj4m+5pTiiiqmncAU500S6AnGmBuxdFyE3t0btJzcj7wibhpg@mail.gmail.com>
In-Reply-To: <CAGj4m+5pTiiiqmncAU500S6AnGmBuxdFyE3t0btJzcj7wibhpg@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 31 Oct 2020 13:27:14 +0100
Message-ID: <CANNYZj_7KWx7h=LGJd_zwN3gNEcRY1_i4cOriciQBxCns5mvKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: Change virtio-vga to virtio-gpu.
To: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bda2d305b2f6a2e3"

--000000000000bda2d305b2f6a2e3
Content-Type: text/plain; charset="UTF-8"

I think you first need to set up a build directory to use sstate-cache in
some common location, then build-st will pick it up, and you can then
easily delete it without destroying the cache.

Alex

On Fri, 30 Oct 2020 at 13:38, Vasyl Vavrychuk <vvavrychuk@gmail.com> wrote:

> Hi, Alexander,
>
> I am trying to run oe-selftest.
>
> I have one question. Is there a way to run oe-selftest incrementally?
>
> Because for now, if I run oe-selftest second time I get
>
>   oe-selftest - ERROR - Build directory ... already exists, aborting
>
> Then, I should remove build-st, and only after that oe-selftest can
> run second time. But it take a lot of time.
>
> Could you please help me?
>
> Thanks,
> Vasyl
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

--000000000000bda2d305b2f6a2e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think you first need to set up a build directory to=
 use sstate-cache in some common location, then build-st will pick it up, a=
nd you can then easily delete it without destroying the cache.<br></div><di=
v><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, 30 Oct 2020 at 13:38, Vasyl Vavrychu=
k &lt;<a href=3D"mailto:vvavrychuk@gmail.com">vvavrychuk@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi, Alexa=
nder,<br>
<br>
I am trying to run oe-selftest.<br>
<br>
I have one question. Is there a way to run oe-selftest incrementally?<br>
<br>
Because for now, if I run oe-selftest second time I get<br>
<br>
=C2=A0 oe-selftest - ERROR - Build directory ... already exists, aborting<=
br>
<br>
Then, I should remove build-st, and only after that oe-selftest can<br>
run second time. But it take a lot of time.<br>
<br>
Could you please help me?<br>
<br>
Thanks,<br>
Vasyl<br>
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

--000000000000bda2d305b2f6a2e3--
