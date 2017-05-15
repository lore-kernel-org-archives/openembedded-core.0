Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 385E172F60
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 15:59:05 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id k74so17980417qke.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 08:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nPVHj+GVyx3OJaX36KxPMkxhzpD7KY7TeDweumJ62ZM=;
	b=MAm0cTIznuc7EllUt/rpFkn/eJluRKcM1kNj4kfatdlTVM7BYPYv2vAuCyK0SONchy
	qo4zF+oPh0iRdoirsGj8aKpFXMaskQznWXNe2WfGSidmJCZb5SRRROaLwxRSrdYgae8X
	Vnj8VAU7iYuQ+vQnKHnJL8au6fIUO7Hs/LpA3yqK4mml7MNrXk4xXO59239dQ7BxMPa6
	4U7JesUhPoaVI8gXzDS4JXfQP6/CaBH8i5uoub4tbbhUb3vd7CHT7AvzaI3ZGGkEyH5J
	KJSn/SAL6/oa7nEDVEDwrN1HOxT8JfPTFGPHT+4TMjM/d0OP+1lI3NdupKB4ayofxOpd
	iHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nPVHj+GVyx3OJaX36KxPMkxhzpD7KY7TeDweumJ62ZM=;
	b=st0YmPbbXLGbSkhMjBbUehfBYtivXTdVvIhwUpvR0vMibeNi3eauVk27FE44ithhIQ
	R/roKiYEwusgM9gh93iqNQp4aMAFTwhjcexZdSkMOKZOCaVx9X1VBEgIavTIVrr6E/ZL
	lc+yLPqCmr/u+VHQpYxla2krFA9z7IKEluomO6nHTaOBxJ4fn9KUPeLB97f0eaceMg3g
	rIr6z+GxOvgadXSA/WY2Ov4B0Dw2SXikoAUfFBwzxJiQMNzK9kIOAFCn6YRiiezaMCSV
	lgeMtgaXhL3CuFTnqmQJ8+jbRQrEyzUv8quZp2xSGo2/ZAeqJ1tH7Bti/NYwwiFCzIgc
	4qCw==
X-Gm-Message-State: AODbwcAXRIqBr+G62tmPAZ05RDH1Vnh7Q0JR2y13efGXxlWbp1irip+J
	3jcZ03cMr92NR4KqDrp73Wrb013/aQ==
X-Received: by 10.80.182.35 with SMTP id b32mr5511207ede.123.1494863947039;
	Mon, 15 May 2017 08:59:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Mon, 15 May 2017 08:58:36 -0700 (PDT)
In-Reply-To: <CAHiDW_FuoagmNjK=XV3OeaYSq+AAR6NvcZ9RnKFabN0=DUFHGQ@mail.gmail.com>
References: <1494839116-32279-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<CAHiDW_FuoagmNjK=XV3OeaYSq+AAR6NvcZ9RnKFabN0=DUFHGQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 May 2017 08:58:36 -0700
Message-ID: <CAMKF1spBOuOq0yvQ2v4GaKXX4b7mi+o+B26YaHPaK0jtP4kwXw@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libnl: 3.2.29 -> 3.3.0
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
X-List-Received-Date: Mon, 15 May 2017 15:59:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 15, 2017 at 3:49 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
>
>
> On 15 May 2017 at 12:05, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
>>
>> 1) Upgrade libnl from 3.2.29 to 3.3.0.
>> 2) Delete patch "fix-pktloc_syntax_h-race.patch", since it is  integrated
>> upstream.
>> 3) Add patch "musl-header-conflict.patch" to fix musl compile error.
>>
>> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
>> ---
>>  .../libnl/libnl/fix-pktloc_syntax_h-race.patch     | 36 -------------
>>  .../libnl/libnl/musl-header-conflict.patch         | 59
>> ++++++++++++++++++++++
>>  .../libnl/{libnl_3.2.29.bb => libnl_3.3.0.bb}      |  7 +--
>>  3 files changed, 63 insertions(+), 39 deletions(-)
>>  delete mode 100644
>> meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
>>  create mode 100644
>> meta/recipes-support/libnl/libnl/musl-header-conflict.patch
>>  rename meta/recipes-support/libnl/{libnl_3.2.29.bb => libnl_3.3.0.bb}
>> (88%)
>>
>> diff --git
>> a/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
>> b/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
>> deleted file mode 100644
>> index 79aa0bd..0000000
>> --- a/meta/recipes-support/libnl/libnl/fix-pktloc_syntax_h-race.patch
>> +++ /dev/null
>> @@ -1,36 +0,0 @@
>> -Upstream-Status: Inappropriate [configuration]
>> -
>> -libnl has progressed to 0.3.2 and there does not appear to be any
>> -"make -j" issues with this build after my limited testing on that
>> -newer version so we can assume this issue is fixed upstream
>> -
>> -Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>> -
>> -Index: libnl-3.2.25/lib/Makefile.am
>> -===================================================================
>> ---- libnl-3.2.25.orig/lib/Makefile.am
>> -+++ libnl-3.2.25/lib/Makefile.am
>> -@@ -46,9 +46,12 @@ CLEANFILES = \
>> -
>> - # Hack to avoid using ylwrap. It does not function correctly in
>> combination
>> - # with --header-file=
>> -+route/pktloc.lo: route/pktloc_syntax.h route/pktloc_grammar.h
>> -+route/pktloc_grammar.h: route/pktloc_grammar.c
>> - route/pktloc_grammar.c: route/pktloc_grammar.l
>> -       $(AM_V_GEN) $(MKDIR_P) route; $(FLEX)
>> --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
>> -
>> -+route/pktloc_syntax.h: route/pktloc_syntax.c
>> - route/pktloc_syntax.c: route/pktloc_syntax.y
>> -       $(AM_V_GEN) $(MKDIR_P) route; $(YACC) -d $(YFLAGS) -o $@ $^
>> -
>> -@@ -102,7 +105,9 @@ BUILT_SOURCES = \
>> -       route/cls/ematch_grammar.c \
>> -       route/cls/ematch_syntax.c \
>> -       route/pktloc_grammar.c \
>> --      route/pktloc_syntax.c
>> -+   route/pktloc_syntax.c \
>> -+   route/pktloc_syntax.h \
>> -+   route/pktloc_grammar.h
>> -
>> - EXTRA_DIST = \
>> -       route/pktloc_grammar.l \
>> diff --git a/meta/recipes-support/libnl/libnl/musl-header-conflict.patch
>> b/meta/recipes-support/libnl/libnl/musl-header-conflict.patch
>> new file mode 100644
>> index 0000000..5363685
>> --- /dev/null
>> +++ b/meta/recipes-support/libnl/libnl/musl-header-conflict.patch
>> @@ -0,0 +1,59 @@
>> +From fa1ecb21bd612c0f7c0bd380c15d058227451e4e Mon Sep 17 00:00:00 2001
>> +From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
>> +Date: Tue, 16 May 2017 02:30:21 +0900
>> +Subject: [PATCH] Fix musl compile error like:
>> +
>> +In file included from
>> ../libnl-3.3.0/include/linux-private/linux/ipv6.h:5:0,
>> +                 from
>> ../libnl-3.3.0/include/netlink-private/netlink.h:54,
>> +                 from ../libnl-3.3.0/lib/nl.c:28:
>> +../libnl-3.3.0/include/linux-private/linux/in6.h:32:8: error:
>> +redefinition of 'struct in6_addr'
>> + struct in6_addr {
>> +        ^~~~~~~~
>> +
>> +Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
>> +---
>> + include/linux-private/linux/if_bridge.h | 1 -
>> + include/linux-private/linux/ipv6.h      | 1 -
>> + include/netlink-private/netlink.h       | 1 -
>> + 3 files changed, 3 deletions(-)
>> +
>> +diff --git a/include/linux-private/linux/if_bridge.h
>> b/include/linux-private/linux/if_bridge.h
>> +index f24050b..8f7490c 100644
>> +--- a/include/linux-private/linux/if_bridge.h
>> ++++ b/include/linux-private/linux/if_bridge.h
>> +@@ -15,7 +15,6 @@
>> +
>> + #include <linux/types.h>
>> + #include <linux/if_ether.h>
>> +-#include <linux/in6.h>
>> +
>> + #define SYSFS_BRIDGE_ATTR     "bridge"
>> + #define SYSFS_BRIDGE_FDB      "brforward"
>> +diff --git a/include/linux-private/linux/ipv6.h
>> b/include/linux-private/linux/ipv6.h
>> +index e05e684..f16349d 100644
>> +--- a/include/linux-private/linux/ipv6.h
>> ++++ b/include/linux-private/linux/ipv6.h
>> +@@ -2,7 +2,6 @@
>> + #define _IPV6_H
>> +
>> + #include <asm/byteorder.h>
>> +-#include <linux/in6.h>
>> +
>> + /* The latest drafts declared increase in minimal mtu up to 1280. */
>> +
>> +diff --git a/include/netlink-private/netlink.h
>> b/include/netlink-private/netlink.h
>> +index dd07c10..25ee07f 100644
>> +--- a/include/netlink-private/netlink.h
>> ++++ b/include/netlink-private/netlink.h
>> +@@ -30,7 +30,6 @@
>> + #include <limits.h>
>> + #include <search.h>
>> +
>> +-#include <arpa/inet.h>
>> + #include <netdb.h>
>> +
>> + #include <defs.h>
>> +--
>> +2.7.4
>> +
>> diff --git a/meta/recipes-support/libnl/libnl_3.2.29.bb
>> b/meta/recipes-support/libnl/libnl_3.3.0.bb
>> similarity index 88%
>> rename from meta/recipes-support/libnl/libnl_3.2.29.bb
>> rename to meta/recipes-support/libnl/libnl_3.3.0.bb
>> index 7d4839b..9138aa8 100644
>> --- a/meta/recipes-support/libnl/libnl_3.2.29.bb
>> +++ b/meta/recipes-support/libnl/libnl_3.3.0.bb
>> @@ -10,13 +10,14 @@ LIC_FILES_CHKSUM =
>> "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>>  DEPENDS = "flex-native bison-native"
>>
>>  SRC_URI =
>> "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV').replace('.','_')}/${BP}.tar.gz
>> \
>> -           file://fix-pktloc_syntax_h-race.patch \
>>             file://fix-pc-file.patch \
>>  "
>>  UPSTREAM_CHECK_URI = "https://github.com/thom311/${BPN}/releases"
>>
>> -SRC_URI[md5sum] = "a8ba62a5c4f883f4e493a46d1f3733fe"
>> -SRC_URI[sha256sum] =
>> "0beb593dc6abfffa18a5c787b27884979c1b7e7f1fd468c801e3cc938a685922"
>> +SRC_URI_append_libc-musl = "file://musl-header-conflict.patch"
>
>
> Does the patched version not build with glibc or why is this only patched
> for musl?

this should be generic

>
> Also patch seems to be missing Upstream-Status.
>
> Jussi
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

