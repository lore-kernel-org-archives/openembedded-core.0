Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RGYxJ-0005Zh-3z
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 18:25:25 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Oct 2011 09:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="64785966"
Received: from unknown (HELO [10.255.15.35]) ([10.255.15.35])
	by orsmga002.jf.intel.com with ESMTP; 19 Oct 2011 09:19:31 -0700
Message-ID: <4E9EF893.7080908@linux.intel.com>
Date: Wed, 19 Oct 2011 09:19:31 -0700
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1318976197.git.josh@linux.intel.com>
	<f90833637d03ce25b7d84641c29fb60c90c375fa.1318976197.git.josh@linux.intel.com>
	<20111019005411.GB27915@sakrah.homelinux.org>
In-Reply-To: <20111019005411.GB27915@sakrah.homelinux.org>
Subject: Re: [PATCH 2/2] tzdata: updated SRC_URI and update to 2011k
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
X-List-Received-Date: Wed, 19 Oct 2011 16:25:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/18/2011 05:54 PM, Khem Raj wrote:
> On (18/10/11 15:24), Joshua Lock wrote:
>> tzdata is now hosted by IANA at http://www.iana.org/time-zones
>>
>> Signed-off-by: Joshua Lock <josh@linux.intel.com>
>> ---
>>  .../tzdata/{tzdata_2011k.bb => tzdata_2011l.bb}    |    6 +++---
>>  1 files changed, 3 insertions(+), 3 deletions(-)
>>  rename meta/recipes-extended/tzdata/{tzdata_2011k.bb => tzdata_2011l.bb} (96%)
>>
>> diff --git a/meta/recipes-extended/tzdata/tzdata_2011k.bb b/meta/recipes-extended/tzdata/tzdata_2011l.bb
>> similarity index 96%
>> rename from meta/recipes-extended/tzdata/tzdata_2011k.bb
>> rename to meta/recipes-extended/tzdata/tzdata_2011l.bb
>> index 45f2c4d..140f8ed 100644
>> --- a/meta/recipes-extended/tzdata/tzdata_2011k.bb
>> +++ b/meta/recipes-extended/tzdata/tzdata_2011l.bb
>> @@ -12,10 +12,10 @@ RCONFLICTS= "timezones timezone-africa timezone-america timezone-antarctica \
>>               timezone-australia timezone-europe timezone-indian \
>>               timezone-iso3166.tab timezone-pacific timezone-zone.tab"
>>  
>> -SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzdata${PV}.tar.gz;name=tzdata"
>> +SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
> 
> I think same would be needed for tzcode-native recipes. Could you also
> do that while you are at it.

I'll try and get to it today.

Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


