Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoLqW-0004iC-Sz
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 23:50:21 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Jul 2012 14:39:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120493628"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Jul 2012 14:39:09 -0700
Message-ID: <4FFB4F7D.1040009@linux.intel.com>
Date: Mon, 09 Jul 2012 14:39:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: build stats error with eglibc 2.16!
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2012 21:50:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


I have started to build the eglibc 2.16 locally and I am seeing a 
strange buildstats failure:

> ERROR: Execution of event handler 'run_buildstats' failed
> Traceback (most recent call last):
>   File "run_buildstats(e)", line 89, in run_buildstats(e=<bb.build.TaskSucceeded object at 0x77ce2d0>)
>   File "buildstats.bbclass", line 5, in write_task_data(status='passed', logfile='/intel/poky/builds/world/tmp/buildstats/gnupg-qemux86/201207091436/eglibc-2.16-r0+svnr19383/do_package_write_ipk', dev='sdb1', e=<bb.build.TaskSucceeded object at 0x77ce2d0>)
> IOError: [Errno 2] No such file or directory: '/intel/poky/builds/world/tmp/buildstats/gnupg-qemux86/201207091436/eglibc-2.16-r0+svnr19383/do_package_write_ipk'
>
> NOTE: package eglibc-2.16-r0+svnr19383: task do_package_write_ipk: Succeeded
> NOTE: Running noexec task 1067 of 1073 (ID: 198, /intel/poky/distro/meta/recipes-core/eglibc/eglibc_2.15.bb, do_package_write)

Ideas?

Sau!

-- 
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System




