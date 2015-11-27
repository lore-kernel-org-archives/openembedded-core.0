Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 86E9E6012A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 13:18:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Nov 2015 05:18:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,351,1444719600"; d="scan'208";a="848262565"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 27 Nov 2015 05:18:34 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 9AF576A4083;
	Fri, 27 Nov 2015 05:17:26 -0800 (PST)
Date: Fri, 27 Nov 2015 14:47:18 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <20151127124718.GA25988@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1447834352.git.mariano.lopez@linux.intel.com>
	<2d04d7f11597f6e8331b293e033aef0d36ce5f02.1447834352.git.mariano.lopez@linux.intel.com>
	<20151123173747.GA17608@linux.intel.com>
	<56538F7B.20608@linux.intel.com>
	<20151124154323.GA3530@linux.intel.com>
	<56571BAF.5040507@linux.intel.com>
	<56575C46.7030106@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <56575C46.7030106@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] wic: Allow to use a custom config for bootloaders
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
X-List-Received-Date: Fri, 27 Nov 2015 13:18:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 26, 2015 at 01:23:50PM -0600, Mariano Lopez wrote:
> 
> 
> On 11/26/2015 08:48 AM, Mariano Lopez wrote:
> >
> >
> >On 11/24/2015 09:43 AM, Ed Bartosh wrote:
> >>On Mon, Nov 23, 2015 at 04:13:15PM -0600, Mariano Lopez wrote:
> >>>
> >>>On 11/23/2015 11:37 AM, Ed Bartosh wrote:
> >>>>Hi Mariano,
> >>>>
> >>>>Thank you for the patchset!
> >>>>
> >>>>Would it be better to put content of configuration file into .wks
> >>>>instead of just referring to it?
> >>>If the configuration is simple I agree with you; however if the
> >>>configuration have scripts I think it's better to have separated
> >>>file. The file can growth and would be a real mess inside a wks
> >>>file.
> >>>
> >>What bothers me here is that reference to the external entity
> >>(config file in this case) which
> >>may or may not exist. This makes wic more fragile than it is now.
> >>
> >>Can we put bootloader configs to some predefined place, e.g. to the same
> >>directory where .wks is?
> >
> >I see your point now. I'll change the code to have the
> >configuration in the wks file.
> 
> I was checking in the kickstart code and the parser is a state
> machine that reads line by line, so a multi line bootloader config
> file is not currently and option. I was about to modify the code
> when I saw the comment for this class:
> 
> "Methods that don't need to do anything may just pass.  However,
> _stateMachine should never be overridden."
> 
> So, in order to have the config file inside the wks file we would
> need to hack in kickstart code; I would like to avoid that. What do
> you think?
> 

I agree with you. Let's not touch kickstart code.

Let's put bootloader config at the same location where .wks is then.
It's also not the best solution though as it can be inconvenient for the
user, but it's better than pointing to the file which might not exist.

--
Regards,
Ed

