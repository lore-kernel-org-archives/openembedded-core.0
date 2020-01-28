Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6F39D7FED8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 15:16:45 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p17so2973547wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 07:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=7GYD2goWNGpH2G/5Mo8C72udXf8u8kv47UFkqHFZ7vc=;
	b=GsvzUR0glWku95sqyXJxoz7c3xyEFqWhwbtC2gjjSPW0Z36jp24On54faARRdtbadm
	1JymKBBf92JYaSV3364JAXlXsFza30p/J6ii+vjCN6LMGNsV3phgMY7xNRJ0nPW3rtRH
	HFpLFyoF5j7wOXN5EJA5SD6D1kq6vl2asj4oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7GYD2goWNGpH2G/5Mo8C72udXf8u8kv47UFkqHFZ7vc=;
	b=Yp6WxgubSaHu+489vm/qz6/yKKNSTyuZZQQt3/hmP5TG/sDyxVzaffjqtcmSImXvvU
	LGhDt/eU5Mw15JACxeyplbRMzZOfHrChx/pDMG2iUyppuCT1MRw04vZJAq+xOcJK/e7t
	qtRSF0fT/cx036bbE6nSIBMCmwwhaaXL8vTzISIlqS0alcav3GoNS1Ap1xpF33h4ivDf
	pe8E58VhWLN8hNOZ8/rY/j8EqpfvY3E6Na4EjboGKBOYmkix+bYy8NZgDW1hbbdpECnr
	CL/OWflMBYh5ZDhjDicA6SQXIT2QJ8rJck+jUdqwECkIef01wnCJZoG8tOBL0tw1JBFF
	nChg==
X-Gm-Message-State: APjAAAVRYUDU9Diw1Ctfxl9udJr3xqVXykovfGe5HYI67KfxEi6lv89D
	oaJ+ywNtnNKGMHwFQlWVTv5p7y09EtM=
X-Google-Smtp-Source: APXvYqz/DXIH587+jR7fJrlp8oJL09MkdSsov6GNNmKzpa5E5fr4Fz4419R518J2PozQB3SqJsmsqg==
X-Received: by 2002:a7b:ce8b:: with SMTP id q11mr5801349wmj.100.1580224606081; 
	Tue, 28 Jan 2020 07:16:46 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c15sm25711302wrt.1.2020.01.28.07.16.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 07:16:45 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2020 15:16:40 +0000
Message-Id: <20200128151643.9711-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200128151643.9711-1-richard.purdie@linuxfoundation.org>
References: <20200128151643.9711-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/5] glibc-package.inc: Remove warnings about unpacked directories
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
X-List-Received-Date: Tue, 28 Jan 2020 15:16:46 -0000
Content-Transfer-Encoding: 8bit

If documemtation generation is disabled, the recipe throws warnings about
unpackaged files. Avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index ede9e9b9096..d2667f54a11 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -213,6 +213,8 @@ stash_locale_cleanup () {
 	rm -rf $cleanupdir${libdir}/gconv
 	rm -rf $cleanupdir${localedir}
 	rm -rf $cleanupdir${datadir}/locale
+	rmdir --ignore-fail-on-non-empty $cleanupdir${datadir}
+
 	if [ "${libdir}" != "${exec_prefix}/lib" ] && [ "${root_prefix}/lib" != "${exec_prefix}/lib" ]; then
 		if [ -d "$cleanupdir${exec_prefix}/lib" ]; then
 			if [ -z "${ARCH_DYNAMIC_LOADER}" -o \
-- 
2.20.1


