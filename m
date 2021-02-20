Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web09.12391.1613854808303620614
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Feb 2021 13:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o+vwxJFk;
 spf=pass (domain: gmail.com, ip: 209.85.222.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id j15so3068918uaa.9
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Feb 2021 13:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kCMYDQk9RcIHJB5MSLV+Ushs795tBTuUJ0Pa4yD6jQ4=;
        b=o+vwxJFkW/9uf40vmyKVz/aX71EP/2Ar3eHTDKMDvmJZKGhUP+w4rCyivh8Q8ZwTLz
         JYGwV5tEegBC6MalaSi+SR2j2GAHJN+8aqi3kPoyIkh8/GN+f32no2a6DZjQYRoCxqcR
         x1sv+6K6+8eqqUcIqS5UGGyKnwA05Cm/QHo7bsIYdkHpivhwpYIt+j4d9MTHfbNbF+Ea
         Gdr43s7I8co06b6lYNOQKMbg9ON0OyR6BdaMR5iEucEV9JT0ufQtnj4tlLvyef7f3cJ6
         iZRxLkxkwHWEJYw6eb8xw/QHXo/3B18RXi5gCOEuBc1EYnulwiZYskjZXF4ctfohaAi1
         dGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kCMYDQk9RcIHJB5MSLV+Ushs795tBTuUJ0Pa4yD6jQ4=;
        b=Dk2ggf2tOEXRezGlzFQKx83reG/novroTzCYhDyFZB6jdWd9ibzU32H3sDj4YLdbYl
         Uj3RdkwjzbmsjuhMzuSDyE2s7ck1lCGj7OanUcdpiRs82lshRnUw9Fuj2goiKZ5yiJ+x
         YeagVz/vxlwBKI5IjzP2iB5c+FCkc1oQ2A/tYTDNVEfPICxu8Y0QPFL+fp2btfQYYg1B
         8XyQy1RQ/6ppqMjFVKl0047BBI9rhz8EHDaTwjio6CWIA0UdbLUAxi3+hrp6Ih0uBrkL
         qGRd9Xyr1iS/cIhvqZTnUr3d/hiBBKQQCaVLYVNNd1iz6C135d0hQnu1eBd/li3mgbFI
         2BSg==
X-Gm-Message-State: AOAM532u0/FaVubSvOzpKRgJ3L0D63RcPFzxZUDkiuzFSTk0dOgP3DaT
	bO+Fnae8CXGID/epT1OrmAffdhhY/QDFlXgqo38=
X-Google-Smtp-Source: ABdhPJyjWalgWtVSOOOzNUdygVjix09rQzcvQowK0SCmypwn87CWQe+3SYJ2sIbKtC7UPeHr8n+OH+QU0l+jut8QdAE=
X-Received: by 2002:ab0:2b95:: with SMTP id q21mr10657847uar.22.1613854807475;
 Sat, 20 Feb 2021 13:00:07 -0800 (PST)
MIME-Version: 1.0
References: <20210220190924.3153040-1-raj.khem@gmail.com> <CANNYZj-MB3mzzzu91dzaHvP+MdQhN0RK09QaQtJDh7JWMTx4kQ@mail.gmail.com>
 <5c76ef42-79f9-b929-b1a4-e8e5360e301c@gmail.com> <CANNYZj9wLUDQapAB6JbVHLb=eYwCbhkyPYHtWzPAxaz98i_iwA@mail.gmail.com>
 <8e14f8ab-03d7-b928-554b-f5af207710d8@gmail.com>
In-Reply-To: <8e14f8ab-03d7-b928-554b-f5af207710d8@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 20 Feb 2021 21:59:55 +0100
Message-ID: <CANNYZj-UAzyAs_6c5GWtkJStmyCMywXstisLSQBLvvzwFEWntw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] runqemu: Disable vga with nographic
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000084cb7305bbcadab8"

--00000000000084cb7305bbcadab8
Content-Type: text/plain; charset="UTF-8"

How about you simply add novga option to runqemu?

Alex

On Sat, 20 Feb 2021 at 21:40, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 2/20/21 12:11 PM, Alexander Kanavin wrote:
> > What I am saying is that -nographic (where the output goes on the host)
> > and -vga none (what hardware gets emulated in the guest) are
> > independent, orthogonal options, and you should not bundle them
> > together. It is a valid use case to have -nographic with emulated
> > graphical hardware still enabled.
>
> I think I understood what you mean, I was suggesting to not translate
> runqemu option 'nographic' one to one to qemu option -nographic but
> still address the usecase you are bringing up with another option on the
> line like sdl, gtk options we have
>
> >
> > Alex
> >
> > On Sat, 20 Feb 2021 at 21:03, Khem Raj <raj.khem@gmail.com
> > <mailto:raj.khem@gmail.com>> wrote:
> >
> >
> >
> >     On 2/20/21 11:20 AM, Alexander Kanavin wrote:
> >      > I don't think this is right. You might want to use -nographic,
> >     but still
> >      > keep an emulated graphical device inside the guest for testing the
> >      > userspace applications without seeing their output. It's better
> >     to set
> >      > -vga none via a dedicated runqemu option.
> >
> >     using -display none is better way to control this kind of behaviour
> >     where you still want graphic card to be emulated but not display the
> >     output. perhaps such an option would be better suited and nographic
> >     runqemu option can be used for qemu being a simple cmdline app.
> >
> >      >
> >      > Alex
> >      >
> >      > On Sat, 20 Feb 2021 at 20:09, Khem Raj <raj.khem@gmail.com
> >     <mailto:raj.khem@gmail.com>
> >      > <mailto:raj.khem@gmail.com <mailto:raj.khem@gmail.com>>> wrote:
> >      >
> >      >     When using nographic, explicitly disable vga since some qemu
> >     firmware (
> >      >     OpenFirmware ) defaults to std vga, and when vga is enabled
> >     then it
> >      >     disables output to serial and redirects that to vga which is
> >     by design,
> >      >     hwoever we expect the console output to go to serial when
> using
> >      >     nographic, therefore its important to disable vga with
> nographic
> >      >     especially on qemu based ppc platforms
> >      >
> >      >     Signed-off-by: Khem Raj <raj.khem@gmail.com
> >     <mailto:raj.khem@gmail.com> <mailto:raj.khem@gmail.com
> >     <mailto:raj.khem@gmail.com>>>
> >      >     ---
> >      >       scripts/runqemu | 2 +-
> >      >       1 file changed, 1 insertion(+), 1 deletion(-)
> >      >
> >      >     diff --git a/scripts/runqemu b/scripts/runqemu
> >      >     index dd92a64553..2e31338d8e 100755
> >      >     --- a/scripts/runqemu
> >      >     +++ b/scripts/runqemu
> >      >     @@ -462,7 +462,7 @@ class BaseConfig(object):
> >      >                           raise RunQemuError('Option nographic
> >     makes no
> >      >     sense alongside the sdl option.' % (arg))
> >      >                       if ('gtk' in sys.argv):
> >      >                           raise RunQemuError('Option nographic
> >     makes no
> >      >     sense alongside the gtk option.' % (arg))
> >      >     -                self.qemu_opt_script += ' -nographic'
> >      >     +                self.qemu_opt_script += ' -nographic -vga
> none'
> >      >                       self.kernel_cmdline_script += '
> console=ttyS0'
> >      >                   elif arg == 'sdl':
> >      >                       if 'gl' in sys.argv[1:]:
> >      >     --
> >      >     2.30.1
> >      >
> >      >
> >      >     
> >      >
> >
>

--00000000000084cb7305bbcadab8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>How about you simply add novga option to runqemu?</di=
v><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sat, 20 Feb 2021 at 21:40, Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 2/20/21 12:11 PM, Alexander Kanavin wrote:<br>
&gt; What I am saying is that -nographic (where the output goes on the hos=
t) <br>
&gt; and -vga none (what hardware gets emulated in the guest) are <br>
&gt; independent, orthogonal options, and you should not bundle them <br>
&gt; together. It is a valid use case to have -nographic with emulated <br=
>
&gt; graphical hardware still enabled.<br>
<br>
I think I understood what you mean, I was suggesting to not translate <br>
runqemu option &#39;nographic&#39; one to one to qemu option -nographic bu=
t <br>
still address the usecase you are bringing up with another option on the <=
br>
line like sdl, gtk options we have<br>
<br>
&gt; <br>
&gt; Alex<br>
&gt; <br>
&gt; On Sat, 20 Feb 2021 at 21:03, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com" target=3D"_blank">raj.khem@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">ra=
j.khem@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 2/20/21 11:20 AM, Alexander Kanavin wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I don&#39;t think this is right. You might w=
ant to use -nographic,<br>
&gt;=C2=A0 =C2=A0 =C2=A0but still<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; keep an emulated graphical device inside the=
 guest for testing the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; userspace applications without seeing their =
output. It&#39;s better<br>
&gt;=C2=A0 =C2=A0 =C2=A0to set<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; -vga none via a dedicated runqemu option.<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0using -display none is better way to control this =
kind of behaviour<br>
&gt;=C2=A0 =C2=A0 =C2=A0where you still want graphic card to be emulated b=
ut not display the<br>
&gt;=C2=A0 =C2=A0 =C2=A0output. perhaps such an option would be better sui=
ted and nographic<br>
&gt;=C2=A0 =C2=A0 =C2=A0runqemu option can be used for qemu being a simple=
 cmdline app.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Alex<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Sat, 20 Feb 2021 at 20:09, Khem Raj &lt;<=
a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</=
a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;mailto:<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a> &lt;mailto:<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&gt;&gt; wr=
ote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0When using nographic, exp=
licitly disable vga since some qemu<br>
&gt;=C2=A0 =C2=A0 =C2=A0firmware (<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0OpenFirmware ) defaults t=
o std vga, and when vga is enabled<br>
&gt;=C2=A0 =C2=A0 =C2=A0then it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0disables output to serial=
 and redirects that to vga which is<br>
&gt;=C2=A0 =C2=A0 =C2=A0by design,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0hwoever we expect the con=
sole output to go to serial when using<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0nographic, therefore its =
important to disable vga with nographic<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0especially on qemu based =
ppc platforms<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Khem Raj &=
lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.c=
om</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>&gt; &lt;mailto:<a href=3D"mailto:ra=
j.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0scripts/runqemu | =
2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 1 =
insertion(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0diff --git a/scripts/runq=
emu b/scripts/runqemu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0index dd92a64553..2e31338=
d8e 100755<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0--- a/scripts/runqemu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+++ b/scripts/runqemu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0@@ -462,7 +462,7 @@ class=
 BaseConfig(object):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise RunQemuError(&#3=
9;Option nographic<br>
&gt;=C2=A0 =C2=A0 =C2=A0makes no<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0sense alongside the sdl o=
ption.&#39; % (arg))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (&#39;gtk&#39; in sys.argv):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise RunQemuError(&#3=
9;Option nographic<br>
&gt;=C2=A0 =C2=A0 =C2=A0makes no<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0sense alongside the gtk o=
ption.&#39; % (arg))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.qemu_opt_script +=3D &#39; -nographic=
&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.qemu_opt_script +=3D &#39; -nographic=
 -vga none&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.kernel_cmdline_script +=3D &#39=
; console=3DttyS0&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0elif arg =3D=3D &#39;sdl&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;gl&#39; in sys.argv[1:]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A02.30.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
</blockquote></div>

--00000000000084cb7305bbcadab8--
