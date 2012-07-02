Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SlVCb-0001er-EB
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 03:13:21 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 01 Jul 2012 18:02:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172319788"
Received: from fmsmsx104.amr.corp.intel.com ([10.19.9.35])
	by fmsmga001.fm.intel.com with ESMTP; 01 Jul 2012 18:02:15 -0700
Received: from fmsmsx151.amr.corp.intel.com (10.19.17.220) by
	FMSMSX104.amr.corp.intel.com (10.19.9.35) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Sun, 1 Jul 2012 18:02:15 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	FMSMSX151.amr.corp.intel.com (10.19.17.220) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Sun, 1 Jul 2012 18:02:00 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.33]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.220]) with mapi id
	14.01.0355.002; Mon, 2 Jul 2012 09:01:59 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [CONSOLIDATED PULL 00/20] Kernel Updates and other
	fixes
Thread-Index: AQHNVHulmHBFIx62dkSPP1txNiBvJ5cVMmGw
Date: Mon, 2 Jul 2012 01:01:59 +0000
Message-ID: <857BE142E5399E46B20FD45B9DB8A7BC0FE50D39@SHSMSX102.ccr.corp.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340811559.git.sgw@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 00/20] Kernel Updates and other fixes
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
X-List-Received-Date: Mon, 02 Jul 2012 01:13:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

> Lianhao Lu (3):
>   classes/image: Allow openssh empty passwords login.
>   image/core-image: Handle conflicting IMAGE_FEATURES.
>   task-core-tools-debug: Added openssh-sftp-server.

I saw only the first patch "openssh empty password" was merged. What's the =
status of the other 2 patches?

Best Regards,
-Lianhao

Saul Wold wrote on 2012-06-27:
> Richard,
>=20
> Another set of pulls with various fixes and updates.
>=20
> Of note:
> * Ross's gconf also needs to get into the denzil branch for 1.2.1
>   build it and it resolved the gthumb build issue.
> * Robert's change for disabling CCACHE
> * Zhenhua's linux-dtb work
>=20
> The following changes since commit f4b5afe46ff018570c1949653eb6995428827f=
6f:
>=20
>   sanity.bbclass: Increase LAYER_CONF_VERSION to match bblayers change (2=
012-06-25 17:20:06 +0100)
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Dsgw/stage
> Andrea Adami (1):
>   mtd-utils: do not stage headers in sysroot
> Bruce Ashfield (6):
>   kern-tools: add buildall and robustness fixes
>   linux-yocto/3.4: update and categorize configuration options
>   linux-yocto/3.4: update to v3.4.3
>   linux-yocto-rt/3.4: update qemuppc branch
>   linux-yocto/3.4: -rt build fixes + configuration audit (part2)
>   linux-yocto/3.0: update BSP descriptions to new kern-tools format
> Lianhao Lu (3):
>   classes/image: Allow openssh empty passwords login.
>   image/core-image: Handle conflicting IMAGE_FEATURES.
>   task-core-tools-debug: Added openssh-sftp-server.
> Marcin Juszkiewicz (1):
>   libxml: disable lzma
> Robert Yang (1):
>   bitbake.conf: disable ccache explicitly if it is not enabled
> Ross Burton (1):
>   gconf.bbclass: don't register schemas in the install stage
> Saul Wold (3):
>   mx: Upgrade to 1.4.6
>   busybox: add correct ALTERNATIVE_TARGET for init.d/syslog
>   native.bbclass: correct PATH to have native-intercept be prepended
> Wade Farnsworth (1):
>   systemtap: update to version 1.8
> Xiaofeng Yan (2):
>   archiver.bbclass: Add the function of filtering packages
>   local.conf.sample.extended: Add filtering function to
>     archiver.bbclass
> Zhenhua Luo (1):
>   linux-dtb: add multi-dtb build support



