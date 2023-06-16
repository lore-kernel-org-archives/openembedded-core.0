Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 082B0EB64DC
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:37:59 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.239.1686926276349835117
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=gSbWlcEo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1b51414b080so5579275ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926275; x=1689518275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+b+yhZy2Wb0vjTZED++HNHFm5i82S+tHWl7KBNGuTkU=;
        b=gSbWlcEoCzqZJrt7ouFp80AMV53rURv+uzRlat/pUCqyeNxCTkEkZtDkSeP7/m9dC/
         yd05o/QO/iMd/ufvwcbVpoZ1XHJit++MbiwVD7ACKcqD3NHhKxNZuTbL6NLyM29ILwb9
         Qjhn9/3CAPOW2edm3z6UZ2cDUy3cE98yq5EoBMTqmJpIPJvlmTt2CW6MU+3O//mmR0+B
         +HN/m0wXemNZWJEooHWcD/zbWHayJWDySK0lOBIVra2/72zffqDn9XRtwSkiKZpsfbpy
         iTFyhEovnNYE3FAzVkw7nyxhjKvrqj0II55LAb8HWKrhHN1pec2l2Urct1VDFBXJ7d53
         VQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926275; x=1689518275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+b+yhZy2Wb0vjTZED++HNHFm5i82S+tHWl7KBNGuTkU=;
        b=Lyc7x4LnbdYePyvyNYmkoAzfKaN6IKGM4nnP8TdyUMmBlfHohi/ddICBtPIglcEfgd
         dI2lUoXbUFnzSaxSLXIR9qGqPYyYj6YdSgWGIEIbAawLDBjjIjlKPowdRNKggmWaYjOE
         +Xx80BPwE0NU5zaLU0NEF6LRRVUhO28i61OXjlaUjCkUBDFm2BkGDLokv6VcF865PdXh
         e7kfw/hz5NNS/M5CWbzH1xw1mQpK1qQo5Plelm/FuUgfb3Tq9yF8PV9dHowtDlmPNARP
         t3T8FgIxPEQkL3+CmqdiTdj4ECsah73JOKxIzAoZ8nBbq/vmhL2gIq81g+L1Yh7mjGcR
         4IvQ==
X-Gm-Message-State: AC+VfDxXzsLBrmc4kSu6cGJ21XtD5Ba6C6/vSKD5Qiu31ejbdjq5MqZQ
	EgMW4gmFH+pHGcWImx04cBZabcnjWL8kTCuySVs=
X-Google-Smtp-Source: ACHHUZ5OUKpSO9PFwX7sjOHcjXsMw7KCcjYwvW8ccOVKS9x+fO5HF0+L6iin57e4iKlFIBW2Ms6Ymw==
X-Received: by 2002:a17:902:744a:b0:1b5:25bd:df2b with SMTP id e10-20020a170902744a00b001b525bddf2bmr2011651plt.14.1686926275472;
        Fri, 16 Jun 2023 07:37:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.37.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:37:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 20/24] maintainers.inc: correct unassigned entries
Date: Fri, 16 Jun 2023 04:37:11 -1000
Message-Id: <27f15bc3166fda5acd07e9e1c34842a641d24e37.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686925952.git.steve@sakoman.com>
References: <cover.1686925952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183041

From: Alexander Kanavin <alex.kanavin@gmail.com>

Modify packages to unassigned where appropriate

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ab37ddf53607111bf5c49c4f2388224999c4a5a9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 098bd96c28..d9e00bcdac 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -41,7 +41,7 @@ RECIPE_MAINTAINER:pn-alsa-utils = "Michael Opdenacker <michael.opdenacker@bootli
 RECIPE_MAINTAINER:pn-apmd = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-apr = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-apr-util = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER:pn-apt = "Aníbal Limón <limon.anibal@gmail.com>"
+RECIPE_MAINTAINER:pn-apt = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-argp-standalone = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-asciidoc = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-aspell = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -60,7 +60,7 @@ RECIPE_MAINTAINER:pn-base-passwd = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-bash = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-bash-completion = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-bc = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-bind = "Armin Kuster <akuster808@gmail.com>"
+RECIPE_MAINTAINER:pn-bind = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-binutils = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-cross-${TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
@@ -152,7 +152,7 @@ RECIPE_MAINTAINER:pn-docbook-xml-dtd4 = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-docbook-xsl-stylesheets = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-dos2unix = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-dosfstools = "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER:pn-dpkg = "Aníbal Limón <limon.anibal@gmail.com>"
+RECIPE_MAINTAINER:pn-dpkg = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-dropbear = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-dtc = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-dwarfsrcfiles = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -415,7 +415,7 @@ RECIPE_MAINTAINER:pn-liburcu = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-liburi-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libusb1 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libubootenv = "Stefano Babic <sbabic@denx.de>"
-RECIPE_MAINTAINER:pn-libuv = "Armin Kuster <akuster@mvista.com>"
+RECIPE_MAINTAINER:pn-libuv = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libva = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libva-initial = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libva-utils = "Anuj Mittal <anuj.mittal@intel.com>"
-- 
2.34.1


