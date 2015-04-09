Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C295A65C98
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 19:12:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 Apr 2015 12:12:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,551,1422950400"; d="scan'208";a="677900573"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 09 Apr 2015 12:12:43 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 3A6F86A408D;
	Thu,  9 Apr 2015 12:12:18 -0700 (PDT)
Date: Thu, 9 Apr 2015 22:12:35 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: =?iso-8859-1?Q?Jo=E3o?= Henrique Ferreira de Freitas <joaohf@gmail.com>
Message-ID: <20150409191235.GA19415@linux.intel.com>
References: <1428400661-19372-1-git-send-email-ed.bartosh@linux.intel.com>
	<5525A940.5040600@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5525A940.5040600@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [wic][PATCH] wic: Implement --build-rootfs command line option
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
X-List-Received-Date: Thu, 09 Apr 2015 19:12:50 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Apr 08, 2015 at 07:18:40PM -0300, João Henrique Ferreira de Freitas wrote:
> 
> Hi Ed,
> 
> I liked.
> 
> Two points:
> 
> - How about if user sets INHERIT = "rm_work"? I mean the image
> recipe will be rm, right? I always put my images in RM_WORK_EXCLUDE
> so wic can use it.
>
rm_work removes artifacts required by wic. Wic will complain that rootfs
can't be found. There is a bug about i https://bugzilla.yoctoproject.org/show_bug.cgi?id=7042
I closed it as not a bug as wic uses build artifacts by design.

> - What will be the behavior if: wic create test-image-4Gb -e
> test-image --rootfs rootfs1=test-image --rootfs
> rootfs2=bringup-image -f. A believed that only 'test-image' will be
> build. Right?
>
I don't fully understand command line options in your example, but generally you're right.
wic will take image name from -e option and run "bitbake test-image" in this case.

Regards,
Ed

