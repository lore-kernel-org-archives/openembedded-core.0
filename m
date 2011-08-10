Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QqzPE-0004kQ-76
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 05:24:32 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Aug 2011 20:20:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,348,1309762800"; d="scan'208";a="36901298"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by azsmga001.ch.intel.com with ESMTP; 09 Aug 2011 20:19:59 -0700
Received: from pgsmsx151.gar.corp.intel.com (172.30.236.41) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 10 Aug 2011 11:18:33 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX151.gar.corp.intel.com (172.30.236.41) with Microsoft SMTP Server
	(TLS) id 14.1.323.3; Wed, 10 Aug 2011 11:18:32 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Wed, 10 Aug 2011 11:18:31 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Darren Hart <dvhart@linux.intel.com>
Date: Wed, 10 Aug 2011 11:18:31 +0800
Thread-Topic: [OE-core] [PATCH 1/1] oe-init-build-env,
	scripts/oe-buildenv-internal: add error detecting for $BDIR
Thread-Index: AcxWpfTTiXSZftm0QvOE8p8w4SxuvQAZSzBA
Message-ID: <1865303E0DED764181A9D882DEF65FB6B6CD83BDA9@shsmsx502.ccr.corp.intel.com>
References: <cover.1312265186.git.dexuan.cui@intel.com>
	<6def4624e63c8c7cf439dff32cb155dd2bba0ebe.1312265186.git.dexuan.cui@intel.com>
	<1312285430.2344.582.camel@rex> <4E38C941.30805@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B304414CE2@shsmsx502.ccr.corp.intel.com>
	<4E395235.9010709@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B3044150C6@shsmsx502.ccr.corp.intel.com>
	<4E3A3562.1060907@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B3046C9A79@shsmsx502.ccr.corp.intel.com>
	<4E3AA24A.7050400@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B3046C9C11@shsmsx502.ccr.corp.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B5FF85AB28@shsmsx502.ccr.corp.intel.com>
	<4E40B92A.1000903@linux.intel.com>
	<1865303E0DED764181A9D882DEF65FB6B5FF85AF9D@shsmsx502.ccr.corp.intel.com>
	<4E414D03.1060301@linux.intel.com>
In-Reply-To: <4E414D03.1060301@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Phil Blundell <philb@gnu.org>, Richard,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] oe-init-build-env, scripts/oe-buildenv-internal: add error detecting for $BDIR
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
X-List-Received-Date: Wed, 10 Aug 2011 03:24:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Darren Hart wrote on 2011-08-09:
> On 08/09/2011 07:04 AM, Cui, Dexuan wrote:
>> Hi Darren, thanks a lot for all the suggestions! I appreciate your
>> efforts to help to make the patch better. Below is the updated patch
>> (also pasted at the end of the mail):
>> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Ddcu i=
/
>> bug-671&id=3D2ece3a84d646bb4bf83f3c8aa3067cb99989da47
>>=20
>> -- Dexuan
>>=20
>> commit 2ece3a84d646bb4bf83f3c8aa3067cb99989da47
>> Author: Dexuan Cui <dexuan.cui@intel.com>
>> Date:   Thu Aug 4 14:53:20 2011 +0800
>>=20
>>     scripts/oe-buildenv-internal: improve the error detecting for
>> $BDIR
>>=20
>>     The previous fix for a bug in Ubuntu 10.04 readlink,
>>     be2a2764d8ceb398d81714661e6f199c8b11946c, notified the user when a
>>     trailing slash was used. As there is no semantic difference, simply
>>     remove any trailing slashes and proceed without nagging the user.
>>    =20
>>     See [YOCTO #671] for more details.
>>    =20
>>     Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
>>     Cc: Darren Hart <dvhart@linux.intel.com>
>>     Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
>=20
> Looks good,
>=20
> Acked-by: Darren Hart <dvhart@linux.intel.com>
Thanks, Darren!

Hi RP, could you please pull the patch?=20
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Ddcui/bug=
-671&id=3D2ece3a84d646bb4bf83f3c8aa3067cb99989da47

Thanks,
-- Dexuan




