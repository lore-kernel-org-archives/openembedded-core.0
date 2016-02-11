Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CAB8A62136
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 08:47:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 11 Feb 2016 00:47:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,430,1449561600"; d="scan'208";a="900652499"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2016 00:47:57 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 5DA096A4002;
	Thu, 11 Feb 2016 01:35:47 -0800 (PST)
Date: Thu, 11 Feb 2016 08:38:21 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Oliver Graute <oliver.graute@gmail.com>
Message-ID: <20160211063821.GB4868@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20160210161458.GB27824@graute-opti>
MIME-Version: 1.0
In-Reply-To: <20160210161458.GB27824@graute-opti>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: create_image.wic is missing u-boot SPL file
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
X-List-Received-Date: Thu, 11 Feb 2016 08:47:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Oliver,

This looks like a bug in wic code to me. I remember something similar
was fixed recently. Please, create a bug in for me in bugzilla.

On Wed, Feb 10, 2016 at 05:14:58PM +0100, Oliver Graute wrote:
> Hello list,
> 
> I observe a problem with the create_image.wic script after second execution of
> 
> bitbake fsl-image
> 
> NOTE: recipe fsl-image-1.0-r0: task do_rootfs: Started
> 2016-02-10T03:21:41.323Z: ERROR: Error: The image creation script '/home/dnt/build-imx6ulevk/tmp/work/imx6ulevk-poky-linux-gnueabi/fsl-image/1.0-r0/temp/create_image.wic' returned 1:
> 2016-02-10T03:21:41.323Z: Error: exec_cmd: du -Lbks /home/dnt/build-imx6ulevk/tmp/deploy/images/imx6ulevk/SPL returned '1' instead of 0
> 2016-02-10T03:21:41.323Z: Checking basic build environment...
> 2016-02-10T03:21:41.323Z: Done.
> 2016-02-10T03:21:41.324Z:
> 2016-02-10T03:21:41.324Z: Creating image(s)...
> 2016-02-10T03:21:41.324Z:
> 2016-02-10T03:21:41.324Z: WARNING: exit code 1 from a shell command.
> 2016-02-10T03:21:41.324Z:
> 2016-02-10T03:21:41.324Z: ERROR: Function failed: do_rootfs
> 2016-02-10T03:21:41.371Z: ERROR: Logfile of failure stored in: /home/dnt/build-imx6ulevk/tmp/work/imx6ulevk-poky-linux-gnueabi/fsl-image/1.0-r0/temp/log.do_rootfs.27900
> 
> 
> Somewhere the SPL symbolic link and the SPL files itself are deleted from my
> deploy image folder during the wic run.
> 
> If i execute
> 
> bitbake -c cleansstate  u-boot fsl-image
> bitbake u-boot fsl-image
> 
> everything works fine, until I run next time bitbake fsl_image again
> (without u-boot before)
> 
> Some ideas how to fix this?
> 
> Best regards,
> 
> Oliver
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--
Regards,
Ed

