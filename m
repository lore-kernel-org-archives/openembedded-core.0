Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UcHFL-00084h-7F
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 17:34:37 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 May 2013 08:16:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,671,1363158000"; d="scan'208";a="313428465"
Received: from unknown (HELO envy2.home) ([10.255.12.29])
	by orsmga001.jf.intel.com with ESMTP; 14 May 2013 08:16:01 -0700
Message-ID: <51925531.4060502@linux.intel.com>
Date: Tue, 14 May 2013 08:16:01 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <519153C8.6060708@linux.intel.com> <20130513213356.GE3187@jama>
In-Reply-To: <20130513213356.GE3187@jama>
X-Enigmail-Version: 1.5.1
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: init-ifupdown: do_package_ipk failing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 May 2013 15:34:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/13/2013 02:33 PM, Martin Jansa wrote:
> On Mon, May 13, 2013 at 01:57:44PM -0700, Darren Hart wrote:
>> After removing a bbappend for init-ifupdown I am seeing failures
>> in do_package_ipk:
>> 
>> Build Configuration: BB_VERSION        = "1.19.0" BUILD_SYS
>> = "x86_64-linux" NATIVELSBSTRING   = "Ubuntu-11.10" TARGET_SYS
>> = "i586-poky-linux" MACHINE           = "minnow" DISTRO
>> = "poky" DISTRO_VERSION    = "1.3+snapshot-20130513" 
>> TUNE_FEATURES     = "m32 core2" TARGET_FPU        = "" meta-yocto
>> = "master:94d31b0b36be389710bfb1c5d7aeacda92efad5b" meta-minnow
>> = "master:d474c4304dc1c9e9703fce0cd6a4329289681f92" meta-intel
>> = "master:624aada76d2de84bd0263065b112ed4e94798b6b" meta
>> = "master:94d31b0b36be389710bfb1c5d7aeacda92efad5b"
>> 
>> ...
>> 
>> ERROR: Error executing a python function in 
>> /build/yocto/master/minnow_201302231109 
>> 41/poky/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb:
>> 
>> OSError: [Errno 2] No such file or directory: 
>> '/build/yocto/master/minnow_201302231 
>> 10941/build/tmp/work/core2-poky-linux/init-ifupdown/1.0-r2/packages-split/init-ifup
>>
>> 
down-dbg'
>> 
>> ERROR: Error executing a python function in 
>> /build/yocto/master/minnow_201302231109 
>> 41/poky/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb:
>> 
>> OSError: [Errno 2] No such file or directory: 
>> '/build/yocto/master/minnow_201302231 
>> 10941/build/tmp/work/core2-poky-linux/init-ifupdown/1.0-r2/packages-split/init-ifup
>>
>> 
down-dbg'
>> 
>> ERROR: The stack trace of python calls that resulted in this 
>> exception/failure was: ERROR:   File "do_package_ipk", line 194,
>> in <module> ERROR: ERROR:   File "do_package_ipk", line 45, in
>> do_package_ipk ERROR: ERROR: The code that was being executed
>> was: ERROR:      0190:        bb.utils.unlockfile(lf) ERROR:
>> 0191: ERROR:      0192: ERROR:      0193: ERROR:  ***
>> 0194:do_package_ipk(d) ERROR:      0195:
>> 
>> ERROR: [From file: 'do_package_ipk', lineno: 194, function:
>> <module>]
>> 
>> ERROR:      0041:        basedir =
>> os.path.join(os.path.dirname(root))
>> 
>> ERROR:      0042:        arch = localdata.getVar('PACKAGE_ARCH',
>> True)
>> 
>> ERROR:      0043:        pkgoutdir = "%s/%s" % (outdir, arch)
>> 
>> ERROR:      0044:        bb.mkdirhier(pkgoutdir) ERROR:  ***
>> 0045:        os.chdir(root) ERROR:      0046:        from glob
>> import glob ERROR:      0047:        g = glob('*') ERROR:
>> 0048:        try: ERROR:      0049:            del
>> g[g.index('CONTROL')] ERROR: [From file: 'do_package_ipk',
>> lineno: 45, function: do_package_ipk] ERROR: Function failed:
>> do_package_ipk ERROR: Logfile of failure stored in: 
>> /build/yocto/master/minnow_20130223110941/build/tmp/work/core2-poky-linux/init-ifupdown/1.0-r0/temp/log.do_package_write_ipk.16210
>>
>> 
ERROR: Task 1399
>> (/build/yocto/master/minnow_20130223110941/poky/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb,
>>
>> 
do_package_write_ipk) failed with exit code '1'
>> 
>> I have done cleansstate and cleanall, but the error is
>> repeatable.
> 
> You need to manually remove minnow init-ifupdown from
> runtime/pkgdata
> 
>> Is anyone else experiencing this with init-ifupdown and ipk
>> packaging?
> 
> See https://bugzilla.yoctoproject.org/show_bug.cgi?id=4102

Thank you!

- -- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJRklUxAAoJEKbMaAwKp364xJIIAIBMt/gD8uslYnKQ9Ug207bX
39Dnqx2gkzsbB2TxDmH4UG7KEYnUY7ZDvfcefxgClDbd/DPEhMXjJGC8uHjOO4In
vJKQS5HEMs2xQJR3W5AIdFwZUsb+9VcWzljyC0+c09ru/6jLQasFlzQprRto0GLe
EgC91grqR8l6pskPX3HhZ5qJshN9KA+bG0iuMYMVJpsrL++duYX22DpHi+sH4OFB
sHppD0o7e5qUkkhWD6pd4CRSXyqDkYNDElM5zqn8Owhp4F/Ppp6KFOR/u9XsGCXM
EzOjyZI+jGB0hy+mEoiLM0kjF5Diw/3mK0+1C0bXxMOHsq/cfxX+bBwDBnxMs4g=
=tqM7
-----END PGP SIGNATURE-----


