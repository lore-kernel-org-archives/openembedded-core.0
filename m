Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80930C4167B
	for <webhook@archiver.kernel.org>; Sun, 10 Dec 2023 22:17:50 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.64791.1702246666662636328
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Dec 2023 14:17:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=F2MQtQn+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D8C0A60002;
	Sun, 10 Dec 2023 22:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702246664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z9wB4YppboOXe484Mu/FXcmuI6ovh9h7jw11PXImS7I=;
	b=F2MQtQn+xDIMzFrzy8X37dAB17XbZIRSxGLIb3sOVMFRivvRgEBUGe3x3C+PBNJUFYhYPy
	3a8x3/KPdcAj1D0jOsJEuS1Fjc23ND70vzbReqOyvnzjRXv0yebHJWQ5EzUlfHp+C68GhQ
	Tv97MxQqIwfA3lIg6aXySIGZsiZyOnVI6Y5mGQh6fgvE5fySolWqQf124GxWg9Cz7q2yZK
	/Usd1343mD22xTxf/CWgslJap7ifjdr5BugG4s8JEh+JP3R2+L2bFk1G/YfJOemQjeI6r+
	+cQIC7ST90euh6QRJaiRd0p0cCwf9hHpsuft6hRk/Y3g+da2YDaJTJOldR/r0A==
Date: Sun, 10 Dec 2023 23:17:43 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: =?iso-8859-1?Q?Eil=EDs_'pidge'_N=ED_Fhlannag=E1in?= <pidge@baylibre.com>,
	openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [OE-core] [PATCH 2/4] python3-qemu-qmp: Add recipe
Message-ID: <202312102217433b6b41cb@mail.local>
References: <cover.1701959631.git.pidge@baylibre.com>
 <25d25aac54efcb8afe5a6d17f70800b57a0d0a21.1701959631.git.pidge@baylibre.com>
 <CANx9H-DTVzzHb8p=U-igt8AwdM5Uwf80QTVyr0XSS74JK1bWXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANx9H-DTVzzHb8p=U-igt8AwdM5Uwf80QTVyr0XSS74JK1bWXA@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Dec 2023 22:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192127

On 07/12/2023 09:38:17-0800, Tim Orling wrote:
> This will also need a maintainer entry in:
> https://git.openembedded.org/openembedded-core/tree/meta/conf/distro/include/maintainers.inc
> 

Also:
stdio: WARNING: python3-qemu-qmp-0.0.2-r0 do_recipe_qa: QA Issue: Recipe python3-qemu-qmp in /home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/recipes-devtools/python/python3-qemu-qmp_0.0.2.bb does not contain a HOMEPAGE. Please add an entry. [missing-metadata]
stdio: WARNING: python3-qemu-qmp-0.0.2-r0 do_recipe_qa: QA Issue: Recipe python3-qemu-qmp in /home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/recipes-devtools/python/python3-qemu-qmp_0.0.2.bb does not have an assigned maintainer. Please add an entry into meta/conf/distro/include/maintainers.inc. [missing-maintainer]
stdio: WARNING: python3-qemu-qmp-native-0.0.2-r0 do_recipe_qa: QA Issue: Recipe python3-qemu-qmp-native in /home/pokybuild/yocto-worker/qemuarm64-armhost/build/meta/recipes-devtools/python/python3-qemu-qmp_0.0.2.bb does not contain a HOMEPAGE. Please add an entry. [missing-metadata]
WARNING: python3-qemu-qmp-0.0.2-r0 do_package_qa: QA Issue: Recipe LICENSE includes obsolete licenses GPLv2 LGPLv2+ [obsolete-license]

> On Thu, Dec 7, 2023 at 6:36 AM Eilís 'pidge' Ní Fhlannagáin <
> pidge@baylibre.com> wrote:
> 
> > From: Ross Burton <ross.burton@arm.com>
> >
> > Add a recipe for python QEMU Monitor Protocol. This will be needed for
> > qemu screendumps for qemu screendump testing.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
> > ---
> >  .../python/python3-qemu-qmp_0.0.2.bb               | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >  create mode 100644 meta/recipes-devtools/python/python3-qemu-qmp_0.0.2.bb
> >
> > diff --git a/meta/recipes-devtools/python/python3-qemu-qmp_0.0.2.bb
> > b/meta/recipes-devtools/python/python3-qemu-qmp_0.0.2.bb
> > new file mode 100644
> > index 00000000000..faa0cc69738
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3-qemu-qmp_0.0.2.bb
> > @@ -0,0 +1,14 @@
> > +SUMMARY = "asyncio library for communicating with QEMU Monitor Protocol
> > (QMP) servers"
> > +LICENSE = "LGPLv2+ & GPLv2"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=4cf66a4984120007c9881cc871cf49db \
> > +
> > file://LICENSE_GPL2;md5=441c28d2cf86e15a37fa47e15a72fbac"
> > +
> > +SRC_URI[sha256sum] =
> > "c918e9e3ae09abdf70c7ece67637a93ac4583d940bbf48d24ff77987f74f1b8b"
> > +
> > +inherit pypi python_setuptools_build_meta
> > +
> > +PYPI_PACKAGE = "qemu.qmp"
> > +
> > +DEPENDS += "python3-setuptools-scm-native"
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > --
> > 2.34.1
> >
> >
> > 
> >
> >

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191969): https://lists.openembedded.org/g/openembedded-core/message/191969
> Mute This Topic: https://lists.openembedded.org/mt/103035077/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

