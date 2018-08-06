Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0AFE978A30
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 22:57:40 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id r5-v6so6878507pgv.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 15:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LGLFN106u5eoITrpuUJyMaiuwb6rLfGBXxskqITYigE=;
	b=j2tZoY0pbGd8PBSc6I0fFjwVl+7FPJrBC2dyMz59mQFAM8x9ikfHQOjHoktuo7tIUX
	ERROo6UfcL10aWkpEnnpnSEvMHWiNh2oo80lT9/vGh+8e1VRS4Cq8UqqNA7zr0nLupi9
	nk4qc+8K/szVU4UEqSCMLTcVi7JNfd9if+HKUC8YK0dHW2Kat8ilfVdtpyPWkpAEIfx2
	u6uC+aP+t82nXgTbNCMBkEaly527/qX+NFbYFILis0n5Eltt2b70Le4W//sqUU/BLPU4
	Jz48vSDWyj/YDOOnx1quqc6L+1plnbk35hj67WmbT3MO5YtmTD7q3So4r3H0Wq8TQJ49
	gYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LGLFN106u5eoITrpuUJyMaiuwb6rLfGBXxskqITYigE=;
	b=GfZk/RhlmEkoFKRQWz3HB/sxXGcyYxaJ2KmeXnES7DRDD/Q+4rZxYtD4P++tt/gMym
	XS14J6wYVvZk3DzUvnfNfMjmhe8vYk0GUa1cY+GJyRi8KxL2UOcigm1r5Ho5DOM6IazH
	NH2xayJpwtDnNfJ4rlF2kPrvjuaIVEZvzOumAU+vLnncj6THLUK09Og4uZr4CXCj82lM
	sA4/eLLPFB9j0v4OaRiGCrmNFIzRiNiLvA8oiGish/rOFEz7LbYY3mF9szGEtFhijwRb
	vPRqMkGBC0QmBVRaUNB74to2sbpvEZ+Fs7M7Dgb+03b3nKgYjt0ImVqSWAH+OkhRf5Iq
	8EKw==
X-Gm-Message-State: AOUpUlFkhv9dBsKCDaiQOmrdo2sWWj/tFdUJPNmDspfTqhgJ0m9QpnDY
	IpEm+kGLA86sO6wYErlL9kYQW9N4
X-Google-Smtp-Source: AAOMgpcZhK43P4JOivOgDiD8djpz1pPkmiD8bnnWfEZeBe/Ajfaksvx8NVki/hdRLdbFiPa53hDGVg==
X-Received: by 2002:a62:1d49:: with SMTP id
	d70-v6mr19396694pfd.101.1533596260929; 
	Mon, 06 Aug 2018 15:57:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm11993137pgr.59.2018.08.06.15.57.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Aug 2018 15:57:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 15:57:10 -0700
Message-Id: <e9bcf3a4c54ac1cd9721abc0d9be5324d4004845.1533595822.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533595822.git.raj.khem@gmail.com>
References: <cover.1533595822.git.raj.khem@gmail.com>
Subject: [PATCH 13/18] Disable crypt support in glibc
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
X-List-Received-Date: Mon, 06 Aug 2018 22:57:40 -0000

We have independent crypt implementation coming from libxcrypt

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.28.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.28.bb
index 086daed04c..906e6c2b62 100644
--- a/meta/recipes-core/glibc/glibc_2.28.bb
+++ b/meta/recipes-core/glibc/glibc_2.28.bb
@@ -83,6 +83,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --enable-bind-now \
                 --enable-stack-protector=strong \
                 --enable-stackguard-randomization \
+                --disable-crypt \
                 ${GLIBCPIE} \
                 ${GLIBC_EXTRA_OECONF}"
 
-- 
2.18.0


