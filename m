Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SHC67-0002Do-1j
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 12:45:23 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 09 Apr 2012 03:36:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="86865378"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Apr 2012 03:36:05 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Mon, 9 Apr 2012 03:36:04 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.125]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.142]) with mapi id
	14.01.0355.002; Mon, 9 Apr 2012 18:36:03 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/1] meta-toolchain: runqemu falied on
	FC16/Opensuse12.1 x86_64
Thread-Index: AQHNFjrD5+rzQHJT5kasSUjz+hO3xJaSTBPw
Date: Mon, 9 Apr 2012 10:36:02 +0000
Message-ID: <857BE142E5399E46B20FD45B9DB8A7BC0FD32945@SHSMSX102.ccr.corp.intel.com>
References: <cover.1333966697.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1333966697.git.liezhi.yang@windriver.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 0/1] meta-toolchain: runqemu falied on	FC16/Opensuse12.1 x86_64
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
X-List-Received-Date: Mon, 09 Apr 2012 10:45:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Robert Yang wrote on 2012-04-09:
> Test info:
> * Have tested on:
>   * Fedora 16 x86_64
>   * Opensuse 12.1 x86_64

Robert,=20
Hongna just found a qemu launch error on openSuse x86_64 using the 2.15 egl=
ibc-nativesdk, something about the SDL initialization error. Did your platf=
orm work well?

>   * Ubuntu 10.04
> * The testing commands are:
>   $ bitbake core-image-sato meta-toolchain meta-toolchain-sdk
>  =20
>   And untar the sdk, then runqemu from the sdk to start the target.
> // Robert
>=20
> The following changes since commit 1a82989345fb98becb487d270fd93a5e6dffeb=
47:
>=20
>   runqemu-internal: Add console=3Dtty for qemuppc and NFS (2012-04-06 01:=
12:15 +0100)
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib robert/tc
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Drobert/tc
> Robert Yang (1):
>   meta-toolchain: runqemu falied on FC16/Opensuse12.1 x86_64
>  meta/conf/distro/include/tcmode-default.inc |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> _______________________________________________ Openembedded-core
> mailing list Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Best Regards,
Lianhao




