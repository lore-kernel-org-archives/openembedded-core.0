Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF29C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 11:36:06 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.19717.1703072165108117837
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 03:36:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FHQmYcbq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5A30FF816;
	Wed, 20 Dec 2023 11:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703072163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CNdMz+Pj6LqQANadT8wEHBaBzu+OLLVwgc77R3e7jxU=;
	b=FHQmYcbqPzE+GXm8pJ5P4HlWSpIjOg3c+5j/y7hyOUoK0mywtDrdoMF+rQ927m8jesN/NO
	HqRj64D9JDa5Ts0g6jSZbJVCN3y+oMnmTkwv5BcWnf9QLLdQBKyruZiV/1+qn8GOt+Rnlt
	tuq3sQMEV8Pl+9Codz5PNH53W6vapQJf6lq7XM2P8ipgtWsDJheCE7IhZ/9P/6lOiYWU6b
	ebVys3lg0B/PfDASuZgfoJEIc6xvUR4DqapAZpUrZUc2g36cDTD97kET1zfTLPR0+GAb/C
	8vfEjK4BYp3bn5A09u5X53edHcMW+saHKnnu81G4bTDkzislhexQIZdJEa0E2g==
Date: Wed, 20 Dec 2023 12:36:02 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] libxml2: upgrade 2.11.5 -> 2.12.3
Message-ID: <202312201136028504c556@mail.local>
References: <1702978464-7753-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1702978464-7753-1-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 11:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192792

Hello,

I already told you that this is breaking webkit on the 23/11/2023...

On 19/12/2023 17:34:24+0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Changelog:
> ==========
> - parser: Fix namespaces redefined from default attributes
> - include: Rename XML_EMPTY helper macro
> - include: Move declaration of xmlInitGlobals
> - include: Add missing includes
> - include: Move globals from xmlsave.h to parser.h
> - include: Readd circular dependency between tree.h and parser.h
> 
> install-tests.patch
> refreshed for 2.12.3
> 
> License-Update:
>  hash: Rewrite hash table code
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-core/libxml/libxml2/install-tests.patch     | 8 ++++----
>  .../libxml/{libxml2_2.11.5.bb => libxml2_2.12.3.bb}      | 9 +++++----
>  2 files changed, 9 insertions(+), 8 deletions(-)
>  rename meta/recipes-core/libxml/{libxml2_2.11.5.bb => libxml2_2.12.3.bb} (92%)
> 
> diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
> index 14ccce5873..62988f6bfe 100644
> --- a/meta/recipes-core/libxml/libxml2/install-tests.patch
> +++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
> @@ -1,4 +1,4 @@
> -From 3fc716357ce1372d9418dc86f24315b34d9808de Mon Sep 17 00:00:00 2001
> +From 16b46f8ef89aeebe8eb110ab8ef8e69e3a23c145 Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@arm.com>
>  Date: Mon, 5 Dec 2022 17:02:32 +0000
>  Subject: [PATCH] add yocto-specific install-ptest target
> @@ -13,11 +13,11 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
>   1 file changed, 10 insertions(+)
>  
>  diff --git a/Makefile.am b/Makefile.am
> -index 5bc4018..57d27af 100644
> +index 0a49d37..1097c63 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -26,6 +26,16 @@ check_PROGRAMS = \
> - 	testlimits \
> +@@ -27,6 +27,16 @@ check_PROGRAMS = \
> + 	testparser \
>   	testrecurse
>   
>  +ptestdir=$(libexecdir)
> diff --git a/meta/recipes-core/libxml/libxml2_2.11.5.bb b/meta/recipes-core/libxml/libxml2_2.12.3.bb
> similarity index 92%
> rename from meta/recipes-core/libxml/libxml2_2.11.5.bb
> rename to meta/recipes-core/libxml/libxml2_2.12.3.bb
> index 319833f053..8f37a39fe2 100644
> --- a/meta/recipes-core/libxml/libxml2_2.11.5.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.12.3.bb
> @@ -4,10 +4,11 @@ HOMEPAGE = "https://gitlab.gnome.org/GNOME/libxml2"
>  BUGTRACKER = "http://bugzilla.gnome.org/buglist.cgi?product=libxml2"
>  SECTION = "libs"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://Copyright;md5=2044417e2e5006b65a8b9067b683fcf1 \
> -                    file://hash.c;beginline=6;endline=15;md5=e77f77b12cb69e203d8b4090a0eee879 \
> +LIC_FILES_CHKSUM = "file://Copyright;md5=fec7ecfe714722b2bb0aaff7d200c701 \
> +                    file://hash.c;beginline=6;endline=15;md5=9af9349d0ead24569dc332f2116ef5f8 \
>                      file://list.c;beginline=4;endline=13;md5=b9c25b021ccaf287e50060602d20f3a7 \
> -                    file://trio.c;beginline=5;endline=14;md5=cd4f61e27f88c1d43df112966b1cd28f"
> +                    file://trio.c;beginline=5;endline=14;md5=cd4f61e27f88c1d43df112966b1cd28f \
> +                    "
>  
>  DEPENDS = "zlib virtual/libiconv"
>  
> @@ -19,7 +20,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
>             file://install-tests.patch \
>             "
>  
> -SRC_URI[archive.sha256sum] = "3727b078c360ec69fa869de14bd6f75d7ee8d36987b071e6928d4720a28df3a6"
> +SRC_URI[archive.sha256sum] = "8c8f1092340a89ff32bc44ad5c9693aff9bc8a7a3e161bb239666e5d15ac9aaa"
>  SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
>  
>  # Disputed as a security issue, but fixed in d39f780
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192703): https://lists.openembedded.org/g/openembedded-core/message/192703
> Mute This Topic: https://lists.openembedded.org/mt/103259916/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

