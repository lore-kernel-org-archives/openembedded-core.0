Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S115E-0000kn-ED
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 20:45:36 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Feb 2012 11:37:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="114620584"
Received: from unknown (HELO [10.255.15.58]) ([10.255.15.58])
	by orsmga002.jf.intel.com with ESMTP; 24 Feb 2012 11:37:11 -0800
Message-ID: <4F47E6E7.6050808@linux.intel.com>
Date: Fri, 24 Feb 2012 11:37:11 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1330109787.git.sgw@linux.intel.com>
	<e8916ebbe105cd17ac91f389787dabddf78028e7.1330109787.git.sgw@linux.intel.com>
	<20120224190842.GL3769@jama.jama.net>
In-Reply-To: <20120224190842.GL3769@jama.jama.net>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 1/2] gnupg: Update checksum, fix configure and compliation issues
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
X-List-Received-Date: Fri, 24 Feb 2012 19:45:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2012 11:08 AM, Martin Jansa wrote:
> On Fri, Feb 24, 2012 at 10:59:20AM -0800, Saul Wold wrote:
>> This recipe was added, but did not have the correct
>> checksum information for the LIC_FILES_CHKSUM or the
>> SRC_URI.  Also disable Documetnation for now due to
>> older autotools issue.
>
> BTW: those checksums matches gnupg_1.4.10 which is available in
> oe-classic and there is also similar patch (like mpfr from today)
> for thumb issues in gnupg/mpi/longlong.h.
>
I am kind of suprised and confused by this, how could the 1.4.10 which 
is a GPLv3 license have the same checksum as the 1.4.7 version.  I just 
verified (again) the md5sum of the 1.4.7 version and it's correct.

I also have the long-long-thumb.patch in this version, or is the same as 
the oe-classic version.

Are you suggesting I need something else?

> Maybe it would be worth updating from there if there isn't reason to
> hold on 1.4.7.
>
We need 1.4.7 because it's the last GPLv2 version.


Sau!

> Cheers,
>
>>
>> [YOCTO #1966]
>>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>>   .../gnupg/gnupg-1.4.7/configure.patch              |   17 +++++++++++++++++
>>   meta/recipes-support/gnupg/gnupg_1.4.7.bb          |   17 +++++++++--------
>>   2 files changed, 26 insertions(+), 8 deletions(-)
>>   create mode 100644 meta/recipes-support/gnupg/gnupg-1.4.7/configure.patch
>>
>> diff --git a/meta/recipes-support/gnupg/gnupg-1.4.7/configure.patch b/meta/recipes-support/gnupg/gnupg-1.4.7/configure.patch
>> new file mode 100644
>> index 0000000..e005ac6
>> --- /dev/null
>> +++ b/meta/recipes-support/gnupg/gnupg-1.4.7/configure.patch
>> @@ -0,0 +1,17 @@
>> +
>> +Upstream-Status: Inappropriate [configuration]
>> +
>> +Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> +
>> +Index: gnupg-1.4.7/configure.ac
>> +===================================================================
>> +--- gnupg-1.4.7.orig/configure.ac
>> ++++ gnupg-1.4.7/configure.ac
>> +@@ -827,7 +827,6 @@ else
>> +   AC_SUBST(USE_NLS)
>> +   AC_SUBST(USE_INCLUDED_LIBINTL)
>> +   AC_SUBST(BUILD_INCLUDED_LIBINTL)
>> +-  AM_PO_SUBDIRS
>> + fi
>> +
>> + if test "$try_extensions" = yes || test x"$card_support" = xyes ; then
>> diff --git a/meta/recipes-support/gnupg/gnupg_1.4.7.bb b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
>> index daea5aa..f033659 100644
>> --- a/meta/recipes-support/gnupg/gnupg_1.4.7.bb
>> +++ b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
>> @@ -5,18 +5,18 @@ SECTION = "console/utils"
>>
>>   LICENSE = "GPLv2"
>>
>> -LIC_FILES_CHKSUM = "file://COPYING;md5="
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
>>
>> -PR = "r4"
>> +PR = "r5"
>>
>>   SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-${PV}.tar.bz2 \
>>              file://long-long-thumb.patch \
>> -           file://mips_gcc4.4.patch"
>> +           file://configure.patch \
>> +           file://mips_gcc4.4.patch \
>> +           file://curl_typeof_fix_backport.patch"
>>
>> -SRC_URI[md5sum] = "dcf7ed712997888d616e029637bfc303"
>> -SRC_URI[sha256sum] = "a2907f4432d67894e425e48ae85785dd60ecb01658c9682bcd96f5e91043bb38"
>> -
>> -S = "${WORKDIR}/gnupg-${PV}"
>> +SRC_URI[md5sum] = "b06a141cca5cd1a55bbdd25ab833303c"
>> +SRC_URI[sha256sum] = "69d18b7d193f62ca27ed4febcb4c9044aa0c95305d3258fe902e2fae5fc6468d"
>>
>>   inherit autotools gettext
>>
>> @@ -73,7 +73,8 @@ EXTRA_OECONF = "--disable-ldap \
>>   		--with-bzip2=${STAGING_LIBDIR}/.. \
>>   		--disable-selinux-support \
>>                   --with-readline=${STAGING_LIBDIR}/.. \
>> -                ac_cv_sys_symbol_underscore=yes"
>> +                ac_cv_sys_symbol_underscore=no \
>> +		"
>>
>>   do_install () {
>>   	autotools_do_install
>> --
>> 1.7.7.6
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


