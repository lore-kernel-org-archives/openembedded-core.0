Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C9A5160290
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 14:04:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Dec 2016 06:04:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,378,1477983600"; d="scan'208";a="20728096"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 20 Dec 2016 06:04:26 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 89C976A4006;
	Tue, 20 Dec 2016 06:03:36 -0800 (PST)
Date: Tue, 20 Dec 2016 16:04:12 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Maciej Borzecki <maciej.borzecki@rndity.com>
Message-ID: <20161220140412.GA16406@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20161213185317.GA6550@linux.intel.com>
	<cover.1482145354.git.maciej.borzecki@rndity.com>
MIME-Version: 1.0
In-Reply-To: <cover.1482145354.git.maciej.borzecki@rndity.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Maciej Borzecki <maciek.borzecki@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v6 0/5] wic: bugfixes & --fixed-size support, tests, oeqa: enhancements
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
X-List-Received-Date: Tue, 20 Dec 2016 14:04:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 19, 2016 at 12:20:56PM +0100, Maciej Borzecki wrote:
> v6 of a patch series previously posted here [1].
> 
> Changes since v5:
> 
> * `oe-selftest: enforce en_US.UTF-8 locale` was merged to master, hence it's no
>   longer part of this series
> 
> * rebased on top of master (d0d260b0b85790ceb136dd6b0445e8e33d038f5e)
> 

The patchset looks good to me. Thank you.

Couple of questions:
- did you test if Lars' change
  https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=db08ffee0ad1451f3bf710f4d1b623938ba9aefb
  works with your patchset?

- Regarding oe-selftest fixes, wich machine did you run oe-selftest on?
  It looks to me that a lot of test cases can be run on your machine
  if we use another wks.

> [1]. http://lists.openembedded.org/pipermail/openembedded-core/2016-November/129187.html
> 
> Maciej Borzecki (5):
>   oeqa/utils/commands.py: allow use of binaries from native sysroot
>   wic: add --fixed-size wks option
>   wic: selftest: avoid COMPATIBLE_HOST issues
>   wic: selftest: do not assume bzImage kernel image
>   wic: selftest: add tests for --fixed-size partition flags
> 
>  meta/lib/oeqa/selftest/wic.py          | 117 +++++++++++++++++++++++++++++++--
>  meta/lib/oeqa/utils/commands.py        |   9 ++-
>  scripts/lib/wic/help.py                |  14 +++-
>  scripts/lib/wic/imager/direct.py       |   2 +-
>  scripts/lib/wic/ksparser.py            |  41 ++++++++++--
>  scripts/lib/wic/partition.py           |  88 +++++++++++++++----------
>  scripts/lib/wic/utils/partitionedfs.py |   2 +-
>  7 files changed, 224 insertions(+), 49 deletions(-)

--
Regards,
Ed

