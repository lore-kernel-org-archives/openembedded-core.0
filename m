Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 825C77F962
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 10:47:37 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 20so4564158wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 02:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tNubP81MP+U/nB1Rgvp9j6lwSw8iPTKe4NC4n4HFem8=;
	b=ZmsJPf+SjELgmT4q8Zf4KFLmuvdNvgCylp+AxVv+hg7WkfT+eix6rL6BfCkvv2lD4U
	1ETYFnfqfyZh0QnTtOIUcStwdYGrnpb23w4DMpNQQl6eh+KUNqr4jVtTVWHQZVNDiiXI
	28ZEB7dn9L/0kWaowFnfayJCAMkVZkG63Z+94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tNubP81MP+U/nB1Rgvp9j6lwSw8iPTKe4NC4n4HFem8=;
	b=KlgMVE+2CSED0by7uLzfxBrQjpLWa4NSugJKCm5caiWHcljHPT+XhT6Kw3By6Xatwd
	SPK8B1Pn+APk0W14AanX56xJA9nWo4z+js5u0A5ysMT1HyZAEKOA+tYj7Sk3Si1JjSBb
	Gp/HDBsVuez5yYC4Au1TPFBVVcyRr/49OOHvsAG63tOXOOF8RGHGaCiQMrSZCSNemtJW
	puroYJjVGqxZqED74ZU7eXmT4BWT7akpytaCeLbDc0kh8rBF+wnH7w1S323O8U3tj28P
	U/yFWOGxP9H7FUVeJ74/Um4t9IbuE4sIyFHzn+aEwhFlkA5MlCFKFEoBCoE5qtiHhm0g
	gYEA==
X-Gm-Message-State: APjAAAV7Rb1m6DgCNaxw1GScFuqdpBCp/sCTo6cMhfbPJH7oVoRIjKC6
	mPEzkMAguB2bWAYqttkdfjPesuUu3Rw=
X-Google-Smtp-Source: APXvYqy2CUwWTb7JkuIua1LyHq1xfnMXfn5TtD098aasc5dZbyP7reSDx9kE6mUKGF080rAiC54Qng==
X-Received: by 2002:a05:600c:20c7:: with SMTP id
	y7mr9731208wmm.21.1578739657838; 
	Sat, 11 Jan 2020 02:47:37 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k11sm5657807wmc.20.2020.01.11.02.47.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 11 Jan 2020 02:47:37 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 Jan 2020 10:47:35 +0000
Message-Id: <20200111104736.31797-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] meta-extsdk-toolchain: Mark as nostamp
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
X-List-Received-Date: Sat, 11 Jan 2020 10:47:37 -0000
Content-Transfer-Encoding: 8bit

This recipe needs to generate the latest hashes. With unihash we may not
rebuild as previous dependencies may be marked as equivalent.

eSDK which uses this is nostamp already, mark this task as nostamp also
for the same reason.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/meta-extsdk-toolchain.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/meta-extsdk-toolchain.bb b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
index 235d6ecc0f4..0df681ac738 100644
--- a/meta/recipes-core/meta/meta-extsdk-toolchain.bb
+++ b/meta/recipes-core/meta/meta-extsdk-toolchain.bb
@@ -16,6 +16,9 @@ addtask do_locked_sigs after do_populate_sysroot
 SSTATETASKS += "do_locked_sigs"
 do_locked_sigs[sstate-inputdirs] = "${LOCKED_SIGS_INDIR}"
 do_locked_sigs[sstate-outputdirs] = "${STAGING_DIR}/${PACKAGE_ARCH}/${PN}/locked-sigs"
+# If a taskhash changes we need to use the latest hash changes. With unihash we may not rebuild.
+# eSDK which uses this is nostamp anyway
+do_locked_sigs[nostamp] = "1"
 
 python do_locked_sigs() {
     import oe.copy_buildsystem
-- 
2.20.1


