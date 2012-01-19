Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Rngyk-0006ag-Fc
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 02:39:50 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jan 2012 17:32:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113805328"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2012 17:32:10 -0800
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 19 Jan 2012 09:30:09 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.21]) by
	SHSMSX101.ccr.corp.intel.com ([169.254.1.213]) with mapi id
	14.01.0355.002; Thu, 19 Jan 2012 09:30:08 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC PATCH 1/1][v2] self-hosted-image: generate the
	.hdddirect and .vmdk image files
Thread-Index: AQHM1fu5qN+lC/AnZEi3c9lVtAWAJJYS5iDg
Date: Thu, 19 Jan 2012 01:30:08 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A1913230FCAC821@SHSMSX102.ccr.corp.intel.com>
References: <cover.1326894448.git.dexuan.cui@intel.com>
	<84776a87449ee57fcf3a568562cb0957da04f8bc.1326894448.git.dexuan.cui@intel.com>
	<4F16EEFD.1020700@linux.intel.com>
In-Reply-To: <4F16EEFD.1020700@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "dvhart@linux.intel.com" <dvhart@linux.intel.com>
Subject: Re: [RFC PATCH 1/1][v2] self-hosted-image: generate the .hdddirect and .vmdk image files
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
X-List-Received-Date: Thu, 19 Jan 2012 01:39:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Saul Wold wrote on 2012-01-19:
>> +	if [ "${NOVMDK}" !=3D "1" ] ; then
> Why make this a "double negative", Why not have a CREATE_VMDK check?
>=20
>> +		${STAGING_BINDIR_NATIVE}/qemu-img convert -O vmdk   \
>> +			${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.hdddirect \
>> +			${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vmdk
>> +	fi
>>   }
Hi Saul,
I thought it's better to create .vmdk by default.
So do you think this is better?
if [ "${CREATE_VMDK}" =3D=3D "1" ] ; then
  #create the .vmdk image.
fi

In this way we don't create .vmdk by default and I'll define
CREATE_VMDK =3D "1"
in self-hosted-image.bb to generate the .vmdk.

Thanks,
-- Dexuan




