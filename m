Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id DCE466FFC8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 17:15:24 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id cy9so236660068pac.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jan 2016 09:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=foYkQr97blfbIoRugDjfryejL1sPDnTFMJzQNqt0dqY=;
	b=CZZHebKr/myDQ5mWQbXuJ61n803bdsA04nyUvtryqR+EtYDjfPepZGbGL+Ih2EdU5A
	Wve8vubrtl2uS8DKgdmvKQyF159Y5XCaCAolAaSnw3lzMMZHMWMlKENyxOlkAQtCkcJX
	LMMXbxxW8SzMpvfogAulns6N56gOQX659SQAHF4gFfcR97SWw8MM5Qq8DkEYaWmq8J05
	/lZ6KIrGF9oA1kFcOrHwLYJQFG2bZeFrGWu5aHjqTRVPzb+qDxD9ecuLbnbxehuRVc0l
	7hnsYHCl6RtNZVrKr4/8zPyCBDRajvuqkCdvdjgrCWXZXFm7rYK2n3dgqI/2yC1VkVlg
	v80A==
X-Received: by 10.67.7.101 with SMTP id db5mr142392823pad.53.1452100525293;
	Wed, 06 Jan 2016 09:15:25 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:e4f9:3d7b:7fa1:22be?
	([2601:202:4000:1239:e4f9:3d7b:7fa1:22be])
	by smtp.googlemail.com with ESMTPSA id
	q87sm99190538pfa.45.2016.01.06.09.15.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jan 2016 09:15:24 -0800 (PST)
To: "Belal, Awais" <Awais_Belal@mentor.com>
References: <1450869629-27805-1-git-send-email-awais_belal@mentor.com>
	<2021B186DC632746BD5A3CE32F12BD28011FB77C51@EU-MBX-02.mgc.mentorg.com>
	<5689D53A.3040902@gmail.com>
	<2021B186DC632746BD5A3CE32F12BD28011FB78A03@EU-MBX-02.mgc.mentorg.com>
	<2021B186DC632746BD5A3CE32F12BD28011FB7A43D@EU-MBX-02.mgc.mentorg.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <568D4BAA.9050001@gmail.com>
Date: Wed, 6 Jan 2016 09:15:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <2021B186DC632746BD5A3CE32F12BD28011FB7A43D@EU-MBX-02.mgc.mentorg.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dizzy][PATCH] grub2: Fix CVE-2015-8370
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jan 2016 17:15:25 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Awais,

this is what I am seeing.

NOTE: Executing RunQueue Tasks
ERROR: Command Error: exit status: 1  Output:
Applying patch 0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
patching file grub-core/lib/crypto.c
Hunk #1 FAILED at 470.
1 out of 1 hunk FAILED -- rejects in file grub-core/lib/crypto.c
patching file grub-core/normal/auth.c
Hunk #1 FAILED at 174.
1 out of 1 hunk FAILED -- rejects in file grub-core/normal/auth.c
Patch 0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch does
not apply (enforce with -f)
ERROR: Function failed: patch_do_patch
ERROR: Logfile of failure stored in:
/home/akuster/oss/maint/mylayers/poky/build/tmp/work/i586-poky-linux/grub/2.00-r1/temp/log.do_patch.3029
ERROR: Task 1
(/home/akuster/oss/maint/mylayers/poky/meta/recipes-bsp/grub/grub_2.00.bb,
do_patch) failed with exit code '1'


I am using my contrib akuster/dizzy-next.

I will hand fixup the changes. please give me a few days.

- armin


On 01/06/2016 01:43 AM, Belal, Awais wrote:
> Ping!
> 
> BR,
> Awais
> 
> ________________________________________
> From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-bounces@lists.openembedded.org] on behalf of Belal, Awais
> Sent: Monday, January 04, 2016 12:53 PM
> To: akuster808
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [dizzy][PATCH] grub2: Fix CVE-2015-8370
> 
> Hi Armin,
> 
> Odd, applies cleanly on dizzy for me. Can you please share the patch log?
> 
> On a scratch build dir, I get the following:
> --------------------------------------------------------------
> awais@alpha:~/yocto/build-dizzy$ bitbake -c patch grub
> Parsing recipes: 100% |#############################################################| Time: 00:00:36
> Parsing of 1458 .bb files complete (0 cached, 1458 parsed). 1914 targets, 66 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> 
> Build Configuration:
> BB_VERSION        = "1.24.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-14.04"
> TARGET_SYS        = "x86_64-poky-linux"
> MACHINE           = "amdfalconx86"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.7.3"
> TUNE_FEATURES     = "dbfp4"
> TARGET_FPU        = ""
> meta
> meta-yocto
> meta-yocto-bsp    = "(detachedfromorigin/dizzy):6d34267e0a13e10ab91b60590b27a2b5ba3b7da6"
> common
> meta-amdfalconx86 = "(detachedfromorigin/dizzy):84ae10ad68c7b253ab87558c5a6df057c9a84f08"
> meta-oe
> meta-python       = "(detachedfromorigin/dizzy):7f1df52e9409edcc4d4cd5f34694f8740f56e1bf"
> 
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> NOTE: Tasks Summary: Attempted 10 tasks of which 0 didn't need to be rerun and all succeeded.
> awais@alpha:~/yocto/build-dizzy$
> --------------------------------------------------------------
> 
> BR,
> Awais
> 
> ________________________________________
> From: akuster808 [akuster808@gmail.com]
> Sent: Monday, January 04, 2016 7:13 AM
> To: Belal, Awais
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [dizzy][PATCH] grub2: Fix CVE-2015-8370
> 
> On 12/31/15 5:38 AM, Belal, Awais wrote:
> Awais,
> 
>> Ping!
> This patch does not apply to the current dizzy branch.
> 
> is there a dependency patch I missed to apply?
> 
> regards,
> Armin
>>
>> BR,
>> Awais
>>
>> ________________________________________
>> From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-bounces@lists.openembedded.org] on behalf of Belal, Awais
>> Sent: Wednesday, December 23, 2015 4:20 PM
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [dizzy][PATCH] grub2: Fix CVE-2015-8370
>>
>> http://git.savannah.gnu.org/cgit/grub.git/commit/?id=451d80e52d851432e109771bb8febafca7a5f1f2
>>
>> Signed-off-by: Awais Belal <awais_belal@mentor.com>
>> ---
>>  ...E-2015-8370-Grub2-user-pass-vulnerability.patch | 52 ++++++++++++++++++++++
>>  meta/recipes-bsp/grub/grub-efi_2.00.bb             |  1 +
>>  meta/recipes-bsp/grub/grub_2.00.bb                 |  1 +
>>  3 files changed, 54 insertions(+)
>>  create mode 100644 meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
>>
>> diff --git a/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch b/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
>> new file mode 100644
>> index 0000000..f9252e9
>> --- /dev/null
>> +++ b/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch
>> @@ -0,0 +1,52 @@
>> +Upstream-Status: Accepted
>> +Signed-off-by: Awais Belal <awais_belal@mentor.com>
>> +
>> +From 451d80e52d851432e109771bb8febafca7a5f1f2 Mon Sep 17 00:00:00 2001
>> +From: Hector Marco-Gisbert <hecmargi@upv.es>
>> +Date: Wed, 16 Dec 2015 04:57:18 +0000
>> +Subject: Fix security issue when reading username and password
>> +
>> +This patch fixes two integer underflows at:
>> +  * grub-core/lib/crypto.c
>> +  * grub-core/normal/auth.c
>> +
>> +CVE-2015-8370
>> +
>> +Signed-off-by: Hector Marco-Gisbert <hecmargi@upv.es>
>> +Signed-off-by: Ismael Ripoll-Ripoll <iripoll@disca.upv.es>
>> +Also-By: Andrey Borzenkov <arvidjaar@gmail.com>
>> +---
>> +diff --git a/grub-core/lib/crypto.c b/grub-core/lib/crypto.c
>> +index 010e550..683a8aa 100644
>> +--- a/grub-core/lib/crypto.c
>> ++++ b/grub-core/lib/crypto.c
>> +@@ -470,7 +470,8 @@ grub_password_get (char buf[], unsigned buf_size)
>> +
>> +       if (key == '\b')
>> +       {
>> +-        cur_len--;
>> ++        if (cur_len)
>> ++          cur_len--;
>> +         continue;
>> +       }
>> +
>> +diff --git a/grub-core/normal/auth.c b/grub-core/normal/auth.c
>> +index c6bd96e..8615c48 100644
>> +--- a/grub-core/normal/auth.c
>> ++++ b/grub-core/normal/auth.c
>> +@@ -174,8 +174,11 @@ grub_username_get (char buf[], unsigned buf_size)
>> +
>> +       if (key == '\b')
>> +       {
>> +-        cur_len--;
>> +-        grub_printf ("\b");
>> ++        if (cur_len)
>> ++          {
>> ++            cur_len--;
>> ++            grub_printf ("\b");
>> ++          }
>> +         continue;
>> +       }
>> +
>> +--
>> +cgit v0.9.0.2
>> diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
>> index 7674255..6822e7a 100644
>> --- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
>> +++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
>> @@ -30,6 +30,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
>>             file://grub-2.00-add-oe-kernel.patch \
>>             file://grub-efi-fix-with-glibc-2.20.patch \
>>             file://0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch \
>> +           file://0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch \
>>            "
>>  SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
>>  SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
>> diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.00.bb
>> index d4df676..94b6da9 100644
>> --- a/meta/recipes-bsp/grub/grub_2.00.bb
>> +++ b/meta/recipes-bsp/grub/grub_2.00.bb
>> @@ -25,6 +25,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
>>            file://fix-endianness-problem.patch \
>>            file://grub2-remove-sparc64-setup-from-x86-builds.patch \
>>            file://0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patch \
>> +          file://0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.patch \
>>            "
>>
>>  SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

