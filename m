Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.2331.1613620294769890471
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 19:51:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d3onsyBb;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id lu16so1761246ejb.9
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 19:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2wZIAZC9yxZ2mDBnWjpNcEl9yGwCYZmfu5a5UnmBEgk=;
        b=d3onsyBbgEtzSgcBV6Ws0COGWzN0vV1nW2XiVLgQDTnFU39KO6Qh6XZyDSbn87cZ9f
         hDPdRTSes7GGkFDH2vpdQhQrvyQE/SDlh7XDE+nI7Q/Fk4ChxdGxexWWxPiJ6WWf502l
         WPcQNDdFzfFMi+hMxa6kCk6A8NFFMpAuEzTko1uuz5skhi/y7pUDyJG9C4ohIVnvct5P
         CW8N18hZExMENn6xABX2CjDoC0yzrlCzunKLW8DpHV+2ukyZP0JvWkn88rHT3DoBuyl3
         CJ/ZdqQzRvEJEyGV17cBIBX8k9xzFDyIdIqLAXG1W1v5vmolq6CKoQdCFCxdD2k9OgMr
         ZVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2wZIAZC9yxZ2mDBnWjpNcEl9yGwCYZmfu5a5UnmBEgk=;
        b=RtzC/dB5sYg26IEKDGsQqrTFw711hnvYoNcJgRcVfJlMYEE+vot5mL6Q+e0bp1J/od
         huRZmeDeg6/HvmZk8suaGggCfEtU3tPShC8RcQJUvDX5m4UOGu8FIDF44eOSrKkCXd8m
         fSsLPjUS4b0vAA+i3GRJXFMNTKq9EUVmEBkYqQkBnmztYgVhUNvsbFh3l3g43BlvI1I6
         n/5bd+inOrAfSjw+5YO23+rQBv3j9Bt5MMv4dSYmvTa02kBOxDHsv8up30vY6HIvSojI
         5TKGikvvUnNr15GQldRvzGU1AiRyOjsH+MW2/42SbiA6DHUBmc08Kix0JUdbf0hZrXsU
         uPFw==
X-Gm-Message-State: AOAM530RESzEQBB+bKgSmwJM5pb0WriEqTl4IYamSgrlGJZwwD/wpBMJ
	TKQB33PurxDwOh2bwQhRpSqXlQQUVw0RUAlvi6U=
X-Google-Smtp-Source: ABdhPJw+22Nid1mXd8x8AOeBAWMmaYbdiUOlhboMoElKNOM6ixt+zpp29be3BGgP1+h2i+MVjZAo3ZhG/87rKvPFQ/Q=
X-Received: by 2002:a17:906:a295:: with SMTP id i21mr2079378ejz.334.1613620293192;
 Wed, 17 Feb 2021 19:51:33 -0800 (PST)
MIME-Version: 1.0
References: <20210208181747.44789-1-mcroce@linux.microsoft.com>
 <CADkTA4P-kS6UdgDmT9J=FtWGy0Tmu28RtDtXHOg0M_J8z41vAQ@mail.gmail.com> <CAFnufp1BS2mZxJ5TAu6bVX7h76_k2vrnbrLDj6o83UbOCb5M_w@mail.gmail.com>
In-Reply-To: <CAFnufp1BS2mZxJ5TAu6bVX7h76_k2vrnbrLDj6o83UbOCb5M_w@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 17 Feb 2021 22:51:21 -0500
Message-ID: <CADkTA4OsXBJk-a29_=Sx6-FBOgRAR7M3X+=RdVqju7PDLBFnmw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipes-kernel: add libbpf
To: Matteo Croce <mcroce@linux.microsoft.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000060cea305bb944006"

--00000000000060cea305bb944006
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 17, 2021 at 9:32 PM Matteo Croce <mcroce@linux.microsoft.com>
wrote:

> On Mon, Feb 8, 2021 at 9:13 PM Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> >
> > On Mon, Feb 8, 2021 at 1:18 PM Matteo Croce <mcroce@linux.microsoft.com>
> wrote:
> > >
> > > From: Matteo Croce <mcroce@microsoft.com>
> > >
> > > Add a recipe to build libbpf from https://github.com/libbpf/libbpf
> > > The only patch fixes a build issue, and it's already merged upstream.
> >
> > Thanks for the submission! I have a few comments / questions.
> >
> > To get this into oe-core, we should be commenting / documenting why it
> > should be in core, versus another layer. The standard criteria is that
> > there are enough varied users and that the functionality is common
> > enough, that it belongs in core.
> >
> > There should also be some sort of oe-selftest for the functionality,
> > otherwise, it is hard to detect breakages. Some sort of application
> > that uses the library and that can be executed in qemu would be
> > enough.
> >
> > What are the kernel requirements ? CONFIG_BPF is selected by other
> > kernel configs (it has no menu entry, so it must be), is it that, or
> > something else that is the requirement (classic BFP?). If that option
> > is now always on, is that true for the reference kernel versions in
> > master (5.4 and 5.10).
> >
>
> Something like this will work? I see a similar trick in the uprobe recipe:
>
> do_compile() {
>  if grep -q "CONFIG_BPF_SYSCALL=y" ${STAGING_KERNEL_BUILDDIR}/.config
>  then
>   oe_runmake
>  else
>   bbnote "BFP syscall is not enabled"
>  fi
> }
>
>
Since it already depends on virtual/kernel, that will indeed work. I can't
say
that I'm a huge fan of checking the .config, since it leaves us open to
changing config option names, but that is way less common now than it
used to be, so it isn't a problem as a basic sanity check. As you mention,
uprobe already sets the prior art on it anyway :D



>
> > Finally, does this work across all the supported architectures ? if
> > not, we'll need compatibility settings.
> >
>
> I'm adding this:
>
> COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64).*-linux"
>
>
That's reasonable. Interested folks can add other architectures if they
are willing to help out and support.



> > >
> > > Signed-off-by: Matteo Croce <mcroce@microsoft.com>
> > > ---
> > >  ...01-install-don-t-preserve-file-owner.patch | 29 +++++++++++++++++++
> > >  meta/recipes-kernel/libbpf/libbpf_0.3.bb      | 25 ++++++++++++++++
> > >  2 files changed, 54 insertions(+)
> > >  create mode 100644
> meta/recipes-kernel/libbpf/libbpf/0001-install-don-t-preserve-file-owner.patch
> > >  create mode 100644 meta/recipes-kernel/libbpf/libbpf_0.3.bb
> > >
> > > diff --git
> a/meta/recipes-kernel/libbpf/libbpf/0001-install-don-t-preserve-file-owner.patch
> b/meta/recipes-kernel/libbpf/libbpf/0001-install-don-t-preserve-file-owner.patch
> > > new file mode 100644
> > > index 0000000000..4e65d8d80a
> > > --- /dev/null
> > > +++
> b/meta/recipes-kernel/libbpf/libbpf/0001-install-don-t-preserve-file-owner.patch
> > > @@ -0,0 +1,29 @@
> > > +From 7df10d91db6f533cc0f6c09f4ae8ad92918c6160 Mon Sep 17 00:00:00 2001
> > > +From: Matteo Croce <mcroce@microsoft.com>
> > > +Date: Tue, 26 Jan 2021 12:41:47 +0100
> > > +Subject: [PATCH] install: don't preserve file owner
> > > +
> > > +'cp -p' preserve file ownership, this may leave files owned by the
> > > +current in user in /lib .
> > > +
> >
> > We need the upstream status documented here, not just in the commit
> message.
> >
>
> You want the upstream commit, or just saying that it will go into 0.4 is
> enough?
>
>
We normally do something like:

Upstream-status: submitted (0.4 release) <link to the pull request or
mailing list submission>

That way it is abundantly clear that we aren't carrying it ourselves, and
when we can drop it.



> > > +Signed-off-by: Matteo Croce <mcroce@microsoft.com>
> > > +---
> > > + Makefile | 2 +-
> > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > +
> > > +diff --git a/Makefile b/Makefile
> > > +index da33613..ab66edc 100644
> > > +--- a/Makefile
> > > ++++ b/Makefile
> > > +@@ -130,7 +130,7 @@ define do_s_install
> > > +       $(Q)if [ ! -d '$(DESTDIR)$2' ]; then            \
> > > +               $(INSTALL) -d -m 755 '$(DESTDIR)$2';    \
> > > +       fi;
> > > +-      $(Q)cp -fpR $1 '$(DESTDIR)$2'
> > > ++      $(Q)cp -fR $1 '$(DESTDIR)$2'
> > > + endef
> > > +
> > > + install: all install_headers install_pkgconfig
> > > +--
> > > +2.29.2
> > > +
> > > diff --git a/meta/recipes-kernel/libbpf/libbpf_0.3.bb
> b/meta/recipes-kernel/libbpf/libbpf_0.3.bb
> > > new file mode 100644
> > > index 0000000000..402e57257f
> > > --- /dev/null
> > > +++ b/meta/recipes-kernel/libbpf/libbpf_0.3.bb
> > > @@ -0,0 +1,25 @@
> > > +SUMMARY = "Library for BPF handling"
> > > +DESCRIPTION = "Library for BPF handling"
> > > +HOMEPAGE = "https://github.com/libbpf/libbpf"
> > > +SECTION = "libs"
> > > +LICENSE = "LGPLv2.1+"
> > > +
> > > +LIC_FILES_CHKSUM =
> "file://../LICENSE.LPGL-2.1;md5=b370887980db5dd40659b50909238dbd"
> > > +
> > > +DEPENDS = "zlib elfutils"
> > > +
> > > +SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https"
> > > +SRCREV = "051a4009f94d5633a8f734ca4235f0a78ee90469"
> > > +
> > > +# Backported from version 0.4
> > > +SRC_URI += "file://0001-install-don-t-preserve-file-owner.patch"
> > > +
> > > +S = "${WORKDIR}/git/src"
> > > +
> > > +inherit pkgconfig
> >
> > I see inherit pkgconfig, but no PACKAGECONFIG setting. Is it actually
> > used here ?
> >
> > > +
> > > +do_install() {
> > > +       make install DESTDIR=${D} LIBDIR=${libdir}
> >
> > Rather than a bare 'make' call, this should likely be oe_runmake
> >
>
> Right.
> While at it, what about adding DESTDIR and LIBDIR to ${EXTRA_OEMAKE}?
> They are ignored in the build phase
>
>
yep. that is doable. oe_runmake will pass them along if in the right
variable.

Bruce



> > Bruce
> >
> > > +}
> > > +
> > > +BBCLASSEXTEND = "native"
> > > --
> > > 2.29.2
> > >
> > >
> > > 
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>
> Regards,
> --
> per aspera ad upstream
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000060cea305bb944006
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Feb 17, 2021 at 9:32 PM Matteo Croce &lt;<a=
 href=3D"mailto:mcroce@linux.microsoft.com">mcroce@linux.microsoft.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mo=
n, Feb 8, 2021 at 9:13 PM Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfie=
ld@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Feb 8, 2021 at 1:18 PM Matteo Croce &lt;<a href=3D"mailto:mcr=
oce@linux.microsoft.com" target=3D"_blank">mcroce@linux.microsoft.com</a>&g=
t; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Matteo Croce &lt;<a href=3D"mailto:mcroce@microsoft.com" t=
arget=3D"_blank">mcroce@microsoft.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Add a recipe to build libbpf from <a href=3D"https://github.com/=
libbpf/libbpf" rel=3D"noreferrer" target=3D"_blank">https://github.com/libb=
pf/libbpf</a><br>
&gt; &gt; The only patch fixes a build issue, and it&#39;s already merged =
upstream.<br>
&gt;<br>
&gt; Thanks for the submission! I have a few comments / questions.<br>
&gt;<br>
&gt; To get this into oe-core, we should be commenting / documenting why i=
t<br>
&gt; should be in core, versus another layer. The standard criteria is tha=
t<br>
&gt; there are enough varied users and that the functionality is common<br=
>
&gt; enough, that it belongs in core.<br>
&gt;<br>
&gt; There should also be some sort of oe-selftest for the functionality,<=
br>
&gt; otherwise, it is hard to detect breakages. Some sort of application<b=
r>
&gt; that uses the library and that can be executed in qemu would be<br>
&gt; enough.<br>
&gt;<br>
&gt; What are the kernel requirements ? CONFIG_BPF is selected by other<br=
>
&gt; kernel configs (it has no menu entry, so it must be), is it that, or<=
br>
&gt; something else that is the requirement (classic BFP?). If that option=
<br>
&gt; is now always on, is that true for the reference kernel versions in<b=
r>
&gt; master (5.4 and 5.10).<br>
&gt;<br>
<br>
Something like this will work? I see a similar trick in the uprobe recipe:=
<br>
<br>
do_compile() {<br>
=C2=A0if grep -q &quot;CONFIG_BPF_SYSCALL=3Dy&quot; ${STAGING_KERNEL_BUILD=
DIR}/.config<br>
=C2=A0then<br>
=C2=A0 oe_runmake<br>
=C2=A0else<br>
=C2=A0 bbnote &quot;BFP syscall is not enabled&quot;<br>
=C2=A0fi<br>
}<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">Since it already depends on virtual/kernel, that will ind=
eed work. I can&#39;t say</div><div class=3D"gmail_default" style=3D"font-s=
ize:small">that I&#39;m a huge fan of checking the .config, since it leaves=
 us open to</div><div class=3D"gmail_default" style=3D"font-size:small">cha=
nging config option names, but that is way less common now than it</div><di=
v class=3D"gmail_default" style=3D"font-size:small">used to be, so it isn&#=
39;t a problem as a basic sanity check. As you mention,</div><div class=3D"=
gmail_default" style=3D"font-size:small">uprobe already sets the prior art =
on it anyway :D</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
&gt; Finally, does this work across all the supported architectures ? if<b=
r>
&gt; not, we&#39;ll need compatibility settings.<br>
&gt;<br>
<br>
I&#39;m adding this:<br>
<br>
COMPATIBLE_HOST =3D &quot;(x86_64.*|i.86.*|aarch64).*-linux&quot;<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">That&#39;s reasonable. Interested folks can add other arc=
hitectures if they</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">are willing to help out and support.</div><br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Matteo Croce &lt;<a href=3D"mailto:mcroce@microso=
ft.com" target=3D"_blank">mcroce@microsoft.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ...01-install-don-t-preserve-file-owner.patch | 29 +++++++=
++++++++++++<br>
&gt; &gt;=C2=A0 meta/recipes-kernel/libbpf/<a href=3D"http://libbpf_0.3.bb=
" rel=3D"noreferrer" target=3D"_blank">libbpf_0.3.bb</a>=C2=A0 =C2=A0 =C2=
=A0 | 25 ++++++++++++++++<br>
&gt; &gt;=C2=A0 2 files changed, 54 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-kernel/libbpf/libbpf/0001-=
install-don-t-preserve-file-owner.patch<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-kernel/libbpf/<a href=3D"h=
ttp://libbpf_0.3.bb" rel=3D"noreferrer" target=3D"_blank">libbpf_0.3.bb</a>=
<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-kernel/libbpf/libbpf/0001-install-don-=
t-preserve-file-owner.patch b/meta/recipes-kernel/libbpf/libbpf/0001-instal=
l-don-t-preserve-file-owner.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..4e65d8d80a<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-kernel/libbpf/libbpf/0001-install-don-t-prese=
rve-file-owner.patch<br>
&gt; &gt; @@ -0,0 +1,29 @@<br>
&gt; &gt; +From 7df10d91db6f533cc0f6c09f4ae8ad92918c6160 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From: Matteo Croce &lt;<a href=3D"mailto:mcroce@microsoft.com" =
target=3D"_blank">mcroce@microsoft.com</a>&gt;<br>
&gt; &gt; +Date: Tue, 26 Jan 2021 12:41:47 +0100<br>
&gt; &gt; +Subject: [PATCH] install: don&#39;t preserve file owner<br>
&gt; &gt; +<br>
&gt; &gt; +&#39;cp -p&#39; preserve file ownership, this may leave files o=
wned by the<br>
&gt; &gt; +current in user in /lib .<br>
&gt; &gt; +<br>
&gt;<br>
&gt; We need the upstream status documented here, not just in the commit m=
essage.<br>
&gt;<br>
<br>
You want the upstream commit, or just saying that it will go into 0.4 is e=
nough?<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">We normally do something like:</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small">Upstream-status: submitted (0.4 release) &lt;link t=
o the pull request or mailing list submission&gt;</div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">That way it is abundantly=
 clear that we aren&#39;t carrying it ourselves, and when we can drop it.</=
div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
&gt; &gt; +Signed-off-by: Matteo Croce &lt;<a href=3D"mailto:mcroce@micros=
oft.com" target=3D"_blank">mcroce@microsoft.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + Makefile | 2 +-<br>
&gt; &gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/Makefile b/Makefile<br>
&gt; &gt; +index da33613..ab66edc 100644<br>
&gt; &gt; +--- a/Makefile<br>
&gt; &gt; ++++ b/Makefile<br>
&gt; &gt; +@@ -130,7 +130,7 @@ define do_s_install<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)if [ ! -d &#39;$(DESTDIR)$2&#39;=
 ]; then=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTAL=
L) -d -m 755 &#39;$(DESTDIR)$2&#39;;=C2=A0 =C2=A0 \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0fi;<br>
&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 $(Q)cp -fpR $1 &#39;$(DESTDIR)$2&#39;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 $(Q)cp -fR $1 &#39;$(DESTDIR)$2&#39;<br>
&gt; &gt; + endef<br>
&gt; &gt; +<br>
&gt; &gt; + install: all install_headers install_pkgconfig<br>
&gt; &gt; +--<br>
&gt; &gt; +2.29.2<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/meta/recipes-kernel/libbpf/<a href=3D"http://libbpf=
_0.3.bb" rel=3D"noreferrer" target=3D"_blank">libbpf_0.3.bb</a> b/meta/reci=
pes-kernel/libbpf/<a href=3D"http://libbpf_0.3.bb" rel=3D"noreferrer" targe=
t=3D"_blank">libbpf_0.3.bb</a><br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..402e57257f<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-kernel/libbpf/<a href=3D"http://libbpf_0.3.bb=
" rel=3D"noreferrer" target=3D"_blank">libbpf_0.3.bb</a><br>
&gt; &gt; @@ -0,0 +1,25 @@<br>
&gt; &gt; +SUMMARY =3D &quot;Library for BPF handling&quot;<br>
&gt; &gt; +DESCRIPTION =3D &quot;Library for BPF handling&quot;<br>
&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/libbpf/libbpf"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/libbpf/libbpf</a>&=
quot;<br>
&gt; &gt; +SECTION =3D &quot;libs&quot;<br>
&gt; &gt; +LICENSE =3D &quot;LGPLv2.1+&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://../LICENSE.LPGL-2.1;md5=3Db37=
0887980db5dd40659b50909238dbd&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +DEPENDS =3D &quot;zlib elfutils&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/libbpf/lib=
bpf.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/l=
ibbpf/libbpf.git;protocol=3Dhttps</a>&quot;<br>
&gt; &gt; +SRCREV =3D &quot;051a4009f94d5633a8f734ca4235f0a78ee90469&quot;=
<br>
&gt; &gt; +<br>
&gt; &gt; +# Backported from version 0.4<br>
&gt; &gt; +SRC_URI +=3D &quot;file://0001-install-don-t-preserve-file-owne=
r.patch&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +S =3D &quot;${WORKDIR}/git/src&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +inherit pkgconfig<br>
&gt;<br>
&gt; I see inherit pkgconfig, but no PACKAGECONFIG setting. Is it actually=
<br>
&gt; used here ?<br>
&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +do_install() {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0make install DESTDIR=3D${D} LIBDIR=
=3D${libdir}<br>
&gt;<br>
&gt; Rather than a bare &#39;make&#39; call, this should likely be oe_runm=
ake<br>
&gt;<br>
<br>
Right.<br>
While at it, what about adding DESTDIR and LIBDIR to ${EXTRA_OEMAKE}?<br>
They are ignored in the build phase<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">yep. that is doable. oe_runmake will pass them along if i=
n the right variable.</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bru=
ce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
&gt; Bruce<br>
&gt;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.29.2<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await=
<br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
Regards,<br>
-- <br>
per aspera ad upstream<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end<br>- &quot;Use the force Harry&quot;=
 - Gandalf, Star Trek II<br><br></div></div>

--00000000000060cea305bb944006--
