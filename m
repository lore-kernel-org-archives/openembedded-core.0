Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0346DC36002
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:38:56 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.2874.1742323135419851653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cnb+CxOH;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2f9d3d0f55dso6749433a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323135; x=1742927935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKrGjdHHjnR7jsgqadzmaAaILBEfzJQIsOo3GFgMEZI=;
        b=cnb+CxOHs/rHTOzNAebxkYmV1K85z8+q11CC3dYuJhj0sDjTFfEETdusYwsWJgWIju
         dSqB6+dTPhYi/Y8IzEYePhjYBs9TWrLiSqOj1CtWyhbswVApyCVKAh8D7AU5bH8IRRXU
         SPyHqtjeDTsxWegtfb6g0vgDhO8jNGwACb/xhoD2rLh42cpAvumxpYIylI8ZMqAoTBu+
         nK3+lnFxgXubGoM0/ceXv87EiG74ZcJEPuNQevhNQqNdd6qLwPnw9rq125J/prH4qApD
         EJzDk/f++UTGkK0hWdngbjesGYNvItIE1W2FO9xsv7k6ZcvrCeWdKWKlriisOS99xpBV
         vMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323135; x=1742927935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKrGjdHHjnR7jsgqadzmaAaILBEfzJQIsOo3GFgMEZI=;
        b=HbqsPRckXqf5AAmO2n73kNY02L8SKF04y8BwnxA6hGw/ntmlM/AXLe5+W7X8fO1fDb
         IUlWkh60oM1JkBx9YlagEW23zuoNkBt1gRGVVYsEvF6pVlySig2j4uvJESe8g3ffUusS
         re152NYbPFseQedWV2xOJiOCHxB5cNquejZYvUc5JPWjhgaVYrsTB660EzCeNTnQwV9b
         D8rUAOIya0ClwzMNmpxfw66IDqZ7CSjdVYjsndOned1p65JB+nGPwZcnrEFPmCLLsEPy
         Fyv1t96rLso9lIxYSTdvRxVCt4NaUk4gfV8v5D1xX5qF9/G0I8HtBmD/tGBUny6i6XRT
         J9ng==
X-Gm-Message-State: AOJu0YxveOj+e+Pv6FRHul4f+6B9cdHLalfgER78fcALe7xaGRkhqHxd
	I7DtcqNMA65oiGi7ZIOdgxFOrUPoK0k9188B5+fv79tgK+V2/oTU15XgF65A
X-Gm-Gg: ASbGncvCbOAGYPll9rQaJJVAckG0thCHvyUs4DKF8jiMIKQYtU6aXaoGmVmRZDhnhDN
	8hakLbo3e8gRl+PVhoRFTLMG2kZGxQ4CgvF/SJsbBDRJLirS6pCXoDYVy+uZsTfMWrLUZNgt35N
	zhwhidxXGi0MNyZku9zHNPrVrhtaF3gLPSzmxPjckTYLe2hJPUKhzkCmf8lxdXIsF3qQQvq8r3P
	TxWjxGkJrFfA9450Kwi6BMBpiVWD8BS3T9ooQ2zLvvzI8e6zVvjgDH9Dj3lyIIiX0twx0iGbI1i
	4cEFakXLhzxUwPW/Id5NqsWobBXsefN6N9wd
X-Google-Smtp-Source: AGHT+IHmVK4mO8OiQnk/4nIspVqN1iHTS4z3o5NgbyF+mpmbItpv50oZH0SRCciQV7O5UBFS3lc6sg==
X-Received: by 2002:a17:90b:5288:b0:2ff:502e:62d4 with SMTP id 98e67ed59e1d1-301a5b992e9mr4285482a91.32.1742323134572;
        Tue, 18 Mar 2025 11:38:54 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:38:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 12/25] man-db: Add missing rdep for col utility
Date: Tue, 18 Mar 2025 11:38:27 -0700
Message-ID: <20250318183842.2256284-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:38:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213238

man utility calls col utility internally when formatting is asked for
therefore it expects col to be in rootfs otherwise silently errors with
retcode 3 meaning 'file not found' in this case its due to col not being
found, other distros eg. gets this via bsdextrautils dependency

libssh2 ptest mansyntax.sh fails due to this error, which now works

Add util-linux explicitly to DEPENDS as system is not able to trancend
rdep to dep due to special handling of packages in util-linux recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/man-db/man-db_2.13.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/man-db/man-db_2.13.0.bb b/meta/recipes-extended/man-db/man-db_2.13.0.bb
index 2178239bb60..e9fd3b5ac57 100644
--- a/meta/recipes-extended/man-db/man-db_2.13.0.bb
+++ b/meta/recipes-extended/man-db/man-db_2.13.0.bb
@@ -13,8 +13,8 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
           "
 SRC_URI[sha256sum] = "82f0739f4f61aab5eb937d234de3b014e777b5538a28cbd31433c45ae09aefb9"
 
-DEPENDS = "libpipeline gdbm groff-native base-passwd"
-RDEPENDS:${PN} += "base-passwd"
+DEPENDS = "libpipeline gdbm groff-native base-passwd util-linux"
+RDEPENDS:${PN} += "base-passwd util-linux-col"
 PACKAGE_WRITE_DEPS += "base-passwd"
 
 # | /usr/src/debug/man-db/2.8.0-r0/man-db-2.8.0/src/whatis.c:939: undefined reference to `_nl_msg_cat_cntr'

