Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SG0L5-0007iA-PM
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 05:59:55 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Apr 2012 20:50:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127741715"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by azsmga001.ch.intel.com with ESMTP; 05 Apr 2012 20:50:42 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 5 Apr 2012 20:50:42 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.125]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.91]) with mapi id
	14.01.0355.002; Fri, 6 Apr 2012 11:50:41 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/3] libxaw: move it from meta-demoapps/ into
	meta/ and upgrade it to 1.0.10
Thread-Index: AQHNE2C2eH0b1KeYO0G2/aCwrgO+BZaNKSaA
Date: Fri, 6 Apr 2012 03:50:40 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A1913230FCFD412@SHSMSX102.ccr.corp.intel.com>
References: <cover.1333642153.git.dexuan.cui@intel.com>
	<515847c54a45a2cb7922cec91d2aeac26a4a7dea.1333642153.git.dexuan.cui@intel.com>
	<20120405191606.GS4181@jama.jama.net>
In-Reply-To: <20120405191606.GS4181@jama.jama.net>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] libxaw: move it from meta-demoapps/ into meta/ and upgrade it to 1.0.10
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
X-List-Received-Date: Fri, 06 Apr 2012 03:59:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Martin Jansa wrote on 2012-04-06:
> On Fri, Apr 06, 2012 at 12:10:11AM +0800, Dexuan Cui wrote:
>> Add LICENSE and LIC_FILES_CHKSUM;
>> Add SRC_URI checksums;
>> Remove do_install_append since 1.0.10's Makefile has done the work.
>=20
> This is also in meta-oe
> meta-openembedded/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.9.bb
>=20
> as with xterm, can you compare and merge those changes?
Hi Martin, thanks for the suggestion!

Now I try to avoid introducing new recipes at this phase of release cycle.
I'm trying to use a poky variable to tell bitbake which terminal should be
used(currently the Run image functionality in hob uses /usr/bin/xterm by
hardcode).

Thanks,
-- Dexuan




