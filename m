Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E593E605F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:05:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Mar 2014 02:05:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,749,1389772800"; d="scan'208";a="501557218"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 28 Mar 2014 02:05:42 -0700
Date: Fri, 28 Mar 2014 11:05:41 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20140328090541.GB18728@lpalcu-linux>
References: <cover.1395933640.git.laurentiu.palcu@intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1395933640.git.laurentiu.palcu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 0/1] package_manager.py: delete RPM db locks after calling rpmresolve
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
X-List-Received-Date: Fri, 28 Mar 2014 09:05:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Put this on hold. I'll do some more investigations. I want to see what's
the deal with those rpm lock DBs and why we don't delete them only once,
after the rootfs generation has completely finished (after postprocess
commands are called, etc).

laurentiu

On Thu, Mar 27, 2014 at 06:18:52PM +0200, Laurentiu Palcu wrote:
> The following changes since commit c4eeaa8e35e926b6d1f633549f76d1ba9ed9278b:
> 
>   bitbake: knotty: Show a link to the logfile for failed setscene tasks (2014-03-27 10:42:08 +0000)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib lpalcu/b6049_do_rootfs_crash
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b6049_do_rootfs_crash
> 
> Laurentiu Palcu (1):
>   package_manager.py: delete RPM db locks after calling rpmresolve
> 
>  meta/lib/oe/package_manager.py |   12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> -- 
> 1.7.9.5
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

