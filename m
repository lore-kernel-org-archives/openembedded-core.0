Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 212E465CBC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 09:40:33 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 20 Aug 2015 02:40:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="545295170"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Aug 2015 02:40:33 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 4CB8B6A4087; Thu, 20 Aug 2015 02:39:45 -0700 (PDT)
Received: from 10.252.47.114
	(SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Thu, 20 Aug 2015 12:39:45 +0300 (EEST)
Message-ID: <51334.10.252.47.114.1440063585.squirrel@linux.intel.com>
In-Reply-To: <1440037356-937-1-git-send-email-raj.khem@gmail.com>
References: <1440037356-937-1-git-send-email-raj.khem@gmail.com>
Date: Thu, 20 Aug 2015 12:39:45 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Khem Raj" <raj.khem@gmail.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] systemd: Upgrade 219 -> 224
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
X-List-Received-Date: Thu, 20 Aug 2015 09:40:37 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> MIT licence was unused and dropped in source itself
>
> commit 8f1e0c5f38cdf7e401ab4d2bb93ad816d08e7715
> Author: Kay Sievers <kay@vrfy.org>
> Date: Tue Apr 21 19:21:56 2015 +0200
>
> delete unused LICENSE.MIT
>
> libudev API documentation has been converted from gtkdoc into man pages.
>
> see
>
> commit 2375607039517c88df51ef16ddbb624ec1c10654
> Author: Kay Sievers <kay@vrfy.org>
> Date: Wed Jun 3 00:09:23 2015 +0200
>
> remove gudev and gtk-doc
>
> The library moved to:
> https://git.gnome.org/browse/libgudev/
>
> package newly added xorg information
>
> commit 1401ec2d34bcde406ced531a72dc46ebaf332594
> Author: Kay Sievers <kay@vrfy.org>
> Date:   Fri Jan 9 21:23:48 2015 +0100
>
>     push xorg information to the systemd --user instance
>
> There are many reasons, for me its overlay support for systemd-nspawn,
> networkd has got many new features that is now usable w.r.t. IP
> forwarding, vxlan etc.
> and it has many bug fixed in those 2000 odd commits since 219
>
> Change-Id: I998e652382950a3c74c4839f3767ef8bef23d88f
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

My apologies, but this is a really poor commit log message. Please write
complete English sentences that make it clear *what* was changed by you
and *why*, with attribution when work has been copied from elsewhere.
Don't just copy-paste snippets from your email response to Ross.

This will help anyone who will make changes to this recipe in the future
and will need to find out why certain things were done in the past.

Regards,
Alex

