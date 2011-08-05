Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpNlN-0006mK-Pg
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 19:00:46 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Aug 2011 09:56:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,324,1309762800"; 
   d="scan'208";a="4501645"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Aug 2011 09:56:14 -0700
Message-ID: <4E3C20AE.9070907@linux.intel.com>
Date: Fri, 05 Aug 2011 09:56:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1312484099-29314-1-git-send-email-galak@kernel.crashing.org>
	<6E357E06-687D-4B2C-B82E-973ABC9973F9@kernel.crashing.org>
In-Reply-To: <6E357E06-687D-4B2C-B82E-973ABC9973F9@kernel.crashing.org>
Subject: Re: [PATCH] gcc: use ${base_lib} to match gcc default	configuration
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
X-List-Received-Date: Fri, 05 Aug 2011 17:00:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/05/2011 09:53 AM, Kumar Gala wrote:
>
> On Aug 4, 2011, at 1:54 PM, Kumar Gala wrote:
>
>> Rather than tweaking MULTILIB_DIRNAMES&  MULTILIB_OSDIRNAMES like is
>> done for x86-64 via 64bithack.patch.  We can just go with gcc defaults
>> and utilize ${base_lib} for where to find gcc libs.
>>
>> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
>> ---
>> .../gcc/gcc-cross-intermediate.inc                 |    2 +-
>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
>> index df5958a..7b1bb38 100644
>> --- a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
>> @@ -34,7 +34,7 @@ do_compile () {
>> do_install () {
>> 	oe_runmake 'DESTDIR=${D}' install
>> 	install -d ${D}${target_base_libdir}/
>> -	mv ${D}${exec_prefix}/${TARGET_SYS}/lib/* ${D}${target_base_libdir}/
>> +	mv ${D}${exec_prefix}/${TARGET_SYS}/${baselib}/* ${D}${target_base_libdir}/
>>
>> 	# We don't really need this (here shares/ contains man/, info/, locale/).
>> 	rm -rf ${D}${datadir}/
>> --
>> 1.7.3.4
>
> ping

Kumar,

I need to check with Richard on the bitbake.conf and this change, it's 
in my pending queue for a pull later today.

Sau!

>
> - k
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


