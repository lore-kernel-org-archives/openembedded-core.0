Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C0E3173243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 11:13:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 22 Sep 2015 04:13:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,572,1437462000"; d="scan'208";a="566165814"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Sep 2015 04:13:31 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id E14106A4087; Tue, 22 Sep 2015 04:12:36 -0700 (PDT)
Received: from 10.252.48.86 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Tue, 22 Sep 2015 14:12:36 +0300 (EEST)
Message-ID: <58887.10.252.48.86.1442920356.squirrel@linux.intel.com>
In-Reply-To: <CAJTo0LaJFQozfE1gaXvdEBR=ioCB7GR425_TDJaiVE1E9UnuXA@mail.gmail.com>
References: <1442844096-27847-1-git-send-email-Martin.Jansa@gmail.com>
	<560029CB.6050006@linux.intel.com>
	<CAJTo0LaJFQozfE1gaXvdEBR=ioCB7GR425_TDJaiVE1E9UnuXA@mail.gmail.com>
Date: Tue, 22 Sep 2015 14:12:36 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: openembedded-core@lists.openembedded.org
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Subject: Re: [PATCH] webkitgtk: add REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 22 Sep 2015 11:13:33 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> Remove x11 from DISTRO_FEATURES ("I'm building a product that doesn't need
> or use X") and build webkitgtk.  webkitgtk depends on libxt which depends
> on libx11 which then refuses to build because you explicitly said you
> didn't want X.
>
> We're adding required_distro_feature annotations as required so that world
> builds without X11 enabled still work by skipping the recipes instead of
> failing to build.


But this means you need to add this to every recipe that directly or
indirectly depends on libx11. Which is crazy awkward and error-prone.

Why can't the tools figure out which recipes should be excluded from
builds without explicit annotations?


Alex

