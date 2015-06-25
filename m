Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 028A66AC15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 11:24:44 +0000 (UTC)
Received: by oiax193 with SMTP id x193so50073209oia.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 04:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ilLfHuMZU34aJgyWM2o9VVAXb97zGhp2Orx/omF/Fdg=;
	b=hgsN8eNP/53yDhcAwVvJOMv7DPBCkmQrY968K+K9WooAqrAwSnyWW6hOCLtZVHad5J
	wu1Ovl5GJ6B1iiz+uhT4Z7DNFnywQHyv6NikB9PtqRmITAuePNbtRWBd2DSuwUaceRQP
	pfjzw/YGVBafwxFyDt3R7qQ71MGFunoRjNzFkmtCdhTuvZYG440xj0iigXZ6pBEacLHh
	KaIp6mawol1KFZp6+Wi6Wc53OCA1R2/koIibGx62fEDoR8QWRHmC42dawn9sObwt3IY2
	a0kUA4b2m4gSMC7dzGDs4L+ulBVZbMRnOiwZd2dTzTAJV75Nzy9Rcg51TWj5zR5sxhNn
	amyA==
X-Gm-Message-State: ALoCoQnp03TnlJfGijVv1UvWDUe50a76C+TGzNY/yGFzFqi/AvbQphPVtuPyIIgb3/iKZizeuQcC
X-Received: by 10.202.76.150 with SMTP id z144mr2141297oia.54.1435231485908;
	Thu, 25 Jun 2015 04:24:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.225.2 with HTTP; Thu, 25 Jun 2015 04:24:16 -0700 (PDT)
In-Reply-To: <cover.1435228589.git.jussi.kukkonen@intel.com>
References: <cover.1435228589.git.jussi.kukkonen@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 25 Jun 2015 14:24:16 +0300
Message-ID: <CAHiDW_H1Nmg-5NmuRHkqr4CE+cyEOCwQfPrtyUot8T5oy8OOTw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Point upgrades (X, mesa, freetype)
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
X-List-Received-Date: Thu, 25 Jun 2015 11:24:45 -0000
Content-Type: text/plain; charset=UTF-8

On 25 June 2015 at 14:19, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
> The following changes since commit 18e902b2dc17746af453869bcc1fba4dbae7c94f:
>
>   wpa-supplicant: Revert "Make SystemD D-Bus config conditional" (2015-06-24 14:04:14 +0100)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib jku/upgrades
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/upgrades
>
> Jussi Kukkonen (4):
>   freetype: Upgrade 2.5.5 -> 2.6

To avoid misleading anyone: the freetype upgrade is more like a major
than a point release, unlike the email subject suggests.

Cheers,
  Jussi

>   mesa: Upgrade 10.5.6 -> 10.5.8
>   xorg-xserver: Upgrade 1.17.1 -> 1.17.2
>   xf86-video-vesa: Upgrade 2.3.3 -> 2.3.4
>
>  .../{freetype_2.5.5.bb => freetype_2.6.bb}         |  4 +-
>  .../mesa/{mesa-gl_10.5.6.bb => mesa-gl_10.5.8.bb}  |  0
>  .../mesa/{mesa_10.5.6.bb => mesa_10.5.8.bb}        |  4 +-
>  ...ideo-vesa_2.3.3.bb => xf86-video-vesa_2.3.4.bb} |  4 +-
>  ...Fix-error-check-for-pci_device_map_legacy.patch | 50 ----------------------
>  ...sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch | 48 ---------------------
>  .../fix_open_max_preprocessor_error.patch          | 15 -------
>  .../xserver-xorg/xorg-CVE-2013-6424.patch          | 31 --------------
>  .../xorg-xserver/xserver-xorg/xtrans.patch         | 38 ----------------
>  ...erver-xorg_1.17.1.bb => xserver-xorg_1.17.2.bb} | 13 ++----
>  10 files changed, 9 insertions(+), 198 deletions(-)
>  rename meta/recipes-graphics/freetype/{freetype_2.5.5.bb => freetype_2.6.bb} (92%)
>  rename meta/recipes-graphics/mesa/{mesa-gl_10.5.6.bb => mesa-gl_10.5.8.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_10.5.6.bb => mesa_10.5.8.bb} (77%)
>  rename meta/recipes-graphics/xorg-driver/{xf86-video-vesa_2.3.3.bb => xf86-video-vesa_2.3.4.bb} (80%)
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-int10-Fix-error-check-for-pci_device_map_legacy.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/fix_open_max_preprocessor_error.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/xorg-CVE-2013-6424.patch
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/xtrans.patch
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.17.1.bb => xserver-xorg_1.17.2.bb} (62%)
>
> --
> 2.1.4
>

