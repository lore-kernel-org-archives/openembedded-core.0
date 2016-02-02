Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1B90577248
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 18:47:43 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id n1so104035927vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 10:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=iBE6mhCFFK4IhW9EC81N9HDUlbE5MZH+lBNcFJGUyks=;
	b=w7pha8jxnycdVN70xV108tfpCB4KXCjps8gFu3EoLFJOEJpCI22bYUXDOS2DQLawyE
	lICTqvOEaK0n1TaQoMb3TmZt9WuRkh2zyrNsWM6QXuU7OWaUR3kFOH1EGyj4ihjLkfAw
	YEuoGA1p82FQT6ewlTZhnl6fPEu3EJkO6uMEYMlmhh6s1pu5A4zrRZv8d8wiJBWOI38s
	+7yKjLjrxol3La8Y/fITrC1G2BvcBxn+YS4nZ1JZ0Om78kYcyA+kV3Rfv9q+LM+1Iwpu
	v8MejmWIm2sVtvtMKpHAhbhKt6EWKGEtDkkpE3Z+waCVjrNzLQdUgLPpCJXA1Hp/U5tB
	julw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=iBE6mhCFFK4IhW9EC81N9HDUlbE5MZH+lBNcFJGUyks=;
	b=Gh/eInUr2F/nYNZTHbWi1csX6JEtAzT4qYwq2EmuG4GToa9OdShFFpUZq37V4q9ia8
	gGSdQY5Mwg3P9RUYG+CM8jpg793Wz19uW2Zi3X3YiU7aYLsWhDEDCmKlG8p5quuUGxrx
	6Z6Q/6lb0gvN0+FWlb5SgbIwsO3at52C6eO3ZknL5VRy+M9tJtMclbpGokNha22td94k
	bltz69HkAZcQCyKSdWSunma6XkL8l96uInjiXeLsUGKMy7v2ALPr9O6j0UZqT/ye4ZIj
	CnYtT77+0QW2yDZs18fn4R3E7EM8CPpAsytewBUQ4Nc5qYzMZac0AOxs5DqDj4fpl1US
	lbHQ==
X-Gm-Message-State: AG10YOSCws03FssNvcX8g3wOgrkOlvlNzMNkYu+0h0x5gqoua8YF1bxz5w8w2gevgEwcMN6xSaGc1CPwdf5flQ==
MIME-Version: 1.0
X-Received: by 10.31.3.194 with SMTP id f63mr18708234vki.114.1454438864197;
	Tue, 02 Feb 2016 10:47:44 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Tue, 2 Feb 2016 10:47:44 -0800 (PST)
In-Reply-To: <1454438419.22468.178.camel@linux.intel.com>
References: <1454436308-29949-1-git-send-email-alexandru.but@ni.com>
	<1454438419.22468.178.camel@linux.intel.com>
Date: Tue, 2 Feb 2016 13:47:44 -0500
Message-ID: <CADkTA4OgkC7ytFj=fvg2V4upqTNJCc=k=ofEAh-biS06uF917g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: backport uapi header list
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
X-List-Received-Date: Tue, 02 Feb 2016 18:47:44 -0000
Content-Type: multipart/alternative; boundary=001a11428470d91dee052acdef29

--001a11428470d91dee052acdef29
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 2, 2016 at 1:40 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On Tue, 2016-02-02 at 20:05 +0200, Alexandru But wrote:
> > nvme uapi header was renamed from nvme.h to nvme_ioctl.h in linux
> > 4.4, but the
> > header list was not updated. This causes efivar (and maybe other)
> > package build
> > to fail. This should fix the build while the commit is backported in
> > the
> > kernel.
> >
> Would it not make more sense to fix efivar (and maybe others) instead
> of changing the kernel headers, which were clearly changed for a reason
> to start with.
>

Yep. But I recall some argument against that. I'm on a plane at the moment
and can't check my references.


>
> This patch seems to be pending:
> https://gitweb.gentoo.org/repo/gentoo.git/tree/sys-libs/efivar/files/0.
> 21-nvme_ioctl.h.patch
>
> And a more appropriate patch to the kernel headers would be backporting
> this already merged patch:
>
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/
> ?id=a9cf8284b45110a4d98aea180a89c857e53bf850
>
> You can request that Bruce (the linux-yocto maintainer) backport this
> patch via the linux-yocto@yoctoproject.org list.
>
>
Maybe I'm missing something, but wouldn't that just fix projects that build
against
linux-yocto ? If that's good enough, then yes, I can cherry pick the patch
(or
better yet, get it via -stable).

but we'd still need to update the linux-libc-headers, since unless these
apps
are building against the kernel_staging_dir, they are using the libc-headers
variant of the header.

Right ? .. or again, I may be missing what efivar is building against.

Bruce


>
> Sau!
>
> > Signed-off-by: Alexandru But <alexandru.but@ni.com>
> > ---
> >  ...i-update-install-list-after-nvme.h-rename.patch | 34
> > ++++++++++++++++++++++
> >  .../linux-libc-headers/linux-libc-headers_4.4.bb   |  4 +++
> >  2 files changed, 38 insertions(+)
> >  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-
> > libc-headers/0001-uapi-update-install-list-after-nvme.h-rename.patch
> >
> > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-
> > headers/0001-uapi-update-install-list-after-nvme.h-rename.patch
> > b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-
> > uapi-update-install-list-after-nvme.h-rename.patch
> > new file mode 100644
> > index 0000000..4d9f5a1
> > --- /dev/null
> > +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-
> > uapi-update-install-list-after-nvme.h-rename.patch
> > @@ -0,0 +1,34 @@
> > +From a9cf8284b45110a4d98aea180a89c857e53bf850 Mon Sep 17 00:00:00
> > 2001
> > +From: Mike Frysinger <vapier@gentoo.org>
> > +Date: Sun, 10 Jan 2016 20:14:11 -0500
> > +Subject: [PATCH] uapi: update install list after nvme.h rename
> > +
> > +Commit 9d99a8dda154 ("nvme: move hardware structures out of the uapi
> > +version of nvme.h") renamed nvme.h to nvme_ioctl.h, but the uapi
> > list
> > +still refers to nvme.h.  People trying to install the headers hit a
> > +failure as the header no longer exists.
> > +
> > +Cc: stable@vger.kernel.org
> > +Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> > +Reviewed-by: Christoph Hellwig <hch@lst.de>
> > +Signed-off-by: Jens Axboe <axboe@fb.com>
> > +---
> > + include/uapi/linux/Kbuild | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/include/uapi/linux/Kbuild b/include/uapi/linux/Kbuild
> > +index 628e6e6..88e1292 100644
> > +--- a/include/uapi/linux/Kbuild
> > ++++ b/include/uapi/linux/Kbuild
> > +@@ -306,7 +306,7 @@ header-y += nfs_mount.h
> > + header-y += nl80211.h
> > + header-y += n_r3964.h
> > + header-y += nubus.h
> > +-header-y += nvme.h
> > ++header-y += nvme_ioctl.h
> > + header-y += nvram.h
> > + header-y += omap3isp.h
> > + header-y += omapfb.h
> > +--
> > +2.6.1
> > +
> > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-
> > headers_4.4.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-
> > headers_4.4.bb
> > index 3763dc0..c8c7a10 100644
> > --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-
> > headers_4.4.bb
> > +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-
> > headers_4.4.bb
> > @@ -5,5 +5,9 @@ SRC_URI_append_libc-musl = "\
> >      file://0002-libc-compat.h-prevent-redefinition-of-struct-
> > ethhdr.patch \
> >      file://0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch \
> >     "
> > +SRC_URI_append ="\
> > +    file://0001-uapi-update-install-list-after-nvme.h-rename.patch \
> > +   "
> > +
> >  SRC_URI[md5sum] = "9a78fa2eb6c68ca5a40ed5af08142599"
> >  SRC_URI[sha256sum] =
> > "401d7c8fef594999a460d10c72c5a94e9c2e1022f16795ec51746b0d165418b2"
> > --
> > 2.6.1
> >
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11428470d91dee052acdef29
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Feb 2, 2016 at 1:40 PM, Saul Wold <span dir=3D"ltr">&lt;<a href=
=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Tue,=
 2016-02-02 at 20:05 +0200, Alexandru But wrote:<br>
&gt; nvme uapi header was renamed from nvme.h to nvme_ioctl.h in linux<br>
&gt; 4.4, but the<br>
&gt; header list was not updated. This causes efivar (and maybe other)<br>
&gt; package build<br>
&gt; to fail. This should fix the build while the commit is backported in<b=
r>
&gt; the<br>
&gt; kernel.<br>
&gt;<br>
</span>Would it not make more sense to fix efivar (and maybe others) instea=
d<br>
of changing the kernel headers, which were clearly changed for a reason<br>
to start with.<br></blockquote><div><br></div><div>Yep. But I recall some a=
rgument against that. I&#39;m on a plane at the moment<br></div><div>and ca=
n&#39;t check my references.<br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
<br>
This patch seems to be pending:=C2=A0<br>
<a href=3D"https://gitweb.gentoo.org/repo/gentoo.git/tree/sys-libs/efivar/f=
iles/0.
21-nvme_ioctl.h.patch" rel=3D"noreferrer" target=3D"_blank">https://gitweb.=
gentoo.org/repo/gentoo.git/tree/sys-libs/efivar/files/0.<br>
21-nvme_ioctl.h.patch</a><br>
<br>
And a more appropriate patch to the kernel headers would be backporting<br>
this already merged patch:<br>
<br>
<a href=3D"https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/=
commit/
?id=3Da9cf8284b45110a4d98aea180a89c857e53bf850" rel=3D"noreferrer" target=
=3D"_blank">https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git=
/commit/<br>
?id=3Da9cf8284b45110a4d98aea180a89c857e53bf850</a><br>
<br>
You can request that Bruce (the linux-yocto maintainer) backport this<br>
patch via the <a href=3D"mailto:linux-yocto@yoctoproject.org">linux-yocto@y=
octoproject.org</a>=C2=A0list.<br>
<br></blockquote><br></div><div class=3D"gmail_quote">Maybe I&#39;m missing=
 something, but wouldn&#39;t that just fix projects that build against<br><=
/div><div class=3D"gmail_quote">linux-yocto ? If that&#39;s good enough, th=
en yes, I can cherry pick the patch (or<br></div><div class=3D"gmail_quote"=
>better yet, get it via -stable).<br><br></div><div class=3D"gmail_quote">b=
ut we&#39;d still need to update the linux-libc-headers, since unless these=
 apps<br></div><div class=3D"gmail_quote">are building against the kernel_s=
taging_dir, they are using the libc-headers<br></div><div class=3D"gmail_qu=
ote">variant of the header. <br><br></div><div class=3D"gmail_quote">Right =
? .. or again, I may be missing what efivar is building against.<br></div><=
div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Bruce<br></d=
iv><div class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<br>
Sau!<br>
<div class=3D"HOEnZb"><div class=3D"h5">=C2=A0<br>
&gt; Signed-off-by: Alexandru But &lt;<a href=3D"mailto:alexandru.but@ni.co=
m">alexandru.but@ni.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0...i-update-install-list-after-nvme.h-rename.patch | 34<br>
&gt; ++++++++++++++++++++++<br>
&gt; =C2=A0.../linux-libc-headers/<a href=3D"http://linux-libc-headers_4.4.=
bb" rel=3D"noreferrer" target=3D"_blank">linux-libc-headers_4.4.bb</a>=C2=
=A0=C2=A0=C2=A0|=C2=A0=C2=A04 +++<br>
&gt; =C2=A02 files changed, 38 insertions(+)<br>
&gt; =C2=A0create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-=
<br>
&gt; libc-headers/0001-uapi-update-install-list-after-nvme.h-rename.patch<b=
r>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-<br>
&gt; headers/0001-uapi-update-install-list-after-nvme.h-rename.patch<br>
&gt; b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-<br>
&gt; uapi-update-install-list-after-nvme.h-rename.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..4d9f5a1<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-<=
br>
&gt; uapi-update-install-list-after-nvme.h-rename.patch<br>
&gt; @@ -0,0 +1,34 @@<br>
&gt; +From a9cf8284b45110a4d98aea180a89c857e53bf850 Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: Mike Frysinger &lt;<a href=3D"mailto:vapier@gentoo.org">vapier@=
gentoo.org</a>&gt;<br>
&gt; +Date: Sun, 10 Jan 2016 20:14:11 -0500<br>
&gt; +Subject: [PATCH] uapi: update install list after nvme.h rename<br>
&gt; +<br>
&gt; +Commit 9d99a8dda154 (&quot;nvme: move hardware structures out of the =
uapi<br>
&gt; +version of nvme.h&quot;) renamed nvme.h to nvme_ioctl.h, but the uapi=
<br>
&gt; list<br>
&gt; +still refers to nvme.h.=C2=A0=C2=A0People trying to install the heade=
rs hit a<br>
&gt; +failure as the header no longer exists.<br>
&gt; +<br>
&gt; +Cc: <a href=3D"mailto:stable@vger.kernel.org">stable@vger.kernel.org<=
/a><br>
&gt; +Signed-off-by: Mike Frysinger &lt;<a href=3D"mailto:vapier@gentoo.org=
">vapier@gentoo.org</a>&gt;<br>
&gt; +Reviewed-by: Christoph Hellwig &lt;<a href=3D"mailto:hch@lst.de">hch@=
lst.de</a>&gt;<br>
&gt; +Signed-off-by: Jens Axboe &lt;<a href=3D"mailto:axboe@fb.com">axboe@f=
b.com</a>&gt;<br>
&gt; +---<br>
&gt; + include/uapi/linux/Kbuild | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/include/uapi/linux/Kbuild b/include/uapi/linux/Kbuild<br=
>
&gt; +index 628e6e6..88e1292 100644<br>
&gt; +--- a/include/uapi/linux/Kbuild<br>
&gt; ++++ b/include/uapi/linux/Kbuild<br>
&gt; +@@ -306,7 +306,7 @@ header-y +=3D nfs_mount.h<br>
&gt; + header-y +=3D nl80211.h<br>
&gt; + header-y +=3D n_r3964.h<br>
&gt; + header-y +=3D nubus.h<br>
&gt; +-header-y +=3D nvme.h<br>
&gt; ++header-y +=3D nvme_ioctl.h<br>
&gt; + header-y +=3D nvram.h<br>
&gt; + header-y +=3D omap3isp.h<br>
&gt; + header-y +=3D omapfb.h<br>
&gt; +--<br>
&gt; +2.6.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-<br>
&gt; <a href=3D"http://headers_4.4.bb" rel=3D"noreferrer" target=3D"_blank"=
>headers_4.4.bb</a> b/meta/recipes-kernel/linux-libc-headers/linux-libc-<br=
>
&gt; <a href=3D"http://headers_4.4.bb" rel=3D"noreferrer" target=3D"_blank"=
>headers_4.4.bb</a><br>
&gt; index 3763dc0..c8c7a10 100644<br>
&gt; --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-<br>
&gt; <a href=3D"http://headers_4.4.bb" rel=3D"noreferrer" target=3D"_blank"=
>headers_4.4.bb</a><br>
&gt; +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-<br>
&gt; <a href=3D"http://headers_4.4.bb" rel=3D"noreferrer" target=3D"_blank"=
>headers_4.4.bb</a><br>
&gt; @@ -5,5 +5,9 @@ SRC_URI_append_libc-musl =3D &quot;\<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0file://0002-libc-compat.h-prevent-redefi=
nition-of-struct-<br>
&gt; ethhdr.patch \<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0file://0003-remove-inclusion-of-sysinfo.=
h-in-kernel.h.patch \<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0&quot;<br>
&gt; +SRC_URI_append =3D&quot;\<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0file://0001-uapi-update-install-list-after-nv=
me.h-rename.patch \<br>
&gt; +=C2=A0=C2=A0=C2=A0&quot;<br>
&gt; +<br>
&gt; =C2=A0SRC_URI[md5sum] =3D &quot;9a78fa2eb6c68ca5a40ed5af08142599&quot;=
<br>
&gt; =C2=A0SRC_URI[sha256sum] =3D<br>
&gt; &quot;401d7c8fef594999a460d10c72c5a94e9c2e1022f16795ec51746b0d165418b2=
&quot;<br>
&gt; --<br>
&gt; 2.6.1<br>
&gt;<br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--001a11428470d91dee052acdef29--
