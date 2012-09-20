Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TEkbP-000606-Bd
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 19:31:51 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Sep 2012 10:18:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,455,1344236400"; d="scan'208";a="208844056"
Received: from unknown (HELO [10.255.13.229]) ([10.255.13.229])
	by orsmga002.jf.intel.com with ESMTP; 20 Sep 2012 10:18:45 -0700
Message-ID: <505B4FF5.80406@linux.intel.com>
Date: Thu, 20 Sep 2012 10:18:45 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Tarek El-Sherbiny <tarek.elsherbiny@gmail.com>
References: <CAB3sqtajQUBTmQz47OxXp+faU94WfDaJ783wFUzx7+83XzX9nA@mail.gmail.com>
In-Reply-To: <CAB3sqtajQUBTmQz47OxXp+faU94WfDaJ783wFUzx7+83XzX9nA@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Lighttpd recipe is failling
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
X-List-Received-Date: Thu, 20 Sep 2012 17:31:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/20/2012 10:07 AM, Tarek El-Sherbiny wrote:
> I would like to include lighttpd to my image but I can't build it.
>
> This is the error message I'm getting.
>
> NOTE: package lighttpd-1.4.30-r12: task do_package: Started
> ERROR: Error executing a python function in
> /home/telsherbiny/work/fsl/sources/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
> <http://lighttpd_1.4.30.bb>:
> AttributeError: 'NoneType' object has no attribute 'split'
>
Based on this, some variable is returning a NoneType and split is 
chocking, I don't really have enough information to go on for where this 
is happening.

I know that lighttpd does build in Poky, so it may be some local 
configuration issue?

Sau!

> ERROR: The stack trace of python calls that resulted in this
> exception/failure was:
> ERROR:   File "populate_packages", line 321, in <module>
> ERROR:
> ERROR:   File "populate_packages", line 115, in populate_packages
> ERROR:
> ERROR:   File "populate_packages", line 72, in systemd_check_services
> ERROR:
> ERROR: The code that was being executed was:
> ERROR:      0317:bb.note("%s contains dangling symlink to %s" % (pkg, l))
> ERROR:      0318:d.setVar('RDEPENDS_' + pkg,
> bb.utils.join_deps(rdepends, commasep=False))
> ERROR:      0319:
> ERROR:      0320:
> ERROR:  *** 0321:populate_packages(d)
> ERROR:      0322:
> ERROR: (file: 'populate_packages', lineno: 321, function: <module>)
> ERROR:      0111:for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
> ERROR:      0112:if d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1)
> and d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1).strip():
> ERROR:      0113:systemd_generate_package_scripts(pkg_systemd)
> ERROR:      0114:systemd_add_rdepends(pkg_systemd)
> ERROR:  *** 0115:systemd_check_services()
> ERROR:      0116:def update_rcd_package(pkg):
> ERROR:      0117:bb.debug(1, 'adding update-rc.d calls to
> postinst/postrm for %s' % pkg)
> ERROR:      0118:localdata = bb.data.createCopy(d)
> ERROR:      0119:overrides = localdata.getVar("OVERRIDES", True)
> ERROR: (file: 'populate_packages', lineno: 115, function: populate_packages)
> ERROR: Function failed: populate_packages
> ERROR: Logfile of failure stored in:
> /home/telsherbiny/work/fsl/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/lighttpd-1.4.30-r12/temp/log.do_package.5062
> NOTE: package lighttpd-1.4.30-r12: task do_package: Failed
> ERROR: Task 282
> (/home/telsherbiny/work/fsl/sources/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
> <http://lighttpd_1.4.30.bb>, do_package) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 3469 tasks of which 3467 didn't need to
> be rerun and 1 failed.
>
> Can someone help please
>
> Thanks
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


