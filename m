Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B9ABC73B90
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jun 2015 11:40:45 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 08 Jun 2015 04:40:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,573,1427785200"; d="scan'208";a="583994909"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 08 Jun 2015 04:40:30 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 3509C6A4087;
	Mon,  8 Jun 2015 04:39:54 -0700 (PDT)
Date: Mon, 8 Jun 2015 12:46:47 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20150608094647.GA20508@linux.intel.com>
References: <1433484789-304-1-git-send-email-ed.bartosh@linux.intel.com>
	<1433484789-304-4-git-send-email-ed.bartosh@linux.intel.com>
	<5571CF48.6060009@intel.com>
MIME-Version: 1.0
In-Reply-To: <5571CF48.6060009@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [wic][PATCH 3/4] wic: replaced __run_parted with exec_native_cmd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ed.bartosh@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Jun 2015 11:40:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 05, 2015 at 05:33:12PM +0100, Ross Burton wrote:
> On 05/06/2015 07:13, Ed Bartosh wrote:
> > There is no need for yet another wrapper around exec_native_cmd.
> 
> This doesn't appear to apply to master, can you rebase?
> 
> (or does it depend on your other series?)

It depends on this patchset: http://lists.openembedded.org/pipermail/openembedded-core/2015-June/105561.html

--
Regards,
Ed

