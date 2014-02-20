Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 601986EC88
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 16:59:36 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id x13so3546475qcv.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 08:59:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=frBP1IgGwTakY+L/BNfeceKpNWJoQX6dAEA5A/0FZnE=;
	b=OkUT3/h+UTHwrOAC5vcFWzadKLcKCbDgYs6zWNw+ZS7mo+4xnEXu3uPcBw4C0EOuTW
	sUwlvwA7fhBIztPWxRBlUkPr/+1Qq4V3V6HdgYhBBTqx6AphYF4yN+x9KxGONofy5kyG
	WO1/WY9R9qQTVOGOmNnHCCB/fN0CqRR91bO/8MfK5bnQ9ToAIgwMBayc/l8i+jmDP36R
	XZPiKBgOAk6SvFIjLfx7+dbhGAlTdm075vQ2O/HHsQFYxlsimevwGCQk1nKUa1mZWPhn
	fgv0YeNhwk2Rfa7DTL/0KHXzW8yZmFmurAqr0nQhIgEUGwl3zNb30aFrKNreXsufaKNY
	zPLg==
X-Gm-Message-State: ALoCoQl82TmnoAuGlYI1S77rqI0sLxHBnCM6YCk8slxPrH+wAHXd1Q8v4evLB/wcNam9bFmt9KdT
X-Received: by 10.224.98.139 with SMTP id q11mr3096237qan.64.1392915577325;
	Thu, 20 Feb 2014 08:59:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Thu, 20 Feb 2014 08:59:17 -0800 (PST)
In-Reply-To: <CANyK_8d2i15W5s9-uAGWcG9kBcb1WMZDJovC-HAhzVwKuqUk4Q@mail.gmail.com>
References: <CAOMwXhP68XUd-6ZSa3+t_OBMgr=mim0_9-yz0q1sNf1i90hgvA@mail.gmail.com>
	<CANyK_8d2i15W5s9-uAGWcG9kBcb1WMZDJovC-HAhzVwKuqUk4Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Feb 2014 16:59:17 +0000
Message-ID: <CAJTo0LaeE+oqgU=U+eHvJ-X+ceNQnonV_Xcx0Y2ASes2JHe-wA@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Removal of poky-feed-config-opkg_1.0.bb
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
X-List-Received-Date: Thu, 20 Feb 2014 16:59:39 -0000
Content-Type: text/plain; charset=UTF-8

On 20 February 2014 16:41, Paul Barker <paul@paulbarker.me.uk> wrote:
> It does duplicate the creation of "${sysconfdir}/opkg/arch.conf" and
> so that bit should go. I think it should probably be replaced by a
> template recipe in meta-skeleton which shows a developer how to create
> their own feed config in a recipe.

Note that rootfs_ipk also has a way of constructing a feed config, and
there's a recipe in meta-oe that constructs a feed config.

All but one of these need to go. As far as I'm aware they all only
work for opkg too, so they should all go and be replaced with one
cross-packaging recipe.

Ross

