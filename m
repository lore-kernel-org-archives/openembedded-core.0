Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14D8C77B7A
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 11:49:49 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.29150.1685620187684440400
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 04:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FpXaHl8v;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685620185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0HcTmQosVkInsQTrXxgCdwSohYUpT3uDeHQDRmCCZb4=;
	b=FpXaHl8vZU5U6gDbWjlZZA6YLMRIwNCd/AUBGxyFaqwtq8xlLp7Dk0CUdbKW2QFNRi9fPa
	c+iyNkpBGKD+YPRWw2pyd5ELQcX4/NBvive2r/oyX6mRk4aQcGeOj+LRm5iO+FI7TuDnhv
	frEtsl9Q3/oF8T5YYPLqDwpFy2FrdIUvfeLhca9GPKsrkTODq5tpWYJsspTqUnknMZa49D
	lCB4KR2e5pGPhldHEfCaUB7/p5bbwGqgfDTA0dpvsKvyp7HRUvtTobsXAipk+NLIb+0AJs
	s03FxHl3zsYDq+ugEI0zQOJ111uo1da6hDDFD7DXKaArpCwe5XUS5buhoPxedw==
X-GND-Sasl: alexandre.belloni@bootlin.com
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9161220002;
	Thu,  1 Jun 2023 11:49:44 +0000 (UTC)
Date: Thu, 1 Jun 2023 13:49:44 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: =?iso-8859-1?B?QvZzevZybelueWkgWm9sdOFu?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] python3-meson-python: New recipe
Message-ID: <2023060111494403e2eb36@mail.local>
References: <20230601080821.2346868-1-zboszor@gmail.com>
 <20230601080821.2346868-2-zboszor@gmail.com>
 <202306011100565b118a99@mail.local>
 <bda183eb-33ce-687c-d5c5-1f0172199a71@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bda183eb-33ce-687c-d5c5-1f0172199a71@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 11:49:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182101

On 01/06/2023 13:39:13+0200, B�sz�rm�nyi Zolt�n wrote:
> 2023. 06. 01. 13:00 keltez�ssel, Alexandre Belloni �rta:
> > Hello,
> > 
> > This fails on the autobuilders:
> > 
> > stdio: WARNING: Nothing PROVIDES 'python3-pyproject-metadata-native'
> 
> It works in mickledore.
> 
> Was BBCLASSEXTEND removed from python3-pyproject-metadata
> in meta-openembedded master? (Looking... No, it wasn't.)
> 
> Can you try building python3-pyproject-metadata-native by itself?

oe-core doesn't depend on meta-openembedded so our builds doesn't have
it. You should either import the missing recipe or submit your recipe to
meta-openembedded.

> 
> >   (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb, virtual:native:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb, /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb DEPENDS on or otherwise requires it). Close matches:
> > stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-pyproject-metadata' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
> > stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-meson-python' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
> > stdio: WARNING: Nothing RPROVIDES 'nativesdk-python3-meson-python-dev' (but virtual:nativesdk:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
> > stdio: WARNING: Nothing RPROVIDES 'python3-pyproject-metadata-native' (but virtual:native:/home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
> > stdio: WARNING: Nothing RPROVIDES 'python3-pyproject-metadata' (but /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
> > stdio: WARNING: Nothing RPROVIDES 'python3-meson-python' (but /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
> > stdio: WARNING: Nothing RPROVIDES 'python3-meson-python-dev' (but /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb RDEPENDS on or otherwise requires it)
> > 
> > On 01/06/2023 10:08:21+0200, Zoltan Boszormenyi wrote:
> > > This python module adds support for a new PEP517 build backend
> > > used by recent versions of scikit-image, scipy and others.
> > > 
> > > The previously added python_mesonpy.bbclass uses it
> > > 
> > > Signed-off-by: Zolt�n B�sz�rm�nyi <zboszor@gmail.com>
> > > ---
> > >   meta/conf/distro/include/maintainers.inc      |  1 +
> > >   .../python/python3-meson-python_0.13.1.bb     | 22 +++++++++++++++++++
> > >   2 files changed, 23 insertions(+)
> > >   create mode 100644 meta/recipes-devtools/python/python3-meson-python_0.13.1.bb
> > > 
> > > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> > > index 8c4c586414..f2448ee3c9 100644
> > > --- a/meta/conf/distro/include/maintainers.inc
> > > +++ b/meta/conf/distro/include/maintainers.inc
> > > @@ -647,6 +647,7 @@ RECIPE_MAINTAINER:pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
> > >   RECIPE_MAINTAINER:pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> > >   RECIPE_MAINTAINER:pn-python3-markdown = "Alexander Kanavin <alex.kanavin@gmail.com>"
> > >   RECIPE_MAINTAINER:pn-python3-markupsafe = "Richard Purdie <richard.purdie@linuxfoundation.org>"
> > > +RECIPE_MAINTAINER:pn-python3-meson-python = "Zolt�n B�sz�rm�nyi <zboszor@gmail.com>"
> > >   RECIPE_MAINTAINER:pn-python3-more-itertools = "Tim Orling <tim.orling@konsulko.com>"
> > >   RECIPE_MAINTAINER:pn-python3-ndg-httpsclient = "Tim Orling <tim.orling@konsulko.com>"
> > >   RECIPE_MAINTAINER:pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> > > diff --git a/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb b/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb
> > > new file mode 100644
> > > index 0000000000..828a1652fa
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/python/python3-meson-python_0.13.1.bb
> > > @@ -0,0 +1,22 @@
> > > +SUMMARY = "Meson Python build backend (PEP 517)"
> > > +LICENSE = "MIT"
> > > +LIC_FILES_CHKSUM = "file://LICENSE;md5=d580b27e67cc0892a5b005b0be114b60"
> > > +
> > > +DEPENDS = " \
> > > +	meson-native ninja-native patchelf-native \
> > > +	python3-pyproject-metadata-native \
> > > +"
> > > +
> > > +PYPI_PACKAGE = "meson_python"
> > > +
> > > +inherit pypi python_mesonpy
> > > +SRC_URI[sha256sum] = "63b3170001425c42fa4cfedadb9051cbd28925ff8eed7c40d36ba0099e3c7618"
> > > +
> > > +DEPENDS:remove:class-native = "python3-meson-python-native"
> > > +
> > > +RDEPENDS:${PN} = " \
> > > +	meson ninja patchelf \
> > > +	python3-pyproject-metadata \
> > > +"
> > > +
> > > +BBCLASSEXTEND = "native nativesdk"
> > > -- 
> > > 2.40.1
> > > 
> > > 
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#182054): https://lists.openembedded.org/g/openembedded-core/message/182054
> > > Mute This Topic: https://lists.openembedded.org/mt/99259620/3617179
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > 
> > 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

