Return-Path: <kirgene@gmail.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4130A605A0
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Aug 2013 15:53:18 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id bv4so536162qab.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Aug 2013 08:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=dJR8c4waTZeE63a9w0eKPMLyOvXxRKMvHQfT+j55LHQ=;
	b=lurrUrd06eyTmY5GA2RisNshaz7aoRjqVRqHQL/7UrvHxu34ZeGU0WvJKrRS4kPd+q
	5nxGyMtQukv75QmoeOjxs9XKVHtRCiC/mBwXezA83zrGH6GZt6MZ3F7+jlFaVq0UV0Br
	uhah3I1d6R+5UPrzC8SaRSnu9C1geVpQx8YMyWgon9khXxPHFf9opCBO+bv+xbEb5kM0
	fe+Ku326WNAMSk4anAVAXMoGTQlzA9Um5E+MtdoR31yIyaZnbXVbsDCtGX5eHPd/57Ka
	3q/cTaX4cUr2hLpLpFgMqz+OoItRYx3k7GXr9MQD87wCtxuixqFtjHboVSubsfARoC3C
	hRcw==
MIME-Version: 1.0
X-Received: by 10.224.2.194 with SMTP id 2mr24081162qak.40.1375631597858; Sun,
	04 Aug 2013 08:53:17 -0700 (PDT)
Received: by 10.49.108.39 with HTTP; Sun, 4 Aug 2013 08:53:17 -0700 (PDT)
In-Reply-To: <51FD5AB2.6020209@linux.intel.com>
References: <1375472467-8051-1-git-send-email-kirgene@gmail.com>
	<51FC1D1A.10608@linux.intel.com>
	<CADV-EXFtuyca0R_thUm89teFACNW8Fnv6zD0sg8kUw5Ae_d8Uw@mail.gmail.com>
	<51FD5AB2.6020209@linux.intel.com>
Date: Sun, 4 Aug 2013 18:53:17 +0300
Message-ID: <CADV-EXF_DqtaYYc2n_e_Epto-s_rpeeqFekrtOZ_PyuY7-8FCw@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] btrfs-tools: upgrade to upstream revision.
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
X-List-Received-Date: Sun, 04 Aug 2013 15:53:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

OK, I'll fix it and send v3 of this patch.
Best regards,
Yevhen


2013/8/3 Saul Wold <sgw@linux.intel.com>:
> On 08/03/2013 08:30 AM, Yevhen Kyriukha wrote:
>>
>> 2013/8/2 Saul Wold <sgw@linux.intel.com>:
>>>
>>>
>>> Please add an explanation of why the patches are removed and a
>>> Signed-off-by: in the commit message.
>>>
>>> Thanks
>>>          Sau!
>>>
>>>
>>>
>>> On 08/02/2013 12:41 PM, Yevhen Kyriukha wrote:
>>>>
>>>>
>>>> ---
>>>>    ...ix_race_condition_with_multithreaded_make.patch | 36
>>>> ----------------------
>>>>    .../btrfs-tools/btrfs-tools/fix_use_of_gcc.patch   | 31
>>>> -------------------
>>>>    .../btrfs-tools/btrfs-tools_git.bb                 | 13 +++-----
>>>>    3 files changed, 4 insertions(+), 76 deletions(-)
>>>>    delete mode 100644
>>>>
>>>> meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_race_condition_with_multithreaded_make.patch
>>>>    delete mode 100644
>>>> meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch
>>>>
>>>> diff --git
>>>>
>>>> a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_race_condition_with_multithreaded_make.patch
>>>>
>>>> b/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_race_condition_with_multithreaded_make.patch
>>>> deleted file mode 100644
>>>> index 40175b8..0000000
>>>> ---
>>>>
>>>> a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_race_condition_with_multithreaded_make.patch
>>>> +++ /dev/null
>>>> @@ -1,36 +0,0 @@
>>>> -Upstream-Status: Pending
>>>> -
>>>> -Fix makefile for multithreaded (make -j ) building.
>>>> -
>>>> -btrfsctl.c
>>>> -| i586-poky-linux-gcc  -m32   -march=i586
>>>> --sysroot=/intel/poky/builds/world/tmp/sysroots/qemux86
>>>> -Wp,-MMD,./.btrfsctl.o.d,-MT,btrfsctl.o -Wall -D_FILE_OFFSET_BITS=64
>>>> -D_FORTIFY_SOURCE=2 -O2 -pipe -g -feliminate-unused-debug-types -c
>>>> btrfsctl.c
>>>> -| btrfsctl.c:37:21: fatal error: version.h: No such file or directory
>>>> -| compilation terminated.
>>>> -| btrfslabel.c:40:21: fatal error: version.h: No such file or directory
>>>> -| compilation terminated.
>>>> -
>>>> -Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
>>>> -2012/01/02
>>>> -
>>>> -Index: git/Makefile
>>>> -===================================================================
>>>> ---- git.orig/Makefile
>>>> -+++ git/Makefile
>>>> -@@ -26,14 +26,13 @@ else
>>>> -       check = ls
>>>> - endif
>>>> -
>>>> --.c.o:
>>>> -+%.o: %.c version.h
>>>> -       $(check) $<
>>>> -       $(CC) $(DEPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c $<
>>>> -
>>>> -+all: $(progs) manpages
>>>> -
>>>> --all: version $(progs) manpages
>>>> --
>>>> --version:
>>>> -+version.h: version.sh
>>>> -       bash version.sh
>>>> -
>>>> - btrfs: $(objects) btrfs.o btrfs_cmds.o scrub.o
>>>> diff --git
>>>> a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch
>>>> b/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch
>>>> deleted file mode 100644
>>>> index 7f6594a..0000000
>>>> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_use_of_gcc.patch
>>>> +++ /dev/null
>>>> @@ -1,31 +0,0 @@
>>>> -Nitin A Kamble <nitin.a.kamble@intel.com> 2011/06/09
>>>> -Upstream-Status: Pending
>>>> -
>>>> -Avoid these kinds of errors while doing cross build:
>>>> -
>>>> -| ccache i586-poky-linux-gcc -march=i586
>>>> --sysroot=/disk0/pokybuild/build0/tmp/sysroots/qemux86
>>>> -Wp,-MMD,./.btrfsctl.o.d,-MT,btrfsctl.o -Wall -D_FILE_OFFSET_BITS=64
>>>> -D_FORTIFY_SOURCE=2 -O2 -pipe -g -feliminate-unused-debug-types -c
>>>> btrfsctl.c
>>>> -| gcc -O2 -pipe -g -feliminate-unused-debug-types -o btrfsctl
>>>> btrfsctl.o
>>>> ctree.o disk-io.o radix-tree.o extent-tree.o print-tree.o root-tree.o
>>>> dir-item.o file-item.o inode-item.o inode-map.o crc32c.o rbtree.o
>>>> extent-cache.o extent_io.o volumes.o utils.o btrfs-list.o -Wl,-O1
>>>> -Wl,--as-needed -luuid
>>>> -| /usr/bin/ld: i386 architecture of input file `btrfsctl.o' is
>>>> incompatible with i386:x86-64 output
>>>> -| /usr/bin/ld: i386 architecture of input file `ctree.o' is
>>>> incompatible
>>>> with i386:x86-64 output
>>>> -
>>>> -Index: git/Makefile
>>>> -===================================================================
>>>> ---- git.orig/Makefile
>>>> -+++ git/Makefile
>>>> -@@ -41,13 +41,13 @@ btrfs: $(objects) btrfs.o btrfs_cmds.o s
>>>> -               $(objects) $(LDFLAGS) $(LIBS)
>>>> -
>>>> - calc-size: $(objects) calc-size.o
>>>> --      gcc $(CFLAGS) -o calc-size calc-size.o $(objects) $(LDFLAGS)
>>>> $(LIBS)
>>>> -+      $(CC) $(CFLAGS) -o calc-size calc-size.o $(objects) $(LDFLAGS)
>>>> $(LIBS)
>>>> -
>>>> - find-root: $(objects) find-root.o
>>>> --      gcc $(CFLAGS) -o find-root find-root.o $(objects) $(LDFLAGS)
>>>> $(LIBS)
>>>> -+      $(CC) $(CFLAGS) -o find-root find-root.o $(objects) $(LDFLAGS)
>>>> $(LIBS)
>>>> -
>>>> - restore: $(objects) restore.o
>>>> --      gcc $(CFLAGS) -o restore restore.o $(objects) $(LDFLAGS) $(LIBS)
>>>> $(RESTORE_LIBS)
>>>> -+      $(CC) $(CFLAGS) -o restore restore.o $(objects) $(LDFLAGS)
>>>> $(LIBS)
>>>> $(RESTORE_LIBS)
>>>> -
>>>> - btrfsctl: $(objects) btrfsctl.o
>>>> -       $(CC) $(CFLAGS) -o btrfsctl btrfsctl.o $(objects) $(LDFLAGS)
>>>> $(LIBS)
>>>> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
>>>> b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
>>>> index ef575ae..d63f1e0 100644
>>>> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
>>>> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
>>>> @@ -12,21 +12,16 @@ LIC_FILES_CHKSUM =
>>>> "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
>>>>    SECTION = "base"
>>>>    DEPENDS = "util-linux attr"
>>>>
>>>> -SRCREV = "fdb6c0402337d9607c7a39155088eaf033742752"
>>>> +SRCREV = "194aa4a1bd6447bb545286d0bcb0b0be8204d79f"
>>>>    SRC_URI =
>>>>
>>>> "git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs.git;protocol=git"
>>>>
>>>>    S = "${WORKDIR}/git"
>>>>
>>>> -PV = "0.19+git${SRCPV}"
>>>> +PV = "0.20+git${SRCPV}"
>>>>
>>>> -PR = "r6"
>>>> +PR = "r7"
>>>>
>>> We do not need PR Bumps any more, so it can just be removed as you are
>>> incrementing the PV.
>>>
>>
>> So what do I need to do with existing PR? Just don't change it or
>> remove it from recipe?
>>
>>
> Sorry for being unclear since you have incremented the PV, you can
> completely remove the PR entry.
>
> Sau!
>

