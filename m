Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1160577225
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 11:57:47 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP; 19 Dec 2016 03:57:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,373,1477983600"; d="scan'208";a="44665507"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 19 Dec 2016 03:57:47 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id CAF126A4080;
	Mon, 19 Dec 2016 03:56:57 -0800 (PST)
Date: Mon, 19 Dec 2016 13:57:12 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <20161219115712.GA11680@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20161216144423.GB6398@linux.intel.com>
	<1482138565-4120-1-git-send-email-kristian.amlie@mender.io>
MIME-Version: 1.0
In-Reply-To: <1482138565-4120-1-git-send-email-kristian.amlie@mender.io>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 3/3] selftest/wic: Add tests for --exclude-dir option.
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
X-List-Received-Date: Mon, 19 Dec 2016 11:57:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 19, 2016 at 10:09:22AM +0100, Kristian Amlie wrote:
> 
> >> +    def test_exclude_path(self):
> >> +        """Test --exclude-path wks option."""
> >> +
> >> +        # For using 'e2ls'.
> >> +        old_path = os.environ['PATH']
> >> +        os.environ['PATH'] = get_bb_var('PATH', 'core-image-minimal')
> >> +
> >> +        wks_file = 'temp.wks'
> >> +        ks = open(wks_file, 'w')
> > 
> > I'd use more pythonic 'with open(wks_file, 'w') as wks:' here.
> 
> Done for all three blocks!
> 
Thank you!

The patchset looks good to me.

--
Regards,
Ed

