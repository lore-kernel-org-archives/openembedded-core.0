Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SRI47-0001BD-DX
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 09:09:03 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 May 2012 23:59:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="140847605"
Received: from unknown (HELO [10.255.12.143]) ([10.255.12.143])
	by orsmga002.jf.intel.com with ESMTP; 06 May 2012 23:59:12 -0700
Message-ID: <4FA772BF.5020406@linux.intel.com>
Date: Sun, 06 May 2012 23:59:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1336176824-5954-1-git-send-email-sgw@linux.intel.com>
	<5B2F5D0A-BEEF-47BE-85DD-F9FCC7E290DC@dominion.thruhere.net>
In-Reply-To: <5B2F5D0A-BEEF-47BE-85DD-F9FCC7E290DC@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] libpcap: Move pcap-config to -dev package
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
X-List-Received-Date: Mon, 07 May 2012 07:09:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2012 11:57 PM, Koen Kooi wrote:
>
> Op 5 mei 2012, om 02:13 heeft Saul Wold het volgende geschreven:
>
>> pcap-config is a tool used for getting the cflags and ln flags for development
>>
>> [YOCTO #2367]
>>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>> meta/recipes-connectivity/libpcap/libpcap.inc |    7 ++++++-
>> 1 files changed, 6 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
>> index 427078f..7950b2a 100644
>> --- a/meta/recipes-connectivity/libpcap/libpcap.inc
>> +++ b/meta/recipes-connectivity/libpcap/libpcap.inc
>> @@ -13,7 +13,7 @@ DEPENDS = "flex-native bison-native"
>> PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
>> PACKAGECONFIG[bluetooth] = "--enable-bluetooth,--disable-bluetooth,bluez4"
>>
>> -INC_PR = "r1"
>> +INC_PR = "r2"
>>
>> SRC_URI = "http://www.tcpdump.org/release/libpcap-${PV}.tar.gz"
>>
>> @@ -30,3 +30,8 @@ do_configure_prepend () {
>>          cat aclocal.m4>  acinclude.m4
>>      fi
>> }
>> +
>> +# pcap-config is a dev tool and should not be packaged in the
>> +# core package.
>> +FILES_${PN} = "${libdir}/lib*${SOLIBS}"
>> +FILES_${PN}-dev += "${bindir}"
>
> Change that go ${bindir}/pcap-config to avoid being too greedy during upgrades. Or just inherit 'binconfig' :)

It already inherits binconfig!

That does not seem to address which package it gets installed in!

Sau!

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


