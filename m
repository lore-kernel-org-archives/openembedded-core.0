Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 35B6C6EE11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 08:50:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Feb 2014 00:50:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,824,1384329600"; d="scan'208";a="479519781"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by fmsmga002.fm.intel.com with ESMTP; 11 Feb 2014 00:50:40 -0800
Date: Tue, 11 Feb 2014 10:50:38 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: David =?iso-8859-1?Q?Nystr=F6m?= <david.nystrom@enea.com>
Message-ID: <20140211085037.GE10078@lpalcu-linux>
References: <cover.1391427313.git.laurentiu.palcu@intel.com>
	<cover.1392034327.git.laurentiu.palcu@intel.com>
	<52F9E289.2080002@enea.com>
MIME-Version: 1.0
In-Reply-To: <52F9E289.2080002@enea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5 00/53] Rootfs/image generation refactoring (cover letter only)
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
X-List-Received-Date: Tue, 11 Feb 2014 08:50:58 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi David,

On Tue, Feb 11, 2014 at 09:42:49AM +0100, David Nyström wrote:
> File: '/media/sdb5/poky-contrib/meta/lib/oe/image.py', lineno: 158,
> function: _write_script
>      0154:        self.d.setVarFlag('img_creation_func', 'func', 1)
>      0155:        self.d.setVarFlag('img_creation_func', 'fakeroot', 1)
>      0156:
>      0157:        with open(script_name, "w+") as script:
>  *** 0158:            script.write("%s" % bb.build.shell_trap_code())
>      0159:            script.write("export ROOTFS_SIZE=%d\n" %
> self._get_rootfs_size())
>      0160:            bb.data.emit_func('img_creation_func', script,
> self.d)
>      0161:            script.write("img_creation_func\n")
>      0162:
> Exception: AttributeError: 'module' object has no attribute
> 'shell_trap_code'
I guess you're missing this commit:

bitbake: build.py: create separate function for shell trap creation code

which is already in master.

laurentiu


> 
> ERROR: Function failed: do_rootfs
> ERROR: Logfile of failure stored in: /media/sdb5/bld/tmp/work/qemuppc-poky-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.9994
> ERROR: Task 6 (/media/sdb5/poky-contrib/meta/recipes-core/images/core-image-minimal.bb,
> do_rootfs) failed with exit code '1'
> 
> 
> 

