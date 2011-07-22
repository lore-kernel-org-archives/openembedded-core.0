Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QkJ00-0008Dn-3a
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 18:54:52 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QkIw0-00015x-SO from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 09:50:44 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 22 Jul 2011 09:48:21 -0700
Received: from [172.30.80.68] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.289.1;
	Fri, 22 Jul 2011 09:50:44 -0700
Message-ID: <4E29AA5D.6080101@mentor.com>
Date: Fri, 22 Jul 2011 09:50:37 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311352057.git.tom_rini@mentor.com>	<ea9bd3c17709ba37b964e4824e8818bcd4723135.1311352057.git.tom_rini@mentor.com>
	<3DA9FF0A-3193-4606-9A94-561B09173340@kernel.crashing.org>
In-Reply-To: <3DA9FF0A-3193-4606-9A94-561B09173340@kernel.crashing.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 22 Jul 2011 16:48:21.0202 (UTC)
	FILETIME=[2A2D0B20:01CC488F]
Subject: Re: [PATCH 1/8] siteinfo: Move certain samba entries to common-linux
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
X-List-Received-Date: Fri, 22 Jul 2011 16:54:52 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/22/2011 09:39 AM, Kumar Gala wrote:
>>
>> diff --git a/meta/site/powerpc-common b/meta/site/powerpc-common
>> index e69de29..145da0d 100644
>> --- a/meta/site/powerpc-common
>> +++ b/meta/site/powerpc-common
>> @@ -0,0 +1,325 @@
>> +ac_cv_func_getpgrp_void=yes
>> +ac_cv_func_setpgrp_void=yes
>> +ac_cv_func_setgrent_void=yes
>> +ac_cv_func_malloc_0_nonnull=yes
>> +ac_cv_func_malloc_works=yes
>> +ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
>> +ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
>> +ac_cv_func_setvbuf_reversed=no
>> +ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
>> +ac_cv_sizeof_bool=${ac_cv_sizeof_bool=1}
>> +ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
>> +ac_cv_sizeof_double=${ac_cv_sizeof_double=8}
>> +ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
>> +ac_cv_sizeof_int_p=${ac_cv_sizeof_int_p=4}
>> +ac_cv_sizeof_float=${ac_cv_sizeof_float=4}
>> +ac_cv_sizeof_long=${ac_cv_sizeof_long=4}
>> +ac_cv_sizeof_long_int=${ac_cv_sizeof_long_int=4}
>> +ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
>> +ac_cv_sizeof_short=${ac_cv_sizeof_short=2}
>> +ac_cv_sizeof_unsigned_char=${ac_cv_sizeof_unsigned_char=1}
>> +ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
>> +ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=4}
>> +ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=4}
>> +ac_cv_sizeof_long_p=${ac_cv_sizeof_long_p=4}
>> +ac_cv_sizeof_wchar_t=${ac_cv_sizeof_wchar_t=4}
>> +ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=8}
>> +ac_cv_sys_restartable_syscalls=yes
>> +ac_cv_type___int64=${ac_cv_type___int64=no}
>> +ac_cv_type_size_t=${ac_cv_type_size_t=yes}
>> +ac_cv_type_void_p=${ac_cv_type_void_p=yes}
>> +ac_cv_uchar=${ac_cv_uchar=no}
>> +ac_cv_uint=${ac_cv_uint=yes}
>> +ac_cv_ulong=${ac_cv_ulong=yes}
>> +ac_cv_ushort=${ac_cv_ushort=yes}
>> +ac_cv_time_r_type=${ac_cv_time_r_type=POSIX}
>> +cookie_io_functions_use_off64_t=${cookie_io_functions_use_off64_t=yes}
> 
> 
> This is wrong for PPC.. will break ppc64

Yeah, that wasn't supposed to be in there, sorry.  I'll v2 this all
shortly then.


-- 
Tom Rini
Mentor Graphics Corporation


