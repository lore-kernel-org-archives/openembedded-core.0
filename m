Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1TTc25-0000EU-2m
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Oct 2012 18:24:49 +0100
Received: by mail-vb0-f47.google.com with SMTP id ez10so1757565vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2012 10:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=f1PY522kKxFzYOupRjt2JJAyC/ZIAlogvnnWVMZToyY=;
	b=U3zLzgfTW8jnDDkeSYiG9aVEnqnowKDrtNPZBpPtsFVg4z6PPsm17d1t3Z1WwEINy3
	6tVZKkajbJjQ3it77g2fyBcW8GLIyDVtlyN3KEfNpouwGRKIdexo4FmuJpKN4LysvQbS
	xZoF2SIBcIG4RYXMTJnWiqx+yfK2KYViCXVcH6jQIYsMFyU1ryGQIeINHPgqFOLruAMt
	8MviHPjP3BLR/Zo22wLRmdpbweCggbKw6r5rxPNqh3vSwM5hHH6UAqZl+x6Dn5sMPOcC
	JGt3j02/zTwd1+bsnWdYnpOYRHRT6GZp17K0SpJj9gTSVVOSe8a+tIIssuTn922BCZ6C
	16Hw==
MIME-Version: 1.0
Received: by 10.52.24.231 with SMTP id x7mr48020415vdf.121.1351703471731; Wed,
	31 Oct 2012 10:11:11 -0700 (PDT)
Received: by 10.58.246.100 with HTTP; Wed, 31 Oct 2012 10:11:11 -0700 (PDT)
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A73724E@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1350554279-8975-1-git-send-email-yashpal.dutta@freescale.com>
	<CADkTA4MzmofTtk7qvhU_2fsfKgmGRPmxf-zUzcj4FkzBDAP_rQ@mail.gmail.com>
	<70CC66F5C30A414DADDA6973E4CA391A73724E@039-SN1MPN1-002.039d.mgd.msft.net>
Date: Wed, 31 Oct 2012 13:11:11 -0400
Message-ID: <CADkTA4NBu0-M-N8VOQM470MgZszo5Bv+DXwmMazrqKKAxjVBSA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Cc: Dutta Yashpal-B05456 <B05456@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cryptodev kernel module recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Oct 2012 17:24:49 -0000
Content-Type: multipart/alternative; boundary=20cf307f363446330f04cd5dfd23

--20cf307f363446330f04cd5dfd23
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 30, 2012 at 2:50 PM, McClintock Matthew-B29882 <
B29882@freescale.com> wrote:

> On Thu, Oct 18, 2012 at 8:33 AM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> > On Thu, Oct 18, 2012 at 5:57 AM, Yashpal Dutta
> > <yashpal.dutta@freescale.com> wrote:
> >> This is a /dev/crypto device driver, equivalent to those in OpenBSD or
> FreeBSD.
> >> The main idea is to access of existing ciphers in kernel space from
> userspace,
> >> thus enabling re-use of a hardware implementation of a cipher.
> >
> > I always use OCF for an overlapping set of functionality. To make this
> external
> > module gracefully deal with a situation such as this, maybe a check for
> OCF
> > in the kernel config ?
> >
> > The same thing could be said about having a kernel with this
> functionality
> > already integrated (I have several of those as well).
> >
> > That's a more general question about what's the best way to gracefully
> deal
> > with out of tree modules detecting that they are being built against a
> kernel
> > that already has the functionality merged. The easy answer is that
> > it's something
> > the distro maintainer needs to know, and manage, and maybe that's the
> > final answer. But I'm more wondering about this with respect to
> > inter-operability
> > of layers, if something in a layer depends/rdepends on this module, it
> will be
> > pulled in, and won't that limit the mix/match/stacking of the various
> layers ?
> >
> > I added Richard for comment on the above.
> >
> > But that of course raises the question, why should this be in oe-core
> versus
> > something like OCF ? This is definitely simpler, but OCF has it's use
> cases and
> > advantages as well, that are an overlapping set of functionality.
> >
> > I don't have all the answers, just plenty of questions :)
>
> I'm not overly familiar with OCF. Does this just RCONFLICT with ocf-linux?
>

I missed this yesterday, sorry about that. gmail just left this in the
thread and
not in my inbox .. but anyway.

I only see parts ocf in oe-core, but maybe I'm just not understanding what
the
recipe is doing (are you seeing more) ? i.e. ocf-linux is buried under the
open-ssl recipe, and really looks to be just providing headers.

I'm doing some builds now to learn more .. which I just did .. and from
what I
can see, it is just the headers, which isn't all that useful without the
kernel
underpinning.

OCF does definitely accelerate openssl when properly used in both the
kernel and
userspace, but I'm not seeing the full offload kernel framework anywhere.

I wonder if anyone actually uses it :)

But yes AFAIC, if you had a full OCF, you need these to conflict, since
they'll both
try and enable/provide cryptodev.

Bruce


>
> -M
>
> >
> > Cheers,
> >
> > Bruce
> >
> >
> >>
> >> Signed-off-by: Yashpal Dutta <yashpal.dutta@freescale.com>
> >> ---
> >>  meta/recipes-kernel/cryptodev/cryptodev_1.5.bb     |   18
> +++++++++++++
> >>  .../cryptodev/files/makefile_fixup.patch           |   26
> ++++++++++++++++++++
> >>  2 files changed, 44 insertions(+), 0 deletions(-)
> >>  create mode 100644 meta/recipes-kernel/cryptodev/cryptodev_1.5.bb
> >>  create mode 100644
> meta/recipes-kernel/cryptodev/files/makefile_fixup.patch
> >>
> >> diff --git a/meta/recipes-kernel/cryptodev/cryptodev_1.5.bbb/meta/recipes-kernel/cryptodev/
> cryptodev_1.5.bb
> >> new file mode 100644
> >> index 0000000..5125710
> >> --- /dev/null
> >> +++ b/meta/recipes-kernel/cryptodev/cryptodev_1.5.bb
> >> @@ -0,0 +1,18 @@
> >> +SECTION = "devel"
> >> +SUMMARY = "Linux Cryptodev KERNEL MODULE"
> >> +DESCRIPTION = "The Cryptodev package contains the kernel /dev/crypto
> module"
> >> +LICENSE = "GPLv2"
> >> +LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >> +
> >> +DEPENDS = "virtual/kernel"
> >> +
> >> +inherit module
> >> +
> >> +SRCREV = "1c24a0aa996630518d47826a2e3fea129ea094c7"
> >> +
> >> +SRC_URI = "git://repo.or.cz/cryptodev-linux.git;protocol=git \
> >> +         file://makefile_fixup.patch"
> >> +
> >> +EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
> >> +
> >> +S = "${WORKDIR}/git"
> >> diff --git a/meta/recipes-kernel/cryptodev/files/makefile_fixup.patch
> b/meta/recipes-kernel/cryptodev/files/makefile_fixup.patch
> >> new file mode 100644
> >> index 0000000..323aacd
> >> --- /dev/null
> >> +++ b/meta/recipes-kernel/cryptodev/files/makefile_fixup.patch
> >> @@ -0,0 +1,26 @@
> >> +diff --git a/Makefile b/Makefile
> >> +index 2be8825..b36d68c 100644
> >> +--- a/Makefile
> >> ++++ b/Makefile
> >> +@@ -1,6 +1,7 @@
> >> + KBUILD_CFLAGS += -I$(src)
> >> + KERNEL_DIR = /lib/modules/$(shell uname -r)/build
> >> + VERSION = 1.5
> >> ++PREFIX =
> >> +
> >> + cryptodev-objs = ioctl.o main.o cryptlib.o authenc.o zc.o util.o
> >> +
> >> +@@ -12,10 +13,10 @@ build: version.h
> >> + version.h: Makefile
> >> +       @echo "#define VERSION \"$(VERSION)\"" > version.h
> >> +
> >> +-install:
> >> ++modules_install:
> >> +       make -C $(KERNEL_DIR) SUBDIRS=`pwd` modules_install
> >> +-      @echo "Installing cryptodev.h in /usr/include/crypto ..."
> >> +-      @install -D crypto/cryptodev.h /usr/include/crypto/cryptodev.h
> >> ++      @echo "Installing cryptodev.h in $(PREFIX)/usr/include/crypto
> ..."
> >> ++      @install -D crypto/cryptodev.h
> $(PREFIX)/usr/include/crypto/cryptodev.h
> >> +
> >> + clean:
> >> +       make -C $(KERNEL_DIR) SUBDIRS=`pwd` clean
> >> --
> >> 1.7.0.4
> >>
> >>
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end"
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--20cf307f363446330f04cd5dfd23
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><div class=3D"gmail_quote">On Tue, Oct 30, 2=
012 at 2:50 PM, McClintock Matthew-B29882 <span dir=3D"ltr">&lt;<a href=3D"=
mailto:B29882@freescale.com" target=3D"_blank">B29882@freescale.com</a>&gt;=
</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div><div>On Thu, Oct 18, 2012 at 8:33 AM, Bruce Ashfield<=
br>

&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ash=
field@gmail.com</a>&gt; wrote:<br>
&gt; On Thu, Oct 18, 2012 at 5:57 AM, Yashpal Dutta<br>
&gt; &lt;<a href=3D"mailto:yashpal.dutta@freescale.com" target=3D"_blank">y=
ashpal.dutta@freescale.com</a>&gt; wrote:<br>
&gt;&gt; This is a /dev/crypto device driver, equivalent to those in OpenBS=
D or FreeBSD.<br>
&gt;&gt; The main idea is to access of existing ciphers in kernel space fro=
m userspace,<br>
&gt;&gt; thus enabling re-use of a hardware implementation of a cipher.<br>
&gt;<br>
&gt; I always use OCF for an overlapping set of functionality. To make this=
 external<br>
&gt; module gracefully deal with a situation such as this, maybe a check fo=
r OCF<br>
&gt; in the kernel config ?<br>
&gt;<br>
&gt; The same thing could be said about having a kernel with this functiona=
lity<br>
&gt; already integrated (I have several of those as well).<br>
&gt;<br>
&gt; That&#39;s a more general question about what&#39;s the best way to gr=
acefully deal<br>
&gt; with out of tree modules detecting that they are being built against a=
 kernel<br>
&gt; that already has the functionality merged. The easy answer is that<br>
&gt; it&#39;s something<br>
&gt; the distro maintainer needs to know, and manage, and maybe that&#39;s =
the<br>
&gt; final answer. But I&#39;m more wondering about this with respect to<br=
>
&gt; inter-operability<br>
&gt; of layers, if something in a layer depends/rdepends on this module, it=
 will be<br>
&gt; pulled in, and won&#39;t that limit the mix/match/stacking of the vari=
ous layers ?<br>
&gt;<br>
&gt; I added Richard for comment on the above.<br>
&gt;<br>
&gt; But that of course raises the question, why should this be in oe-core =
versus<br>
&gt; something like OCF ? This is definitely simpler, but OCF has it&#39;s =
use cases and<br>
&gt; advantages as well, that are an overlapping set of functionality.<br>
&gt;<br>
&gt; I don&#39;t have all the answers, just plenty of questions :)<br>
<br>
</div></div>I&#39;m not overly familiar with OCF. Does this just RCONFLICT =
with ocf-linux?<br></blockquote><div><br></div><div>I missed this yesterday=
, sorry about that. gmail just left this in the thread and</div><div>not in=
 my inbox .. but anyway.</div>

<div><br></div><div>I only see parts ocf in oe-core, but maybe I&#39;m just=
 not understanding what the</div><div>recipe is doing (are you seeing more)=
 ? i.e. ocf-linux=A0is buried under the=A0</div><div>open-ssl recipe, and r=
eally looks to be just providing headers.=A0</div>

<div><br></div><div>I&#39;m doing some builds now to learn more .. which I =
just did .. and from what I=A0<br></div><div>can see, it is just the header=
s, which isn&#39;t all that useful without the kernel</div><div>underpinnin=
g.=A0</div>
<div><br></div><div><div>OCF does definitely accelerate openssl when proper=
ly used in both the kernel and</div><div>userspace, but I&#39;m not seeing =
the full offload kernel framework anywhere.</div></div><div><br></div><div>
I wonder if anyone actually uses it :)</div>
<div><br></div><div>But yes AFAIC, if you had a full OCF, you need these to=
 conflict, since they&#39;ll both=A0</div><div>try and enable/provide crypt=
odev.</div><div><br></div><div>Bruce</div><div>=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">


<span><font color=3D"#888888"><br>
-M<br>
</font></span><div><div><br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Yashpal Dutta &lt;<a href=3D"mailto:yashpal.dutta@f=
reescale.com" target=3D"_blank">yashpal.dutta@freescale.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =A0meta/recipes-kernel/cryptodev/<a href=3D"http://cryptodev_1.5.b=
b" target=3D"_blank">cryptodev_1.5.bb</a> =A0 =A0 | =A0 18 +++++++++++++<br=
>
&gt;&gt; =A0.../cryptodev/files/makefile_fixup.patch =A0 =A0 =A0 =A0 =A0 | =
=A0 26 ++++++++++++++++++++<br>
&gt;&gt; =A02 files changed, 44 insertions(+), 0 deletions(-)<br>
&gt;&gt; =A0create mode 100644 meta/recipes-kernel/cryptodev/<a href=3D"htt=
p://cryptodev_1.5.bb" target=3D"_blank">cryptodev_1.5.bb</a><br>
&gt;&gt; =A0create mode 100644 meta/recipes-kernel/cryptodev/files/makefile=
_fixup.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-kernel/cryptodev/<a href=3D"http://crypt=
odev_1.5.bb" target=3D"_blank">cryptodev_1.5.bb</a> b/meta/recipes-kernel/c=
ryptodev/<a href=3D"http://cryptodev_1.5.bb" target=3D"_blank">cryptodev_1.=
5.bb</a><br>


&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000..5125710<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-kernel/cryptodev/<a href=3D"http://cryptodev_1.=
5.bb" target=3D"_blank">cryptodev_1.5.bb</a><br>
&gt;&gt; @@ -0,0 +1,18 @@<br>
&gt;&gt; +SECTION =3D &quot;devel&quot;<br>
&gt;&gt; +SUMMARY =3D &quot;Linux Cryptodev KERNEL MODULE&quot;<br>
&gt;&gt; +DESCRIPTION =3D &quot;The Cryptodev package contains the kernel /=
dev/crypto module&quot;<br>
&gt;&gt; +LICENSE =3D &quot;GPLv2&quot;<br>
&gt;&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce44=
86a80fdaf4a4263&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +DEPENDS =3D &quot;virtual/kernel&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +inherit module<br>
&gt;&gt; +<br>
&gt;&gt; +SRCREV =3D &quot;1c24a0aa996630518d47826a2e3fea129ea094c7&quot;<b=
r>
&gt;&gt; +<br>
&gt;&gt; +SRC_URI =3D &quot;git://<a href=3D"http://repo.or.cz/cryptodev-li=
nux.git;protocol=3Dgit" target=3D"_blank">repo.or.cz/cryptodev-linux.git;pr=
otocol=3Dgit</a> \<br>
&gt;&gt; + =A0 =A0 =A0 =A0 file://makefile_fixup.patch&quot;<br>
&gt;&gt; +<br>
&gt;&gt; +EXTRA_OEMAKE=3D&#39;KERNEL_DIR=3D&quot;${STAGING_KERNEL_DIR}&quot=
; PREFIX=3D&quot;${D}&quot;&#39;<br>
&gt;&gt; +<br>
&gt;&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt; diff --git a/meta/recipes-kernel/cryptodev/files/makefile_fixup.pa=
tch b/meta/recipes-kernel/cryptodev/files/makefile_fixup.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000..323aacd<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-kernel/cryptodev/files/makefile_fixup.patch<br>
&gt;&gt; @@ -0,0 +1,26 @@<br>
&gt;&gt; +diff --git a/Makefile b/Makefile<br>
&gt;&gt; +index 2be8825..b36d68c 100644<br>
&gt;&gt; +--- a/Makefile<br>
&gt;&gt; ++++ b/Makefile<br>
&gt;&gt; +@@ -1,6 +1,7 @@<br>
&gt;&gt; + KBUILD_CFLAGS +=3D -I$(src)<br>
&gt;&gt; + KERNEL_DIR =3D /lib/modules/$(shell uname -r)/build<br>
&gt;&gt; + VERSION =3D 1.5<br>
&gt;&gt; ++PREFIX =3D<br>
&gt;&gt; +<br>
&gt;&gt; + cryptodev-objs =3D ioctl.o main.o cryptlib.o authenc.o zc.o util=
.o<br>
&gt;&gt; +<br>
&gt;&gt; +@@ -12,10 +13,10 @@ build: version.h<br>
&gt;&gt; + version.h: Makefile<br>
&gt;&gt; + =A0 =A0 =A0 @echo &quot;#define VERSION \&quot;$(VERSION)\&quot;=
&quot; &gt; version.h<br>
&gt;&gt; +<br>
&gt;&gt; +-install:<br>
&gt;&gt; ++modules_install:<br>
&gt;&gt; + =A0 =A0 =A0 make -C $(KERNEL_DIR) SUBDIRS=3D`pwd` modules_instal=
l<br>
&gt;&gt; +- =A0 =A0 =A0@echo &quot;Installing cryptodev.h in /usr/include/c=
rypto ...&quot;<br>
&gt;&gt; +- =A0 =A0 =A0@install -D crypto/cryptodev.h /usr/include/crypto/c=
ryptodev.h<br>
&gt;&gt; ++ =A0 =A0 =A0@echo &quot;Installing cryptodev.h in $(PREFIX)/usr/=
include/crypto ...&quot;<br>
&gt;&gt; ++ =A0 =A0 =A0@install -D crypto/cryptodev.h $(PREFIX)/usr/include=
/crypto/cryptodev.h<br>
&gt;&gt; +<br>
&gt;&gt; + clean:<br>
&gt;&gt; + =A0 =A0 =A0 make -C $(KERNEL_DIR) SUBDIRS=3D`pwd` clean<br>
&gt;&gt; --<br>
&gt;&gt; 1.7.0.4<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/ope=
nembedded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailma=
n/listinfo/openembedded-core</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait<br>
&gt; thee at its end&quot;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await t=
hee at its end&quot;<br>
</div>

--20cf307f363446330f04cd5dfd23--
