Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A20D7762B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 12:17:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 07 Jun 2016 05:17:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,433,1459839600"; d="scan'208";a="715209465"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Jun 2016 05:17:08 -0700
Received: by linux.intel.com (Postfix, from userid 48)
	id 684B66A4008; Tue,  7 Jun 2016 06:04:35 -0700 (PDT)
Received: from 10.252.15.9 (SquirrelMail authenticated user alexander.kanavin)
	by linux.intel.com with HTTP; Tue, 7 Jun 2016 16:04:35 +0300 (EEST)
Message-ID: <51509.10.252.15.9.1465304675.squirrel@linux.intel.com>
In-Reply-To: <8a877e57a8b8613493c463a1ba6296490d3d04f0.1465288175.git.jussi.kukkone
	n@intel.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
	<8a877e57a8b8613493c463a1ba6296490d3d04f0.1465288175.git.jussi.kukkonen@intel.com>
Date: Tue, 7 Jun 2016 16:04:35 +0300 (EEST)
From: alexander.kanavin@linux.intel.com
To: "Jussi Kukkonen" <jussi.kukkonen@intel.com>
User-Agent: SquirrelMail/1.4.8-5.el4.centos.8
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 33/37] matchbox-desktop-sato: Upgrade to remove Utilities folder
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
X-List-Received-Date: Tue, 07 Jun 2016 12:17:07 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

> This version merges Utilities into Applications to make the common
> case a little more useful: Now e.g. Terminal icon should be visible
> on startup.
> -SRCREV = "810b0b08eb79e4685202da2ec347b990bb467e07"
> +SRCREV = "4a02b6408565f083802592f152e05dee9b40e05b"
>  PV = "0.1+git${SRCPV}"
> -PR = "r1"
>
>  SRC_URI = "git://git.yoctoproject.org/${BPN}"

I think it's better to just move the files into oe-core and merge their
installation into matchbox-desktop recipe. It's not likely someone will
want to use a different configuration, and so maintaining a separate
autoconf-based upstream is just overhead.

Alex

