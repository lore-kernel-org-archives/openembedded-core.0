Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id D964A6BCAC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 19:25:42 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ro12so870753pbb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 12:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=Etm7fe45T+UMSplC5/c5Z1Bwl8NYtGk/j3QTEcVUrB4=;
	b=1AZedlxqlCf0J7XaFZ8chUXkw/eHumycDm+ELg4xZxRc4gPDwyl+ic6KJfNsfUilmP
	uTVIvIlXQWT7YEdfB773H6Kl5oNCkTBmb0mapyz1VMlHYWoPfoePyPo4DBn6p/XjGw8x
	zaxjQfUjLHDLRM3F5unHW0UTWauF+59Mr8QKF6fNVoMdFRyZW+jCMuLAXEoiybVBU5py
	IZ9r6qBiLgvLTLTGGP4lhEbYZIX/r6LT3mgre2xKH2gxSt/090XsHEbcEN9Kp/b9OUow
	XyCMS45ef4/wVpXDfgWmgIc+jFaZEvCO1LYJi9u0aWF8OehDL3MM5w8z4+F7gWCkD9iH
	OKwg==
X-Received: by 10.66.218.226 with SMTP id pj2mr6226767pac.62.1377804343920;
	Thu, 29 Aug 2013 12:25:43 -0700 (PDT)
Received: from [192.168.1.106] ([94.205.106.26])
	by mx.google.com with ESMTPSA id
	bb1sm39615916pbc.10.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 12:25:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <CADkTA4M2hEpX25DVY-pGNM1-JrL-8t5M4Mjf72gUPg78DowxkQ@mail.gmail.com>
Date: Thu, 29 Aug 2013 23:25:36 +0400
Message-Id: <C4CD5C92-8FC2-4A02-B978-3520BD7348CD@gmail.com>
References: <20130829115339.a5c5c4a29245e5c988b774ab8f895ac5.53f04ab59e.wbe@email15.secureserver.net>
	<A259F4C4-2C7F-4835-961E-3F2EEF8F0FD6@gmail.com>
	<CADkTA4M2hEpX25DVY-pGNM1-JrL-8t5M4Mjf72gUPg78DowxkQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
X-Mailer: Apple Mail (2.1498)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Thu, 29 Aug 2013 19:25:44 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Aug 29, 2013, at 11:16 PM, Bruce Ashfield <bruce.ashfield@gmail.com> =
wrote:

> linux-yocto-3.10 is pretty much the standard kernel, unless you want =
to use
> the extra features I've merged, it is vanilla.
>=20
> You are going overboard with the definitions. What the build really =
needs, it'll
> generate on it's own. If you want to make an official/controlled BSP
> ... only then
> do you actually need .scc files, etc.
>=20
> If you add compatbility with the linux-yocto recipe, put a defconfig =
in the
> SRC_URI and you are done.

Just adding the defconfig in the SRC_URI is not enough. The qemuarm
launches with the versatilepb machine emulation, not vexpress.

For me to get vexpress support, I've had to create a local copy of the=20=

linux-yocto repo, update the meta-branch and then do the adaptations.

So, it's not just a simple one line fix as simple as adding a defconfig
for linux-yocto. the runqemu scripts have to be modified, etc.

I've shared all that I've done, with you, but you've apparently done =
this
before, and I've just spend days to find out just that!!=20

Thanks for the run around!!=20

Elvis Dowson=

