Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f174.google.com (unknown [74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 36D8E60E79
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 12:23:20 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id k48so6651411wev.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 05:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PRhl/pKwzTMW8Yq4cmfR6U9uF/QMeuxLyuF7LWZZmBo=;
	b=Lk/oIXVUoOM2mYKvB+mK4z+BukIQnFRBUhd/51aCTJedoIyPm9+y9hd+GCRk/xEULM
	BcUN6oqxYZER9j0caFKh5ctW1oW/zoW994b2Ech5+FoQaatE+ouvcJdk+DW4R9wJKalJ
	b/5BxIXXEncQkV/H2CW/CSgTJE3cgMt2gZUMDVa+ZHTb1JA4S605knV6rZZoo+Lrmzsk
	Wjkx7ybG2Eod1+cjP7GxEf/87XDP301m8P6Zm1C+GgjPWqmbXJHCLr1jALT6Srax9jqg
	BG770FKN8ATLkBoPyW5llWMHeDUYQXf/HqKjzAnbYZolsWUhHz9nZEnK/MaOJgcMBmG+
	Wv2Q==
X-Gm-Message-State: ALoCoQkhcrXSEBcOysN5iIYmABJ4b7H2oE4C3lKAt4D5mTkqRHux09/9tsSB25y30uR63VHOU8tV
X-Received: by 10.194.59.231 with SMTP id c7mr22080wjr.95.1399896909021;
	Mon, 12 May 2014 05:15:09 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	ct2sm17699110wjb.33.2014.05.12.05.15.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 May 2014 05:15:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 May 2014 13:14:53 +0100
Message-Id: <1399896893-486-7-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399896893-486-1-git-send-email-ross.burton@intel.com>
References: <1399896893-486-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 7/7] systemd: remove tcp-wrappers option
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
X-List-Received-Date: Mon, 12 May 2014 12:23:21 -0000

systemd version 212 removed the TCP wrappers support, so remove the
PACKAGECONFIG stanza for it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_212.bb |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_212.bb b/meta/recipes-core/systemd/systemd_212.bb
index bbc5d34..233bd31 100644
--- a/meta/recipes-core/systemd/systemd_212.bb
+++ b/meta/recipes-core/systemd/systemd_212.bb
@@ -47,7 +47,7 @@ LDFLAGS_append_libc-uclibc = " -lrt"
 
 GTKDOC_DOCDIR = "${S}/docs/"
 
-PACKAGECONFIG ??= "xz tcp-wrappers"
+PACKAGECONFIG ??= "xz"
 # Sign the journal for anti-tampering
 PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
 # regardless of PACKAGECONFIG, libgcrypt is always required to expand
@@ -55,7 +55,6 @@ PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
 DEPENDS += "libgcrypt"
 # Compress the journal
 PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
-PACKAGECONFIG[tcp-wrappers] = "--enable-tcpwrap,--disable-tcpwrap,tcp-wrappers"
 PACKAGECONFIG[cryptsetup] = "--enable-libcryptsetup,--disable-libcryptsetup,cryptsetup"
 PACKAGECONFIG[microhttpd] = "--enable-microhttpd,--disable-microhttpd,libmicrohttpd"
 
-- 
1.7.10.4


