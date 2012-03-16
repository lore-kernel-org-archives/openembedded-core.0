Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8Rgd-0004iL-PO
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 08:34:56 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 Mar 2012 00:26:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119687531"
Received: from azsmsx603.amr.corp.intel.com ([10.2.161.23])
	by azsmga001.ch.intel.com with ESMTP; 16 Mar 2012 00:26:06 -0700
Received: from azsmsx602.amr.corp.intel.com (10.2.121.201) by
	azsmsx603.amr.corp.intel.com (10.2.161.23) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 16 Mar 2012 00:26:06 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	azsmsx602.amr.corp.intel.com (10.2.121.201) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 16 Mar 2012 00:26:06 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.36]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.91]) with mapi id
	14.01.0355.002; Fri, 16 Mar 2012 15:25:59 +0800
From: "Wang, Shane" <shane.wang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 5/8] alsa-utils: update to 1.0.25
Thread-Index: AQHNAdG+YxOedP2idEOipMI2UYa/KZZsh8EQ
Date: Fri, 16 Mar 2012 07:25:58 +0000
Message-ID: <3AB6CE7F274E534CAFD089D127A8A1FC23AED058@SHSMSX102.ccr.corp.intel.com>
References: <cover.1331713107.git.kai.kang@windriver.com>
	<8e34c071af55fbd1bf52da1c78337ee9ea23e9e5.1331713107.git.kai.kang@windriver.com>
In-Reply-To: <8e34c071af55fbd1bf52da1c78337ee9ea23e9e5.1331713107.git.kai.kang@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "Purdie, Richard" <richard.purdie@intel.com>, "Wold,
	Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 5/8] alsa-utils: update to 1.0.25
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
X-List-Received-Date: Fri, 16 Mar 2012 07:34:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Kang Kai wrote on=A02012-03-14:

> Update to version 1.0.25, and update patch
> 0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch because
> rejected when apply it.
>=20
> Signed-off-by: Kang Kai <kai.kang@windriver.com>


Kai, why did you drop the patch? You can port it to alsa-utils v1.0.25 code=
 base, as I did.
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dshane/m4=
upgrade&id=3D924cdfe1a0069ff53526afe67b11cbd9405472de

--
Shane


