Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1QmTSU-0007m5-Uj
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 18:29:15 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Jul 2011 09:24:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,283,1309762800"; d="scan'208";a="33171554"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by orsmga001.jf.intel.com with ESMTP; 28 Jul 2011 09:24:58 -0700
Received: from orsmsx152.amr.corp.intel.com (10.22.226.39) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 28 Jul 2011 09:24:58 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.233]) by
	ORSMSX152.amr.corp.intel.com ([169.254.6.186]) with mapi id
	14.01.0289.001; Thu, 28 Jul 2011 09:24:57 -0700
From: "Zhang, Jessica" <jessica.zhang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/1][M3] Fix bug #1299 for meta-environment
Thread-Index: AQHMTULj+Jyr3jHQr0qetK6CVfRZTg==
Date: Thu, 28 Jul 2011 16:24:56 +0000
Message-ID: <C6510F6D410BB64A8C15398EDC6B847C136FBF17@ORSMSX101.amr.corp.intel.com>
References: <cover.1311851957.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1311851957.git.lianhao.lu@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.132]
MIME-Version: 1.0
Subject: Re: [PATCH 0/1][M3] Fix bug #1299 for meta-environment
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
X-List-Received-Date: Thu, 28 Jul 2011 16:29:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Lianhao Lu
Sent: Thursday, July 28, 2011 4:24 AM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH 0/1] Fix bug #1299 for meta-environment

Using recipe-scope variable REAL_MULTIMACH_TARGET_SYS instead of the unavai=
lable
OLD_MULTIMACH_TARGET_SYS to generate meta-environment files for ADT install=
er.

The following changes since commit f94b781695cd8fa387daff16ecbf3987a0883018=
:
  Bruce Ashfield (1):
        poky.conf: explicitly referenced preferred linux-yocto version

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib llu/bug1299
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dllu/bug1299

Lianhao Lu (1):
  meta-environment: set correct *MULTIMACH_TARGET_SYS.

 meta/classes/toolchain-scripts.bbclass     |    7 ++++---
 meta/recipes-core/meta/meta-environment.bb |    9 +++++----
 2 files changed, 9 insertions(+), 7 deletions(-)


_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


