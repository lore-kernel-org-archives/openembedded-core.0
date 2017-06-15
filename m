Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
	[209.85.161.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4F2AA7838B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 10:41:01 +0000 (UTC)
Received: by mail-yw0-f170.google.com with SMTP id 63so3684280ywr.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 03:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OXkTZwSXk0kr6JYe7OidPazjLOsisKp0ysolkLaiapY=;
	b=iuB6xh++10DtW5zDFyIuRPRCw/Vi9jcKZS7S7uRroCZthGbKYNzIkzRP3Jd4kSGg4b
	IuJAodJiYPrNpOh3Z20aQv0YE9LTmCkHZNhcCpVYOQasXSGdyCs6RW7kt/Qb94TelYPu
	4dHH4h+01mVibI0lxEeBfqEEI2fIWJVokKt2StnmRMvInNOyWyLUHBJdDdKduZDgyWRv
	A4LgJnxWWBKoZWJExQhateTsadl/AgzxHY8HeUw4DpFXlQVzmOvVCJw67/bwX0wXhLJS
	Uyq9QFw3VltgrxJUxx9QcqGtdr7u53i731iW3JueYbzgaIByd29cO+KaEHrhp1cpe9Bh
	ts3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OXkTZwSXk0kr6JYe7OidPazjLOsisKp0ysolkLaiapY=;
	b=XvQCsC4rCoT/dycurdOgtgumg6uzegFuZVVjS9Wjje6PKO6Bu4bO3inacrLUP/YQ0F
	jh7LRbos4mFC0Op2MhPh/CsLq8Eh4z70dQNL6XETMKvfN2fpxmBTo+Gqwl+Y93K94DY2
	W9z1zsKnzHnGry532BfIo1GYF9lc6fgfS2bim3fI6TApLY5/PDDD2oc4YCRpBxgkylT0
	kOwwbP42Bpj0JCc9Vz+gdd1mV2zKFF4TEnqaQf9Wo+nbws/LN/uh3MAKdmGR+6XcJ1JR
	8m8RWugmPL8xr8MxeI5dHTuXwSP7NqPoEtMu2vnSev/pa1AGjpq4cosL4AxGyFhWeSFr
	AM/w==
X-Gm-Message-State: AKS2vOyWUpRAZrNvRoWCtbLNUu9qPjlh7bRfRNRCZtLwKCxQAWQZMPlW
	PeEumQ3RgcabixnzrAAlm2yfKREmZg==
X-Received: by 10.13.200.135 with SMTP id k129mr3721504ywd.243.1497523262459; 
	Thu, 15 Jun 2017 03:41:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Thu, 15 Jun 2017 03:41:01 -0700 (PDT)
In-Reply-To: <20170614065618.GD3088@jama>
References: <cover.1489267743.git.raj.khem@gmail.com>
	<5124b899-8410-1d30-c397-65237f9d0a90@gmail.com>
	<CA+chaQdT-TRBD4mA5hHuXWBtJupOE6tfe=tqehu8DLVa78e=OA@mail.gmail.com>
	<CAMKF1sqGsV22S7MFVCMBgDxbSKFgqF1iZSviSU-e6pS0Ljx6aQ@mail.gmail.com>
	<20170331150810.GA3897@jama>
	<CAMKF1soVTYoZKuNumi+qOw8sgSQqpcXkLW2skhM9v_warvRgkw@mail.gmail.com>
	<CA+chaQdj48R74vNax1XPzc_mB6EQe7y+bgwXmOW417BQxtguoQ@mail.gmail.com>
	<CAMKF1sozG3W+axiBRVLs7ht+ficrp1Wj45SW38cJEB3bGZNx6Q@mail.gmail.com>
	<20170613213940.GC3088@jama>
	<CAMKF1soTEa9paNsyPjNbrfNCY2OxydNp3s5KA5DcUjO01R5rMQ@mail.gmail.com>
	<20170614065618.GD3088@jama>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Jun 2017 12:41:01 +0200
Message-ID: <CA+chaQfyGGG68b+mvnMw3Bk3NkZoLOubrw9ete1pbhUHYVTrMg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] mesa: Contain configure search for llvm
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
X-List-Received-Date: Thu, 15 Jun 2017 10:41:01 -0000
Content-Type: multipart/alternative; boundary="001a114dbd901a145d0551fd4e78"

--001a114dbd901a145d0551fd4e78
Content-Type: text/plain; charset="UTF-8"

Also it looks like the llvm option was renamed in some recent mesa, causing
new warning above the error caused by this change.

| configure: WARNING: The --enable-gallium-llvm option has been deprecated.
Use --enable-llvm instead.
| configure: error: --enable-llvm selected but llvm-config is not found
| NOTE: The following config.log files may provide further information.
| NOTE:
/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/mesa/2_17.1.1-r0/build/config.log

BTW: this is probably the reason why my builders are running out of disk
space (tmpfs), because now (after temporarily removing my revert from my
branches) even mesa fails to build for qemu*, so rm_work isn't triggered
early enough.


On Wed, Jun 14, 2017 at 8:56 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Tue, Jun 13, 2017 at 03:13:01PM -0700, Khem Raj wrote:
> > On Tue, Jun 13, 2017 at 2:39 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > > On Sat, Apr 01, 2017 at 08:21:16AM -0700, Khem Raj wrote:
> > >> On Fri, Mar 31, 2017 at 10:52 PM, Martin Jansa <
> martin.jansa@gmail.com> wrote:
> > >> > Why is it needed?
> > >>
> > >> If you have clang/llvm installed on your build host then it defaults
> to that
> > >> thats why its needed.
> > >
> > > And where does meta-clang install it? Because if it doesn't match with
> > > the location used by meta-oe's llvm then we cannot have the same flag
> > > which suits both providers.
> > >
> > > As it is now I still have this change reverted in my branches and I've
> > > noticed some layers which just use EXTRA_OECONF_remove to just remove
> > > this with-llvm-prefix to unblock the builds with Pyro and Rocko.
> > >
> > >> > Without this change mesa was finding llvm-config correctly, that's
> why I've
> > >> > just reverted this to continue building.
> >
> > The problem is mainly when you have clang/llvm installed on build host
> > now that we prune hosttools this might not be an issue anymore, although
> > this needs to be tested.
>
> I'm not using meta-clang anywhere, can you please answer where
> meta-clang installs llvm-config and if it's different path than what
> meta-oe recipe does, can we unify them?
>
> Unifying them was also discussed here:
> https://www.mail-archive.com/openembedded-core@lists.
> openembedded.org/msg94412.html
> but as I'm using meta-oe's llvm just for mesa I cannot help much with
> that.
>
> Regards,
>
> > >> > On Fri, Mar 31, 2017 at 5:57 PM, Khem Raj <raj.khem@gmail.com>
> wrote:
> > >> >>
> > >> >> On Fri, Mar 31, 2017 at 8:08 AM, Martin Jansa <
> martin.jansa@gmail.com>
> > >> >> wrote:
> > >> >> > On Thu, Mar 23, 2017 at 10:31:07AM -0700, Khem Raj wrote:
> > >> >> >> On Thu, Mar 23, 2017 at 12:51 AM, Martin Jansa <
> martin.jansa@gmail.com>
> > >> >> >> wrote:
> > >> >> >> > I'm not sure if this is the root cause, but last qemux86
> build shows:
> > >> >> >> >
> > >> >> >> >
> > >> >> >> > | configure: error: --enable-gallium-llvm selected but
> llvm-config is
> > >> >> >> > not
> > >> >> >> > found
> > >> >> >> > | ERROR: Function failed: do_configure (log file is located at
> > >> >> >> >
> > >> >> >> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-
> linux/mesa/2_17.0.1-r0/temp/log.do_configure.11359)
> > >> >> >> >
> > >> >> >>
> > >> >> >> can you point where is llvm-config installed in sysroot ? its
> possible
> > >> >> >> its not in native sysroot location ${STAGING_BINDIR_NATIVE}
> > >> >> >
> > >> >> > OE qemux86@ ~/build/oe-core $ find
> > >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot*
> -name llvm\*
> > >> >> >
> > >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot/usr/bin/crossscripts/llvm-config
> > >> >> >
> > >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot/usr/bin/crossscripts/llvm-config3.3
> > >> >> >
> > >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot/usr/include/llvm3.3
> > >> >> >
> > >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot/usr/include/llvm3.3/llvm-c
> > >> >> >
> > >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot/usr/include/llvm3.3/llvm
> > >> >> >
> > >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot/usr/include/llvm3.3/llvm/Config/llvm-config.h
> > >> >> >
> > >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot/usr/lib/llvm3.3
> > >> >> >
> > >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot/sysroot-providers/llvm-common
> > >> >> >
> > >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot/sysroot-providers/llvm3.3
> > >> >> >
> > >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot-native/installeddeps/llvm3.3.complete
> > >> >> >
> > >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot-native/installeddeps/llvm-common.complete
> > >> >> >
> > >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot-native/installeddeps/llvm-common.6be6a4ae98ee0dff7c2a4c4df17f026a
> > >> >> >
> > >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot-native/installeddeps/llvm-common
> > >> >> >
> > >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot-native/installeddeps/llvm3.3.388adaa288ab3b1d35e01a43b6542368
> > >> >> >
> > >> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-
> sysroot-native/installeddeps/llvm3.3
> > >> >> >
> > >> >>
> > >> >> so it seems it should point to <recipe-sysroot>/usr/bin/
> crossscripts
> > >> >> can you try changing -with-llvm-prefix to point to this dir ?
> > >> >>
> > >> >> >>
> > >> >> >> >
> > >> >> >> > I've noticed some llvm changes for meta-clang, do we need
> similar
> > >> >> >> > changes
> > >> >> >> > for meta-oe version of llvm?
> > >> >> >> >
> > >> >> >> >
> > >> >> >> > On Sun, Mar 12, 2017 at 12:16 AM, Khem Raj <
> raj.khem@gmail.com>
> > >> >> >> > wrote:
> > >> >> >> >>
> > >> >> >> >>
> > >> >> >> >>
> > >> >> >> >> On 3/11/17 1:30 PM, Khem Raj wrote:
> > >> >> >> >> > The following changes since commit
> > >> >> >> >> > a47e64d985a610535449730806651f5bfd75d9ec:
> > >> >> >> >> >
> > >> >> >> >> >   libcomps: add a recipe (2017-03-11 16:08:50 +0000)
> > >> >> >> >> >
> > >> >> >> >> > are available in the git repository at:
> > >> >> >> >> >
> > >> >> >> >> >   git://git.openembedded.org/openembedded-core-contrib
> kraj/pu
> > >> >> >> >> >
> > >> >> >> >> > http://cgit.openembedded.org/
> openembedded-core-contrib/log/?h=kraj/pu
> > >> >> >> >> >
> > >> >> >> >> > Khem Raj (1):
> > >> >> >> >> >   mesa: Contain configure search for llvm
> > >> >> >> >> >
> > >> >> >> >>
> > >> >> >> >> I added another fix for mesa-gl to remove one of obsolete
> > >> >> >> >> packageconfigs
> > >> >> >> >> and its on the same pull branch now.
> > >> >> >> >>
> > >> >> >> >> >  meta/recipes-graphics/mesa/mesa.inc | 2 +-
> > >> >> >> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >> >> >> >> >
> > >> >> >> >> --
> > >> >> >> >> _______________________________________________
> > >> >> >> >> Openembedded-core mailing list
> > >> >> >> >> Openembedded-core@lists.openembedded.org
> > >> >> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-
> core
> > >> >> >> >
> > >> >> >> >
> > >> >> >
> > >> >> > --
> > >> >> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > >> >
> > >> >
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

--001a114dbd901a145d0551fd4e78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Also it looks like the llvm option was renamed in some rec=
ent mesa, causing new warning above the error caused by this change.<div><b=
r></div><div><div>| configure: WARNING: The --enable-gallium-llvm option ha=
s been deprecated. Use --enable-llvm instead.</div><div>| configure: error:=
 --enable-llvm selected but llvm-config is not found</div><div>| NOTE: The =
following config.log files may provide further information.</div><div>| NOT=
E: /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/mesa/2_17.1=
.1-r0/build/config.log</div></div><div><br></div><div>BTW: this is probably=
 the reason why my builders are running out of disk space (tmpfs), because =
now (after temporarily removing my revert from my branches) even mesa fails=
 to build for qemu*, so rm_work isn&#39;t triggered early enough.</div><div=
><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jun 14, 2017 at 8:56 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">O=
n Tue, Jun 13, 2017 at 03:13:01PM -0700, Khem Raj wrote:<br>
&gt; On Tue, Jun 13, 2017 at 2:39 PM, Martin Jansa &lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt; &gt; On Sat, Apr 01, 2017 at 08:21:16AM -0700, Khem Raj wrote:<br>
&gt; &gt;&gt; On Fri, Mar 31, 2017 at 10:52 PM, Martin Jansa &lt;<a href=3D=
"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt; Why is it needed?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; If you have clang/llvm installed on your build host then it d=
efaults to that<br>
&gt; &gt;&gt; thats why its needed.<br>
&gt; &gt;<br>
&gt; &gt; And where does meta-clang install it? Because if it doesn&#39;t m=
atch with<br>
&gt; &gt; the location used by meta-oe&#39;s llvm then we cannot have the s=
ame flag<br>
&gt; &gt; which suits both providers.<br>
&gt; &gt;<br>
&gt; &gt; As it is now I still have this change reverted in my branches and=
 I&#39;ve<br>
&gt; &gt; noticed some layers which just use EXTRA_OECONF_remove to just re=
move<br>
&gt; &gt; this with-llvm-prefix to unblock the builds with Pyro and Rocko.<=
br>
&gt; &gt;<br>
&gt; &gt;&gt; &gt; Without this change mesa was finding llvm-config correct=
ly, that&#39;s why I&#39;ve<br>
&gt; &gt;&gt; &gt; just reverted this to continue building.<br>
&gt;<br>
&gt; The problem is mainly when you have clang/llvm installed on build host=
<br>
&gt; now that we prune hosttools this might not be an issue anymore, althou=
gh<br>
&gt; this needs to be tested.<br>
<br>
</span>I&#39;m not using meta-clang anywhere, can you please answer where<b=
r>
meta-clang installs llvm-config and if it&#39;s different path than what<br=
>
meta-oe recipe does, can we unify them?<br>
<br>
Unifying them was also discussed here:<br>
<a href=3D"https://www.mail-archive.com/openembedded-core@lists.openembedde=
d.org/msg94412.html" rel=3D"noreferrer" target=3D"_blank">https://www.mail-=
archive.com/<wbr>openembedded-core@lists.<wbr>openembedded.org/msg94412.htm=
l</a><br>
but as I&#39;m using meta-oe&#39;s llvm just for mesa I cannot help much wi=
th<br>
that.<br>
<br>
Regards,<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; &gt;&gt; &gt; On Fri, Mar 31, 2017 at 5:57 PM, Khem Raj &lt;<a href=3D=
"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; On Fri, Mar 31, 2017 at 8:08 AM, Martin Jansa &lt;<a=
 href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt;<br>
&gt; &gt;&gt; &gt;&gt; wrote:<br>
&gt; &gt;&gt; &gt;&gt; &gt; On Thu, Mar 23, 2017 at 10:31:07AM -0700, Khem =
Raj wrote:<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; On Thu, Mar 23, 2017 at 12:51 AM, Martin Ja=
nsa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a=
>&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; wrote:<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; I&#39;m not sure if this is the root c=
ause, but last qemux86 build shows:<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; | configure: error: --enable-gallium-l=
lvm selected but llvm-config is<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; not<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; found<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; | ERROR: Function failed: do_configure=
 (log file is located at<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; /home/jenkins/oe/world/shr-<wbr>core/t=
mp-glibc/work/i586-oe-<wbr>linux/mesa/2_17.0.1-r0/temp/<wbr>log.do_configur=
e.11359)<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; can you point where is llvm-config installe=
d in sysroot ? its possible<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; its not in native sysroot location ${STAGIN=
G_BINDIR_NATIVE}<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; OE qemux86@ ~/build/oe-core $ find<br>
&gt; &gt;&gt; &gt;&gt; &gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2=
-r0/recipe-<wbr>sysroot* -name llvm\*<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2=
-r0/recipe-<wbr>sysroot/usr/bin/crossscripts/<wbr>llvm-config<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2=
-r0/recipe-<wbr>sysroot/usr/bin/crossscripts/<wbr>llvm-config3.3<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2=
-r0/recipe-<wbr>sysroot/usr/include/llvm3.3<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2=
-r0/recipe-<wbr>sysroot/usr/include/llvm3.3/<wbr>llvm-c<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2=
-r0/recipe-<wbr>sysroot/usr/include/llvm3.3/<wbr>llvm<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2=
-r0/recipe-<wbr>sysroot/usr/include/llvm3.3/<wbr>llvm/Config/llvm-config.h<=
br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2=
-r0/recipe-<wbr>sysroot/usr/lib/llvm3.3<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2=
-r0/recipe-<wbr>sysroot/sysroot-providers/<wbr>llvm-common<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2=
-r0/recipe-<wbr>sysroot/sysroot-providers/<wbr>llvm3.3<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2=
-r0/recipe-<wbr>sysroot-native/installeddeps/<wbr>llvm3.3.complete<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2=
-r0/recipe-<wbr>sysroot-native/installeddeps/<wbr>llvm-common.complete<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2=
-r0/recipe-<wbr>sysroot-native/installeddeps/<wbr>llvm-common.<wbr>6be6a4ae=
98ee0dff7c2a4c4df17f02<wbr>6a<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2=
-r0/recipe-<wbr>sysroot-native/installeddeps/<wbr>llvm-common<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2=
-r0/recipe-<wbr>sysroot-native/installeddeps/<wbr>llvm3.3.<wbr>388adaa288ab=
3b1d35e01a43b65423<wbr>68<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; tmp-glibc/work/i586-oe-linux/<wbr>mesa/2_17.0.2=
-r0/recipe-<wbr>sysroot-native/installeddeps/<wbr>llvm3.3<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; so it seems it should point to &lt;recipe-sysroot&gt=
;/usr/bin/<wbr>crossscripts<br>
&gt; &gt;&gt; &gt;&gt; can you try changing -with-llvm-prefix to point to t=
his dir ?<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; I&#39;ve noticed some llvm changes for=
 meta-clang, do we need similar<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; changes<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; for meta-oe version of llvm?<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; On Sun, Mar 12, 2017 at 12:16 AM, Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;<b=
r>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; wrote:<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; On 3/11/17 1:30 PM, Khem Raj wrote=
:<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; The following changes since c=
ommit<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; a47e64d985a610535449730806651=
f<wbr>5bfd75d9ec:<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0libcomps: add a r=
ecipe (2017-03-11 16:08:50 +0000)<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; are available in the git repo=
sitory at:<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0git://<a href=3D"=
http://git.openembedded.org/openembedded-core-contrib" rel=3D"noreferrer" t=
arget=3D"_blank">git.openembedded.org/<wbr>openembedded-core-contrib</a> kr=
aj/pu<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; <a href=3D"http://cgit.openem=
bedded.org/openembedded-core-contrib/log/?h=3Dkraj/pu" rel=3D"noreferrer" t=
arget=3D"_blank">http://cgit.openembedded.org/<wbr>openembedded-core-contri=
b/log/<wbr>?h=3Dkraj/pu</a><br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; Khem Raj (1):<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0mesa: Contain con=
figure search for llvm<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; I added another fix for mesa-gl to=
 remove one of obsolete<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; packageconfigs<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; and its on the same pull branch no=
w.<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 meta/recipes-graphics/m=
esa/<wbr>mesa.inc | 2 +-<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 1 file changed, 1 inser=
tion(+), 1 deletion(-)<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; --<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; ______________________________<wbr=
>_________________<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; Openembedded-core mailing list<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; <a href=3D"mailto:Openembedded-cor=
e@lists.openembedded.org">Openembedded-core@lists.<wbr>openembedded.org</a>=
<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; <a href=3D"http://lists.openembedd=
ed.org/mailman/listinfo/openembedded-core" rel=3D"noreferrer" target=3D"_bl=
ank">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>=
core</a><br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; --<br>
&gt; &gt;&gt; &gt;&gt; &gt; Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0=
jabber: <a href=3D"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a=
><br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D=
"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
<br>
--<br>
Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mailto:Ma=
rtin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
</div></div></blockquote></div><br></div>

--001a114dbd901a145d0551fd4e78--
