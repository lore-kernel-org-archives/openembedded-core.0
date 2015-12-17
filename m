Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B37BF6FFF2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 14:25:23 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 17 Dec 2015 06:25:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,441,1444719600"; d="scan'208";a="14917800"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 17 Dec 2015 06:25:24 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 007CB6A4087;
	Thu, 17 Dec 2015 07:13:24 -0800 (PST)
Date: Thu, 17 Dec 2015 15:53:59 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <20151217135359.GA13025@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1450283593-26774-1-git-send-email-joshua.lock@collabora.co.uk>
	<20151217122121.GB30559@linux.intel.com>
	<5672B673.5030400@collabora.co.uk>
MIME-Version: 1.0
In-Reply-To: <5672B673.5030400@collabora.co.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic/utils/partitionedfs.py: assemble .wic images as sparse files
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
X-List-Received-Date: Thu, 17 Dec 2015 14:25:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 17, 2015 at 01:19:47PM +0000, Joshua Lock wrote:
> Hi Ed,
> 
> On 17/12/15 12:21, Ed Bartosh wrote:
> >Thank you for the patch! I like the change. It's a first step towards
> >supporting bmaptool, which is in my TODO list.
> 
> No problem, I've been playing with bmaptool myself and that's what
> prompted the change.
> 
> >Would you be willing to write or modify wic test case to test this?
> 
> I'd be willing to do that, is there any documentation on the
> development of test cases?
You can find short info here:
https://wiki.yoctoproject.org/wiki/Oe-selftest

And here https://docs.python.org/2/library/unittest.html as oe-selftest
test cases are based on Python unittest.

> I see meta/lib/oeqa/selftest/wic.py has a bunch of functions with
> @testcase decorators but I'm not familiar with how this should all
> fit together.
You've spotted it right. All wic testcases are in that file.
You can run them this way:  oe-selftest --run-tests wic

As Ross already pointed out you can omit @testcase decorator if you add
new test. QA team will add it later when they need it.

--
Regards,
Ed

