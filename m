Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RkgO5-00076b-1g
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 19:25:33 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Jan 2012 10:18:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="96646296"
Received: from unknown (HELO [10.255.13.28]) ([10.255.13.28])
	by orsmga002.jf.intel.com with ESMTP; 10 Jan 2012 10:18:03 -0800
Message-ID: <4F0C80DA.8030904@linux.intel.com>
Date: Tue, 10 Jan 2012 10:18:02 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326174744.git.sgw@linux.intel.com>
	<a471d342424502de48f28c4f8297d490f2cd1443.1326174744.git.sgw@linux.intel.com>
	<CAMKF1sqa4Z3QTSoUG2g_SGHE164WiWchTZghrW-yM2Btgnst5A@mail.gmail.com>
In-Reply-To: <CAMKF1sqa4Z3QTSoUG2g_SGHE164WiWchTZghrW-yM2Btgnst5A@mail.gmail.com>
Subject: Re: [CONSOLIDATED PULL 03/22] site/common-uclibc: Cache gl_cv_func_wcwidth_works
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
X-List-Received-Date: Tue, 10 Jan 2012 18:25:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/10/2012 10:13 AM, Khem Raj wrote:
> please drop this patch. Its superseded by my pull request.
>
Looks like this got pulled, will there be a problem?

Sau!

> On Mon, Jan 9, 2012 at 9:53 PM, Saul Wold<sgw@linux.intel.com>  wrote:
>> From: Khem Raj<raj.khem@gmail.com>
>>
>> Its not computed properly during configure and
>> we configure uclibc with widechar support anyway
>> so its fine to cache it. It fixes the errors like
>>
>> | In file included from ./stdio.h:31:0,
>> |                  from fpurge.h:20,
>> |                  from fpurge.c:20:
>> | /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/sysroots/qemux86/usr/include/stdio.h:662:40: error: expected declaration specifiers or '...' before '(' token
>> | make[4]: *** [fpurge.o] Error 1
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>>   meta/site/common-uclibc |    1 +
>>   1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/site/common-uclibc b/meta/site/common-uclibc
>> index 331c2a2..c2ad42d 100644
>> --- a/meta/site/common-uclibc
>> +++ b/meta/site/common-uclibc
>> @@ -21,6 +21,7 @@ ac_cv_func_vsnprintf_c99=${ac_cv_func_vsnprintf_c99=yes}
>>   glib_cv_compliant_posix_memalign=${glib_cv_compliant_posix_memalign=1}
>>   glib_cv_long_long_format=${glib_cv_long_long_format=ll}
>>   glib_cv_have_qsort_r=${glib_cv_have_qsort_r=no}
>> +gl_cv_func_wcwidth_works=${gl_cv_func_wcwidth_works=yes}
>>
>>   #dbus-glib
>>   ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
>> --
>> 1.7.6.5
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


