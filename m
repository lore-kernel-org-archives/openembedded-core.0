Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QghxQ-0000wJ-DC
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 20:45:20 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jul 2011 11:41:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,522,1304319600"; d="scan'208";a="27067920"
Received: from unknown (HELO [10.255.14.40]) ([10.255.14.40])
	by fmsmga002.fm.intel.com with ESMTP; 12 Jul 2011 11:41:21 -0700
Message-ID: <4E1C9551.7070803@linux.intel.com>
Date: Tue, 12 Jul 2011 11:41:21 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1310425837.git.sgw@linux.intel.com>	<d92f0fcf6f83379a91b23e697cd43ac00078257e.1310425837.git.sgw@linux.intel.com>
	<C1E5A836-FA0D-40EF-9257-11885C935182@dominion.thruhere.net>
In-Reply-To: <C1E5A836-FA0D-40EF-9257-11885C935182@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 08/26] sqlite3: inherit shared_lib class
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
X-List-Received-Date: Tue, 12 Jul 2011 18:45:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/2011 12:00 AM, Koen Kooi wrote:
>
> Op 12 jul 2011, om 01:13 heeft Saul Wold het volgende geschreven:
>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>> meta/recipes-support/sqlite/sqlite3.inc |   10 ++--------
>> 1 files changed, 2 insertions(+), 8 deletions(-)
>>
>> diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
>> index a5d122d..5f1adb3 100644
>> --- a/meta/recipes-support/sqlite/sqlite3.inc
>> +++ b/meta/recipes-support/sqlite/sqlite3.inc
>> @@ -5,7 +5,7 @@ DEPENDS = "readline ncurses"
>> DEPENDS_virtclass-native = ""
>> LICENSE = "PD"
>>
>> -inherit autotools pkgconfig
>> +inherit autotools pkgconfig shared_lib
>
> that has lib${PN} at the end of packages
>
The renamed shlibpackaging.bbclass has PACKAGES += "lib${PN}, that an 
perpend according to my understanding.

>> -PACKAGES = "lib${PN} lib${PN}-dev lib${PN}-doc ${PN} ${PN}-dbg"
>
> And this one at the front.
>
So they are the same.

Sau!

>> -FILES_${PN} = "${bindir}/*"
>> -FILES_lib${PN} = "${libdir}/*.so.*"
>> -FILES_lib${PN}-dev = "${libdir}/*.a ${libdir}/*.la ${libdir}/*.so \
>> -		       ${libdir}/pkgconfig ${includedir}"
>> -FILES_lib${PN}-doc = "${docdir} ${mandir} ${infodir}"
>> -AUTO_LIBNAME_PKGS = "lib${PN}"
>> +FILES_lib${PN}-doc += "${docdir} ${mandir} ${infodir}"
>>
>> BBCLASSEXTEND = "native nativesdk"
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


