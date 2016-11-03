Return-Path: <krisztian.litkey@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 707AA71AF2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 13:10:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 03 Nov 2016 06:09:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,438,1473145200"; d="scan'208";a="1080054442"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 03 Nov 2016 06:09:59 -0700
Received: from mandark.fi.intel.com (mandark.fi.intel.com [10.237.72.54])
	by linux.intel.com (Postfix) with ESMTP id B5A546A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 06:09:22 -0700 (PDT)
Message-ID: <1478178404.13445.9.camel@linux.intel.com>
From: Krisztian Litkey <krisztian.litkey@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 03 Nov 2016 15:06:44 +0200
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: qemu woes on recent Fedora 24 kernels
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
X-List-Received-Date: Thu, 03 Nov 2016 13:10:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

  Hi,

I thought I share this with others in case I'm not the only one who
have been struggling with this recently. I've been running lately into
really bad (and non-deterministic) clock skew issues, often triggering
oopses, when testing images with qemu on fedora 24. I'm not sure what
has changed in the fedora kernels that triggered this behavior, but
switching the clock source from TSC to HPET (by appending
clocksource=hpet to the kernel command line in the generated qemu
config file) did the trick for me and got rid of the problems.

  Cheers,
    kli


