Return-Path: <tanuk@iki.fi>
X-Greylist: delayed 316 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 01 Feb 2020 08:21:05 UTC
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB33600AC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2020 08:21:05 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 8C1C62213D;
	Sat,  1 Feb 2020 03:15:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Sat, 01 Feb 2020 03:15:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=YdMPp8sf88W7sIC0BQnfEUm6LEA0X4g/88/UdBN8b
	Fs=; b=ogUCW102oUNSwaPMwWfRXdZL7MkHDpaOCJt43rp7fsOR5g3V+Y4/jPKQY
	yBlZNwwJ5g+JOUGyxIvYew03zxYQhBI/kBDZ9JeCykRZEVg0aHpY6btsoYiu+CkA
	nQW6J2/g+9hT0j9Yc9qMtOriJUkfRSngSLLj1Ui9y/j8y3cG86PCPCsyrSVAv2GZ
	qOdWRNAQGDDeBRH/2U/z+VvW4USHUp95hiRnIehFR13lXcku54KynPfsH3nwE90k
	v84GWw1elrucg3CwL+V7hB/QZd6BcxznhPmZpdD/fW1HtseWWiXdknhY1JQjdS+t
	xLbAagl4nu/qZASHHgXx1D7Q4FSGw==
X-ME-Sender: <xms:tjM1XhMAvKMZkpF102DJLIeuiycD0_yt4t9Mp2pHZE56jMJZCiGS5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrgedugdduudeiucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepvfgrnhhu
	ucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuffhomhgrihhnpegrlh
	hsrgdqphhrohhjvggtthdrohhrghdpohhpvghnvghmsggvugguvggurdhorhhgpdhprght
	rhgvohhnrdgtohhmpdhlihgsvghrrghprgihrdgtohhmnecukfhppeduleeirddvgeegrd
	duledurdduudegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
	rhhomhepthgrnhhukhesihhkihdrfhhi
X-ME-Proxy: <xmx:tjM1XufBXNVDa7a5K-5p_EDhCtGGoov8_QU-l6Z_JWtM-hwRtN4Y-g>
	<xmx:tjM1XtO2zYddSVOZjt7vfik7-lamau5SSyINBXkp7xoLcZbh38GcQQ>
	<xmx:tjM1XgYxyUQ9E3zd73V9qTj2JN9kwE4tPkW8JUdKjjISkXwUgGl9Vg>
	<xmx:tjM1Xkadl8XIZuSFbGsc6uLzP-AGRLkwHkVgkCJQ0Am__ehhyNHV_g>
Received: from laptop (unknown [196.244.191.114])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8B170328005E;
	Sat,  1 Feb 2020 03:15:49 -0500 (EST)
Message-ID: <5259176251b3dcbf2c0600bb343b8484c4bdb53c.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Sat, 01 Feb 2020 10:15:45 +0200
In-Reply-To: <CAP71WjyMNKJJ0CFzVaVRx0T4rffN0dWJQ-JfJEk7iKHPFegEpA@mail.gmail.com>
References: <20200106091806.49129-1-tanuk@iki.fi>
	<20200106091806.49129-3-tanuk@iki.fi>
	<CAP71WjyMNKJJ0CFzVaVRx0T4rffN0dWJQ-JfJEk7iKHPFegEpA@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/5] alsa-ucm-conf: new recipe, version 1.2.1.2
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
X-List-Received-Date: Sat, 01 Feb 2020 08:21:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-01-30 at 15:01 +0100, Nicolas Dechesne wrote:
> hey,
> 
> On Mon, Jan 6, 2020 at 10:18 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> > The UCM configuration files were moved from the alsa-lib repository to a
> > new alsa-ucm-conf repository. The move was accompanied by a license
> > change from LGPL2.1 to BSD-3-Clause.
> > 
> > Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
> > ---
> >  meta/conf/distro/include/maintainers.inc      |  1 +
> >  .../alsa/alsa-lib_1.2.1.2.bb                  |  2 +-
> >  .../alsa/alsa-ucm-conf_1.2.1.2.bb             | 23 +++++++++++++++++++
> >  3 files changed, 25 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb
> > 
> > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> > index 39eee9475c..c9fb373f52 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -35,6 +35,7 @@ RECIPE_MAINTAINER_pn-alsa-lib = "Tanu Kaskinen <tanuk@iki.fi>"
> >  RECIPE_MAINTAINER_pn-alsa-plugins = "Tanu Kaskinen <tanuk@iki.fi>"
> >  RECIPE_MAINTAINER_pn-alsa-state = "Tanu Kaskinen <tanuk@iki.fi>"
> >  RECIPE_MAINTAINER_pn-alsa-tools = "Tanu Kaskinen <tanuk@iki.fi>"
> > +RECIPE_MAINTAINER_pn-alsa-ucm-conf = "Tanu Kaskinen <tanuk@iki.fi>"
> >  RECIPE_MAINTAINER_pn-alsa-utils = "Tanu Kaskinen <tanuk@iki.fi>"
> >  RECIPE_MAINTAINER_pn-alsa-utils-scripts = "Tanu Kaskinen <tanuk@iki.fi>"
> >  RECIPE_MAINTAINER_pn-apmd = "Anuj Mittal <anuj.mittal@intel.com>"
> > diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
> > index 9565ad1b20..7bc78b8523 100644
> > --- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
> > +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
> > @@ -33,7 +33,7 @@ FILES_alsa-server = "${bindir}/*"
> >  FILES_alsa-conf = "${datadir}/alsa/"
> >  FILES_libatopology = "${libdir}/libatopology.so.*"
> > 
> > -RDEPENDS_${PN}_class-target = "alsa-conf"
> > +RDEPENDS_${PN}_class-target = "alsa-conf alsa-ucm-conf"
> > 
> >  # upgrade path
> >  RPROVIDES_${PN} = "libasound"
> > diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb
> > new file mode 100644
> > index 0000000000..469d1f7a95
> > --- /dev/null
> > +++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb
> > @@ -0,0 +1,23 @@
> > +SUMMARY = "ALSA Use Case Manager configuration"
> > +HOMEPAGE = "https://alsa-project.org"
> > +BUGTRACKER = "https://alsa-project.org/wiki/Bug_Tracking"
> > +LICENSE = "BSD-3-Clause"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
> > +
> > +# The tarball doesn't have any toplevel directory. The subdir option tells
> > +# Bitbake to unpack the archive to the correct place.
> > +SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2;subdir=${BP}"
> > +SRC_URI[md5sum] = "b7fa43cfd79df978184a6333766d2a50"
> > +SRC_URI[sha256sum] = "ea8a86875f4cf430d49a662a04a6d6c606c5c9d67e54cb944c4d77b24554062f"
> > +
> > +inherit allarch
> 
> it's a bit late into the game.. but I have some questions about this
> patch. now that the alsa-ucm-conf are allarch, how do we expect a BSP
> layer to provide its own UCM config files? if i add a .bbappend file,
> I can't change PACKAGE_ARCH to be 'machine' specific. If i create a
> new recipe for my custom UCM files, then it's not obvious when I
> should install them, since we need them only if alsa-ucm-conf is
> installed in the first place..
> 
> I was thinking about adding an empty alsa-ucm-machine-conf recipe that
> BSP could append,  like gpsd, e.g.:
> http://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
> 
> Is that a good idea?

I was hoping someone else would answer this, since I have no experience
with BSPs or .bbappend files... Since I don't know how this *should* be
done, I'm not against creating alsa-ucm-machine-conf. However, my
intuition would be that the BSP installs its configuration as a
separate recipe whenever the BSP is used. I don't see the need to have
conditions such as "install only if alsa-ucm-conf is installed". Is it
just to save disk space? alsa-ucm-conf anyway installs a bunch of files
that aren't relevant to most machines, so if you're worried about UCM
disk consumption, the alsa-ucm-conf recipe would need work to somehow
install only those files that are needed by the current machine.

Another approach that would make sense to me (even more than creating a
separate recipe) is to submit your UCM config to ALSA upstream. While
waiting for the change to get accepted to upstream and then later
incorporated in the main alsa-ucm-conf recipe, you could use .bbappend
to add the configuration to the alsa-ucm-conf recipe as a patch.

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk


