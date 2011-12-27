Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1RfcjD-0000PA-AA
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Dec 2011 20:30:27 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Dec 2011 11:22:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="89999825"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by azsmga001.ch.intel.com with ESMTP; 27 Dec 2011 11:22:08 -0800
Received: from orsmsx105.amr.corp.intel.com (10.22.225.132) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 27 Dec 2011 11:22:08 -0800
Received: from orsmsx102.amr.corp.intel.com ([169.254.1.40]) by
	ORSMSX105.amr.corp.intel.com ([169.254.4.103]) with mapi id
	14.01.0355.002; Tue, 27 Dec 2011 11:22:08 -0800
From: "Zhang, Jessica" <jessica.zhang@intel.com>
To: "niqingliang@insigma.com.cn" <niqingliang@insigma.com.cn>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] can't install eclipse plugin
Thread-Index: AQHMw7NS0YBVviSx5EitwmnWVgPMl5XwD+ig
Date: Tue, 27 Dec 2011 19:22:07 +0000
Message-ID: <C6510F6D410BB64A8C15398EDC6B847C2401E62B@ORSMSX102.amr.corp.intel.com>
References: <1324892695.4637.10.camel@localhost.localdomain>
In-Reply-To: <1324892695.4637.10.camel@localhost.localdomain>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Subject: Re: can't install eclipse plugin
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
X-List-Received-Date: Tue, 27 Dec 2011 19:30:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Qingliang,

How did you install the LinuxTools?  For the latest Eclipse plug-in, it use=
s the built-in Lttng-viewer so the dependency is introduced.  You just need=
 to go under Help->install new software Select the Indigo update site: http=
://download.eclipse.org/releases.indigo, and select its Linux Tracing Toolk=
it Integration, that should bring in all the dependency.

Also, you need to install the Lttng parser library and start eclipse with L=
D_LIBRARY_PATH by following the direction from the Lttng wiki http://wiki.e=
clipse.org/Linux_Tools_Project/LTTng.

- Jessica

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Ni Qingliang
Sent: Monday, December 26, 2011 1:45 AM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] can't install eclipse plugin

hello, all:
I have update yocto plugin to 20111224 current version, but can't
install it correctly.

I don't know where to find linuxtools.tmf.core, I have installed
linuxtools totaly, but can't work.

who can help me? thanks!



Cannot complete the install because one or more required items could not
be found.
  Software being installed: Yocto Plugin for Eclipse 1.1.0.201112240640
(org.yocto.sdk.feature.group 1.1.0.201112240640)
  Missing requirement: Yocto Project Plugin Remote Tools
1.1.0.201112240640 (org.yocto.sdk.remotetools 1.1.0.201112240640)
requires 'bundle org.eclipse.linuxtools.tmf.core 0.4.0' but it could not
be found
  Cannot satisfy dependency:
    From: Yocto Plugin for Eclipse 1.1.0.201112240640
(org.yocto.sdk.feature.group 1.1.0.201112240640)
    To: org.yocto.sdk.remotetools 0.0.0


--
Yi Qingliang
niqingliang@insigma.com.cn
https://niqingliang2003.wordpress.com


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


