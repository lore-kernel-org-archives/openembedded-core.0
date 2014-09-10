Return-Path: <dvhart@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CC33D605BD
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 10 Sep 2014 00:42:17 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Sep 2014 17:42:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,494,1406617200"; d="scan'208";a="597163297"
Received: from ajross-mobl1.amr.corp.intel.com (HELO [10.254.38.234])
	([10.254.38.234])
	by fmsmga002.fm.intel.com with ESMTP; 09 Sep 2014 17:42:17 -0700
User-Agent: Microsoft-MacOutlook/14.4.3.140616
Date: Tue, 09 Sep 2014 17:42:16 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Message-ID: <D034EC78.A7DD4%dvhart@linux.intel.com>
Thread-Topic: Packaging kernel sources
Mime-version: 1.0
Cc: "Brandt, Todd E" <todd.e.brandt@intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: Packaging kernel sources
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
X-List-Received-Date: Wed, 10 Sep 2014 00:42:20 -0000
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

Hi all,

I'm working on a project which needs to have the full kernel sources
installed on the target. The kernel-dev package as defined by
kernel.bbclass is heavily pruned to minimize packaging time and size and
is intended to enable building of external modules on the target.

Is there an accepted best-practice for how to get the full source packaged
and installed? I can easily write a new recipe,
linux-custom-source_git.bb, to install the sources, for example, without
impacting the packaging time of "virtual/kernel" package.

It would be nice in some respects for it to all come from the same recipe
though, but I suspect the impact to the common-case where this is not need
would be far too great.

Koen, I believe you had a solution for this with Angstrom?

-- 
Darren Hart
Intel Open Source Technology Center





