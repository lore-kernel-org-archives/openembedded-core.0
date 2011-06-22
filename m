Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZPrR-0004cH-EF
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 18:01:01 +0200
Received: by pwi1 with SMTP id 1so741596pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 08:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type;
	bh=4Xx2nYIz5LDpqVLSR+X5zRrftZTJsxLFo9Uf4+CFsfo=;
	b=NE13X+GZ3fbCQc/5QHY4/oZ/QpeA7iT6azfG7PUcffs1xY4qzduANcqUhoarE2sm3/
	+ZoktgOQPV0p/BnKYf4pnVjqEiHf2ZVu487IkpfPfUU/6JpbkaCqsBGnT+hyMsPPSVfz
	QDeY0TFCrWUKd+S3Bv81ehNBTWaKZfy/Ud9Pc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	b=Dqu1H89Fzb9UKIqgMAQqGMOEmJKTbMwyDaDOPv8ZU35uYnr+hViIps9DnztaCY0p9m
	ibiZAuAYnAKAT1MsrHboIDNWIW00oMl7T9Bd3WScew8xYeFg9vH9UHnttTjb3+7GpnJp
	WGJDuXZBTtIQq2P9hyv7zn207bI7b0tWUgB/g=
Received: by 10.142.218.7 with SMTP id q7mr183526wfg.246.1308758245564;
	Wed, 22 Jun 2011 08:57:25 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x8sm470615wfx.7.2011.06.22.08.57.22
	(version=SSLv3 cipher=OTHER); Wed, 22 Jun 2011 08:57:24 -0700 (PDT)
Message-ID: <4E0210DF.1000200@gmail.com>
Date: Wed, 22 Jun 2011 08:57:19 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1308706511.git.raj.khem@gmail.com>
	<1308757337.20015.72.camel@rex>
In-Reply-To: <1308757337.20015.72.camel@rex>
Subject: Re: [PATCH 0/4] uclibc and related fixes
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
X-List-Received-Date: Wed, 22 Jun 2011 16:01:01 -0000
X-Groupsio-MsgNum: 4530
Content-Type: multipart/mixed; boundary="------------060507060602030600070503"

--------------060507060602030600070503
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/22/2011 08:42 AM, Richard Purdie wrote:
> On Tue, 2011-06-21 at 18:44 -0700, Khem Raj wrote:
>> Fix uclibc build for x86_64
>> gettext compile failed on uclibc so fix it and additionally
>> remove unused patches
>> Add required support for systemd to function with uclibc
>> Quash a parse warning where uclibc-initial and uclibc
>> both provided libsegfault
>>
>> The following changes since commit 78de64f58b98101f5be5778e9ecbdaae5ba32997:
>>
>>    binutils_2.21.bb: Fix ld segfault exposed by eglibc 2.14 on x86_64 (2011-06-21 17:58:06 -0700)
>>
>> are available in the git repository at:
>>    git://git.openembedded.org/openembedded-core-contrib kraj/uclibc
>>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc
>>
>> Khem Raj (4):
>>    uclibc.inc: libsegfault is only RPROVIDED by uclibc
>>    gettext-0.18.1.1: Remove unused patches
>>    uclibc/x86_64/uClibc.machine: Enable ARCH_USE_MMU
>>    uclibc: Add support for $ORIGIN
>
> Merged to master, thanks.
>
> I had reservations about the first one as hardcoding PN can have issues
> with BBCLASSEXTEND but looking at the recipe, there are bigger issues if
> we were ever to do that :/
>

in attached patch I moved it to uclibc recipe is that better ?


> Cheers,
>
> Richard
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--------------060507060602030600070503
Content-Type: text/x-diff;
 name="0001-uclibc.inc-libsegfault-is-only-RPROVIDED-by-uclibc.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-uclibc.inc-libsegfault-is-only-RPROVIDED-by-uclibc.patc";
 filename*1="h"

From 28232ad0c9bea3133493e056e7d828958e74da66 Mon Sep 17 00:00:00 2001
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Jun 2011 01:47:33 -0700
Subject: [PATCH] uclibc.inc: libsegfault is only RPROVIDED by uclibc

Using ${PN} also means that uclibc-initial gets to provide it
which we do not want so move this to uclibc recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc.inc    |    1 -
 meta/recipes-core/uclibc/uclibc_git.bb |    5 +++++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 00f5e8d..13a6164 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -89,7 +89,6 @@ RPROVIDES_uclibc-dev += "libc-dev virtual-libc-dev"
 # uclibc does not really have libsegfault but then using the one from glibc is also not
 # going to work. So we pretend that we have it to make bitbake not pull other recipes
 # to satisfy this dependency for the images/tasks
-RPROVIDES_${PN} += "libsegfault"
 
 SRC_URI = "\
         http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz2;name=uClibc-${PV} \
diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index 6445243..d5b9e40 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -5,6 +5,11 @@ PV = "0.9.31+0.9.32rc3"
 PR = "${INC_PR}.4"
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
+# uclibc does not really have libsegfault but then using the one from glibc is also not
+# going to work. So we pretend that we have it to make bitbake not pull other recipes
+# to satisfy this dependency for the images/tasks
+
+RPROVIDES_${PN} += "libsegfault"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
 
 SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
-- 
1.7.4.1


--------------060507060602030600070503--
