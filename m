Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RVcLi-0001HW-6O
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 06:04:50 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 20:58:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,595,1315206000"; d="scan'208";a="96817704"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 20:58:08 -0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 30 Nov 2011 12:56:34 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Wed, 30 Nov 2011 12:56:33 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2011 12:56:32 +0800
Thread-Topic: [OE-core] [CONSOLIDATED PULL 00/23] Scooping up Patches
Thread-Index: AcyulQC8f4CPRyE8R0GXQoAm4z4ZLwAhZc6w
Message-ID: <1865303E0DED764181A9D882DEF65FB6E8EDF39B50@shsmsx502.ccr.corp.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
	<1322570811.3166.8.camel@ted>
In-Reply-To: <1322570811.3166.8.camel@ted>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 00/23] Scooping up Patches
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
X-List-Received-Date: Wed, 30 Nov 2011 05:04:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote on 2011-11-29:
>> The following changes since commit
>> 2864ff6a4b3c3f9b3bbb6d2597243cc5d3715939:
>>=20
>>   getVar/setVar cleanups (2011-11-26 22:42:00 +0000)
>> are available in the git repository at:
>>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h =
=3D
> sgw/stage
>>=20
>> Dexuan Cui (1):
>>   coreutils: build and install hostname
Hi RP, Saul,
Please don't pull the patch -- I don't think we should use it now:
The purpose of the patch is to use the hostname of coreutils version rather=
 than that of busybox version:
IIRC, because of http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1784 (busy=
box not working with pseudo:libpseudo.so cannot be preloaded: ignored), bus=
ybox's hostname causes a non-fatal warning message in some package's do_con=
figure's log (at this moment, I don't remember the package's name...), but,=
 I think actually we can safely ignore the warning msg.

hostname of coreutils version has 2 issues: 1) need to disable doc/man gene=
ration to make do_compile pass; 2) it doesn't support -F : http://git.opene=
mbedded.org/openembedded/commit/?id=3Df2e1da7559d1798ae8314d8824c8d53da0b35=
06b so we have to fix(or hack) poky's meta/recipes-core/initscripts/initscr=
ipts-1.0/hostname.sh if we decide to use it.

After discussed with Saul, I think we may as well choose to do nothing to c=
oreutils and endure the warning caused by busybox's hostname.

Thanks,
-- Dexuan




