Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1R3t50-0006to-LB
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 19:16:58 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Sep 2011 10:11:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="48402001"
Received: from orsmsx602.amr.corp.intel.com ([10.22.226.211])
	by orsmga002.jf.intel.com with ESMTP; 14 Sep 2011 10:11:47 -0700
Received: from orsmsx105.amr.corp.intel.com (10.22.225.132) by
	orsmsx602.amr.corp.intel.com (10.22.226.211) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 14 Sep 2011 10:11:47 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.19]) by
	ORSMSX105.amr.corp.intel.com ([169.254.4.165]) with mapi id
	14.01.0323.003; Wed, 14 Sep 2011 10:11:35 -0700
From: "Zhang, Jessica" <jessica.zhang@intel.com>
To: "sgw@linux.intel.com" <sgw@linux.intel.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/1] Update to latest prelinker -- fix arm
	and x86 issues
Thread-Index: AQHMcwBJtR+vxzh8qkaYj+bidHZVRZVNHJAA
Date: Wed, 14 Sep 2011 17:11:35 +0000
Message-ID: <C6510F6D410BB64A8C15398EDC6B847C16E6FFDA@ORSMSX101.amr.corp.intel.com>
References: <cover.1315961467.git.mark.hatle@windriver.com>
	<1316019818.1058.28.camel@swold-mobl.bigsur.com>
In-Reply-To: <1316019818.1058.28.camel@swold-mobl.bigsur.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Subject: Re: [PATCH 0/1] Update to latest prelinker -- fix arm and x86 issues
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
X-List-Received-Date: Wed, 14 Sep 2011 17:16:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Bug 1482 filed for it.

- Jessica

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Saul Wold
Sent: Wednesday, September 14, 2011 10:04 AM
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/1] Update to latest prelinker -- fix arm an=
d x86 issues

On Tue, 2011-09-13 at 19:52 -0500, Mark Hatle wrote:
> This fixes yocto bugzilla bug 1473.  It addresses an issue where a typeca=
st
> wasn't being specified and the compiler was doing the wrong thing in a
> printf.
>
> The symbols of the previous failure were, on a 32-bit IA32 host, targetin=
g
> either a 32-bit IA32 target or ARM target the results of a prelinked imag=
e
> may not work properly.
>
Mark,

There is still a problem with the prelinker, it seems to clobber text in
X11 on qemux86, we get a build that has square blocks for text.

Sau!

> The following changes since commit 3be290aac4da885fe5bc31797c4a689196c63b=
7a:
>
>   libzypp: move package-manger to it own package (2011-09-13 16:19:30 -07=
00)
>
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib mhatle/prelink
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dmhatle/prelink
>
> Mark Hatle (1):
>   Uprev to latest version of prelink_git, fixing TLS issues
>
>  meta/recipes-devtools/prelink/prelink_git.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>



_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


