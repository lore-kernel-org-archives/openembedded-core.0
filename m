Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SDBLC-0003Vp-LU
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 11:08:22 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Mar 2012 01:59:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="124714967"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by azsmga001.ch.intel.com with ESMTP; 29 Mar 2012 01:59:16 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 29 Mar 2012 01:59:14 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.36]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.91]) with mapi id
	14.01.0355.002; Thu, 29 Mar 2012 16:57:41 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/1] genext2fs: support large files and
	filesystems without using large amounts of memor
Thread-Index: AQHNDQL3Ut8cbAV2rUit8X7AWJAE55aA+D2Q
Date: Thu, 29 Mar 2012 08:57:41 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A1913230FCEA4F5@SHSMSX102.ccr.corp.intel.com>
References: <cover.1332952962.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1332952962.git.dexuan.cui@intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 0/1] genext2fs: support large files and	filesystems without using large amounts of memor
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
X-List-Received-Date: Thu, 29 Mar 2012 09:08:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dexuan Cui wrote on 2012-03-29:
> Hi RP, Saul, Paul, Darren, Mark, Josh and joaohf and all, please comment.
>=20
> Let's figure out if this big patch is accepatable or not...
>=20
> With this patch, I can successfully create a 8.5GB .ext3 file with genext=
2fs.
> The speed is slow -- I spent about 1.5 hours.
Based on the latest poky master, I built from scratch with DL_DIR pointing
to an empty directory. After the building finished, I got more data:

the size of DL_DIR is about 3.1 GB.
genext2fs took about 65 minutes to create a 5.4GB .ext3 file.
The final .vmdk file's size is about 3.5GB.

>=20
> The following changes since commit
> 265903bdffb10c95ceaf7a892151a50b67939c71:
>=20
>   procps: don't print error message with kernel 3.0+ (2012-03-28
> 10:16:30
> +0100)
>=20

Thanks,
-- Dexuan




