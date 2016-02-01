Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id DF9047721C;
	Mon,  1 Feb 2016 13:33:56 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id e64so77294990vkg.0;
	Mon, 01 Feb 2016 05:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=aZ59fxWAzb620WISl1KAKdfF9oLhm/Vd7RS0/VJiLeU=;
	b=lefHtpIjaif4ZvI564Zn8p/Tu/b2NnzDIfnj/+9dA4O5DWSilsvPlEa5/VPpCiXyhu
	u4/XbK215/WLUaSmEixwUcSKeF/NnWpKD1fH+yL/+5D8FqJIqywByU3V3O/MxV5Dj5JZ
	tfp1dAWkMLmRfqv2sdd9SnRU/22FRrjGCyBbl5WVInt2bl+7GeW43PxHb1d/eJKmxnf7
	jhk4b93ejaGxGhRIDLs/03PPJLu7vCNn/+udmKRnf2ptZRufa4Fihzsaj5LOR5G1cGNs
	KLg6IHF2+/HsuUJs6gbbdlX46Oy/LyIVvZfYYAiY78qJ0WTMTER09aZyjskiaIQplUi1
	5muQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=aZ59fxWAzb620WISl1KAKdfF9oLhm/Vd7RS0/VJiLeU=;
	b=N20EMJ3VVR6MeZSW5cdwd+23lyfnZL1GeJpEzj1ccW0Oa4xAEi0OzfuxrnpkX7b2en
	ia0KDIwB+Oezv6qIRYuN8xXzL+K4ZzDHsekB3Lhq31/6ECa0cfDpLbUYBIPa8397DtVP
	9P1EiCQgzKjhrPwHHvCLOQlRtnJJD7R+XW2Uj3dpE/Mpx2VM+pQMrDUDHgS2guSOQ5ec
	eJmeW42RNfrZC726k3jzWt8XDZrHO/NFOR7XsWx15ETB8Yg+v9my9lx39/ouy7Su+Cj8
	7YqVAccbYuBisvju6ntwImJkSAnFqDdQISX7lVjnsHcHB5TtWIlbOU6aIQxTHU50p+FV
	BuWg==
X-Gm-Message-State: AG10YOQ0zdQhFQxV11COx8V0hi63UYLYe4kTiYucewBFbMtsYLu8VPSLSa3Y0PJ0FwuSWZXdC7h6lGnZ5DR/vg==
MIME-Version: 1.0
X-Received: by 10.31.50.65 with SMTP id y62mr15930460vky.11.1454333637246;
	Mon, 01 Feb 2016 05:33:57 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Mon, 1 Feb 2016 05:33:57 -0800 (PST)
In-Reply-To: <20160201104527.GB2803@jama>
References: <1453200318-25633-1-git-send-email-alexandru.but@ni.com>
	<20160129180157.GA15053@jama>
	<20160201092403.GA4183@zdravan.emea.corp.natinst.com>
	<20160201104527.GB2803@jama>
Date: Mon, 1 Feb 2016 08:33:57 -0500
Message-ID: <CADkTA4MCnK-i7QTejQcusLV1Pm-FShd67CdqzrS9u5d1BS8M7w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>, alexandru.but@ni.com
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: linux-yocto issues Was: [oe] [meta-oe][PATCH] efivar: fix zero initializer compiler error
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
X-List-Received-Date: Mon, 01 Feb 2016 13:33:57 -0000
Content-Type: multipart/alternative; boundary=001a1143158ad57410052ab56fc9

--001a1143158ad57410052ab56fc9
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 1, 2016 at 5:45 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Mon, Feb 01, 2016 at 11:24:03AM +0200, Alexandru But wrote:
> > On Fri, Jan 29, 2016 at 07:01:57PM +0100, Martin Jansa wrote:
> > > On Tue, Jan 19, 2016 at 12:45:18PM +0200, Alexandru But wrote:
> > > > Patch based on commit a3606c0:
> > > > Sometimes the compiler doesn't like { 0,} as an initializer
> > >
> > > Probably not caused by this change, but efivar now fails to build in
> > > world build for qemuarm:
> > >
> > > | linux.c: In function 'eb_nvme_ns_id':
> > > | linux.c:48:27: error: 'NVME_IOCTL_ID' undeclared (first use in this
> function)
> > > |   uint64_t ret = ioctl(fd, NVME_IOCTL_ID, NULL);
> > > |                            ^
> > > | linux.c:48:27: note: each undeclared identifier is reported only
> once for each function it appears in
> > > | make[1]: *** [linux.o] Error 1
> > > | make[1]: Leaving directory
> `/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/efivar/0.21-r0/git/src'
> > > | make: *** [src] Error 2
> > > | ERROR: oe_runmake failed
> > > | ERROR: Function failed: do_compile (log file is located at
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/efivar/0.21-r0/temp/log.do_compile.8376)
> > > NOTE: recipe efivar-0.21-r0: task do_compile: Failed
> > > ERROR: Task 5672
> (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/efivar/
> efivar_0.21.bb, do_compile) failed with exit code '1'
> > >
> >
> > Yes, I saw the error, and indeed is not related to this change. The
> problem is
> > that NVMe uapi header was renamed from nvme.h to nvme_ioctl.h. Here is
> the
> > change:
> >
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=9d99a8dda154f38307d43d9c9aa504bd3703d596
> >
> > The Kconfig update unfortunately hasn't been change in the same time. It
> was
> > commited to the kernel only recently and will most likely be present in
> 4.5.
> >
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=a9cf8284b45110a4d98aea180a89c857e53bf850
> >
> > In the standard/base repository that yocto uses, only the first of the
> above
> > changes have been pulled. The old header has a new name, so the desired
> macro
> > is no longer there. The problem could be solved from the utility point
> of view
> > with a patch that gentoo tree already has:
> >
> https://gitweb.gentoo.org/repo/gentoo.git/tree/sys-libs/efivar/files/0.21-nvme_ioctl.h.patch
> >
> > The problem is that even with this change the new header will not be
> found since
> > the second change is not yet in the yocto repo. I cherry-picked and
> created all
> > the changes above, but efivar still does not find the new header.
> > Problem is that the headers from sysroot are built by linux-libc-headers
> and
> > this recipe uses the static 4.4 linux release archive from kernel.org.
> If all
> > the above are pulled in and linux-libc-headers are using sources with
> both
> > changes, than efivar build will pass.
> >
> > From my point of view the possible solutions for this problem are:
> > - Push the efivar patch and blacklist the recipe until
> linux-libc-headers points
> >   to 4.5
> > - Revert the rename change in the yocto kernel repo and apply the efivar
> patch
> >   after 4.5 token
> > - Apply the efivar patch, and a patch for linux-libc-headers
> > - Escalate the problem to the kernel comunity to backport the Kconfig
> change to
> >   4.4
> >
> > I am not sure which is the right approach since they all have downsides.
>
> Thanks for detailed analysis, I don't use efivar or linux-yocto, so I
> was reporting the issue only because I wasn't able to even build-test
> your change in jenkins.
>
> Adding oe-core and Bruce, because the issue is in
> linux-yocto/linux-libc-headers maintained there.
>
>
Thanks Martin and Alexandru,

Alexandru: since we'd like to fix this everywhere, and not just someone
building,
against linux-yocto .. and I'd rather not wait until the 4.5 kernel is
released (so
I can bump the libc-headers).

I'd suggest that we patch linux-libc-headers to have the proper
definitions, can
you prepare a patch, since you are currently building efivar and can
quickly confim
a fix ?

We can also nominate the Kconfig change to be backported to 4.4, but we can
get things working in the mean time.

Cheers,

Bruce




> Regards,
>
> > > > Signed-off-by: Alexandru But <alexandru.but@ni.com>
> > > > ---
> > > >  ...he-compiler-doesn-t-like-0-as-an-initiali.patch | 42
> ++++++++++++++++++++++
> > > >  meta-oe/recipes-extended/efivar/efivar_0.21.bb     |  3 +-
> > > >  2 files changed, 44 insertions(+), 1 deletion(-)
> > > >  create mode 100644
> meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch
> > > >
> > > > diff --git
> a/meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch
> b/meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch
> > > > new file mode 100644
> > > > index 0000000..68cabd6
> > > > --- /dev/null
> > > > +++
> b/meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch
> > > > @@ -0,0 +1,42 @@
> > > > +From a3606c02fd271d32e364fcc540e34ba1899309f6 Mon Sep 17 00:00:00
> 2001
> > > > +From: Peter Jones <pjones@redhat.com>
> > > > +Date: Tue, 14 Jul 2015 09:33:54 -0400
> > > > +Subject: [PATCH] Sometimes the compiler doesn't like { 0, } as an
> > > > + initializer...
> > > > +
> > > > +Because it really wants to be { {0, },} or something, and sometimes
> the
> > > > +compiler, knowing full well what we're trying to do, likes to
> complain
> > > > +about the rigor applied to our technique in doing it.
> > > > +
> > > > +memset() the struct ifreq to 0 instead so I don't need to figure
> out its
> > > > +internal structure just to zero it out.
> > > > +
> > > > +Resolves #28
> > > > +
> > > > +Signed-off-by: Peter Jones <pjones@redhat.com>
> > > > +---
> > > > + src/linux.c | 3 ++-
> > > > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/src/linux.c b/src/linux.c
> > > > +index 57f71f3..817b8e6 100644
> > > > +--- a/src/linux.c
> > > > ++++ b/src/linux.c
> > > > +@@ -847,12 +847,13 @@ ssize_t
> > > > + __attribute__((__visibility__ ("hidden")))
> > > > + make_mac_path(uint8_t *buf, ssize_t size, const char * const
> ifname)
> > > > + {
> > > > +-        struct ifreq ifr = { 0, };
> > > > ++        struct ifreq ifr;
> > > > +         struct ethtool_drvinfo drvinfo = { 0, };
> > > > +         int fd, rc;
> > > > +         ssize_t ret = -1, sz, off=0;
> > > > +         char busname[PATH_MAX+1] = "";
> > > > +
> > > > ++        memset(&ifr, 0, sizeof (ifr));
> > > > +         strncpy(ifr.ifr_name, ifname, IF_NAMESIZE);
> > > > +         drvinfo.cmd = ETHTOOL_GDRVINFO;
> > > > +         ifr.ifr_data = (caddr_t)&drvinfo;
> > > > +--
> > > > +2.6.1
> > > > +
> > > > diff --git a/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> > > > index b5ef90a..1684a10 100644
> > > > --- a/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> > > > +++ b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> > > > @@ -8,7 +8,8 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
> > > >  DEPENDS_class-target = "popt efivar-native"
> > > >
> > > >  SRCREV = "aab6c2a64d90b6e5a63661fb5bd6be8d878b0784"
> > > > -SRC_URI = "git://github.com/rhinstaller/efivar.git"
> > > > +SRC_URI = "git://github.com/rhinstaller/efivar.git \
> > > > +
>  file://0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch"
> > > >  SRC_URI_append_class-target = "
> file://0001-efivar-fix-for-cross-compile.patch"
> > > >  SRC_URI_append_class-native = "
> file://efivar-drop-options-not-supported-by-lower-version-gcc.patch"
> > > >
> > > > --
> > > > 2.6.1
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> >
> >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1143158ad57410052ab56fc9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Feb 1, 2016 at 5:45 AM, Martin Jansa <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,2=
04);border-left-style:solid;padding-left:1ex">On Mon, Feb 01, 2016 at 11:24=
:03AM +0200, Alexandru But wrote:<br>
&gt; On Fri, Jan 29, 2016 at 07:01:57PM +0100, Martin Jansa wrote:<br>
&gt; &gt; On Tue, Jan 19, 2016 at 12:45:18PM +0200, Alexandru But wrote:<br=
>
&gt; &gt; &gt; Patch based on commit a3606c0:<br>
&gt; &gt; &gt; Sometimes the compiler doesn&#39;t like { 0,} as an initiali=
zer<br>
&gt; &gt;<br>
&gt; &gt; Probably not caused by this change, but efivar now fails to build=
 in<br>
&gt; &gt; world build for qemuarm:<br>
&gt; &gt;<br>
&gt; &gt; | linux.c: In function &#39;eb_nvme_ns_id&#39;:<br>
&gt; &gt; | linux.c:48:27: error: &#39;NVME_IOCTL_ID&#39; undeclared (first=
 use in this function)<br>
&gt; &gt; |=C2=A0 =C2=A0uint64_t ret =3D ioctl(fd, NVME_IOCTL_ID, NULL);<br=
>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
&gt; &gt; | linux.c:48:27: note: each undeclared identifier is reported onl=
y once for each function it appears in<br>
&gt; &gt; | make[1]: *** [linux.o] Error 1<br>
&gt; &gt; | make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp=
-glibc/work/armv5te-oe-linux-gnueabi/efivar/0.21-r0/git/src&#39;<br>
&gt; &gt; | make: *** [src] Error 2<br>
&gt; &gt; | ERROR: oe_runmake failed<br>
&gt; &gt; | ERROR: Function failed: do_compile (log file is located at /hom=
e/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/efivar/=
0.21-r0/temp/log.do_compile.8376)<br>
&gt; &gt; NOTE: recipe efivar-0.21-r0: task do_compile: Failed<br>
&gt; &gt; ERROR: Task 5672 (/home/jenkins/oe/world/shr-core/meta-openembedd=
ed/meta-oe/recipes-extended/efivar/<a href=3D"http://efivar_0.21.bb" rel=3D=
"noreferrer" target=3D"_blank">efivar_0.21.bb</a>, do_compile) failed with =
exit code &#39;1&#39;<br>
&gt; &gt;<br>
&gt;<br>
&gt; Yes, I saw the error, and indeed is not related to this change. The pr=
oblem is<br>
&gt; that NVMe uapi header was renamed from nvme.h to nvme_ioctl.h. Here is=
 the<br>
&gt; change:<br>
&gt; <a href=3D"https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux=
.git/commit/?id=3D9d99a8dda154f38307d43d9c9aa504bd3703d596" rel=3D"noreferr=
er" target=3D"_blank">https://git.kernel.org/cgit/linux/kernel/git/torvalds=
/linux.git/commit/?id=3D9d99a8dda154f38307d43d9c9aa504bd3703d596</a><br>
&gt;<br>
&gt; The Kconfig update unfortunately hasn&#39;t been change in the same ti=
me. It was<br>
&gt; commited to the kernel only recently and will most likely be present i=
n 4.5.<br>
&gt; <a href=3D"https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux=
.git/commit/?id=3Da9cf8284b45110a4d98aea180a89c857e53bf850" rel=3D"noreferr=
er" target=3D"_blank">https://git.kernel.org/cgit/linux/kernel/git/torvalds=
/linux.git/commit/?id=3Da9cf8284b45110a4d98aea180a89c857e53bf850</a><br>
&gt;<br>
&gt; In the standard/base repository that yocto uses, only the first of the=
 above<br>
&gt; changes have been pulled. The old header has a new name, so the desire=
d macro<br>
&gt; is no longer there. The problem could be solved from the utility point=
 of view<br>
&gt; with a patch that gentoo tree already has:<br>
&gt; <a href=3D"https://gitweb.gentoo.org/repo/gentoo.git/tree/sys-libs/efi=
var/files/0.21-nvme_ioctl.h.patch" rel=3D"noreferrer" target=3D"_blank">htt=
ps://gitweb.gentoo.org/repo/gentoo.git/tree/sys-libs/efivar/files/0.21-nvme=
_ioctl.h.patch</a><br>
&gt;<br>
&gt; The problem is that even with this change the new header will not be f=
ound since<br>
&gt; the second change is not yet in the yocto repo. I cherry-picked and cr=
eated all<br>
&gt; the changes above, but efivar still does not find the new header.<br>
&gt; Problem is that the headers from sysroot are built by linux-libc-heade=
rs and<br>
&gt; this recipe uses the static 4.4 linux release archive from <a href=3D"=
http://kernel.org" rel=3D"noreferrer" target=3D"_blank">kernel.org</a>. If =
all<br>
&gt; the above are pulled in and linux-libc-headers are using sources with =
both<br>
&gt; changes, than efivar build will pass.<br>
&gt;<br>
&gt; From my point of view the possible solutions for this problem are:<br>
&gt; - Push the efivar patch and blacklist the recipe until linux-libc-head=
ers points<br>
&gt;=C2=A0 =C2=A0to 4.5<br>
&gt; - Revert the rename change in the yocto kernel repo and apply the efiv=
ar patch<br>
&gt;=C2=A0 =C2=A0after 4.5 token<br>
&gt; - Apply the efivar patch, and a patch for linux-libc-headers<br>
&gt; - Escalate the problem to the kernel comunity to backport the Kconfig =
change to<br>
&gt;=C2=A0 =C2=A04.4<br>
&gt;<br>
&gt; I am not sure which is the right approach since they all have downside=
s.<br>
<br>
Thanks for detailed analysis, I don&#39;t use efivar or linux-yocto, so I<b=
r>
was reporting the issue only because I wasn&#39;t able to even build-test<b=
r>
your change in jenkins.<br>
<br>
Adding oe-core and Bruce, because the issue is in<br>
linux-yocto/linux-libc-headers maintained there.<br>
<br></blockquote><div><br></div><div>Thanks Martin and Alexandru,</div><div=
><br></div><div><font color=3D"#555555"><span style=3D"font-size:12.8px;whi=
te-space:nowrap">Alexandru: since we&#39;d like to fix this everywhere, and=
 not just someone building,</span></font></div><div><font color=3D"#555555"=
><span style=3D"font-size:12.8px;white-space:nowrap">against linux-yocto ..=
 and I&#39;d rather not wait until the 4.5 kernel is released (so</span></f=
ont></div><div><font color=3D"#555555"><span style=3D"font-size:12.8px;whit=
e-space:nowrap">I can bump the libc-headers).</span></font></div><div><font=
 color=3D"#555555"><span style=3D"font-size:12.8px;white-space:nowrap"><br>=
</span></font></div><div><font color=3D"#555555"><span style=3D"font-size:1=
2.8px;white-space:nowrap">I&#39;d suggest that we patch linux-libc-headers =
to=C2=A0</span></font><span style=3D"font-size:12.8px;white-space:nowrap;co=
lor:rgb(85,85,85)">have the proper definitions, can</span></div><div><span =
style=3D"font-size:12.8px;white-space:nowrap;color:rgb(85,85,85)">you prepa=
re a patch, since you are currently building efivar and can quickly confim<=
/span></div><div><span style=3D"font-size:12.8px;white-space:nowrap;color:r=
gb(85,85,85)">a fix ?</span></div><div><span style=3D"font-size:12.8px;whit=
e-space:nowrap;color:rgb(85,85,85)"><br></span></div><div><span style=3D"fo=
nt-size:12.8px;white-space:nowrap;color:rgb(85,85,85)">We can also nominate=
 the Kconfig change to be backported to 4.4, but we can</span></div><div><s=
pan style=3D"font-size:12.8px;white-space:nowrap;color:rgb(85,85,85)">get t=
hings working in the mean time.</span></div><div><span style=3D"font-size:1=
2.8px;white-space:nowrap;color:rgb(85,85,85)"><br></span></div><div><span s=
tyle=3D"font-size:12.8px;white-space:nowrap;color:rgb(85,85,85)">Cheers,</s=
pan></div><div><span style=3D"font-size:12.8px;white-space:nowrap;color:rgb=
(85,85,85)"><br></span></div><div><span style=3D"font-size:12.8px;white-spa=
ce:nowrap;color:rgb(85,85,85)">Bruce</span></div><div><br></div><div><font =
color=3D"#555555"><span style=3D"font-size:12.8px;white-space:nowrap"><br><=
/span></font></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex">
Regards,<br>
<br>
&gt; &gt; &gt; Signed-off-by: Alexandru But &lt;<a href=3D"mailto:alexandru=
.but@ni.com" target=3D"_blank">alexandru.but@ni.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 ...he-compiler-doesn-t-like-0-as-an-initiali.patch | 4=
2 ++++++++++++++++++++++<br>
&gt; &gt; &gt;=C2=A0 meta-oe/recipes-extended/efivar/<a href=3D"http://efiv=
ar_0.21.bb" rel=3D"noreferrer" target=3D"_blank">efivar_0.21.bb</a>=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 3 +-<br>
&gt; &gt; &gt;=C2=A0 2 files changed, 44 insertions(+), 1 deletion(-)<br>
&gt; &gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-extended/efivar/efi=
var/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta-oe/recipes-extended/efivar/efivar/0001-Som=
etimes-the-compiler-doesn-t-like-0-as-an-initiali.patch b/meta-oe/recipes-e=
xtended/efivar/efivar/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-init=
iali.patch<br>
&gt; &gt; &gt; new file mode 100644<br>
&gt; &gt; &gt; index 0000000..68cabd6<br>
&gt; &gt; &gt; --- /dev/null<br>
&gt; &gt; &gt; +++ b/meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-=
the-compiler-doesn-t-like-0-as-an-initiali.patch<br>
&gt; &gt; &gt; @@ -0,0 +1,42 @@<br>
&gt; &gt; &gt; +From a3606c02fd271d32e364fcc540e34ba1899309f6 Mon Sep 17 00=
:00:00 2001<br>
&gt; &gt; &gt; +From: Peter Jones &lt;<a href=3D"mailto:pjones@redhat.com" =
target=3D"_blank">pjones@redhat.com</a>&gt;<br>
&gt; &gt; &gt; +Date: Tue, 14 Jul 2015 09:33:54 -0400<br>
&gt; &gt; &gt; +Subject: [PATCH] Sometimes the compiler doesn&#39;t like { =
0, } as an<br>
&gt; &gt; &gt; + initializer...<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Because it really wants to be { {0, },} or something, and s=
ometimes the<br>
&gt; &gt; &gt; +compiler, knowing full well what we&#39;re trying to do, li=
kes to complain<br>
&gt; &gt; &gt; +about the rigor applied to our technique in doing it.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +memset() the struct ifreq to 0 instead so I don&#39;t need =
to figure out its<br>
&gt; &gt; &gt; +internal structure just to zero it out.<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Resolves #28<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +Signed-off-by: Peter Jones &lt;<a href=3D"mailto:pjones@red=
hat.com" target=3D"_blank">pjones@redhat.com</a>&gt;<br>
&gt; &gt; &gt; +---<br>
&gt; &gt; &gt; + src/linux.c | 3 ++-<br>
&gt; &gt; &gt; + 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +diff --git a/src/linux.c b/src/linux.c<br>
&gt; &gt; &gt; +index 57f71f3..817b8e6 100644<br>
&gt; &gt; &gt; +--- a/src/linux.c<br>
&gt; &gt; &gt; ++++ b/src/linux.c<br>
&gt; &gt; &gt; +@@ -847,12 +847,13 @@ ssize_t<br>
&gt; &gt; &gt; + __attribute__((__visibility__ (&quot;hidden&quot;)))<br>
&gt; &gt; &gt; + make_mac_path(uint8_t *buf, ssize_t size, const char * con=
st ifname)<br>
&gt; &gt; &gt; + {<br>
&gt; &gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ifreq ifr =3D { 0, };<b=
r>
&gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ifreq ifr;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct ethtool_drvinfo dr=
vinfo =3D { 0, };<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fd, rc;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssize_t ret =3D -1, sz, o=
ff=3D0;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char busname[PATH_MAX+1] =
=3D &quot;&quot;;<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(&amp;ifr, 0, sizeof (if=
r));<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strncpy(ifr.ifr_name, ifn=
ame, IF_NAMESIZE);<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drvinfo.cmd =3D ETHTOOL_G=
DRVINFO;<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifr.ifr_data =3D (caddr_t=
)&amp;drvinfo;<br>
&gt; &gt; &gt; +--<br>
&gt; &gt; &gt; +2.6.1<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; diff --git a/meta-oe/recipes-extended/efivar/<a href=3D"http=
://efivar_0.21.bb" rel=3D"noreferrer" target=3D"_blank">efivar_0.21.bb</a> =
b/meta-oe/recipes-extended/efivar/<a href=3D"http://efivar_0.21.bb" rel=3D"=
noreferrer" target=3D"_blank">efivar_0.21.bb</a><br>
&gt; &gt; &gt; index b5ef90a..1684a10 100644<br>
&gt; &gt; &gt; --- a/meta-oe/recipes-extended/efivar/<a href=3D"http://efiv=
ar_0.21.bb" rel=3D"noreferrer" target=3D"_blank">efivar_0.21.bb</a><br>
&gt; &gt; &gt; +++ b/meta-oe/recipes-extended/efivar/<a href=3D"http://efiv=
ar_0.21.bb" rel=3D"noreferrer" target=3D"_blank">efivar_0.21.bb</a><br>
&gt; &gt; &gt; @@ -8,7 +8,8 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md=
5=3D6626bb1e20189cfa95f2c508ba286393&quot;<br>
&gt; &gt; &gt;=C2=A0 DEPENDS_class-target =3D &quot;popt efivar-native&quot=
;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 SRCREV =3D &quot;aab6c2a64d90b6e5a63661fb5bd6be8d878b0=
784&quot;<br>
&gt; &gt; &gt; -SRC_URI =3D &quot;git://<a href=3D"http://github.com/rhinst=
aller/efivar.git" rel=3D"noreferrer" target=3D"_blank">github.com/rhinstall=
er/efivar.git</a>&quot;<br>
&gt; &gt; &gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/rhinst=
aller/efivar.git" rel=3D"noreferrer" target=3D"_blank">github.com/rhinstall=
er/efivar.git</a> \<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Someti=
mes-the-compiler-doesn-t-like-0-as-an-initiali.patch&quot;<br>
&gt; &gt; &gt;=C2=A0 SRC_URI_append_class-target =3D &quot; file://0001-efi=
var-fix-for-cross-compile.patch&quot;<br>
&gt; &gt; &gt;=C2=A0 SRC_URI_append_class-native =3D &quot; file://efivar-d=
rop-options-not-supported-by-lower-version-gcc.patch&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; 2.6.1<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; _______________________________________________<br>
&gt; &gt; &gt; Openembedded-devel mailing list<br>
&gt; &gt; &gt; <a href=3D"mailto:Openembedded-devel@lists.openembedded.org"=
 target=3D"_blank">Openembedded-devel@lists.openembedded.org</a><br>
&gt; &gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/op=
enembedded-devel" rel=3D"noreferrer" target=3D"_blank">http://lists.openemb=
edded.org/mailman/listinfo/openembedded-devel</a><br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D=
"mailto:Martin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a=
><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; &gt; --<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; Openembedded-devel mailing list<br>
&gt; &gt; <a href=3D"mailto:Openembedded-devel@lists.openembedded.org" targ=
et=3D"_blank">Openembedded-devel@lists.openembedded.org</a><br>
&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openemb=
edded-devel" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded=
.org/mailman/listinfo/openembedded-devel</a><br>
<span><font color=3D"#888888">&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-devel mailing list<br>
&gt; <a href=3D"mailto:Openembedded-devel@lists.openembedded.org" target=3D=
"_blank">Openembedded-devel@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-devel" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/=
mailman/listinfo/openembedded-devel</a><br>
<br>
--<br>
Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mailto:Ma=
rtin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a><br>
</font></span><br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div>&qu=
ot;Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at its end&quot;</div>
</div></div>

--001a1143158ad57410052ab56fc9--
