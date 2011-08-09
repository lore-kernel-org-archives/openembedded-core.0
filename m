Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1Qqbu0-0005P0-UE
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 04:18:45 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Aug 2011 19:14:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,340,1309762800"; d="scan'208";a="36512781"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by azsmga001.ch.intel.com with ESMTP; 08 Aug 2011 19:14:12 -0700
Received: from pgsmsx104.gar.corp.intel.com (10.221.44.91) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 9 Aug 2011 10:13:45 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX104.gar.corp.intel.com (10.221.44.91) with Microsoft SMTP Server
	(TLS) id 14.1.323.3; Tue, 9 Aug 2011 10:13:44 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Tue, 9 Aug 2011
	10:13:43 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Darren Hart
	<dvhart@linux.intel.com>
Date: Tue, 9 Aug 2011 10:13:43 +0800
Thread-Topic: [OE-core] [PATCH 1/1] oe-init-build-env,
	scripts/oe-buildenv-internal: add error detecting for $BDIR
Thread-Index: AcxSrK427eyEX9TDTFyrgIWm2d2wsgACBJmgAOEanAA=
Message-ID: <1865303E0DED764181A9D882DEF65FB6B5FF85AB28@shsmsx502.ccr.corp.intel.com>
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
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6B3046C9C11@shsmsx502.ccr.corp.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Phil Blundell <philb@gnu.org>
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
X-List-Received-Date: Tue, 09 Aug 2011 02:18:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Cui, Dexuan wrote on 2011-08-04:
> Darren Hart wrote on 2011-08-04:
>> On 08/04/2011 12:37 AM, Cui, Dexuan wrote: Please remember to include a
>> description of the problem and the approach taken to fix it. This
>> eliminates wasted time trying to decipher it later or by people
>> unfamiliar with the history. This is important even for simple changes.
>> In this case something like:
>>=20
>> " The previous fix for a bug in Ubuntu 10.04 readlink, $COMMIT_ID,
>> notified the user when a trailing slash was used. As there is no
>> semantic difference, simply remove any trailing slashes and proceed
>> without nagging the user. "
> Thanks! I'll use the description.
>=20
>>> diff --git a/scripts/oe-buildenv-internal
>>=20
>> This shouldn't be a question. If the documented behavior of readlink
>> is to return empty when the path doesn't exist, then assume this to
>> be the case.
> The latest manual of readlink says readlink should ignore trailing slash.
>=20
>> Also, it is a good idea to avoid contractions in printed error messages.
>>=20
>> 	echo >&2 "Error: the directory $PARENTDIR does not exist."
> Ok, I'll change "doesn't" to "does not".
>=20
>> Otherwise, this looks good to me.
> Please review the new patch (I paste it at the end of the mail, too)
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Ddcui/b=
ug-671&id=3D593e3506f4d4d9f6030100eac8c8e0af7f8ce3eb
Hi Darren,
Could you please comment on this new version of patch?
I sent it out for several days ago. Maybe it was drowned in the mailing lis=
t.

Thanks,
-- Dexuan


