Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id ADD287931D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 14:14:11 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id r64-v6so2481669pgr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 07:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=m1dkyeBD26z7wiRNisM6FhIx5jW12+M4QGcEzrXmyTY=;
	b=UU2u0/1ZecMYpzwQZsPTOg73F7LAf5xzTFMxneAExKUP0gE+xO+x5hPfVY1XPEwOdI
	UwF9tCkhfnAcFaY6o2gH+SHTG909xV4Nw8dPov2nR0aHJx5vvFDu5Bkqf+NOGGQOazlN
	Qy8U4V4cN+1UUoUzgkxd9Y5zC8Vg53H7K6uNM+UEW9icDNaUNxJVTIzr9Jb0Ztx+1kFp
	hnDa8l3Pu8uLwvo5nlr/N7QcPROAWLqS8fFEavdSqyJptfaQ7k8iUhmxo+8J4h+6v0MA
	5DGp2rEWG9dZdBw1UXx+KD6GcQ3Bsev1k+dZ5lbYmxmoJbJR9Dly/fI1YbNjjL8kMw1z
	7g0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=m1dkyeBD26z7wiRNisM6FhIx5jW12+M4QGcEzrXmyTY=;
	b=bCIdFNatlWc3SsI7QXuedjIL3bss4nKdjghR8OhEzE0r+WGAOSFpSyB0l6E0Rpr7n4
	CpfuV9xHVgV2s+7WLuo1HOu2W5gAWg3qwSTWllt4O5OjlNAX48BE1hF0tJGQigMoFhCE
	TI8NO5agYexCCDFixPagRCOL+WbLiLoxSsb//7C4If1WzG9FXsROT5atliqzLYQsWTW+
	Qz0ViwhxCKtF2mAUPVC7xkee+f+s3EnxL21BzM/IqTav2Pm3l/jp2r9GX6mjj/uXqIWT
	/GLQ0cvAsZkLKL7p5e2tckG4Rv0ZIXcSS658NKfgqGF5vdEfi8c9GNuR9pqdhFtDNaGc
	rMBQ==
X-Gm-Message-State: AOUpUlFjBP0e46kZJRa3jrSy4BdjbzXKwJ9+T9PjuRwE4m6H8MHoPye5
	9eCRtJsB1tTTctOBrS+icB8=
X-Google-Smtp-Source: AA+uWPwwANwXZPll/bj97xt1AJTA3uP8x0vdXtGO20rT18MUKgb6CG24a5cER00DcE53qRWKqShhVQ==
X-Received: by 2002:a63:344b:: with SMTP id
	b72-v6mr5008420pga.184.1534515252802; 
	Fri, 17 Aug 2018 07:14:12 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	p3-v6sm2645388pfo.130.2018.08.17.07.14.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Aug 2018 07:14:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2018 07:14:11 -0700
Message-Id: <20180817141411.31825-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [V2][PATCH] gnutls: Update to 3.6.3
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
X-List-Received-Date: Fri, 17 Aug 2018 14:14:11 -0000

[v2]
Fix new config options form with to disable.

[v1]
release notes: https://lists.gnupg.org/pipermail/gnutls-devel/2018-July/008584.html

add ssl3 and tls1.3 config options now supported.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc                       | 2 ++
 .../gnutls/{gnutls_3.6.2.bb => gnutls_3.6.3.bb}              | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.2.bb => gnutls_3.6.3.bb} (53%)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 04c0fd2af8..f204e5f4c0 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -30,6 +30,8 @@ PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
 PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
 PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
 PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
+PACKAGECONFIG[ssl3] = "--enable-ssl3-support,--disable-ssl3-support,"
+PACKAGECONFIG[tls13] = "--enable-tls13-support,--disable-tls13-support,"
 
 EXTRA_OECONF = " \
     --enable-doc \
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.2.bb b/meta/recipes-support/gnutls/gnutls_3.6.3.bb
similarity index 53%
rename from meta/recipes-support/gnutls/gnutls_3.6.2.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.3.bb
index e540528a8e..c560305032 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.2.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.3.bb
@@ -3,7 +3,8 @@ require gnutls.inc
 SRC_URI += "file://0001-configure.ac-fix-sed-command.patch \
             file://arm_eabi.patch \
            "
-SRC_URI[md5sum] = "8b4912c6c0e5ffefd3dbb4888eaf8a58"
-SRC_URI[sha256sum] = "bcd5db7b234e02267f36b5d13cf5214baac232b7056a506252b7574ea7738d1f"
+
+SRC_URI[md5sum] = "d3b1b05c2546b80832101a423a80faf8"
+SRC_URI[sha256sum] = "ed642b66a4ecf4851ab2d809cd1475c297b6201d8e8bd14b4d1c08b53ffca993"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


