Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9283F7F466
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2019 02:04:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Oct 2019 19:04:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,273,1566889200"; d="scan'208";a="205604368"
Received: from salujahi-mobl.gar.corp.intel.com (HELO linux.fritz.box)
	([10.249.74.106])
	by orsmga002.jf.intel.com with ESMTP; 08 Oct 2019 19:04:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Date: Wed, 09 Oct 2019 14:55:28 +1300
Message-ID: <1578720.UMqjsEuc7k@linux.fritz.box>
Organization: Intel Corporation
In-Reply-To: <1570472058-30746-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1570472058-30746-1-git-send-email-chandana.kalluri@xilinx.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [master][PATCH] menuconfig: Add mechanism for user to append to same devtool fragment after user runs finish
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
X-List-Received-Date: Wed, 09 Oct 2019 02:04:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Chandana,

On Tuesday, 8 October 2019 7:14:18 AM NZDT Sai Hari Chandana Kalluri wrote:
> In current devtool flow, if user runs devtool modify, menuconfig and
> finish, it will create a devtool-fragment.cfg and append to SRC_URI of
> the recipe.
> 
> When a user runs the same flow multiple times, the devtool-fragment.cfg
> created in previous iteration gets replaced with the new fragment
> created in the current iteration. As a result, user can lose config
> changes made previously.
> 
> Provide menuconfig with an option -a or --allow-append that lets users
> to continue append to previous iteration of devtool-fragment.cfg.
> 	Ex. devtool menuconfig linux-xlnx -a
> 
> By default, the devtool flow will replace the config fragment unless
> specified with the -a option.

Functionality-wise his change looks reasonable. However I think it might be 
worth taking a step back and seeing if there is a way we can improve the 
workflow here. I think it's possible that you might want to create several 
config fragments for different features (which would of course need their own 
names), would you agree? If so I think you would want to be able to specify 
the fragment name, but even if it wasn't specified it should auto-generate a 
new name each time rather than hard-coding devtool-fragment.cfg. If it's 
smart, it could allow editing fragments in the middle of a stack of multiple 
fragments, but that would be a bonus.

As for the code itself, could you please (a) ensure you use PEP-8 compliant 
spacing and four-space indentation everywhere and (b) don't undo changes that 
were made to the code when it was merged - I could be wrong but it looks to me 
as if you started with an earlier version of the file. If in doubt please 
review the patch before sending and make sure it is only making changes that 
you expect it to.

Thanks
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



