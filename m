Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id D6D9F78E42
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 17:04:40 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id x5-v6so1370817pgp.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 10:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1FwelgiQS6+aCDDdMzoi3yrzRNE7f6u+y8MwpDcvHE4=;
	b=k5B+/eUIb0UVZUnPhj4OQAr1KN73kx+Mb+4yMxeGT+TqA1Tam00A87JAWmy7BUmRl7
	pDUxeNDWnRA5npCBbLrUeO/UvDMPvgu69c7Kn5vcMJ29F6x5DTmp4oB8DbtB7OYzAvJw
	Dfn+ZAabO4bXmb64ogdt60C0N4X2ByWO9Qgp1wcJ7jBdMYKhxM8VE264qGZjvcRPnc32
	QODz1GGA67x7N/XglgqMJG6UiFWEhkDRVDR7fbWZ7b14gaRHS55lf1lurVU0Uo9a52O2
	Lae/VJZVuYyzZSDuYwKfTyA+xbfFGhFNdUclKB3wl4N1U5c4hCWD3B4sRMVupugovMR/
	rNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1FwelgiQS6+aCDDdMzoi3yrzRNE7f6u+y8MwpDcvHE4=;
	b=g3Ti38SaoPQhMWhieSEzl1MHoE8RA4Uv4Orc72CetytgjvdvFq77MB8k58EvAIyEgK
	HMAeCNKEZ1jSeRaa/IzTXLKWbuA8VOfDfY3UgdLL1Uep4tbp26T9mNbW0qACNzm6DTvg
	uan+C19eBqLWb3nGsoEaiZ5Yk+v/hLuKZoifpyz5VRFjvBJkACLzSUw0mlzy2d9kLxYF
	J0yb279pC86Vc2vFi6csfhhJrfcno3QfGosWMLfUtVNJdmaEGOMiKfyBfIBqh0RxgdD0
	lqap4y4mKP4+3Djngvkpt50fKkq/ftXpTODhGkypGmie66/+i3ih96DeKzhn9P6DqKIF
	QstQ==
X-Gm-Message-State: AOUpUlEx75f9Ws0nxa+zMC+PV190Wxo2K0i8+mBxCBuCgaw7r2JTQbpO
	fQBYvcGuPF6MYuFYiJg/xrPZcG+A
X-Google-Smtp-Source: AA+uWPy+sRkglfKZPdxNvOoQkW9B76iXJEsV9oV8xbtbTiAv+YqOky5YOhxVqOLQ8nA1br+3cB88Eg==
X-Received: by 2002:a63:b349:: with SMTP id
	x9-v6mr3328389pgt.337.1533747881818; 
	Wed, 08 Aug 2018 10:04:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	h9-v6sm3673108pfe.187.2018.08.08.10.04.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Aug 2018 10:04:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 10:04:24 -0700
Message-Id: <9cf56f3e13b2401656d96e1f006e1697710d236c.1533747698.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533747698.git.raj.khem@gmail.com>
References: <cover.1533747698.git.raj.khem@gmail.com>
Subject: [PATCH 7/8] ppp, libpam: Add missing dep on virtual/crypt
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
X-List-Received-Date: Wed, 08 Aug 2018 17:04:41 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb | 2 +-
 meta/recipes-extended/pam/libpam_1.3.0.bb  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
index f4646bd693..644cde4562 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
@@ -4,7 +4,7 @@ the Point-to-Point Protocol (PPP) on Linux and Solaris systems."
 SECTION = "console/network"
 HOMEPAGE = "http://samba.org/ppp/"
 BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
-DEPENDS = "libpcap openssl"
+DEPENDS = "libpcap openssl virtual/crypt"
 LICENSE = "BSD & GPLv2+ & LGPLv2+ & PD"
 LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77d87dc9c290a424dea \
                     file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
diff --git a/meta/recipes-extended/pam/libpam_1.3.0.bb b/meta/recipes-extended/pam/libpam_1.3.0.bb
index 92ab72a42f..3aec2cdb4c 100644
--- a/meta/recipes-extended/pam/libpam_1.3.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.3.0.bb
@@ -32,7 +32,7 @@ SRC_URI_append_libc-musl = " file://0001-Add-support-for-defining-missing-funcit
                              file://include_paths_header.patch \
                            "
 
-DEPENDS = "bison-native flex flex-native cracklib libxml2-native"
+DEPENDS = "bison-native flex flex-native cracklib libxml2-native virtual/crypt"
 
 EXTRA_OECONF = "--with-db-uniquename=_pam \
                 --includedir=${includedir}/security \
-- 
2.18.0


