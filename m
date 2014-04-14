Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2308A65D4A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Apr 2014 14:02:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Apr 2014 07:02:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,857,1389772800"; d="scan'208";a="520468282"
Received: from johnmcca-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.91])
	by orsmga002.jf.intel.com with ESMTP; 14 Apr 2014 07:02:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Valentin Popa <valentin.popa@intel.com>
Date: Mon, 14 Apr 2014 15:02:10 +0100
Message-ID: <1920576.UjDLljL2KG@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.4 (Linux/3.13.9-200.fc20.x86_64; KDE/4.12.4; x86_64; ; )
In-Reply-To: <1397483894-8263-1-git-send-email-valentin.popa@intel.com>
References: <1397483894-8263-1-git-send-email-valentin.popa@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dora][PATCH_V2] mesa: double check for eglplatform.h
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
X-List-Received-Date: Mon, 14 Apr 2014 14:02:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Valentin,

On Monday 14 April 2014 16:58:14 Valentin Popa wrote:
> Even if 'egl' is in PACKAGECONFIG, mesa egl support
> can be disabled explicitly (using a .bbappend, for example).
> This patch adds another check for the existence
> of eglplatform.h before 'sed' can alter it.
> 
> Signed-off-by: Valentin Popa <valentin.popa@intel.com>

If this is dora-only, you need to mention why master isn't affected in the 
commit message. If it affects master the patch needs to go into master first and 
then dora.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

