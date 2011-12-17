Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rby1i-0002Ps-14
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Dec 2011 18:26:26 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 17 Dec 2011 09:18:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="48219771"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Dec 2011 09:18:19 -0800
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sun, 18 Dec 2011 01:18:18 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sun, 18 Dec 2011 01:18:18 +0800
Received: from shsmsx501.ccr.corp.intel.com ([10.239.4.141]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Sun, 18 Dec 2011 01:18:17 +0800
From: "Wang, Shane" <shane.wang@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 18 Dec 2011 01:18:15 +0800
Thread-Topic: [OE-core] [PATCH 1/1] Create a script for SUMMARY audit in
	recipes
Thread-Index: Acy80fXw9bhpk/VQTNyMkO4NIKEsMAADZA5Q
Message-ID: <D5AB6E638E5A3E4B8F4406B113A5A19A12ED44B20B@shsmsx501.ccr.corp.intel.com>
References: <cover.1324132972.git.shane.wang@intel.com>
	<aec7142fcdb265b6bab0b3328043d62e8fe10a8a.1324132972.git.shane.wang@intel.com>
	<20111217153816.GA9547@rhein.zuhause.netz>
In-Reply-To: <20111217153816.GA9547@rhein.zuhause.netz>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] Create a script for SUMMARY audit in recipes
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
X-List-Received-Date: Sat, 17 Dec 2011 17:26:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Henning Heinold wrote on=A02011-12-17:

> On Sat, Dec 17, 2011 at 11:07:12PM +0800, Shane Wang wrote:
>> Some recipes don't contain SUMMARY, which HOB will use for
>> descriptions. If the summary is missing, bitbake will create a default
>> value for summary. That is PN plus string " version " plus its version.
>> Every maintainer should add and update the summary fields according to
>> audit results.
>>=20
>> [YOCTO #1804] got fixed, and maintainers should follow up.
>>=20
>> Signed-off-by: Shane Wang <shane.wang@intel.com>
>> ---
>>  scripts/contrib/summary-audit.sh |   53
>>  ++++++++++++++++++++++++++++++++++++++ 1 files changed, 53
>>  insertions(+), 0 deletions(-) create mode 100755
>>  scripts/contrib/summary-audit.sh
>> diff --git a/scripts/contrib/summary-audit.sh
>> b/scripts/contrib/summary-audit.sh new file mode 100755 index
>> 0000000..068e283 --- /dev/null +++ b/scripts/contrib/summary-audit.sh
>> @@ -0,0 +1,53 @@ +#!/bin/bash +#
>=20
> Hm,
>=20
> where do you need special bash features?
>=20
> Bye Henning

OK, nowhere. I tested with sh just now, it also worked. Will change that.

--
Shane


