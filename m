Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A6CC47073
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:48 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.151021.1703864747323059646
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MWku5JBI;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5c6ce4dffb5so2145491a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864746; x=1704469546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQAX+AmuNHk8RJ/21ObIDaUxsxq4EKCT96HhI858r4g=;
        b=MWku5JBIzYJJpTkpOjcaw3L1I66c5kD9aPflq3/3OfdHu1xL94ZkNUUhOEDCUzA3bJ
         PKvOnbUu5MR0tiQC4ZcHWhpGiLtoEhdj2mnaHVXX2EQdq/Gs+4nbWZ2r1lk9VHkXPS6e
         Up+LKl/EG7OcyX2m4SV3lzRAkryWokXtQN61O4yp2nfIXjzJGVTkSz84Vi3wvXNopQiT
         UdEJLbUpPq78c4LCQGf9n2U3W+iYnd1x30fwxR3k7O5S4Z+UFvyyqvR73cf4H7MUrPuF
         3k5wLHVZK/559v8ZZcdjR7Y9eVkbtmH8A8HhICHVt//u0HWH+b5L3GOXL03VmMncWoP4
         04wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864746; x=1704469546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQAX+AmuNHk8RJ/21ObIDaUxsxq4EKCT96HhI858r4g=;
        b=jl/eag0cjpXuUqVrBTrm6obi0JGtZM0sFFrJyWcIxj5ptRLSGJVwmjBx4417oFl6Tt
         3huQbDpGJNgmUE/v88qwaGBKLCut3oM3QLDPnJpulIfH8OoJZ197yI2OXOAcavlGOU18
         qYcBVK0pZZlLHyGVAcOC1Mdxzqd7UH7N8TNU42+OiEAp4+ZMjGyrxhiMq4b+dobe3C8/
         99VBpAZDDfRbRYnkJM+88iZzux+C3umjuCplCMHosQpEoVUKE/t2s650BBT+Na1t4Q7B
         vCTAsLNeWwlUrbS9RA7bONgpTvQ6jQFhe8x82Sn5zvESgZnnhgJ4AjNx9sWBqVSndZg1
         rTVg==
X-Gm-Message-State: AOJu0Yz6KC7Hv4Xfs2EEGLHmoCoi7A4zNheVCgJcWfbJa6SjtyO/C9gV
	0DZM3bCKFj0vMpnoSBPPGlT4LpBb+Tp9oEP9xkhqAP64ZFo9kw==
X-Google-Smtp-Source: AGHT+IGbW0KxMmd0YFfppy0oNQydpbfscjTaM6BDuv24dCVdkJTJitsPJUvQedW0dvWvMYTJBUjhdQ==
X-Received: by 2002:a17:902:fe01:b0:1d4:3132:bf13 with SMTP id g1-20020a170902fe0100b001d43132bf13mr4597280plj.16.1703864746489;
        Fri, 29 Dec 2023 07:45:46 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 23/41] systemd: update LICENSE statement
Date: Fri, 29 Dec 2023 05:44:37 -1000
Message-Id: <2c65ec32ce3c4a74b7117588151a94a4c6e506a6.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193040

From: Massimiliano Minella <massimiliano.minella@se.com>

As stated in the LICENSES/README.md "Unless otherwise noted, the systemd
project sources are licensed under the terms and conditions of the GNU
Lesser General Public License v2.1 or later", so replace LGPL-2.1-only
with LGPL-2.1-or-later.

With the exception of some udev sources that are licensed under
GPL-2.0-or-later (but are packaged separately), the project is licensed
under LGPL, and all the components are LGPL or under LGPL compatible
licenses. The package libsystemd is currently under the main package
license, which can cause problems when scanning for GPL software linked
to CLOSED one.  Add more granularity by setting a license for libsystemd
to LGPL-2.1-or-later.

Signed-off-by: Massimiliano Minella <massimiliano.minella@se.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 54975f4b2184fe12c4995c289eba8358958e6c21)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 3ba0b5ffc5..ccc3236457 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -10,7 +10,8 @@ state, maintains mount and automount points and implements an \
 elaborate transactional dependency-based service control logic. It can \
 work as a drop-in replacement for sysvinit."
 
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LICENSE = "GPL-2.0-only & LGPL-2.1-or-later"
+LICENSE:libsystemd = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-- 
2.34.1


