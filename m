Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SFqW3-0006Fd-Mj
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 19:30:35 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Apr 2012 10:21:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="85753885"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Apr 2012 10:21:22 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 5 Apr 2012 10:21:22 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.125]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.91]) with mapi id
	14.01.0355.002; Fri, 6 Apr 2012 01:21:20 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/5] dexuan: more build appliance patches:
	[Apr 1, 2012]
Thread-Index: AQHNEdtIzOv8V0YR6UiIlB30FyofjJaMe2Ww
Date: Thu, 5 Apr 2012 17:21:20 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A1913230FCFCF55@SHSMSX102.ccr.corp.intel.com>
References: <cover.1333295122.git.dexuan.cui@intel.com>
	<1333337337.647.3.camel@ted>
	<949066CF-9C65-4057-9432-B4904A8B3AFD@dominion.thruhere.net>
In-Reply-To: <949066CF-9C65-4057-9432-B4904A8B3AFD@dominion.thruhere.net>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 0/5] dexuan: more build appliance patches:	[Apr 1, 2012]
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
X-List-Received-Date: Thu, 05 Apr 2012 17:30:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Koen Kooi wrote on 2012-04-04:
>>> are available in the git repository at:
>>>  git://git.yoctoproject.org/poky-contrib dcui/master
>>>  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Ddcui/master
>>> Dexuan Cui (5):
>>>  genext2fs: support large files and  filesystems without using large
>>>    amounts of memory
>> I've merged these to master, thanks. Whilst I'm reluctant to do so at
>> this point in the release process for such major changes, I think in
>> this case it does make sense since the genext2fs changes seem to fix a
>> number of problematic issues.
>=20
> I'm getting:
>=20
> | genext2fs: set_file_size: ftruncate: Invalid argument
>=20
> Trying to see why that happens and find out how to fix it.
Hi Koen, did you get the cause?

This is the prototype of the function:
int ftruncate(int fd, off_t length);

I suppose you're using a 32-bit building host so the off_t in your host can=
't exceed 4G?

We do need to test it in a 32-bit host and at least we need to document the=
 issue.

Thanks,
-- Dexuan




