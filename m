Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2F8B77695F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 14:13:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 11 Aug 2015 07:13:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,653,1432623600"; d="scan'208";a="746414140"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 11 Aug 2015 07:13:08 -0700
Received: from linux.intel.com (unknown [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 402326A4083;
	Tue, 11 Aug 2015 07:12:21 -0700 (PDT)
Date: Tue, 11 Aug 2015 17:13:03 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Mihaly Varga <mihaly.varga@ni.com>
Message-ID: <20150811141303.GA32439@linux.intel.com>
References: <1438880692-35724-1-git-send-email-mihaly.varga@ni.com>
MIME-Version: 1.0
In-Reply-To: <1438880692-35724-1-git-send-email-mihaly.varga@ni.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: wic: Add plugin for hybrid iso image
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
X-List-Received-Date: Tue, 11 Aug 2015 14:13:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mihaly,

Great work! Thank you!

Acked-by: Ed Bartosh <ed.bartosh@linux.intel.com>

On Thu, Aug 06, 2015 at 08:04:49PM +0300, Mihaly Varga wrote:
> 
> Hi Ed,
> 
> Thank you for your comments. There is a slightly modified version of
> the isoimage-isohybrid plugin, the kickstart file and the wic selftest 
> extended with the iso image creation test case.
>   
> On 7/28/2015 1:57 PM, Ed Bartosh wrote:
> > Hi Mihaly,
> >
> > The code looks ok to me.
> >
> > Can you please fix the following:
> >
> > 1. Pylint is reporting a lot of long lines, indentation and other
> > issues, so it would be nice if you run it and fix at least some of them?
> >
> > 2. Docstring of plugin class is shown in 'wic help plugins' output. Some
> > lines of your plugins look very long there. Please, reformat them.
> >
> > 3. kickstart.get_timeout has a parameter to specify default timeout
> > value. You can use that instead of assigning default value in the code.
> >
> > 4. Using names prefixed by two underscores is only needed if you're
> > really concerned about the name and want it to be mangled by python. One
> > underscore is more than enough in most cases.
> >
> > 5. Please add test case(s) for your plugin to
> > meta/lib/oeqa/selftest/wic.py. This can help keeping your plugin
> > in working state as yocto autobuilder regularly runs all tests.
> >
> > 6. What's crdtools and how to bake them?
> This is a typo in the commit message, is about cdrtools program set,
> which contains the mkisofs program. I corrected the commit message.
> 
> Best regards
>   Mihaly 
> 
> 
> 

-- 
--
Regards,
Ed

