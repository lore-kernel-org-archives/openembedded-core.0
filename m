Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EFB3960438
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 15:19:42 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 12 Aug 2014 08:19:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="371412426"
Received: from glucy-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.202])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Aug 2014 08:16:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, yocto@yoctoproject.org
Date: Tue, 12 Aug 2014 16:19:41 +0100
Message-ID: <8971389.fH3VELLT3O@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.8-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
MIME-Version: 1.0
Subject: Automatic upgrade helper
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
X-List-Received-Date: Tue, 12 Aug 2014 15:19:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi folks,

I'd like to announce the immediate availability of the Automatic Upgrade 
Helper, a tool for automating the task of upgrading recipes when a new 
upstream release occurs. It utilises the build system to check if a new 
version of the software built by a particular recipe is available, and if it 
is, it will attempt to upgrade the recipe to build that new version. The 
outcome of the process is emailed to the maintainer of the recipe along with a 
patch to do the upgrade, so that they can send the patch to be merged (if the 
build succeeded with no warnings) or develop the patch further if problems 
occurred.

The tool is available in the following repository:

  http://git.yoctoproject.org/cgit/cgit.cgi/auto-upgrade-helper/

Currently it builds upon distrodata.bbclass in order to do the upstream 
version checking, but in future we'd like to make better use of BitBake's 
fetcher to do this and also move some of the additional metadata out of inc 
files and into recipes as appropriate. There's probably other things we could 
do to make the tool more flexible in future as well. Feedback / contributions 
welcome.

(Thanks to Laurentiu Palcu & Marius Avram who did all of the work on this 
tool.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

