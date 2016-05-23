Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 88E33601A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 10:36:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2016 03:36:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,355,1459839600"; d="scan'208";a="972610332"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 23 May 2016 03:36:28 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 564B56A4006;
	Mon, 23 May 2016 04:23:58 -0700 (PDT)
Date: Mon, 23 May 2016 13:36:23 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Ian Geiser <geiseri@geekcentral.pub>
Message-ID: <20160523103623.GA18324@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <154c86e7fa2.11a4a3b0e305159.2603931524640206304@geekcentral.pub>
MIME-Version: 1.0
In-Reply-To: <154c86e7fa2.11a4a3b0e305159.2603931524640206304@geekcentral.pub>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Wic and "live" images
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
X-List-Received-Date: Mon, 23 May 2016 10:36:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 19, 2016 at 05:52:45AM -0400, Ian Geiser wrote:
> Greetings, I am trying to learn "wic" and have been confused as how to create a "live" style image.  I am following "http://www.yoctoproject.org/docs/1.5.2/dev-manual/dev-manual.html#creating-partitioned-images" but am getting confused on the target to use to create the a file system that has a single squashfs file containing my root file system.  
> 
> My desired partition layout is as follows:
>       40MiB                 40MiB               300MiB
> +--------------------+-----------------+-----------------------------+
> |      BOOT (esp)    |    DATA (fat)   |          ROOT (live)        |  
> +--------------------+-----------------+-----------------------------+
> 
> BOOT - efi boot partition with kernel and initramfs
> DATA - generic fat filesystem to hold configuration files
> ROOT - an ext4 filesystem that contains a single os.img, which is a squashfs file.
> 
> I have ROOT and DATA figured out but I am at a loss as how to generate the os.img file and copy it into ROOT.  If I generate the os.img file with bitbake and then use the "-r" option to manually supply a directory structure it works, but I would rather have it done from a wks file for automation reasons.
> 
> Any hints?
I'd suggest to use wic image type and generate your image by bitbake.
You can find example wic-image-minimal.bb and wic-image-minimal.wks in ../meta-selftest/recipes-test/images/

You can probably do the same by using wic plugins, but I'd not suggest
to go this way. Using wic image type is simpler, more consistent, easier to do and provides higher level of automation.

--
Regards,
Ed

