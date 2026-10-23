Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4533.1792753087363172880
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@9elements.com header.s=google header.b=gKQ5jCUI;
 spf=pass (domain: 9elements.com, ip: 209.85.208.50, mailfrom: tan.siewert@9elements.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so1057146a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 03:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1792753085; x=1793357885; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5SQKUpsZWA1DO7tSpNJR5GqgUOBRWvvePDeI8T5J2A=;
        b=gKQ5jCUIjRwZv9aG5bAd081EV8laZDOY27JjU24itQBgc5FpqMKeRb4524M4Htb0AK
         jqMWpUUDMy4usGsvYpAriEYUrzRik4tyyvCLF8MNOKV0BmuRM2wcme6m3jgNkWrei/2Q
         U/u1cHHte3dCoATasjWMb5RgHvR1TahGEsTpdANXKlG3o+kgfpkKkXojhjfNrnXSDPsA
         3UfW8Ij6aRIik/dPtkjFixQFv+TKgAAwayayyvNhWSuj08g5tpkvbhKW2O9mE8TIKmyq
         TZNO/0jkc3X5x4XVlZzqDalkTlNCG3TCbTlH0/BwRx4j5TPx4enJQHD9bOP2gDWLbK7y
         xv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792753085; x=1793357885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B5SQKUpsZWA1DO7tSpNJR5GqgUOBRWvvePDeI8T5J2A=;
        b=s1qalBXHTZhKlG/owAyniPFUmkeTnjEJSf4A4GFOJF8TOLb1Wsjun3UsJZmmWOHO0Z
         D1u0nDc6LAZYApBwNVnkQf4e6iGz4ogUjdsvg9K5s+X451AcbNhHHFqqP9CGlaKghx0v
         YhcRzMCWbgMmlyXrK0GPXP4e8S+h7nPz40MjBZFSJBn65d4U0338J0JadsiAWBKgrRCn
         tuIU7nr0X19WXO7FLvuvvIycW2EMN+B+Ff9DgJmcdpI5egAxBqeOb4ApSdFfQlzAKHp6
         hYekYrEP3SNKEVidqa0PoXq5mEhynS9uOFffWMPCkCjhAG5xz5ggqtFY0fHXzdjOpuBG
         je3Q==
X-Gm-Message-State: AFq9FYKtv3eqfXJJgvUDvci5RronADJBqHTQkq8E7N1wc1RMPn8a94Xr
	F3UditJMs5HmavKDpTP1CWo8qSOXkJADbzxGWZ1sm7DZKhJi6H1diXdDInt2QYjaSLdBHXdv9g0
	l5dhqGP8=
X-Gm-Gg: AYBFou07QgVL54QPJyFsugwoSU637A9PMrbK4qzZflJF3idRDztHyLPqFx9GVQB+C3q
	LP77PGWArSRyILEMm51RrB9aikpw23AkseXBxfwo9yBteWuPLgro/P/ZIDM+PuZFjJONtsz7TgZ
	q2Yz2lTMEXHwHujSiUQA1cI/0g13C8SleS75I4G7BcQXbG66vPZzPtmhcW2Gh4lwCrmKZjgrZUX
	s/BFZeqczGO42kHghAZHO0PKDclcbAciEQZ2bQ965IIIDsEnU4gzCgeiUhxQECdVWQcIQ0pDsCb
	x+OYh0f8hNKVUl98J3nCyrlPe6RdmDdBrvSS3qf7k3mIyBbmAzE3daLBYnE1vFKm/OT/R2rNzeE
	+qdyq55Q/LuYNnx88QNwYrHR377JkQ68y7KfzbUt7Tu9lAkNTynW8zL2oeQlyQkW+afwe7xW1U3
	7OsjiJhFsGJHBPpxT5glDxC98qe0wUqyQkCzbqdqG4JHJLDozQCauJDudDoe3ZEgin/YPz6eS4g
	Lm9G10cig4DKqrINMwmHdAIuHHQO2X6YgBJtVL4g5gLIcXMOBUTo4+bWSCqljQID5Wc60AV4A==
X-Received: by 2002:a5d:5d0b:0:b0:48b:10af:f85c with SMTP id ffacd0b85a97d-48e3859dd20mr3046814f8f.37.1792752729503;
        Fri, 23 Oct 2026 03:52:09 -0700 (PDT)
Return-Path: <tan.siewert@9elements.com>
Received: from white-mocha.local ([2a01:599:841:69c3:a3ce:18eb:5996:fa43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37eded3fsm4268891f8f.7.2026.10.23.03.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:52:09 -0700 (PDT)
From: Tan Siewert <tan.siewert@9elements.com>
Date: Fri, 23 Oct 2026 12:51:55 +0200
Subject: [PATCH 3/4] systemd: add hwdb packageconfig
MIME-Version: 1.0
Message-Id: <20261023-systemd-optimisations-v1-3-0cce103e54df@9elements.com>
References: <20261023-systemd-optimisations-v1-0-0cce103e54df@9elements.com>
In-Reply-To: <20261023-systemd-optimisations-v1-0-0cce103e54df@9elements.com>
To: openembedded-core@lists.openembedded.org
Cc: Sai Sireesha T <saisireesha.t@windriver.com>, 
 Patrick Williams <patrick@stwcx.xyz>, 
 Tan Siewert <tan.siewert@9elements.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792752717; l=1813;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=eXLoLIebqj26AL7dvSDg4NSRPKGpz2dnArcB+VKbaZA=;
 b=IJ73RKOjGXevhoJEmGFRuYBla8bIP4PdUMqm2FeR81894oDpjAAewrleIdCOZApCT5dtvxO+W
 FqP0UncsCzKABUwKXRO4RiNejH5+gJQABrGzuTXAo9n/DSS5xtFwsbZ
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:59:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248539

The hwdb is not that useful on embedded devices which may never see HID
or PCI devices, and it uses a fair amount of storage.

Add a packageconfig option which is enabled by default and only
recommends udev-hwdb when it is enabled. usbutils and similar only
RRECOMMEND it, so disabling it does not break them.

Signed-off-by: Tan Siewert <tan.siewert@9elements.com>
---
 meta/recipes-core/systemd/systemd_262.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_262.bb b/meta/recipes-core/systemd/systemd_262.bb
index 60d8ed00d5..03f4e049d5 100644
--- a/meta/recipes-core/systemd/systemd_262.bb
+++ b/meta/recipes-core/systemd/systemd_262.bb
@@ -60,6 +60,7 @@ PACKAGECONFIG ??= " \
     gshadow \
     hibernate \
     hostnamed \
+    hwdb \
     idn \
     ima \
     kmod \
@@ -138,6 +139,7 @@ PACKAGECONFIG[homed] = "-Dhomed=enabled,-Dhomed=disabled"
 PACKAGECONFIG[gshadow] = "-Dgshadow=true,-Dgshadow=false"
 PACKAGECONFIG[hibernate] = "-Dhibernate=true,-Dhibernate=false"
 PACKAGECONFIG[hostnamed] = "-Dhostnamed=true,-Dhostnamed=false"
+PACKAGECONFIG[hwdb] = "-Dhwdb=true,-Dhwdb=false"
 PACKAGECONFIG[idn] = "-Didn=true,-Didn=false"
 PACKAGECONFIG[ima] = "-Dima=true,-Dima=false"
 # importd requires journal-upload/xz/zlib/bzip2/gcrypt
@@ -759,7 +761,7 @@ RDEPENDS:${PN} += "systemd-serialgetty"
 RDEPENDS:${PN} += "volatile-binds"
 
 RRECOMMENDS:${PN} += "${PN}-extra-utils \
-                      udev-hwdb \
+                      ${@bb.utils.contains('PACKAGECONFIG', 'hwdb', 'udev-hwdb', '', d)} \
                       e2fsprogs-e2fsck \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 kernel-module-sch-fq-codel \
                       os-release \

-- 
2.53.0

