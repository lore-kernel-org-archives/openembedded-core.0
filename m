Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6246071C9B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 15:58:06 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 204so15524833pge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2017 07:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9xaZM9gC13tQ0nzEq9ICIpO71TNqXbLO2rg1Fu7Rqhw=;
	b=gq44O8Bu/QMq/mU6tqvDIjALhZ2XCJZDlxuCykFVdsqy8IlsAsE4+HsOjkaUN2KIF8
	OT7iDZrz0vJDx+obA9jSL8x5IwqnhkZ43XIiaKgnl8ZXSD4Jxkhcmg9/CavvOmTlPPCh
	mAol2GbD6Apy0TregXuC1B7sbWVAyA5gCG9nTTMpqKClCUBIqZLlFA2+izBWe9XzbtCd
	lwzo146OqxWXGJgNmf7Z0gVdST9Z2Ts53iUqnCxd9JnzrDZ7kvqeafTLCtd6pgG6+1tZ
	GbCodPKQv1URgHAYEZM05PD+mMScD+DwtQwVDtAMrpo7GhkjuKAFu/2KrfmTdkcPqHLC
	Op4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9xaZM9gC13tQ0nzEq9ICIpO71TNqXbLO2rg1Fu7Rqhw=;
	b=mwrR34PmcrVQvrFV3YE19Cnrxr0kD+Rrqef03v/A4EQ6+u0nhJyCHfL6ZAM5O7jyi3
	GCmonMzUNWv+SrJdMWLuOoS4Xepx+QXDaCRgjGDVCozrYo3i3o4uYdGMwbY3+jw6QHcD
	+WtvsdIy0OH/kNuVwhRj4lwqHt0ToKGzfFmTfGNTpFIWZh6KAw9z9w/gwrbr2/Dc0dg+
	dv/TEeeoxErwLU3FOL5IOx3d49GFqtiv9qt9412EaFOnPDq/UegZTNrnV2ptQXsAz9En
	F10nuqUHFHdMPqJBDSQcrIuzfBAmmi4f30HbdEXSRYvOjMWuTLc7ZDLFNx2YhxUO0MQ/
	RABA==
X-Gm-Message-State: AIkVDXJcBJIbeYG9rRwb4usE3vZIC3oMDgGJyHHBVD7l71vgpfS+DKwBouc4N9KRpLvD6A==
X-Received: by 10.99.171.5 with SMTP id p5mr27782234pgf.182.1486569487528;
	Wed, 08 Feb 2017 07:58:07 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e25sm21594255pfk.3.2017.02.08.07.58.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Feb 2017 07:58:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 07:57:59 -0800
Message-Id: <20170208155759.25297-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.1
Subject: [PATCH] libcap: Add gperf-native to depends
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
X-List-Received-Date: Wed, 08 Feb 2017 15:58:07 -0000

Fixes
|  gperf_case_strncmp (register const char *s1, register const char *s2, register size_t n)
|                                                                                 ^~~~~~
| ./_caps_output.gperf:96:53: error: unknown type name 'size_t'
|  __cap_hash_name (register const char *str, register size_t len)
|                                                      ^~~~~~
| ./_caps_output.gperf:200:55: error: unknown type name 'size_t'
|  __cap_lookup_name (register const char *str, register size_t len)
|                                                        ^~~~~~
| ./_caps_output.gperf:200:1: error: conflicting types for '__cap_lookup_name'
|  __cap_lookup_name (register const char *str, register size_t len)
|  ^~~~~~~~~~~~~~~~~
| ./_caps_output.gperf:33:29: note: previous declaration of '__cap_lookup_name' was here
|  const struct __cap_token_s *__cap_lookup_name(const char *, unsigned int);
|                              ^~~~~~~~~~~~~~~~~
| cap_text.c: In function 'cap_to_name':
| cap_text.c:291:2: warning: ignoring return value of 'asprintf', declared with attribute warn_unused_result [-Wunused-result]
|   asprintf(&tmp, "%u", cap);
|   ^~~~~~~~~~~~~~~~~~~~~~~~~
| make[1]: *** [Makefile:63: cap_text.o] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libcap/libcap_2.25.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcap/libcap_2.25.bb b/meta/recipes-support/libcap/libcap_2.25.bb
index 7ced4be626..343aeb6c40 100644
--- a/meta/recipes-support/libcap/libcap_2.25.bb
+++ b/meta/recipes-support/libcap/libcap_2.25.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://sites.google.com/site/fullycapable/"
 LICENSE = "BSD | GPLv2"
 LIC_FILES_CHKSUM = "file://License;md5=3f84fd6f29d453a56514cb7e4ead25f1"
 
-DEPENDS = "hostperl-runtime-native"
+DEPENDS = "hostperl-runtime-native gperf-native"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz \
            file://0001-ensure-the-XATTR_NAME_CAPS-is-defined-when-it-is-use.patch \
-- 
2.11.1


