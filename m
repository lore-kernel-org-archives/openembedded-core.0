Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7FFF965CBF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 17:56:05 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l2so67272634wml.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 09:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=90NSVf8HegKS9CBzr44tRc6M2xcvHLK+00SjjlIs8u8=;
	b=Vbj8jsZkHZDGhNwIH7OjNLbQQaAKkEzv3QAzyUY/QZHA5/cWeECw8+dyj4AOuakEJS
	HIwiqfnT4O1u027lw/v6iT4R1AoWOQ8nn1yLasqBvJXfdcvf/RHntPlirGauzSHtPud4
	kVTshm8uZbm86hHINK7zQcXUbN6J0ZNNFc8ozu27K11+NjJSxBJ3iVwtrqiuxhr0xO+g
	j+HBjFJ85NQqHBYqmADBsAYBmZmV3i/k3h80v8qkYcXDaP5aCKbhwdWbQ9NlVMxScCXq
	6UazlsifXbImYJcYXf/dJ/1Upy5PMi+VaR8t0aIjPV206gPoJQzwLsH5mqujUPOKrHz1
	FBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=90NSVf8HegKS9CBzr44tRc6M2xcvHLK+00SjjlIs8u8=;
	b=CYCZb0OIP3Gx1t6NSid7ooJdp14W412RnYR9d3uGjjHCciUH2IS0Yp8yntm830ojFT
	sbF6f8Uim9SYXkoVTvSYiyJ2Xe8L37ku5pQsUsmcJlzb5j05uldwIorJI+YOQ+ZXtD2k
	4kEWAvQhd2lv5Z+dObBLLQdIUn7r4+p9gzZqHQrjljD2Epzj0eVhq2g1HtjLmeMjpkeY
	0LjqCwmvozwRnbVL/NQ2qFKAG64rARJNqS/pRsKZSxgE7DpIVUmudzBGlL6kZDzZVbc/
	+XWE7TThHhgRmmTmqCRkKN/rtVUEg4pdBiTI7hcyBwPhL2ZcBGYMKl5u9lSdhadJ0kRN
	UFOw==
X-Gm-Message-State: AIkVDXJHaC+OveUisJeAdNg+gitqb7DaKuJm+Ja0FqkWzvuMHzYlociOKtCfyq2CaUIaaQ==
X-Received: by 10.28.238.70 with SMTP id m67mr2306908wmh.123.1483552564891;
	Wed, 04 Jan 2017 09:56:04 -0800 (PST)
Received: from localhost.localdomain (p579F760B.dip0.t-ipconnect.de.
	[87.159.118.11]) by smtp.googlemail.com with ESMTPSA id
	di9sm99538997wjc.37.2017.01.04.09.56.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jan 2017 09:56:04 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2017 18:55:53 +0100
Message-Id: <1483552554-25685-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 0/1] follow-up for alsa-utils update
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
X-List-Received-Date: Wed, 04 Jan 2017 17:56:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This should fix build as reported by Ross [1]

[1] http://lists.openembedded.org/pipermail/openembedded-core/2017-January/130726.html

Andreas Müller (1):
  alsa-utils(-scripts): fix compile on build machines with
    python-docutils installed

 meta/recipes-multimedia/alsa/alsa-utils_1.1.3.bb | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.5.5


