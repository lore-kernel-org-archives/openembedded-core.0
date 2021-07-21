Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.1352.1626885685590995367
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jul 2021 09:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=TXC1ep2q;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.54, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f54.google.com with SMTP id v6so4092242lfp.6
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jul 2021 09:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Q9VTVG48PzHQobXeVqQBDSEZASTyrd3stHr1v5s7qA=;
        b=TXC1ep2qdEkBWnME5Os7VOQMpi0Z2zeMs9rVTQhLukNHhfMUr1K1H7Ry1HfqylvbzX
         0bgmHdkbma7suzvQK+rcUDNxt2nvIcxP0GPZZfoQHQkhN3JjOk4M/UM7eU5xcGxd38Hj
         b2n9fspqC6uK7F8QrlQW/NHRk/1XYT1BnaEfNczOEe6/PVcvUeb6yNDJmghWjv1KO9/Y
         Xvc9jZyyeajV5FyuyxGscw4JYMjKMG+yvP9SL/Ttb2YNHGR0I/1CuC9H4S04KYYB3sGY
         D/HjcL8Z64neqsk6YMphmfp031ZcFGIbyMwIwUhFvfHc7KEXVyeR01Z4TabeQL9Nk3Az
         vdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Q9VTVG48PzHQobXeVqQBDSEZASTyrd3stHr1v5s7qA=;
        b=PvyOLCzgQnmcx57CkmiMLiOa1dkK0JIaBq2EtBKoMRO7+lWoM8t65Shs5cjoIoWG+Y
         sdrwiEPbnYlmF5wh2hx4qDRs+2zfPFK9BTX1RMOulvGjRYaEkHOWrbi+mUNpH6JO2PGs
         4wCHAloHhKeefWousbhh0+Lij9CMEaa9iZeyazAilZ4hvSRGiW0bD1QOiV5SE80SKgy/
         11MbBP9wqwQMQGAwvCddsSbWcBf73KubTvMlejd1piUtbBp2De5OfeGsmYfACE+hQTfp
         2Ff6meivdsaM9+njQ+RMAgp83NvBaBwZSrg7KpYJAXq561+TtV2i5Eg9nJSAnQtwX7q0
         88iQ==
X-Gm-Message-State: AOAM5337EQtyyrFjGBQpwgUl9bd2kz+Ib8rxogjf8sGKPpoce7M/oF3O
	TZRqfXT1nuv7AMyfUuFbY+Uzba0TaHLT2v9x
X-Google-Smtp-Source: ABdhPJwzPF9WvKpALvix+yAvYqcnYAdiy3rGr+TnURvsoi27ZSEkUmjGkzgDjEiZlUoevBQCExiqOA==
X-Received: by 2002:ac2:58ef:: with SMTP id v15mr25432843lfo.408.1626885683342;
        Wed, 21 Jul 2021 09:41:23 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c-e21d524e.023-160-67626725.bbcust.telenor.se. [78.82.29.226])
        by smtp.gmail.com with ESMTPSA id y13sm2858967ljn.119.2021.07.21.09.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 09:41:22 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] bitbake.conf: change GNOME_MIRROR to new one
Date: Wed, 21 Jul 2021 18:41:16 +0200
Message-Id: <20210721164116.56809-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

URI has been permanently moved and returns HTTP 301.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 160abf40ee..821dae2ba6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -639,7 +639,7 @@ CPAN_MIRROR = "https://search.cpan.org/CPAN"
 DEBIAN_MIRROR = "http://ftp.debian.org/debian/pool"
 GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
 GNOME_GIT = "git://gitlab.gnome.org/GNOME"
-GNOME_MIRROR = "https://ftp.gnome.org/pub/GNOME/sources"
+GNOME_MIRROR = "https://download.gnome.org/sources/"
 GNU_MIRROR = "https://ftp.gnu.org/gnu"
 GNUPG_MIRROR = "https://www.gnupg.org/ftp/gcrypt"
 GPE_MIRROR = "http://gpe.linuxtogo.org/download/source"
-- 
2.25.1

