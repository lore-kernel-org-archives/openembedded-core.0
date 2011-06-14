Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QWOgC-0002KL-Sr
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 10:08:57 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Jun 2011 01:05:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,363,1304319600"; d="scan'208";a="12348824"
Received: from unknown (HELO [10.255.12.216]) ([10.255.12.216])
	by azsmga001.ch.intel.com with ESMTP; 14 Jun 2011 01:05:27 -0700
Message-ID: <4DF71647.7000703@linux.intel.com>
Date: Tue, 14 Jun 2011 01:05:27 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1308000501.git.sgw@linux.intel.com>	<f1001141de7bf605c79b8ae9b44160e4cda9e736.1308000501.git.sgw@linux.intel.com>
	<59F3EB02-7EFE-4E50-AD6E-A953952FEA6B@dominion.thruhere.net>
In-Reply-To: <59F3EB02-7EFE-4E50-AD6E-A953952FEA6B@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/1] autoconf/automake: Bump PR to resolve	perl-native issue
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
X-List-Received-Date: Tue, 14 Jun 2011 08:08:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/14/2011 12:48 AM, Koen Kooi wrote:
> To be clear: does the PR bump fix the issues or was there a fix earlier that lacked a PR bump?
>
The fix was earlier and lacked the PR bump to these recipes.

Sau!

> Op 13 jun 2011, om 23:30 heeft Saul Wold het volgende geschreven:
>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>> meta/recipes-devtools/autoconf/autoconf_2.68.bb |    2 +-
>> meta/recipes-devtools/automake/automake.inc     |    2 +-
>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/autoconf/autoconf_2.68.bb b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
>> index c647a15..638e677 100644
>> --- a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
>> +++ b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
>> @@ -1,6 +1,6 @@
>> require autoconf.inc
>>
>> -PR = "r0"
>> +PR = "r1"
>>
>> PARALLEL_MAKE = ""
>>
>> diff --git a/meta/recipes-devtools/automake/automake.inc b/meta/recipes-devtools/automake/automake.inc
>> index 524e93e..beeec7b 100644
>> --- a/meta/recipes-devtools/automake/automake.inc
>> +++ b/meta/recipes-devtools/automake/automake.inc
>> @@ -4,7 +4,7 @@ Standards. Automake requires the use of Autoconf."
>> LICENSE = "GPLv2"
>> HOMEPAGE = "http://www.gnu.org/software/automake/"
>> SECTION = "devel"
>> -PR = "r1"
>> +PR = "r2"
>>
>> SRC_URI = "${GNU_MIRROR}/automake/automake-${PV}.tar.bz2 "
>>
>> --
>> 1.7.3.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


