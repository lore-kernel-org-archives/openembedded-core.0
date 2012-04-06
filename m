Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SFzrm-0007P3-Dh
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 05:29:38 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Apr 2012 20:20:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127733851"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by azsmga001.ch.intel.com with ESMTP; 05 Apr 2012 20:20:25 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 5 Apr 2012 20:20:24 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.125]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.142]) with mapi id
	14.01.0355.002; Fri, 6 Apr 2012 11:20:23 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Do we have a package that installs the kernel headers and
	config into the target?
Thread-Index: Ac0TpDNglZsuvcTWTNSj8hhUp7EH6A==
Date: Fri, 6 Apr 2012 03:20:22 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A1913230FCFD3A2@SHSMSX102.ccr.corp.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Do we have a package that installs the kernel headers and config into the target?
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
X-List-Received-Date: Fri, 06 Apr 2012 03:29:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

In a typical Linux distribution, there is a build link(or directory) that s=
pecifies the directory where the kernel headers and kernel config are put.

E.g. in my Ubuntu 11.04, a package linux-headers-2.6.38-8-generic installs =
.config, include/ and Kconfig into /usr/src/linux-headers-2.6.38-8-generic/=
 and makes a link /lib/modules/2.6.38-8-generic/build to point to the direc=
tory.

However, looks in Yocto, we don't have such a package? Do we have a plan to=
 add it?

I'm asking the question because in the ESDC contest, the students found in =
Yocto they couldn't build the wifi driver's source code that was downloaded=
 from realtek.com:  http://www.realtek.com.tw/downloads/downloadsView.aspx?=
Langid=3D1&PFid=3D48&Level=3D5&Conn=3D4&ProdID=3D226&DownTypeID=3D3&GetDown=
=3Dfalse&Downloads=3Dtrue
In Ubuntu, they can build the driver fine.


Thanks,
-- Dexuan




