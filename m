Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S7Xzp-00021Z-Bq
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 21:07:01 +0100
Received: from mail-gx0-f180.google.com ([209.85.161.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 13 Mar 2012 12:58:10 -0700
Received: by gglu1 with SMTP id u1so1347707ggl.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 12:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=meYSeaSQNts3juSQMapd+owRWIlwdbY7JOhvipOKeZc=;
	b=ULYvd54FqrXH+E0QqQWcKnl2T5NV7G8tJTQvtOCiLc9YxZ9dnHzolGD7bAKB+ksld6
	9Ofhd+fQyQPEmZa97Ys3aCyna1ilg7zgKZOJnSbvELyqIowypML7MMOBbkS2MXErKNDA
	NwM2LyQSSZ+uY3TfHzxfRjl5ftUELWvQgMNQoENORCCa9PyjgLDU1nXXmm4ZDsTm8J4G
	u7KUedlxgDQYTZEyBVGS8JiWuwplvU/spkeUPLSLtdBV2QzCaBe1iOi4urLAj0g/BPvm
	GqitINbFvjnjvFSP+akiqS1ZzmtQpiy4GR0r8YnXziZNh7iMXSE8KrLVnCmy/gWvEDJT
	chxg==
Received: by 10.60.4.106 with SMTP id j10mr12863009oej.47.1331668689244;
	Tue, 13 Mar 2012 12:58:09 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id b6sm2288991obe.12.2012.03.13.12.58.07
	(version=SSLv3 cipher=OTHER); Tue, 13 Mar 2012 12:58:08 -0700 (PDT)
Message-ID: <4F5FA6D7.6070501@intel.com>
Date: Tue, 13 Mar 2012 12:58:15 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1331604310.git.scott.a.garman@intel.com>
	<2e3c4ca4c3c2dfc8b8e1333e61b239251b4f4efb.1331604310.git.scott.a.garman@intel.com>
	<1331644607.16878.0.camel@ted>
In-Reply-To: <1331644607.16878.0.camel@ted>
X-Gm-Message-State: ALoCoQkYbapc84VpgqqPmwHIuyyFDOp2TE3CxB8vQEgNMe3lnWR6k83dduWf0yHouEBKeqHf28NK
Subject: Re: [PATCH 3/3] gettext: do not set libncurses prefix explicitly
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
X-List-Received-Date: Tue, 13 Mar 2012 20:07:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/13/2012 06:16 AM, Richard Purdie wrote:
> On Mon, 2012-03-12 at 19:08 -0700, Scott Garman wrote:
>> The --with-libncurses-prefix configure option was added before
>> this recipe had ncurses in DEPENDS, so it should be safe to
>> remove it.
>>
>> Signed-off-by: Scott Garman<scott.a.garman@intel.com>
>> ---
>>   meta/recipes-core/gettext/gettext_0.18.1.1.bb |    5 +----
>>   1 files changed, 1 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
>> index 3c65dca..daee5c0 100644
>> --- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
>> +++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
>> @@ -5,7 +5,7 @@ SECTION = "libs"
>>   LICENSE = "GPL-3+&  LGPL-2.1+"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>>
>> -PR = "r7"
>> +PR = "r8"
>>   DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
>>   DEPENDS_virtclass-native = "libxml2-native"
>>   PROVIDES = "virtual/libintl virtual/gettext"
>> @@ -21,8 +21,6 @@ SRC_URI_append_libc-uclibc = " file://wchar-uclibc.patch \
>>   SRC_URI[md5sum] = "3dd55b952826d2b32f51308f2f91aa89"
>>   SRC_URI[sha256sum] = "93ac71a7afa5b70c1b1032516663658c51e653087f42a3fc8044752c026443e9"
>>
>> -#PARALLEL_MAKE = ""
>> -
>>   inherit autotools
>>
>>   EXTRA_OECONF += "--without-lispdir \
>> @@ -32,7 +30,6 @@ EXTRA_OECONF += "--without-lispdir \
>>                    --disable-native-java \
>>                    --disable-openmp \
>>                    --with-included-glib \
>> -                 --with-libncurses-prefix=${STAGING_LIBDIR}/.. \
>>                    --without-emacs \
>>                    --without-cvs \
>>                    --without-git \
>
> Sadly this breaks gettext for me as I'm now seeing things like:
>
> i586-poky-linux-libtool: link: i586-poky-linux-gcc -m32 -march=i586 --sysroot=/media/build1/poky/build/tmp/sysroots/qemux86 -std=gnu99 -O2 -pipe -g -feliminate-unused-debug-types -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o .libs/recode-sr-latin recode_sr_latin-recode-sr-latin.o recode_sr_latin-filter-sr-latin.o  ../gnulib-lib/.libs/libgettextlib.so -L/usr/lib -lc -lncurses
> /media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.6.4/ld: warning: library search path "/usr/lib" is unsafe for cross-compilation
> /media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.6.4/ld: skipping incompatible /usr/lib/libtinfo.so when searching for -ltinfo
> /media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.6.4/ld: skipping incompatible /usr/lib/libtinfo.a when searching for -ltinfo
>
> in the logs which triggers a QA warning.

Argh. Please revert that commit then. It was harmless on my two build 
test systems, but apparently it is needed on others to avoid host 
contamination.

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


