Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 330B57FCA8
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:47 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id f20so3949768plj.5
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BMPZVc95Hy5qcdnvbjhVvd8DZeiSO13+9ZuOS4uaAFw=;
	b=PqWJQqC2koLDytv/7i6BldVfDpCrRqcgf8Nz0ZxNyAeNWIeq4ce2HqpL42gAOQJZs3
	kDoGAD3t/SM2MfMAOLCeSBhjnueYvQgRergSTeohfOGr5VDWWTPV0vy+McCEsl9C8yKU
	5Y+61xXkWS0wjP3ikQ7QVBqF/IrRdAeUajBJaLtwNLKq/QUt0eudDcJI6MO7rEg39mPx
	H/X51ZSiO3ltR88q3WcpSm0t7XFSabmJKPvfkYbYx4v26jzjh2MMBBboaeefSua0/smm
	Cxddd7hldQWj4oK2yqTHf/HlxcRm+RABC/uTQh5BQY6JB36nBwSs7MN/0Fi9s+hNSOpR
	j5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BMPZVc95Hy5qcdnvbjhVvd8DZeiSO13+9ZuOS4uaAFw=;
	b=Z/X1LBZTY9DrMnzlmEj0EXMx5H4+Sro8CfLKD9GPS+UtlmL5904zvGt+LY1uNwFWx6
	Ha4EoNiJhBmQb5BJQcYMUygA4+Lt+GtrQHO4OJqVEQDMPvy8Z0tn3xz09ymI1bCApkss
	N9u+gEnIQCWhsSw7W/JvqFJ1uF6K4RIQyZ9UvH2vbe5gAd/68dYnMYX3IXCNj4Bw51Bb
	w6NKhc12zga3Apuo6Yoncj1434MXuSjW7Qx2kmfnBoZa4DXoD3sgvrr7Qc0ouDGJSPxl
	/PZymKoAEho2n7neKnvDeJ2va1V/l0yVMdmU4r6QY0g/NthTFyg+Zez7YyBu7hAcBr2E
	zM9g==
X-Gm-Message-State: APjAAAUGpZDjR0ob0YoJfQGLrxr5tdQqbPKPh/9kSk38k2NI1xpyP6RS
	Neh9kgaHAN/oCUyFeUgxIC7e+9K/
X-Google-Smtp-Source: APXvYqxjfmeGog5ew9TxUk6sxzazj1neWok6c04HQOzrBvVVb/RfcRlIjPAcz8V6i8qT6NmBC2+b4w==
X-Received: by 2002:a17:90a:bf92:: with SMTP id
	d18mr15970146pjs.21.1578929447771; 
	Mon, 13 Jan 2020 07:30:47 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.30.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:30:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:12 -0800
Message-Id: <7b8f6388e0a1e1eab35918a3764e98553a2452f4.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 13/28] sdk: Install nativesdk locales for all TCLIBC variants
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
X-List-Received-Date: Mon, 13 Jan 2020 15:30:47 -0000

From: Khem Raj <raj.khem@gmail.com>

install_locales() here is actually operating on nativesdk and only glibc
is the default library for nativesdk, since thats what most of
desktop/server distros use, therefore bailing out based on TCLIBC is not
needed here, since nativesdk-glibc would be required for all non-glibc
targetting SDKs as well.

Fixes SDK install time error

ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
Following is the list of potential problems / advisories:
Your system needs to support the en_US.UTF-8 locale.
ERROR: SDK preparation failed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oe/sdk.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index b4fbdb799e..d02a274812 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -88,10 +88,6 @@ class Sdk(object, metaclass=ABCMeta):
             bb.warn("cannot remove SDK dir: %s" % path)
 
     def install_locales(self, pm):
-        # This is only relevant for glibc
-        if self.d.getVar("TCLIBC") != "glibc":
-            return
-
         linguas = self.d.getVar("SDKIMAGE_LINGUAS")
         if linguas:
             import fnmatch
-- 
2.17.1


