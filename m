Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9FA4677026
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jan 2016 09:08:46 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l66so1316777wml.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jan 2016 01:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=dF4hnnGVrPExsJ2HdWUsnpEC6FLj7uEOsfNnEwGgRQw=;
	b=XyD5gfghRZjIvNkYoUxUKl9EIETLgyNdKYx+3D1UdtTUmqC/BWpk+1ZZJrDcwTu0Wc
	yYSm3IXrZCBI/p6qNztWLyLlJs7vz71gTyYPy6h8jPU5GtdWZo+eX+COthrZI07hSoli
	kqZcT31R51ouWqeA6XqP2sfEywASUjmHG+yrKEJpRK4mcCipbLuxEndMp+AY5ChQLh9b
	erlDQL2qGNfoIzhLM8KUhzyTvS+8yzuzUFT5Tc5d1Grp2ETkUNegwsbXbroqzVdkVIMa
	6TR/t3eiHsQPBIPzvNsJ0f8blTYJfJdnTv6pZsTi4nHnqNwRFgZF60yBqEQX0xUBwqe7
	wEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=dF4hnnGVrPExsJ2HdWUsnpEC6FLj7uEOsfNnEwGgRQw=;
	b=m8Jb9C5lwTSdzrdGW4RTpk7IMoRZhFpeKrw1TEt64/xrENhskhRcTyhxFwcJMHN1BU
	vqogHuZdSSsDd3hRCd5u6j7eNY6RtmOFkFn6nv5EKVs8flls1PRhSW84EkIvMofN9YeP
	UpPDGYHZFRxZ9P2l0nRefHiRL351t38oBOypoXgS9n34noN0bRIbiWPVlr34zBaBaXip
	pSpRXUXvgOqNP/S/M+kYEg5jOcPvp0ddgoOr9nT5/2kT9r3v+a3ponMQLSwGmld9XB/n
	ZEh3Hgvdnqf5z9eeK/NR8uiDEtlug9dKPHiZh1fpn8n3yU1vzdQKYsKd9bNrkF0mCl+m
	erDA==
X-Gm-Message-State: AG10YOSc7AaYcQjbrNA7m0rEF/D8ufAd0f8FuGPJBhZgqsA+wf8feBzqE0y5zsIgXlNfK2dY+2omnlgrsSm+OQ==
MIME-Version: 1.0
X-Received: by 10.195.12.45 with SMTP id en13mr12167179wjd.99.1454144926213;
	Sat, 30 Jan 2016 01:08:46 -0800 (PST)
Received: by 10.194.67.168 with HTTP; Sat, 30 Jan 2016 01:08:46 -0800 (PST)
In-Reply-To: <56AC2396.8030707@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
	<20160121115752.GA2603@jama> <20160127113311.GA2574@jama>
	<56AC2396.8030707@gmail.com>
Date: Sat, 30 Jan 2016 10:08:46 +0100
Message-ID: <CA+chaQcaWoZE_Cru1YZGd+AahFx7y_jBapZFG9rxuKcJrE=aXg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/20] Dizzy-next pull request 2016-1
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
X-List-Received-Date: Sat, 30 Jan 2016 09:08:47 -0000
Content-Type: multipart/alternative; boundary=047d7bd9170ac77480052a897fbc

--047d7bd9170ac77480052a897fbc
Content-Type: text/plain; charset=UTF-8

> that was a patch from the patch queue and affect glibc below 2.21 so

glibc/wscanf: CVE-2015-1472

looks like better subject

> Dizzy 1.7.4 is  not planned yet.

I don't care about point releases, I care only about contents of release
branch, can it be merged to dizzy branch?


On Sat, Jan 30, 2016 at 3:44 AM, akuster808 <akuster808@gmail.com> wrote:

> On 1/27/16 3:33 AM, Martin Jansa wrote:
> > On Thu, Jan 21, 2016 at 12:57:52PM +0100, Martin Jansa wrote:
> >> On Sat, Jan 09, 2016 at 04:30:26PM -0800, Armin Kuster wrote:
> >>> Please consider these changes for dizzy-next community support.
> >>>
> >>> The following changes since commit
> 6d34267e0a13e10ab91b60590b27a2b5ba3b7da6:
> >>>
> >>>   documentation: Changed some 'intro' tags to resolve multiple
> mega-manual warnings. (2015-11-18 16:44:05 +0000)
> >>>
> >>> are available in the git repository at:
> >>>
> >>>   git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
> >>>   http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/dizzy-next
> >> This is for oe-core, right? So it shouldn't be in poky-contrib and the
> >> http link doesn't work, it should be:
> >>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/dizzy-next
>
> no. this should be for oe core.
> >>
> >>> Armin Kuster (2):
> >>>   openssh: CVE-2015-6563 CVE-2015-6564 CVE-2015-6565
> >>>   Fixes a heap buffer overflow in glibc wscanf.
> >> What is this 2nd patch? It doesn't follow commit summary convention and
> >> I don't see it in master (at least not with this subject)
> >>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=akuster/dizzy-next&id=4807ff0ca0abf085e6b81257534a4a62fde88d16
>
>
> >> Other changes look good to me.
>
> that was a patch from the patch queue and affect glibc below 2.21 so
> Master, Jethro nor fido are  affected.
>
> http://patches.openembedded.org/patch/109797/
> > ping?
>
> Dizzy 1.7.4 is  not planned yet.
>
> - armin
> >
> >>> Belal, Awais (1):
> >>>   grub2: Fix CVE-2015-8370
> >>>
> >>> Chen Qi (1):
> >>>   image.bbclass: don't let do_rootfs depend on BUILDNAME
> >>>
> >>> Martin Jansa (3):
> >>>   fontcache: allow to pass extra parameters and environment to fc-cache
> >>>   texinfo: don't create dependency on INHERIT variable
> >>>   linux-dtb.inc: drop unused DTB_NAME variable from do_install
> >>>
> >>> Mike Crowe (1):
> >>>   allarch: Force TARGET_*FLAGS variable values
> >>>
> >>> Richard Purdie (2):
> >>>   layer.conf: Add several allarch dependency exclusions
> >>>   layer.conf: Add missing dependency for allarch package
> >>>     initramfs-framework
> >>>
> >>> Sergiy Kibrik (1):
> >>>   rsync: backport libattr checking patch
> >>>
> >>> Sona Sarmadi (7):
> >>>   libtasn1: CVE-2015-3622
> >>>   grep2.19: CVE-2015-1345
> >>>   libxml2: CVE-2015-7942
> >>>   libxml2: CVE-2015-8035
> >>>   openssl: CVE-2015-3194, CVE-2015-3195
> >>>   libxml2: CVE-2015-8241
> >>>   bind: CVE-2015-8000
> >>>
> >>> Tudor Florea (2):
> >>>   glibc: use patch for CVE-2015-1781
> >>>   unzip: CVE-2015-7696, CVE-2015-7697
> >>>
> >>>  meta/classes/allarch.bbclass                       |   4 +
> >>>  meta/classes/fontcache.bbclass                     |  19 +-
> >>>  meta/classes/image.bbclass                         |   2 +-
> >>>  meta/conf/layer.conf                               |  11 ++
> >>>  ...E-2015-8370-Grub2-user-pass-vulnerability.patch |  50 ++++++
> >>>  meta/recipes-bsp/grub/grub-efi_2.00.bb             |   1 +
> >>>  meta/recipes-bsp/grub/grub_2.00.bb                 |   1 +
> >>>  .../bind/bind/CVE-2015-8000.patch                  | 194
> +++++++++++++++++++++
> >>>  meta/recipes-connectivity/bind/bind_9.9.5.bb       |   1 +
> >>>  .../openssh/openssh/CVE-2015-6563.patch            |  36 ++++
> >>>  .../openssh/openssh/CVE-2015-6564.patch            |  34 ++++
> >>>  .../openssh/openssh/CVE-2015-6565.patch            |  35 ++++
> >>>  meta/recipes-connectivity/openssh/openssh_6.6p1.bb |   5 +-
> >>>  .../CVE-2015-3194-Add-PSS-parameter-check.patch    |  37 ++++
> >>>  ...CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch |  61 +++++++
> >>>  .../recipes-connectivity/openssl/openssl_1.0.1p.bb |   2 +
> >>>  ...5-1472-wscanf-allocates-too-little-memory.patch | 108 ++++++++++++
> >>>  meta/recipes-core/glibc/glibc_2.20.bb              |   5 +-
> >>>  meta/recipes-core/libxml/libxml2.inc               |   3 +
> >>>  .../libxml/libxml2/CVE-2015-7942.patch             |  58 ++++++
> >>>  .../libxml/libxml2/CVE-2015-8035.patch             |  35 ++++
> >>>  .../libxml/libxml2/CVE-2015-8241.patch             |  41 +++++
> >>>  .../rsync/files/check_libattr.patch                |  33 ++++
> >>>  meta/recipes-devtools/rsync/rsync_3.1.0.bb         |   3 +-
> >>>  .../grep/grep-2.19/grep2.19-CVE-2015-1345.patch    | 129
> ++++++++++++++
> >>>  meta/recipes-extended/grep/grep_2.19.bb            |   4 +-
> >>>  meta/recipes-extended/texinfo/texinfo_5.2.bb       |   2 +-
> >>>  .../unzip/unzip/CVE-2015-7696.patch                |  38 ++++
> >>>  .../unzip/unzip/CVE-2015-7697.patch                |  31 ++++
> >>>  meta/recipes-extended/unzip/unzip_6.0.bb           |   2 +
> >>>  meta/recipes-kernel/linux/linux-dtb.inc            |   1 -
> >>>  .../gnutls/libtasn1/libtasn1-CVE-2015-3622.patch   |  44 +++++
> >>>  meta/recipes-support/gnutls/libtasn1_4.0.bb        |   1 +
> >>>  scripts/postinst-intercepts/update_font_cache      |   4 +-
> >>>  34 files changed, 1020 insertions(+), 15 deletions(-)
> >>>  create mode 100644
> meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
> >>>  create mode 100644
> meta/recipes-connectivity/bind/bind/CVE-2015-8000.patch
> >>>  create mode 100644
> meta/recipes-connectivity/openssh/openssh/CVE-2015-6563.patch
> >>>  create mode 100644
> meta/recipes-connectivity/openssh/openssh/CVE-2015-6564.patch
> >>>  create mode 100644
> meta/recipes-connectivity/openssh/openssh/CVE-2015-6565.patch
> >>>  create mode 100644
> meta/recipes-connectivity/openssl/openssl/CVE-2015-3194-Add-PSS-parameter-check.patch
> >>>  create mode 100644
> meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch
> >>>  create mode 100644
> meta/recipes-core/glibc/glibc/CVE-2015-1472-wscanf-allocates-too-little-memory.patch
> >>>  create mode 100644
> meta/recipes-core/libxml/libxml2/CVE-2015-7942.patch
> >>>  create mode 100644
> meta/recipes-core/libxml/libxml2/CVE-2015-8035.patch
> >>>  create mode 100644
> meta/recipes-core/libxml/libxml2/CVE-2015-8241.patch
> >>>  create mode 100644
> meta/recipes-devtools/rsync/files/check_libattr.patch
> >>>  create mode 100644
> meta/recipes-extended/grep/grep-2.19/grep2.19-CVE-2015-1345.patch
> >>>  create mode 100644
> meta/recipes-extended/unzip/unzip/CVE-2015-7696.patch
> >>>  create mode 100644
> meta/recipes-extended/unzip/unzip/CVE-2015-7697.patch
> >>>  create mode 100644
> meta/recipes-support/gnutls/libtasn1/libtasn1-CVE-2015-3622.patch
> >>>
> >>> --
> >>> 1.9.1
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >> --
> >> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> >
>
>

--047d7bd9170ac77480052a897fbc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>&gt;=C2=A0<span style=3D"font-size:12.8px">that was a=
 patch from the patch queue and affect glibc below 2.21 so</span></div><div=
><br></div><div>glibc/wscanf: CVE-2015-1472</div><div><br></div><div>looks =
like better subject</div><div><br></div><div>&gt;=C2=A0<span style=3D"font-=
size:12.8px">Dizzy 1.7.4 is=C2=A0 not planned yet.</span></div><div><span s=
tyle=3D"font-size:12.8px"><br></span></div><div><span style=3D"font-size:12=
.8px">I don&#39;t care about point releases, I care only about contents of =
release branch, can it be merged to dizzy branch?</span></div><div><br></di=
v></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sat, J=
an 30, 2016 at 3:44 AM, akuster808 <span dir=3D"ltr">&lt;<a href=3D"mailto:=
akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 1/27/16 3:33 =
AM, Martin Jansa wrote:<br>
&gt; On Thu, Jan 21, 2016 at 12:57:52PM +0100, Martin Jansa wrote:<br>
&gt;&gt; On Sat, Jan 09, 2016 at 04:30:26PM -0800, Armin Kuster wrote:<br>
&gt;&gt;&gt; Please consider these changes for dizzy-next community support=
.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The following changes since commit 6d34267e0a13e10ab91b60590b2=
7a2b5ba3b7da6:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0documentation: Changed some &#39;intro&#39; tags t=
o resolve multiple mega-manual warnings. (2015-11-18 16:44:05 +0000)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; are available in the git repository at:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0git://<a href=3D"http://git.yoctoproject.org/poky-=
contrib" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/poky-con=
trib</a> akuster/dizzy-next<br>
&gt;&gt;&gt;=C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit.cgi//l=
og/?h=3Dakuster/dizzy-next" rel=3D"noreferrer" target=3D"_blank">http://git=
.yoctoproject.org/cgit.cgi//log/?h=3Dakuster/dizzy-next</a><br>
&gt;&gt; This is for oe-core, right? So it shouldn&#39;t be in poky-contrib=
 and the<br>
&gt;&gt; http link doesn&#39;t work, it should be:<br>
&gt;&gt; <a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?=
h=3Dakuster/dizzy-next" rel=3D"noreferrer" target=3D"_blank">http://git.yoc=
toproject.org/cgit.cgi/poky-contrib/log/?h=3Dakuster/dizzy-next</a><br>
<br>
</span>no. this should be for oe core.<br>
<span class=3D"">&gt;&gt;<br>
&gt;&gt;&gt; Armin Kuster (2):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0openssh: CVE-2015-6563 CVE-2015-6564 CVE-2015-6565=
<br>
&gt;&gt;&gt;=C2=A0 =C2=A0Fixes a heap buffer overflow in glibc wscanf.<br>
&gt;&gt; What is this 2nd patch? It doesn&#39;t follow commit summary conve=
ntion and<br>
&gt;&gt; I don&#39;t see it in master (at least not with this subject)<br>
&gt;&gt; <a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/commi=
t/?h=3Dakuster/dizzy-next&amp;id=3D4807ff0ca0abf085e6b81257534a4a62fde88d16=
" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproject.org/cgit.cgi=
/poky-contrib/commit/?h=3Dakuster/dizzy-next&amp;id=3D4807ff0ca0abf085e6b81=
257534a4a62fde88d16</a><br>
<br>
<br>
&gt;&gt; Other changes look good to me.<br>
<br>
</span>that was a patch from the patch queue and affect glibc below 2.21 so=
<br>
Master, Jethro nor fido are=C2=A0 affected.<br>
<br>
<a href=3D"http://patches.openembedded.org/patch/109797/" rel=3D"noreferrer=
" target=3D"_blank">http://patches.openembedded.org/patch/109797/</a><br>
&gt; ping?<br>
<br>
Dizzy 1.7.4 is=C2=A0 not planned yet.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
- armin<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">&gt;<br>
&gt;&gt;&gt; Belal, Awais (1):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0grub2: Fix CVE-2015-8370<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Chen Qi (1):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0image.bbclass: don&#39;t let do_rootfs depend on B=
UILDNAME<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Martin Jansa (3):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0fontcache: allow to pass extra parameters and envi=
ronment to fc-cache<br>
&gt;&gt;&gt;=C2=A0 =C2=A0texinfo: don&#39;t create dependency on INHERIT va=
riable<br>
&gt;&gt;&gt;=C2=A0 =C2=A0linux-dtb.inc: drop unused DTB_NAME variable from =
do_install<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Mike Crowe (1):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0allarch: Force TARGET_*FLAGS variable values<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Richard Purdie (2):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0layer.conf: Add several allarch dependency exclusi=
ons<br>
&gt;&gt;&gt;=C2=A0 =C2=A0layer.conf: Add missing dependency for allarch pac=
kage<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0initramfs-framework<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Sergiy Kibrik (1):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0rsync: backport libattr checking patch<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Sona Sarmadi (7):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0libtasn1: CVE-2015-3622<br>
&gt;&gt;&gt;=C2=A0 =C2=A0grep2.19: CVE-2015-1345<br>
&gt;&gt;&gt;=C2=A0 =C2=A0libxml2: CVE-2015-7942<br>
&gt;&gt;&gt;=C2=A0 =C2=A0libxml2: CVE-2015-8035<br>
&gt;&gt;&gt;=C2=A0 =C2=A0openssl: CVE-2015-3194, CVE-2015-3195<br>
&gt;&gt;&gt;=C2=A0 =C2=A0libxml2: CVE-2015-8241<br>
&gt;&gt;&gt;=C2=A0 =C2=A0bind: CVE-2015-8000<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Tudor Florea (2):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0glibc: use patch for CVE-2015-1781<br>
&gt;&gt;&gt;=C2=A0 =C2=A0unzip: CVE-2015-7696, CVE-2015-7697<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 meta/classes/allarch.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br=
>
&gt;&gt;&gt;=C2=A0 meta/classes/fontcache.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 19 +-<br>
&gt;&gt;&gt;=C2=A0 meta/classes/image.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +-<br>
&gt;&gt;&gt;=C2=A0 meta/conf/layer.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 11 ++<br>
&gt;&gt;&gt;=C2=A0 ...E-2015-8370-Grub2-user-pass-vulnerability.patch |=C2=
=A0 50 ++++++<br>
&gt;&gt;&gt;=C2=A0 meta/recipes-bsp/grub/<a href=3D"http://grub-efi_2.00.bb=
" rel=3D"noreferrer" target=3D"_blank">grub-efi_2.00.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;&gt;&gt;=C2=A0 meta/recipes-bsp/grub/<a href=3D"http://grub_2.00.bb" re=
l=3D"noreferrer" target=3D"_blank">grub_2.00.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;&gt;&gt;=C2=A0 .../bind/bind/CVE-2015-8000.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 194 +++++++++++++++++++++<br>
&gt;&gt;&gt;=C2=A0 meta/recipes-connectivity/bind/<a href=3D"http://bind_9.=
9.5.bb" rel=3D"noreferrer" target=3D"_blank">bind_9.9.5.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;&gt;&gt;=C2=A0 .../openssh/openssh/CVE-2015-6563.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 36 ++++<br>
&gt;&gt;&gt;=C2=A0 .../openssh/openssh/CVE-2015-6564.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 34 ++++<br>
&gt;&gt;&gt;=C2=A0 .../openssh/openssh/CVE-2015-6565.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 35 ++++<br>
&gt;&gt;&gt;=C2=A0 meta/recipes-connectivity/openssh/<a href=3D"http://open=
ssh_6.6p1.bb" rel=3D"noreferrer" target=3D"_blank">openssh_6.6p1.bb</a> |=
=C2=A0 =C2=A05 +-<br>
&gt;&gt;&gt;=C2=A0 .../CVE-2015-3194-Add-PSS-parameter-check.patch=C2=A0 =
=C2=A0 |=C2=A0 37 ++++<br>
&gt;&gt;&gt;=C2=A0 ...CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch |=C2=
=A0 61 +++++++<br>
&gt;&gt;&gt;=C2=A0 .../recipes-connectivity/openssl/<a href=3D"http://opens=
sl_1.0.1p.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.0.1p.bb</a> |=
=C2=A0 =C2=A02 +<br>
&gt;&gt;&gt;=C2=A0 ...5-1472-wscanf-allocates-too-little-memory.patch | 108=
 ++++++++++++<br>
&gt;&gt;&gt;=C2=A0 meta/recipes-core/glibc/<a href=3D"http://glibc_2.20.bb"=
 rel=3D"noreferrer" target=3D"_blank">glibc_2.20.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +-<br>
&gt;&gt;&gt;=C2=A0 meta/recipes-core/libxml/libxml2.inc=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt;&gt;&gt;=C2=A0 .../libxml/libxml2/CVE-2015-7942.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 58 ++++++<br>
&gt;&gt;&gt;=C2=A0 .../libxml/libxml2/CVE-2015-8035.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 35 ++++<br>
&gt;&gt;&gt;=C2=A0 .../libxml/libxml2/CVE-2015-8241.patch=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 41 +++++<br>
&gt;&gt;&gt;=C2=A0 .../rsync/files/check_libattr.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 33 ++++<br>
&gt;&gt;&gt;=C2=A0 meta/recipes-devtools/rsync/<a href=3D"http://rsync_3.1.=
0.bb" rel=3D"noreferrer" target=3D"_blank">rsync_3.1.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
&gt;&gt;&gt;=C2=A0 .../grep/grep-2.19/grep2.19-CVE-2015-1345.patch=C2=A0 =
=C2=A0 | 129 ++++++++++++++<br>
&gt;&gt;&gt;=C2=A0 meta/recipes-extended/grep/<a href=3D"http://grep_2.19.b=
b" rel=3D"noreferrer" target=3D"_blank">grep_2.19.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;&gt;&gt;=C2=A0 meta/recipes-extended/texinfo/<a href=3D"http://texinfo_=
5.2.bb" rel=3D"noreferrer" target=3D"_blank">texinfo_5.2.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;&gt;&gt;=C2=A0 .../unzip/unzip/CVE-2015-7696.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 38 ++++<br>
&gt;&gt;&gt;=C2=A0 .../unzip/unzip/CVE-2015-7697.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 31 ++++<br>
&gt;&gt;&gt;=C2=A0 meta/recipes-extended/unzip/<a href=3D"http://unzip_6.0.=
bb" rel=3D"noreferrer" target=3D"_blank">unzip_6.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;&gt;&gt;=C2=A0 meta/recipes-kernel/linux/linux-dtb.inc=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 -<br>
&gt;&gt;&gt;=C2=A0 .../gnutls/libtasn1/libtasn1-CVE-2015-3622.patch=C2=A0 =
=C2=A0|=C2=A0 44 +++++<br>
&gt;&gt;&gt;=C2=A0 meta/recipes-support/gnutls/<a href=3D"http://libtasn1_4=
.0.bb" rel=3D"noreferrer" target=3D"_blank">libtasn1_4.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;&gt;&gt;=C2=A0 scripts/postinst-intercepts/update_font_cache=C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;&gt;&gt;=C2=A0 34 files changed, 1020 insertions(+), 15 deletions(-)<br=
>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-bsp/grub/files/0001-Fix-=
CVE-2015-8370-Grub2-user-pass-vulnerability.patch<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-connectivity/bind/bind/C=
VE-2015-8000.patch<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-connectivity/openssh/ope=
nssh/CVE-2015-6563.patch<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-connectivity/openssh/ope=
nssh/CVE-2015-6564.patch<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-connectivity/openssh/ope=
nssh/CVE-2015-6565.patch<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-connectivity/openssl/ope=
nssl/CVE-2015-3194-Add-PSS-parameter-check.patch<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-connectivity/openssl/ope=
nssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-core/glibc/glibc/CVE-201=
5-1472-wscanf-allocates-too-little-memory.patch<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-=
2015-7942.patch<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-=
2015-8035.patch<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-=
2015-8241.patch<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-devtools/rsync/files/che=
ck_libattr.patch<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-extended/grep/grep-2.19/=
grep2.19-CVE-2015-1345.patch<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-extended/unzip/unzip/CVE=
-2015-7696.patch<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-extended/unzip/unzip/CVE=
-2015-7697.patch<br>
&gt;&gt;&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/libtasn1/=
libtasn1-CVE-2015-3622.patch<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 1.9.1<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; _______________________________________________<br>
&gt;&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Op=
enembedded-core@lists.openembedded.org</a><br>
&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/open=
embedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedd=
ed.org/mailman/listinfo/openembedded-core</a><br>
&gt;&gt; --<br>
&gt;&gt; Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"=
mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
&gt;<br>
&gt;<br>
<br>
</div></div></blockquote></div><br></div>

--047d7bd9170ac77480052a897fbc--
