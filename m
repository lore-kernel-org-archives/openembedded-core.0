Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 698426C1F6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 22:20:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Oct 2019 15:20:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,249,1566889200"; d="scan'208";a="191929011"
Received: from seok-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.249.72.235])
	by fmsmga007.fm.intel.com with ESMTP; 02 Oct 2019 15:20:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, yocto@yoctoproject.org
Date: Thu, 03 Oct 2019 11:20:02 +1300
Message-ID: <4192571.iDR9UPTnyj@localhost.localdomain>
Organization: Intel Corporation
MIME-Version: 1.0
Subject: 3.0 release notes / migration guide
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
X-List-Received-Date: Wed, 02 Oct 2019 22:20:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi folks

So it's that time again - we need to start building up the raw material for 
the release notes and migration guide for the upcoming 3.0 release, and I'd 
like to request some help with some parts of it - read on for details.

For the migration guide we have a wiki page serving as a staging area:

  https://wiki.yoctoproject.org/wiki/FutureMigrationGuide

Things that should go in the migration guide: *anything* in the release that 
would require someone who is upgrading to take some form of action (i.e. 
change their configuration / recipes / etc.) Help with this from people who 
implemented the changes or have already thought about / dealt with their 
impact would be much appreciated.

There is a process where I look through all the commits since the last release 
and pull out the ones that need to be mentioned in some form - other than the 
migration guide items, the following needs to be gathered for the release 
notes:

1) Features - new functionality. We need to capture what the feature is and 
hopefully express the impact to the user succinctly.

2) Recipe upgrades - straightforward

3) CVE fixes - fairly straightforward, I just look for commits that explicitly 
mention "CVE". If I can easily do so I'll also note where a recipe upgrade 
fixes a CVE, but that isn't often readily available information.

4) Known issues - generally this is difficult to get from the commits since we 
either find out about them after the commit that introduced the issue, or we 
don't know that they aren't addressed until right at the end of the release. 
We don't want to note *all* open bugs, but if there's something that the user 
is likely to hit that wasn't an issue in the previous release then we should 
note it.

For the release notes I need help with #4 and #1 in particular, so if you know 
about anything in this release that falls into these categories then let me 
know - just a pointer to the commit and any extra comments that you would want 
to make would be helpful. In the mean time I will start the process of looking 
through the commits and will add things to the migration guide page, but bear 
in mind I don't always have all of the context for every change.

Thanks!
Paul

-- 
Paul Eggleton
Intel Open Source Technology Centre



