Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SG9ad-00046C-0H
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 15:52:35 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Apr 2012 06:43:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127896317"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by azsmga001.ch.intel.com with ESMTP; 06 Apr 2012 06:43:20 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 6 Apr 2012 06:43:20 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.125]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.91]) with mapi id
	14.01.0355.002; Fri, 6 Apr 2012 21:43:18 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/5] dexuan: more build appliance	patches:
	[Apr 1, 2012]
Thread-Index: AQHNE/m9zOv8V0YR6UiIlB30FyofjJaNzeag
Date: Fri, 6 Apr 2012 13:43:18 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A1913230FCFD98C@SHSMSX102.ccr.corp.intel.com>
References: <cover.1333295122.git.dexuan.cui@intel.com>
	<1333337337.647.3.camel@ted>
	<949066CF-9C65-4057-9432-B4904A8B3AFD@dominion.thruhere.net>
	<A25F549E4D43CD42B4C02DF47A1913230FCFCF55@SHSMSX102.ccr.corp.intel.com>
	<BEE164D2-9C82-4144-BFD6-52EA787FF8E9@dominion.thruhere.net>
In-Reply-To: <BEE164D2-9C82-4144-BFD6-52EA787FF8E9@dominion.thruhere.net>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] dexuan: more build appliance	patches:	[Apr 1, 2012]
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
X-List-Received-Date: Fri, 06 Apr 2012 13:52:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote on 2012-04-06:
> Op 5 apr. 2012 om 10:21 heeft "Cui, Dexuan" <dexuan.cui@intel.com> het
> volgende geschreven:
>=20
>> Koen Kooi wrote on 2012-04-04:
>>>>> are available in the git repository at:
>>>>> git://git.yoctoproject.org/poky-contrib dcui/master
>>>>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Ddcui/maste=
r
>>>>> Dexuan Cui (5):
>>>>> genext2fs: support large files and  filesystems without using large
>>>>>   amounts of memory
>>>> I've merged these to master, thanks. Whilst I'm reluctant to do so at
>>>> this point in the release process for such major changes, I think in
>>>> this case it does make sense since the genext2fs changes seem to fix a
>>>> number of problematic issues.
>>>=20
>>> I'm getting:
>>>=20
>>> | genext2fs: set_file_size: ftruncate: Invalid argument
>>>=20
>>> Trying to see why that happens and find out how to fix it.
>> Hi Koen, did you get the cause?
>>=20
>> This is the prototype of the function:
>> int ftruncate(int fd, off_t length);
>>=20
>> I suppose you're using a 32-bit building host so the off_t in your host =
can't
> exceed 4G?
>=20
> no, 64bit host
Strange...
I use x86-64 Ubuntu 11.04 and x86-64 openSUSE 11.4 and I don't see the issu=
e.

Thanks,
-- Dexuan




