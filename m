Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 903816AC3A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 14:12:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 20 Mar 2015 07:12:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,437,1422950400"; d="scan'208";a="470093743"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Mar 2015 07:12:53 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 00BFF6A408F;
	Fri, 20 Mar 2015 07:12:34 -0700 (PDT)
Date: Fri, 20 Mar 2015 16:12:47 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20150320141247.GA13743@linux.intel.com>
References: <1426850570-12024-1-git-send-email-ed.bartosh@linux.intel.com>
	<1715446.SMLV1DZGVq@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1715446.SMLV1DZGVq@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lib/oe/lsb.py: Stop parsing /etc/SuSE-release
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
X-List-Received-Date: Fri, 20 Mar 2015 14:12:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 20, 2015 at 11:38:25AM +0000, Paul Eggleton wrote:
> Hi Ed,
> 
> On Friday 20 March 2015 13:22:50 Ed Bartosh wrote:
> > /etc/SuSE-release should not be parsed to obtain release info
> > 
> > Here is the quote from /etc/SuSE-release:
> > /etc/SuSE-release is deprecated and will be removed in the future,
> > use /etc/os-release instead
> > 
> > All recent OpenSUSE versions already have /etc/os-release and
> > oe.lsb/release_dict_file function already parses it.
> > 
> > Current implementation of release_dict_file returns different values
> > when parsing /etc/SuSE-release and /etc/os-release. This is one more
> > advantage of getting rid of parsing /etc/SuSE-release.
> 
> How long ago did OpenSuSE start including /etc/os-release? My concern is if 
> someone did happen to run on an older OpenSuSE release and then submit a bug 
> report with an attached log, we'd rather see the actual version rather than 
> "Unknown". If that's a possible scenario, we might want to just swap the 
> blocks around so that /etc/os-release is looked for first.
> 
I've checked opensuse versions starting from 12.3, which was released 2 years ago and became OOL in Jan 2015. If you think it's not enough I can check 12.2 and 12.1 or swap the blocks as you've suggested.

Regards,
Ed

