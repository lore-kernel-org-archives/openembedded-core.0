Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 792926D728
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:00 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id c17so6678660pgg.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nUH7MkGfM3M2BiD7pDQVoBZUwXRw47CBguDNEuVxBTA=;
	b=es3xS8XgOx6q7/eWt/PSQ1obWg608gyops+QGC/DzPc6oNDiOcYWmVMzwimHWL/x7g
	1xv8Q2XPMj5nuftUHMbA3qCPkNVv1sFLoUnf99EN4wXDr+lmy+SRbfS2wVF085209/L7
	4FZPK7ZoCtnD7P4YfzPQE+Wg4E/n7ol1nC+avQMWDV+iFZn6XCqlM6M6hnwGBNVtxKHH
	r6LysFPEO/re/QFmpkWbHeQQwRjCGJnHPYRSODlJx0lXCk1eC7MrEVv+OZe6HF3TzGX5
	JLrBJLBV0dIKig2fPkYPzSLFWCFocwpJ3Ay6QBRnmlTAAdvPkkwGXdOUjBlW98fuuswR
	NlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nUH7MkGfM3M2BiD7pDQVoBZUwXRw47CBguDNEuVxBTA=;
	b=ZC1zWSWQPlkvmchopN5m1ZlIFrn4ocSaMk+CXxxo9ZcT7yo749BT0wteJu3NWj2xxM
	dmA8aOLzZy3m7YS0aHcEhAdidpaapm6yipBB/9BkSU60lKo2A1oV5Q6vnGLAY4bAQ3kl
	xD/mQ9r4G7KLdc67t3zGCG+crL7ROeo6w6G8oZRrnZ754uMqiyBfkUQAIGHRr2mkTZs7
	6tegqfV4vmrWoSd0eUqddYm3LkmvWwet0ivNALO/7v1kCv+31bUl7f5BD+mz4erYj1AJ
	BgZw2DsJB9namWjVrp36P//103ChpvB0CLjyc19KBGPhHEzI/sMcFCTaqANElRZWXrOo
	PUhg==
X-Gm-Message-State: APjAAAUnabVRQ0yhcPdZaq6G03x6/YqKxRn7rD2DPERn/H76EIWRL4UY
	EhJP2eGFWyWL1sp0Xf2XO4e/S357lhw=
X-Google-Smtp-Source: APXvYqyXCa4zfzir79FvXMmRFxXq8kjFR1b+LG/lugpl3rNW00Cu7tCArMPAJWm/YHRxWAS5P3YnVw==
X-Received: by 2002:a17:90a:bc49:: with SMTP id
	t9mr24212691pjv.21.1569818881404; 
	Sun, 29 Sep 2019 21:48:01 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:02 -0700
Message-Id: <203439837077275d632a62050f6606bd203c2484.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 07/54] libid3tag: CVE-2017-11551 is the same as CVE-2004-2779
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:00 -0000

From: Ross Burton <ross.burton@intel.com>

(From OE-Core rev: 0663e5f8f906803685f018061d51fd6277916e50)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch b/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
index 8d09ce7..10e0890 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
+++ b/meta/recipes-multimedia/libid3tag/libid3tag/10_utf16.patch
@@ -6,6 +6,7 @@ https://sources.debian.org/patches/libid3tag/0.15.1b-13/10_utf16.dpatch
 Upstream-Status: Pending
 
 CVE: CVE-2004-2779
+CVE: CVE-2017-11551
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
-- 
2.7.4


