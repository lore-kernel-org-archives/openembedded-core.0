Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 72F637CB03
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 17:47:39 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id z84so6403196wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 09:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wK81DLoFj5SPUS9+wRNPNqv1J0ZPlwvujYCC6AZswkY=;
	b=QSgtP9MI9H8qPFTn//72eH/NjHXzJ9/iVy3OFaoHUyyVgvyhCm265MC2l+982EWDAn
	a6QhKBdkUlqxLJoUu4/6yjxdb8MzgGYshL/CwEjxfNbUzNaLQ43iTOnBrFeUZCI13Hzs
	6D9QOvcTR+Bss/TxbounpWVWP8nFpO22+AKfhelCZ9l1MR5jJ1TiE6DailfWg90J9y8w
	qsz6tKgoPTNh7GVFdxKkV6rqeTHJ2+GMoN7gIt0l4ol+KvCqBvCDr6cC9UPPyv1ugL1f
	DOUSBccufzAho84KVmn0RE80sBxNBAaF6IhL+3pmGXdV9aptzj0QQzc8LLeY5jl0+Q30
	QfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wK81DLoFj5SPUS9+wRNPNqv1J0ZPlwvujYCC6AZswkY=;
	b=h9zbZFjM1/ZEZriAgVDBF0BagU/qCE5kwn6akv3vmyDqAbzgBa9kSaqR/D6HEHShdZ
	rxJbXviR3ALGsGr13uoifJAWsMTnU7BfIRmaAozyfnFCCv1E2Rch2LopiN1eapcbxqts
	NxXZnwH0gO0f6EyYmsaT4Mch0plAnmiBKi7CvKCAyErwnnTr1EIqTRpKBD/E2K60rTu8
	qXkVuqYXXyJXnB2XG7cpLtLpQkM9AnRkEjy/JuPAAJOIHzVHV+NtXC1gYyz+qATHML5d
	jjhqYnmoJAB0S8ueq+ttObeqD7QajEEMSYtljPMZr2KvmB+G7KLtflneSRMKMdo8WR3V
	SlOw==
X-Gm-Message-State: AHQUAubS6rwXFFQfCaGWhoptD7G8dXXQKYZGtSTywdKJv9gaw66+fIUF
	ofYZbv3KSWW+WJL+GiCH49Jaulhf
X-Google-Smtp-Source: APXvYqzJmylRifvbi0Ez5r2aiF6PVzhpB+WCuw2U6TOg7v5TKKIj3zTPnStayG2FPVeLzjMNm3ZGzw==
X-Received: by 2002:a1c:f71a:: with SMTP id v26mr248958wmh.131.1551289659834; 
	Wed, 27 Feb 2019 09:47:39 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id g3sm2056294wmk.32.2019.02.27.09.47.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Feb 2019 09:47:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 18:47:32 +0100
Message-Id: <20190227174733.107911-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190227174733.107911-1-alex.kanavin@gmail.com>
References: <20190227174733.107911-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/3] python3: depend on qemu-native, not qemu-helper-native
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
X-List-Received-Date: Wed, 27 Feb 2019 17:47:39 -0000

qemu-helper-native would erroneously pull in the qemu system
parts, where we only want usermode parts for pgo.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python3_3.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.7.2.bb b/meta/recipes-devtools/python/python3_3.7.2.bb
index 4a1cbae8670..9626ee546b2 100644
--- a/meta/recipes-devtools/python/python3_3.7.2.bb
+++ b/meta/recipes-devtools/python/python3_3.7.2.bb
@@ -72,7 +72,7 @@ PACKAGECONFIG_class-native ??= "readline"
 PACKAGECONFIG_class-nativesdk ??= "readline"
 PACKAGECONFIG[readline] = ",,readline"
 # Use profile guided optimisation by running PyBench inside qemu-user
-PACKAGECONFIG[pgo] = "--enable-optimizations,,qemu-helper-native"
+PACKAGECONFIG[pgo] = "--enable-optimizations,,qemu-native"
 PACKAGECONFIG[tk] = ",,tk"
 
 CPPFLAGS_append = " -I${STAGING_INCDIR}/ncursesw -I${STAGING_INCDIR}/uuid"
-- 
2.17.1


