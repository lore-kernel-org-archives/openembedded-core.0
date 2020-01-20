Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9C7587FCD6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:25:36 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u2so142137wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jZl0tkKcz0sQv/yutmilLu/a9PR5KqNBL7WW2JwfHkg=;
	b=C9HRnNcgBFuFFivo1HJuGZz2Qcfr4l35lKdnuBuAQoFD3vPSskvWnvxM5QlIrDL6nP
	J/zrOZGwlfV2YfZTebTceU4itvnp7T+jAly1RgbNcUMO3SxEyRISLa9gsFC1bvKleHHH
	vuQS55oxa7V3LPLdP9QMKO3b5KdvnwYP4jNY4Sx8Ki62as5yjk4kVWl1HZ5FEgZh/UZi
	vmhibv9mxvK+F4lnAheEHtBXE8vH4vPdKGIRC7HHQOQQ4aEVYIAIvu4tQ9zvnADc/8MO
	MJ7fhSX6Rr7wTJOZ9KCpj/RDq9uoDi9fKawgfzpZdFcxDojK/BTF5n/U6fNhpAmx/Pw8
	SUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jZl0tkKcz0sQv/yutmilLu/a9PR5KqNBL7WW2JwfHkg=;
	b=gNAuItWnRQQM3Bx/vIrPylwPtTvvmhmp2iakevtK20f1+Z3CDvy+yTLEu4YKx5K3PO
	T89c4t9LEblYkiEqoIuxx8UcTkxbQZbF/MAiRYKKelZhONZQzWfDVCs716lZAD3z1aP0
	aZ9crUi2/hrchHFeoTiJ+feNdSdGw3SoFa9hkSMiBJ6b2tQfqTy0FRFKX6VZPS2RyKwj
	NYkJH1VYTAFpuDgKjnZPlRzD5pRv44ACH9Vg5xtfOe8+g6n+aA/fhCS3iYyaFH1g6jN0
	99CeyHFsNpJkseF5yAi8fJ1JXEviPyjAvVws7UNU4v9ox8XBaqtmdR1RvkaX297Z/zCp
	LaWw==
X-Gm-Message-State: APjAAAX/1xouOX4D2kzfVQIg19R66xhYuyea65FoK6VNg8c573mlfpYd
	5JnzCYJQLI0i38EK28LEM6ZaMVoz
X-Google-Smtp-Source: APXvYqzPA6m9IPeNwyN4dwXKN3+kmxMMUZiy/ye158GsKNKaVAW+5Wavt7JwTC/rnMXFV9MXM+zWlA==
X-Received: by 2002:a1c:a404:: with SMTP id n4mr346581wme.109.1579541137090;
	Mon, 20 Jan 2020 09:25:37 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x11sm31526wmg.46.2020.01.20.09.25.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:25:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 18:25:01 +0100
Message-Id: <20200120172510.22648-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120172510.22648-1-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
Subject: [PATCH 15/24] rt-tests: exclude another development version (1.6)
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
X-List-Received-Date: Mon, 20 Jan 2020 17:25:36 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-rt/rt-tests/rt-tests.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 227eb99b98d..3ac39d90c3d 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -4,7 +4,7 @@ PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git"
 # 1.2 to 1.5 seem to be development versions
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(?!1\.[2-5])(\d+(\.\d+)+))"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(?!1\.[2-6])(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


