Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0067073085
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 18:27:04 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 06 Mar 2017 10:27:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,254,1484035200"; d="scan'208";a="941209737"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 06 Mar 2017 10:27:05 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id E28246A4080;
	Mon,  6 Mar 2017 10:27:01 -0800 (PST)
Date: Mon, 6 Mar 2017 20:13:27 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Message-ID: <20170306181327.GA18694@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20170223181309.13899-1-fabio.berton@ossystems.com.br>
	<CAJTo0LaFsWxaGy1Jwo9K92KTry+7Hyzn-MVHvMOpaqx+Q+qCGw@mail.gmail.com>
	<d2ccba14-ac14-1379-d5e1-ac799e9c120b@ossystems.com.br>
	<CAJTo0La=NDhfuMSYG3bjVYe2u6KA4TAZSNN_f1PyrsfVipoxBg@mail.gmail.com>
	<ccfcafd7-cd74-3330-2a64-ccd1e7a27984@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <ccfcafd7-cd74-3330-2a64-ccd1e7a27984@ossystems.com.br>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: Prevent duplicate entries on fstab
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
X-List-Received-Date: Mon, 06 Mar 2017 18:27:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 06, 2017 at 11:00:59AM -0300, Fabio Berton wrote:
> Same error with poky-contrib:ed/wic/wip, we need to add --fstype= to
> part /boot line in all wks files.
> 
Only if we want boot partitions to be added to fstab. Currently / and
/boot partitions are not added. Why do we want to change this?

BTW, your patch will make wic to parse the same fstab file several
times. Can you change this, please?

> 
> On 03/03/2017 10:49 AM, Burton, Ross wrote:
> >
> >On 3 March 2017 at 12:12, Fabio Berton
> ><fabio.berton@ossystems.com.br
> ><mailto:fabio.berton@ossystems.com.br>> wrote:
> >
> >    Sorry for delay. This error for qemux86 is because common.wks.inc
> >    and directdisk-gpt.wks files in scripts/lib/wic/canned-wks
> >    directory doesn't have option --fstype= for part /boot.
> >
> >    For qemuarm machines I get the error:
> >
> >    | DEBUG: Executing python function set_image_size
> >    | DEBUG: Python function set_image_size finished
> >    | DEBUG: Executing shell function do_image_wic
> >    | Error: Please build syslinux first
> >
> >
> >There's patches queued that will change the behaviour here and
> >likely cause your patch to not apply - can you rebase on top of
> >poky-contrib:ed/wic/wip and see what happens?  The build
> >dependency is now wic-tools.
> >
> >Ross
> 

> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
--
Regards,
Ed

