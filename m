Return-Path: <tanuk@iki.fi>
X-Greylist: delayed 317 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Nov 2019 13:41:12 UTC
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id ECE4B7CE27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 13:41:12 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 46058222B4;
	Wed, 20 Nov 2019 08:35:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Wed, 20 Nov 2019 08:35:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=/WN/WuFWok3j2PGL/+3OWOXctryAs4gh4ofmxMW/9
	14=; b=X63wxYz+GglqkujtKw7nHZDiDrHLNFIX1zU6c/eTuWvACgQ5w8cO1tFPV
	DL/h6CyQNWctYqF00OJ8NXfQmPepH+HJhg5hLvqWwqj/lJtBXbw/Se+3/e6iHH9w
	Rg3zqihjJN7o/EmWu7kBrTv+aykU6YQUKQyn0XfNdxmqvGmmpC03TODibfy8pyFZ
	L0zi6VNlgGw3g5jxcKIgjApoh6/l91oDFE4AjFkK2uGvmg1XKnYZh8Quw3AfOzG5
	sBBQ2y69K1zxrBQZlDJb9if01giMSiAGxexZ1btUJTuGjh0FGl7zjhZ77qK/JRqq
	v2uScGiJhxa1kB8Qa9kPG6TnakexA==
X-ME-Sender: <xms:OkHVXQpVkar5JgMIWsiJ7kU9owgu_uJEfh2nrvYkESTzcJ1JIgo-5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudehtddghedvucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepvfgrnhhu
	ucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuffhomhgrihhnpehgih
	hthhhusgdrtghomhdpuggvsghirghnrdhorhhgpdgrlhhsrgdqphhrohhjvggtthdrohhr
	ghdpohhpvghnvghmsggvugguvggurdhorhhgnecukfhppeduleeirddvgeegrdduledurd
	dutdeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhksehikhhirdhfihenucev
	lhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:OkHVXQUUDSFvfz8ZBw7BeeQfMK1TH7kgvNiZ8i33ubmZmapLBk6_QQ>
	<xmx:OkHVXUhFi5x2Lx16yoe4JTesl28Ua7tq1u7KVetdE4eX2_f7xzcgzA>
	<xmx:OkHVXf9N7CX7q58--PuWIfZWZMxCCMH0dKn1GP0zrZJBwof7VtV45g>
	<xmx:O0HVXcrYnLUzpjqBtwcPw_XfF0j1EUI2aWQUhLjATwkdC7F0h9Bq4g>
Received: from laptop (unknown [196.244.191.106])
	by mail.messagingengine.com (Postfix) with ESMTPA id DDFAA8005C;
	Wed, 20 Nov 2019 08:35:53 -0500 (EST)
Message-ID: <899c96a834a3c97f29c47cbdd0a1c2020ff8e5b1.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Alexander Kanavin <alex.kanavin@gmail.com>, "Mittal, Anuj"
	<anuj.mittal@intel.com>
Date: Wed, 20 Nov 2019 15:35:50 +0200
In-Reply-To: <CANNYZj9mjTQyz=dWVcGwSAucHAbkYtBfMaGCEMZ5FFtsRS=r=w@mail.gmail.com>
References: <20191120051704.24066-1-zangrc.fnst@cn.fujitsu.com>
	<7620b40b6ba965474794d7a4b9b280c8c5a849bf.camel@intel.com>
	<CANNYZj9mjTQyz=dWVcGwSAucHAbkYtBfMaGCEMZ5FFtsRS=r=w@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-lib:upgrade 1.1.9 -> 1.2.1.1
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
X-List-Received-Date: Wed, 20 Nov 2019 13:41:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi, I'm still around. Yes, the moved UCM conf files need to be
packaged. (And no doubt the topology files too, although that's an area
I understand less well).

-- Tanu


On Wed, 2019-11-20 at 13:10 +0100, Alexander Kanavin wrote:
> If Tanu is still around, he should probably chime in.
> 
> Alex
> 
> On Wed, 20 Nov 2019 at 12:55, Mittal, Anuj <anuj.mittal@intel.com> wrote:
> 
> > This version has moved ucm and topology conf files to separate
> > repositories. We should also probably fetch and package those.
> > 
> > 
> > https://github.com/alsa-project/alsa-lib/commit/1f37ba2a2b1c07c04de1c368cd4943f712cccfa5
> > 
> > 
> > https://github.com/alsa-project/alsa-lib/commit/cdc8aacbb57c82a81e3b398f2ede6440d49334a5
> > 
> > Thanks,
> > 
> > Anuj
> > 
> > On Wed, 2019-11-20 at 13:17 +0800, Zang Ruochen wrote:
> > > The following error occurred during the steps of do-configure:
> > > > Fixing libtool for -rpath problems.
> > > > ../alsa-lib-1.2.1.1/configure: line 16567: libtool: No such file or
> > > > directory
> > > > mv: cannot stat 'libtool-2': No such file or directory
> > > > chmod: cannot access 'libtool': No such file or directory
> > > 
> > > add alsa-lib/0001-Fix-problem-with-libtool-not-found.patch to fix it.
> > > 
> > > Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > > ---
> > >  ...1-Fix-problem-with-libtool-not-found.patch | 31
> > > +++++++++++++++++++
> > >  ...{alsa-lib_1.1.9.bb => alsa-lib_1.2.1.1.bb} |  8 +++--
> > >  2 files changed, 36 insertions(+), 3 deletions(-)
> > >  create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-Fix-
> > > problem-with-libtool-not-found.patch
> > >  rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.9.bb => alsa-
> > > lib_1.2.1.1.bb} (83%)
> > > 
> > > diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-Fix-problem-
> > > with-libtool-not-found.patch b/meta/recipes-multimedia/alsa/alsa-
> > > lib/0001-Fix-problem-with-libtool-not-found.patch
> > > new file mode 100644
> > > index 0000000000..5fb84cd6f8
> > > --- /dev/null
> > > +++ b/meta/recipes-multimedia/alsa/alsa-lib/0001-Fix-problem-with-
> > > libtool-not-found.patch
> > > @@ -0,0 +1,31 @@
> > > +From f419276a716daf8d98846b3df50995e5ac030134 Mon Sep 17 00:00:00
> > > 2001
> > > +From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > > +Date: Wed, 20 Nov 2019 11:24:17 +0800
> > > +Subject: [PATCH] Fix problem with libtool not found
> > > +
> > > +Upstream-Status: Inappropriate
> > > +Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > > +---
> > > + configure.ac | 6 +++---
> > > + 1 file changed, 3 insertions(+), 3 deletions(-)
> > > +
> > > +diff --git a/configure.ac b/configure.ac
> > > +index 35eb315..548b9ea 100644
> > > +--- a/configure.ac
> > > ++++ b/configure.ac
> > > +@@ -769,9 +769,9 @@ dnl Taken from
> > > https://wiki.debian.org/RpathIssue
> > > + case $host in
> > > +    *-*-linux-gnu)
> > > +    AC_MSG_RESULT([Fixing libtool for -rpath problems.])
> > > +-   sed < libtool > libtool-2 \
> > > ++   sed < "$srcdir"/libtool > "$srcdir"/libtool-2 \
> > > +      's/^hardcode_libdir_flag_spec.*$'/'hardcode_libdir_flag_spec="
> > > -D__LIBTOOL_IS_A_FOOL__ "/'
> > > +-   mv libtool-2 libtool
> > > +-   chmod 755 libtool
> > > ++   mv "$srcdir"/libtool-2 "$srcdir"/libtool
> > > ++   chmod 755 "$srcdir"/libtool
> > > +  ;;
> > > + esac
> > > +--
> > > +2.20.1
> > > +
> > > diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.9.bb
> > > b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.1.bb
> > > similarity index 83%
> > > rename from meta/recipes-multimedia/alsa/alsa-lib_1.1.9.bb
> > > rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.1.1.bb
> > > index 2c63ee7522..56544b0d45 100644
> > > --- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.9.bb
> > > +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.1.bb
> > > @@ -7,9 +7,11 @@ LIC_FILES_CHKSUM = "
> > > file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
> > >                      file://src/socket.c;md5=dd1bc7f44872690224d89c1a
> > > 9806e495;beginline=1;endline=26 \
> > >                      "
> > > 
> > > -SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
> > > -SRC_URI[md5sum] = "e6d429dbdcfaa0f034d907fa6dc3735e"
> > > -SRC_URI[sha256sum] =
> > > "488373aef5396682f3a411a6d064ae0ad196b9c96269d0bb912fbdeec94b994b"
> > > +SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2
> > > \
> > > +           file://0001-Fix-problem-with-libtool-not-found.patch \
> > > +          "
> > > +SRC_URI[md5sum] = "1d428f46d6160f5e4bbdd64a2ff34f45"
> > > +SRC_URI[sha256sum] =
> > > "c95ac63c0aad43a6ac457d960569096b0b2ef72dc4e3737e77e3e2de87022cec"
> > > 
> > >  inherit autotools pkgconfig
> > > 
> > > --
> > > 2.20.1
> > > 
> > > 
> > > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core


