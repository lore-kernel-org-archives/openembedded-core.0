Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sn17G-0001tS-LK
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 07:30:06 +0200
Received: by eekd49 with SMTP id d49so3385446eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 22:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=GV5ZnETbTChOaAfHeWGplOoGK3P9p7wu6SkcWcir/wk=;
	b=SC1L2UHb1Rxao/slcFVhoi73nBFfXVYNIJQJ/Ce0mryahsXb6xcxHAIB5KmhYMODgv
	U3dLPGZht6PsJTOzlqySfqL0/xlf1U8UQS4DA8SUwVZ1EmYQ3sYJwOd0sszt0uXCyBho
	kUQ0PtUnrsC3a5aemFBOGaB15ithFiDcCBwLaU+cVIyXzn9I6lzC3UoPfTazWGAYgQkH
	V2cl7jjaGx8Kn6s/yURHnwRIPpmNpOaq+Bu4S98URppdiMy4t13I5/ACZR0vSedpAN1M
	g2Jj2ErYaVLyCMKenbC/StHEDz6YXYjTFyBUni4ARRflfnM0L1B1s0oJTlX8RNdG1FMl
	Cupw==
Received: by 10.14.95.138 with SMTP id p10mr6996416eef.110.1341551941066; Thu,
	05 Jul 2012 22:19:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Thu, 5 Jul 2012 22:18:30 -0700 (PDT)
In-Reply-To: <CAMKF1sqjrzDbnwRZ788O4+uQMv7nxU0eht5UVi=x7ce-wRgxvQ@mail.gmail.com>
References: <48ef71f7c5eea25278a5a9c9befd01123369e2f9.1341498745.git.raj.khem@gmail.com>
	<0218f823021f888115dba8e26ef98efa612cbe42.1341498745.git.raj.khem@gmail.com>
	<4FF64D14.2080303@linux.intel.com>
	<CAMKF1sqjrzDbnwRZ788O4+uQMv7nxU0eht5UVi=x7ce-wRgxvQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jul 2012 22:18:30 -0700
Message-ID: <CAMKF1srHn+tWBmZqY3gi+TazdXJqtfHSsBEUpY24KHVNsfbZ+w@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/14] eglibc: Add recipes for 2.16 release
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
X-List-Received-Date: Fri, 06 Jul 2012 05:30:06 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 5, 2012 at 8:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>
> On Thursday, July 5, 2012, Saul Wold <sgw@linux.intel.com> wrote:
>> On 07/05/2012 07:35 AM, Khem Raj wrote:
>>>
>>> Drop the patches that were either applied
>>> or fixed differenly in 2.16
>>>
>>> Add patches to fix ppc spe patches to match
>>> eglibc 2.16
>>>
>>> Fix CPPFLAGS to contain correct includepaths
>>> so autoconf cache is generated correctly
>>>
>>
>> Khem,
>>
>> Just to let you know that I will be doing builds with this set over the
>> weekend and since we are approaching a Milestone cut date, we will likely
>> wait until after the freeze date before including these changes.
>>
>> I will keep you posted on my results.
>
> Sure we need more testing on them so they land in good shape
> My aim is to use 2.16 in 1.3 release

btw. I have updated the tree with another patch for gcc-cross-initial
that fixes a long standing problem when using gold
as reported by Martin, I will inform the ml if the patches are updated
by keep an eye.

>>
>> Sau!
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   .../eglibc/cross-localedef-native_2.16.bb          |   44 ++
>>   .../eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch    |  108 ++++
>>   .../eglibc/eglibc-2.16/IO-acquire-lock-fix.patch   |   17 +
>>   .../eglibc-svn-arm-lowlevellock-include-tls.patch  |   21 +
>>   .../eglibc_fix_findidx_parameters.patch            |   38 ++
>>   .../eglibc/eglibc-2.16/generate-supported.mk       |   11 +
>>   .../eglibc/eglibc-2.16/initgroups_keys.patch       |   20 +
>>   .../eglibc/eglibc-2.16/ld-search-order.patch       |   56 ++
>>   .../eglibc/eglibc-2.16/mips-rld-map-check.patch    |   26 +
>>   .../eglibc/eglibc-2.16/multilib_readlib.patch      |   17 +
>>   .../recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch |  538
>> ++++++++++++++++++++
>>   .../eglibc/eglibc-2.16/ppc-sqrt_finite.patch       |  112 ++++
>>   .../eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch |  123 +++++
>>   .../eglibc/eglibc-2.16/rpc-bootstrap.patch         |   63 +++
>>   .../eglibc-2.16/use-sysroot-cxx-headers.patch      |   42 ++
>>   meta/recipes-core/eglibc/eglibc-initial_2.16.bb    |    6 +
>>   meta/recipes-core/eglibc/eglibc-locale_2.16.bb     |    1 +
>>   meta/recipes-core/eglibc/eglibc_2.16.bb            |  146 ++++++
>>   18 files changed, 1389 insertions(+)
>>   create mode 100644
>> meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
>>   create mode 100644
>> meta/recipes-core/eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch
>>   create mode 100644
>> meta/recipes-core/eglibc/eglibc-2.16/IO-acquire-lock-fix.patch
>>   create mode 100644
>> meta/recipes-core/eglibc/eglibc-2.16/eglibc-svn-arm-lowlevellock-include-tls.patch
>>   create mode 100644
>> meta/recipes-core/eglibc/eglibc-2.16/eglibc_fix_findidx_parameters.patch
>>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/etc/ld.so.conf
>>   create mode 100644
>> meta/recipes-core/eglibc/eglibc-2.16/generate-supported.mk
>>   create mode 100644
>> meta/recipes-core/eglibc/eglibc-2.16/initgroups_keys.patch
>>   create mode 100644
>> meta/recipes-core/eglibc/eglibc-2.16/ld-search-order.patch
>>   create mode 100644
>> meta/recipes-core/eglibc/eglibc-2.16/mips-rld-map-check.patch
>>   create mode 100644
>> meta/recipes-core/eglibc/eglibc-2.16/multilib_readlib.patch
>>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch
>>   create mode 100644
>> meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt_finite.patch
>>   create mode 100644
>> meta/recipes-core/eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch
>>   create mode 100644
>> meta/recipes-core/eglibc/eglibc-2.16/rpc-bootstrap.patch
>>   create mode 100644
>> meta/recipes-core/eglibc/eglibc-2.16/use-sysroot-cxx-headers.patch
>>   create mode 100644 meta/recipes-core/eglibc/eglibc-initial_2.16.bb
>>   create mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.16.bb
>>   create mode 100644 meta/recipes-core/eglibc/eglibc_2.16.bb
>>
>> diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
>> b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
>> new file mode 100644
>> index 0000000..88c701e
>> --- /dev/null
>> +++ b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
>> @@ -0,0 +1,44 @@
>> +DESCRIPTION = "Cross locale generation tool for eglibc"
>> +HOMEPAGE = "http://www.eglibc.org/home"
>> +SECTION = "libs"
>> +LICENSE = "LGPL-2.1"
>> +
>> +LIC_DIR = "${WORKDIR}/${EGLIBC_BRANCH}/libc"
>> +LIC_FILES_CHKSUM = "file://${LIC_D


