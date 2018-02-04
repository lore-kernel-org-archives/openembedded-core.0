Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id EB4CF783E4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Feb 2018 17:12:21 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id s73so2199399pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Feb 2018 09:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cVBJ6/ih+QDaO5T9qv6rYsqFXMqq2jadoWdHY1IhjTE=;
	b=RW0xeI1Bemsy/oFGkzMmtC8/AeMr/9+69hO7I+77o6NR8cX0QplBV4sMQYy4NQD9TE
	PsohwDeRkZMniKC2F6WyDs/K8nCVckmCA6lFAq9RxkFMWfet1OVHDbu4CUAmQ5lnzngM
	b2OqC3pcmVcJtTnYptqKOc6hWrfED5pUDoAMybQlT5JHTNC5Vy8NXp/k0hfKfwq8KFYs
	yGINFw68DVup14Nce7F6Temnfbys8DRJqXbfHF+V5CgL/UiRS6MnmHAu5PM3POvvUTwz
	qRs7Kd0Tw8uwGOlyt0udE6KLsG3ZsgfuLihM9IZGhkNeF0VzEsUuCvEIaxOhaCrv8y5j
	CoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cVBJ6/ih+QDaO5T9qv6rYsqFXMqq2jadoWdHY1IhjTE=;
	b=MuhdFXe09maib0FFg4HZnGci88DMbmMGPi4vpoHhTNZeXIgCmKIQZNTp98UUVVWpiD
	8CPA3KVig75s2TuUF2puWhUOgp+K0ZIdubggmmA/FmvRMor21KJ+bc3MiqhSvmsUO3de
	exOVYMFtVosGyJQFjwHs37P2JBu0lHhySSWigYCf+tmNfVIHOGiSHtbwwfxYMZr9KUs4
	9O8PG6c1fvRJwxEJfjLeKhYpzIujFXHayr6K9U1qEQckVH1AE4ouOXqTC1wnp8Sii7zN
	h7ORGtzZsBYFjMhUKsgZCbzFSCkIhMjDlfpus4jhykgWyY55dTGYBtzP7jsAEZlsdFf/
	ia+g==
X-Gm-Message-State: APf1xPAVBT1ndWDXzqfBptzY+UsWL/4lWqglR/NR7V5xZezuli5CmwhR
	4fOMhfMIgs0QYIhJl5iBJ+ZmPUXrf/E775NWzWTRNw==
X-Google-Smtp-Source: AH8x226RG+r21QiI0HQZure24S/u4dPihgAcrggHUC2sE0xN+YhK18CLdRJTfuJqN5HcagR866dbwHC1x+oG/QJN0ec=
X-Received: by 10.99.131.193 with SMTP id h184mr3779127pge.25.1517764342670;
	Sun, 04 Feb 2018 09:12:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.161.170 with HTTP; Sun, 4 Feb 2018 09:11:52 -0800 (PST)
In-Reply-To: <CAJTo0LZFzhjunzJANsfm6Poo=idkyd-y6N7BnANc3kjD51Z26Q@mail.gmail.com>
References: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
	<20180201180210.21652-16-alexander.kanavin@linux.intel.com>
	<CAJTo0LZFzhjunzJANsfm6Poo=idkyd-y6N7BnANc3kjD51Z26Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 Feb 2018 09:11:52 -0800
Message-ID: <CAMKF1spkfhB7su3w1afLHcfz0wSrvOKvJ9AOQQktSLyHH-mCwg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/20] dtc: upgrade to 1.4.6
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
X-List-Received-Date: Sun, 04 Feb 2018 17:12:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 4, 2018 at 12:31 AM, Burton, Ross <ross.burton@intel.com> wrote:
> This breaks u-boot builds:
>
> |
> /data/poky-tmp/master/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/1_2018.01-r0/recipe-sysroot-native/usr/include/libfdt_env.h:70:30:
> error: conflicting types for 'fdt64_t'
> |  typedef uint64_t FDT_BITWISE fdt64_t;
> |                               ^~~~~~~
> | In file included from <command-line>:0:0:
> |
> /data/poky-tmp/master/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/1_2018.01-r0/git/include/libfdt_env.h:19:16:
> note: previous declaration of 'fdt64_t' was here
> |  typedef __be64 fdt64_t;
> |                 ^~~~~~~
>

I have a patch to u-boot which is fixing similar issue. see
see if this helps.

https://gist.github.com/kraj/70d613d1ead4be98a5787928d8518434

> Ross
>
> On 1 February 2018 at 18:02, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>>
>> Drop upstreamed patch.
>>
>> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>> ---
>>  meta/recipes-kernel/dtc/dtc.inc                    |  1 -
>>  ...cks-Use-proper-format-modifier-for-size_t.patch | 43
>> ----------------------
>>  .../dtc/{dtc_1.4.5.bb => dtc_1.4.6.bb}             |  2 +-
>>  3 files changed, 1 insertion(+), 45 deletions(-)
>>  delete mode 100644
>> meta/recipes-kernel/dtc/dtc/0001-checks-Use-proper-format-modifier-for-size_t.patch
>>  rename meta/recipes-kernel/dtc/{dtc_1.4.5.bb => dtc_1.4.6.bb} (81%)
>>
>> diff --git a/meta/recipes-kernel/dtc/dtc.inc
>> b/meta/recipes-kernel/dtc/dtc.inc
>> index d259c57e8d9..925cca92fac 100644
>> --- a/meta/recipes-kernel/dtc/dtc.inc
>> +++ b/meta/recipes-kernel/dtc/dtc.inc
>> @@ -7,7 +7,6 @@ DEPENDS = "flex-native bison-native"
>>
>>  SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git \
>>             file://make_install.patch \
>> -           file://0001-checks-Use-proper-format-modifier-for-size_t.patch
>> \
>>             "
>>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>>
>> diff --git
>> a/meta/recipes-kernel/dtc/dtc/0001-checks-Use-proper-format-modifier-for-size_t.patch
>> b/meta/recipes-kernel/dtc/dtc/0001-checks-Use-proper-format-modifier-for-size_t.patch
>> deleted file mode 100644
>> index cab384dd99a..00000000000
>> ---
>> a/meta/recipes-kernel/dtc/dtc/0001-checks-Use-proper-format-modifier-for-size_t.patch
>> +++ /dev/null
>> @@ -1,43 +0,0 @@
>> -From c7a4c3817796107bb824a1f173faf90fae45396b Mon Sep 17 00:00:00 2001
>> -From: Thierry Reding <treding@nvidia.com>
>> -Date: Wed, 27 Sep 2017 15:04:09 +0200
>> -Subject: [PATCH] checks: Use proper format modifier for size_t
>> -
>> -The size of size_t can vary between architectures, so using %ld isn't
>> -going to work on 32-bit builds. Use the %zu modifier to make sure it is
>> -always correct.
>> -
>> -Upstream-Status: Backport
>> -Signed-off-by: Thierry Reding <treding@nvidia.com>
>> -Acked-by: Rob Herring <robh@kernel.org>
>> -Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> ----
>> - checks.c | 4 ++--
>> - 1 file changed, 2 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/checks.c b/checks.c
>> -index 902f2e3..08a3a29 100644
>> ---- a/checks.c
>> -+++ b/checks.c
>> -@@ -972,7 +972,7 @@ static void check_property_phandle_args(struct check
>> *c,
>> -       int cell, cellsize = 0;
>> -
>> -       if (prop->val.len % sizeof(cell_t)) {
>> --              FAIL(c, dti, "property '%s' size (%d) is invalid, expected
>> multiple of %ld in node %s",
>> -+              FAIL(c, dti, "property '%s' size (%d) is invalid, expected
>> multiple of %zu in node %s",
>> -                    prop->name, prop->val.len, sizeof(cell_t),
>> node->fullpath);
>> -               return;
>> -       }
>> -@@ -1163,7 +1163,7 @@ static void check_interrupts_property(struct check
>> *c,
>> -               return;
>> -
>> -       if (irq_prop->val.len % sizeof(cell_t))
>> --              FAIL(c, dti, "property '%s' size (%d) is invalid, expected
>> multiple of %ld in node %s",
>> -+              FAIL(c, dti, "property '%s' size (%d) is invalid, expected
>> multiple of %zu in node %s",
>> -                    irq_prop->name, irq_prop->val.len, sizeof(cell_t),
>> -                    node->fullpath);
>> -
>> ---
>> -2.15.0
>> -
>> diff --git a/meta/recipes-kernel/dtc/dtc_1.4.5.bb
>> b/meta/recipes-kernel/dtc/dtc_1.4.6.bb
>> similarity index 81%
>> rename from meta/recipes-kernel/dtc/dtc_1.4.5.bb
>> rename to meta/recipes-kernel/dtc/dtc_1.4.6.bb
>> index 0e46cfbeb4f..78c57363926 100644
>> --- a/meta/recipes-kernel/dtc/dtc_1.4.5.bb
>> +++ b/meta/recipes-kernel/dtc/dtc_1.4.6.bb
>> @@ -3,7 +3,7 @@ require dtc.inc
>>  LIC_FILES_CHKSUM = "file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
>>
>> file://libfdt/libfdt.h;beginline=3;endline=52;md5=fb360963151f8ec2d6c06b055bcbb68c"
>>
>> -SRCREV = "22a65c5331c22979d416738eb756b9541672e00d"
>> +SRCREV = "e54388015af1fb4bf04d0bca99caba1074d9cc42"
>>
>>  S = "${WORKDIR}/git"
>>
>> --
>> 2.15.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

