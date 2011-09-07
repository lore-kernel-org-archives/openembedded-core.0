Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1R19U9-0000ep-Sk
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 06:11:38 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Sep 2011 21:06:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="45909821"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by orsmga001.jf.intel.com with ESMTP; 06 Sep 2011 21:06:34 -0700
Received: from pgsmsx102.gar.corp.intel.com (10.221.44.80) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 7 Sep 2011 12:06:26 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX102.gar.corp.intel.com (10.221.44.80) with Microsoft SMTP Server
	(TLS) id 14.1.323.3; Wed, 7 Sep 2011 12:06:26 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Wed, 7 Sep 2011
	12:06:24 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Sep 2011 12:06:24 +0800
Thread-Topic: [OE-core] [PATCH 0/5] patches to fix deb packaging: bug 1070
Thread-Index: Acxs9Fo57ZUgkxSvTa6f1/+ExEt0bgAHmy9Q
Message-ID: <1865303E0DED764181A9D882DEF65FB6BB805C333A@shsmsx502.ccr.corp.intel.com>
References: <cover.1315313790.git.dexuan.cui@intel.com>
	<4E66B976.50505@linux.intel.com>
In-Reply-To: <4E66B976.50505@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] patches to fix deb packaging: bug 1070
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
X-List-Received-Date: Wed, 07 Sep 2011 04:11:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Saul Wold wrote on 2011-09-07:
> It's possible that one of your patches is causing this Multiple .bb files=
 now.
> Did you test with multiple PACKAGE_CLASSES set?
>=20
> ERROR: Multiple .bb files are due to be built which each provide
> virtual/update-alternatives-native
> (virtual:native:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nigh
> tly- ppc/build/meta/recipes-devtools/opkg/opkg_svn.bb
> virtual:native:/srv/home/pokybuild/yocto-autobuilder/yocto-slave/night
> ly-p
> pc/build/meta/recipes-devtools/update-alternatives/update-alternatives
> -dp kg_1.16.0.3.bb).
>   This usually means one provides something the other doesn't and should.
> Thanks
Hmmm, sorry! I missed this test...
Actually at the beginning I did do this test and knew this multiple provide=
r issue, but later I forgot it and only focused on tests with 1 PACKAGE_CLA=
SSES set...=20
I'm try to fix this asap.
So, please hold patch 3, 4 and 5.  Patch 1 and 2 are fixing obvious issues =
and I think we can apply them.

Thanks,
-- Dexuan




