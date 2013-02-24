Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1U9f2t-000392-N0
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Feb 2013 18:07:40 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id A367CF81252; Sun, 24 Feb 2013 09:51:12 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 33C67F81251;
	Sun, 24 Feb 2013 09:51:11 -0700 (MST)
Message-ID: <512A450E.8060107@mlbassoc.com>
Date: Sun, 24 Feb 2013 09:51:26 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20130222140918.682E65029C@opal> <20130224164338.GC3300@jama>
In-Reply-To: <20130224164338.GC3300@jama>
Subject: Re: [oe-commits] Constantin Musca : augeas: upgrade to 1.0.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Feb 2013 17:07:45 -0000
X-List-Received-Date: Sun, 24 Feb 2013 17:07:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-02-24 09:43, Martin Jansa wrote:
> On Fri, Feb 22, 2013 at 02:09:18PM +0000, git@git.openembedded.org wrote:
>> Module: openembedded-core.git
>> Branch: master
>> Commit: a711a8617c39b06c9a494d0ceae9f96f65b024f9
>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=a711a8617c39b06c9a494d0ceae9f96f65b024f9
>>
>> Author: Constantin Musca <constantinx.musca@intel.com>
>> Date:   Mon Feb 18 14:05:09 2013 +0200
>>
>> augeas: upgrade to 1.0.0
>
> Fails to fetch here:
> WARNING: Failed to fetch URL
> http://augeas.net/download/augeas-1.0.0.tar.gz, attempting MIRRORS if

Looks like it should be:
   http://download.augeas.net/download/augeas-1.0.0.tar.gz

> available
> ERROR: Fetcher failure: Fetch command failed with exit code 8, output:
> http://augeas.net/download/augeas-1.0.0.tar.gz:
> 2013-02-23 18:34:48 ERROR 404: Not Found.
>
> http://download.augeas.net/augeas-1.0.0.tar.gz
> Seems like correct URL now.
>
>>
>> 0001-Add-missing-argument-to-escape.patch: removed
>>      - included in the new version
>>
>> remove-gets.patch: not needed anymore
>>
>> add-missing-argz-conditional.patch: added
>>      - the Makefiles assume that the argz conditional
>> is present in configure.ac
>>
>> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>
>> ---
>>
>>   meta/recipes-extended/augeas/augeas.inc            |    2 +-
>>   .../0001-Add-missing-argument-to-escape.patch      |   29 --------------------
>>   .../augeas/add-missing-argz-conditional.patch      |   20 +++++++++++++
>>   .../augeas/augeas/remove-gets.patch                |   20 -------------
>>   meta/recipes-extended/augeas/augeas_0.10.0.bb      |    8 -----
>>   meta/recipes-extended/augeas/augeas_1.0.0.bb       |    6 ++++
>>   6 files changed, 27 insertions(+), 58 deletions(-)
>>
>> diff --git a/meta/recipes-extended/augeas/augeas.inc b/meta/recipes-extended/augeas/augeas.inc
>> index 479fb97..a0aa9dd 100644
>> --- a/meta/recipes-extended/augeas/augeas.inc
>> +++ b/meta/recipes-extended/augeas/augeas.inc
>> @@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1+"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=bbb461211a33b134d42ed5ee802b37ff"
>>
>>   SRC_URI = "http://augeas.net/download/${BP}.tar.gz \
>> -           file://0001-Add-missing-argument-to-escape.patch \
>> +           file://add-missing-argz-conditional.patch \
>>             "
>>
>>   DEPENDS = "readline libxml2"
>> diff --git a/meta/recipes-extended/augeas/augeas/0001-Add-missing-argument-to-escape.patch b/meta/recipes-extended/augeas/augeas/0001-Add-missing-argument-to-escape.patch
>> deleted file mode 100644
>> index 3d0d0e3..0000000
>> --- a/meta/recipes-extended/augeas/augeas/0001-Add-missing-argument-to-escape.patch
>> +++ /dev/null
>> @@ -1,29 +0,0 @@
>> -Upstream-Status: Backport
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -
>> -From 021ea39f8e400225e2d01b4c62eb9d56404f2ecd Mon Sep 17 00:00:00 2001
>> -From: Michael Chapman <mike@very.puzzling.org>
>> -Date: Fri, 16 Dec 2011 21:30:07 +1100
>> -Subject: [PATCH] Add missing argument to escape()
>> -
>> -Fixes ticket #242.
>> ----
>> - src/regexp.c |    2 +-
>> - 1 files changed, 1 insertions(+), 1 deletions(-)
>> -
>> -diff --git a/src/regexp.c b/src/regexp.c
>> -index cf0ea5d..811087d 100644
>> ---- a/src/regexp.c
>> -+++ b/src/regexp.c
>> -@@ -50,7 +50,7 @@ char *regexp_escape(const struct regexp *r) {
>> -     ret = fa_restrict_alphabet(r->pattern->str, strlen(r->pattern->str),
>> -                                &nre, &nre_len, 2, 1);
>> -     if (ret == 0) {
>> --        pat = escape(nre, nre_len);
>> -+        pat = escape(nre, nre_len, RX_ESCAPES);
>> -         free(nre);
>> -     }
>> - #endif
>> ---
>> -1.7.5.4
>> -
>> diff --git a/meta/recipes-extended/augeas/augeas/add-missing-argz-conditional.patch b/meta/recipes-extended/augeas/augeas/add-missing-argz-conditional.patch
>> new file mode 100644
>> index 0000000..abbdbaa
>> --- /dev/null
>> +++ b/meta/recipes-extended/augeas/augeas/add-missing-argz-conditional.patch
>> @@ -0,0 +1,20 @@
>> +Add missing GL_GENERATE_ARGZ_H conditional
>> +
>> +- GL_GENERATE_ARGZ_H is used in gnulib/lib/Makefile.am
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
>> +
>> +Index: augeas-1.0.0/configure.ac
>> +===================================================================
>> +--- augeas-1.0.0.orig/configure.ac
>> ++++ augeas-1.0.0/configure.ac
>> +@@ -55,6 +55,8 @@ AC_ARG_WITH([failmalloc],
>> +
>> + AM_CONDITIONAL([WITH_FAILMALLOC], [test x$with_failmalloc != xno])
>> +
>> ++AM_CONDITIONAL([GL_GENERATE_ARGZ_H], [test -n "$ARGZ_H"])
>> ++
>> + dnl --enable-debug=(yes|no)
>> + AC_ARG_ENABLE([debug],
>> +               [AC_HELP_STRING([--enable-debug=no/yes],
>> diff --git a/meta/recipes-extended/augeas/augeas/remove-gets.patch b/meta/recipes-extended/augeas/augeas/remove-gets.patch
>> deleted file mode 100644
>> index bd6e92c..0000000
>> --- a/meta/recipes-extended/augeas/augeas/remove-gets.patch
>> +++ /dev/null
>> @@ -1,20 +0,0 @@
>> -eglibc 2.16 has remove gets so check for it to be there before using it
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -
>> -Upstream-Status: Pending
>> -Index: augeas-0.10.0/gnulib/lib/stdio.in.h
>> -===================================================================
>> ---- augeas-0.10.0.orig/gnulib/lib/stdio.in.h	2011-03-03 17:07:59.000000000 -0800
>> -+++ augeas-0.10.0/gnulib/lib/stdio.in.h	2012-07-03 19:46:42.871894833 -0700
>> -@@ -161,8 +161,10 @@
>> - /* It is very rare that the developer ever has full control of stdin,
>> -    so any use of gets warrants an unconditional warning.  Assume it is
>> -    always declared, since it is required by C89.  */
>> -+#if defined gets
>> - #undef gets
>> - _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
>> -+#endif
>> -
>> - #if @GNULIB_FOPEN@
>> - # if @REPLACE_FOPEN@
>> diff --git a/meta/recipes-extended/augeas/augeas_0.10.0.bb b/meta/recipes-extended/augeas/augeas_0.10.0.bb
>> deleted file mode 100644
>> index 0840428..0000000
>> --- a/meta/recipes-extended/augeas/augeas_0.10.0.bb
>> +++ /dev/null
>> @@ -1,8 +0,0 @@
>> -require augeas.inc
>> -
>> -SRC_URI += "file://remove-gets.patch \
>> -           "
>> -PR = "r3"
>> -
>> -SRC_URI[md5sum] = "fe1834e90a066c3208ac0214622c7352"
>> -SRC_URI[sha256sum] = "ec111af06186216930176ebe5ecccdf7bf528528aee9acde1d5d70088484afca"
>> diff --git a/meta/recipes-extended/augeas/augeas_1.0.0.bb b/meta/recipes-extended/augeas/augeas_1.0.0.bb
>> new file mode 100644
>> index 0000000..2f7061a
>> --- /dev/null
>> +++ b/meta/recipes-extended/augeas/augeas_1.0.0.bb
>> @@ -0,0 +1,6 @@
>> +require augeas.inc
>> +
>> +PR = "r0"
>> +
>> +SRC_URI[md5sum] = "82131019432ecf8102e1491610ad2dd1"
>> +SRC_URI[sha256sum] = "31bf757c5b8197765946b3805f3793c32b03cd92a7a77ec95d37e71a1f131912"
>>
>>
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


