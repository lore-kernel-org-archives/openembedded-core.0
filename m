Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 677DE792B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 05:17:12 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id p12-v6so3018798pfh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 22:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=0/IfEYr+rldiJQmMHpHec5GmQo9tMvrcLaT9c7s/pSI=;
	b=ZpdB1VAgOY3QdJ8uuFVDCSMgfwHXgqFtH4w1REzYm3zOs2eiCPgKi3ntJ6UCDLO+06
	7vnznowYYahSaP+ClmvDNbelTytKpXSSfdJuWzu3Xx5xYQbnJHmfNpnqUT7Gm3TbKFNP
	bxwZiZeBU6Naz4Fw3zPTKmhit4P/+9eNS9i4dJJixa9FbNbMoq109VXPkyvkHWcR4ryR
	ct9vMZPUPBnnYTL3+3UJ8dtoMpka1YrcZTEALuvt69Sq35evCSmu+kJOgCbLdZ60+82C
	rSZjkkolaFIeZHWf/C6Weule3L4/6Un9mB8Fq4/kUmQ7D0WFN4UXI5QtXxmDoWLOlOx5
	5UqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0/IfEYr+rldiJQmMHpHec5GmQo9tMvrcLaT9c7s/pSI=;
	b=IYrhKnt+5RgdwusmBPDRh3KsQBAiHRcIDRgU1pkgMfLR+Ch/b0Kb4G4x7I1TCmRO1W
	FzSymqzDPV0vVF8ezmNJvTGpvqTNDQqRuzuIfyX9BUoW1ZBRavgYe1f9ozcAn5GFBGfz
	18fJqG5EEHY7vCOhGFDLf7NkkYkDtbpZ2FL3P5DZCrwYywtczppSvTOnNslRScpy228t
	qhc0U+tUCeLTa9ZlbvW1U6/aCruNRGbyz7b2lpFH9KnajMWI2gSclYN0uX2gaiziMMPJ
	YWBVAFK8mQpGxoh4dtjrhDbUDJgd5ApolqQu8vxAVE0KeL8FAE8Eu6/PdJS6xeFt2U39
	jILg==
X-Gm-Message-State: AOUpUlFaBLLTiXQLdyYfjDkMpmspMMvGnjt0Q6HROizAc6kox3yJsVCK
	liLc4u9cOdjkk9g/z7xHomI=
X-Google-Smtp-Source: AA+uWPzbL68c8q9nxJfvcSUfEN/2RknqkKdDk2gPtMN+HJD59W4PXw/UCtunVcOmNbOphOxdnZh5EA==
X-Received: by 2002:a62:2ac8:: with SMTP id
	q191-v6mr35134315pfq.139.1534483033605; 
	Thu, 16 Aug 2018 22:17:13 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	j27-v6sm1315266pfj.91.2018.08.16.22.17.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Aug 2018 22:17:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2018 22:17:12 -0700
Message-Id: <20180817051712.6609-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] gnutls: Update to 3.6.3
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
X-List-Received-Date: Fri, 17 Aug 2018 05:17:12 -0000

release notes: https://lists.gnupg.org/pipermail/gnutls-devel/2018-July/008584.html

add ssl3 and tls1.3 config options now supported.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc                       | 2 ++
 .../gnutls/{gnutls_3.6.2.bb => gnutls_3.6.3.bb}              | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.2.bb => gnutls_3.6.3.bb} (53%)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 04c0fd2af8..cf947d445e 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -30,6 +30,8 @@ PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
 PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
 PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
 PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
+PACKAGECONFIG[ssl3] = "--with-ssl3-support,--disable-ssl3-support,"
+PACKAGECONFIG[tls13] = "--with-tls13-support,--disable-tls13-support,"
 
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


