Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 81164754C0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 06:52:53 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id v24-v6so2754527plo.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 23:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=m0ez3hYs4l7BnaVwpgNwfryXN9TpakgYpKDmcBBdB4Y=;
	b=s12SkjroDe53p0Kq4gjWaqiTGx5VB5mKtDGsTjWpPQzjhclKG3jJa8vWLagbqCQzm8
	Rao5geFI75ul1/+zARI3OfRX8Lf43bIWXwwSjdWXAwpLkgqMRdisI8LSABYhZPit1nyi
	Lbxkxos3mlbcSNDkEmHMFzsFFQewdCyJbMWEVDIjPyP9o2GHT4wcxfJ56z9XVrouInS/
	YsyWJF+5ZLZ6DEgNPJCxu4O2kq7pi5fpg34DrpuDA+bp/zfliPLjcxhspDVAotB535wB
	oTTw1Uu79SgKWs/0Vsav5qeCXML36v9iRNspfdDjjqjTuSQWlBYTkez3LCaHhgH6YwV6
	Xd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=m0ez3hYs4l7BnaVwpgNwfryXN9TpakgYpKDmcBBdB4Y=;
	b=oQc6nv4n7Wm/vmIsONoPdILDpAyIi4KbVJyV7v0xi4Al1KOwEAg/7kjm6qlhE5Ff+T
	qShq4tp0eE2AvqyyIfZfuWtOzFzPuW4417SefflYvZIS61okgOl++r135mSxz5HH79pF
	uPlRwC04ACR84pq3W+2UUU0kvlyAyPFu4EPK2aQT8hJYkjhEIjpVdJX6TqAuWjiO+u9a
	ov+Vl3lLq9QWtvOweIcqfDlShLfHizlmwyKPOgrtrGi8cVI0iRWfnwIroHjJ+jHPQiLC
	b6GHAFFzv+C9N7oxauZGFNlYRJiHhRWpcNlDJIvsHI11HActyEgLk6pr2CdvXzlkL/ba
	vGuQ==
X-Gm-Message-State: ALKqPwdyRS6M4vG7uqCX2VQqZyeXOizPRsenQGi/tZLUGFEusGlsVss0
	XMddU8zMVM4YgUuzvAea9ypGTg==
X-Google-Smtp-Source: AB8JxZp606fWkOENwA0yHP6Z/TMp670VUHa6EP4o2NsbsOWJ/1pAcCZ4xGE1Tsd+FA4+wSpiEYVywg==
X-Received: by 2002:a17:902:a585:: with SMTP id
	az5-v6mr4296134plb.79.1526021574424; 
	Thu, 10 May 2018 23:52:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	q126-v6sm4583116pga.79.2018.05.10.23.52.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 May 2018 23:52:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 May 2018 23:52:49 -0700
Message-Id: <20180511065249.40069-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180511065249.40069-1-raj.khem@gmail.com>
References: <20180511065249.40069-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] uninative-tarball: Add libjis and euc-jp gconv files
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
X-List-Received-Date: Fri, 11 May 2018 06:52:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

packages like fontforge-native fail with mysterious errors like

| ../../git/inc/gwwiconv.h:44:21: error: conflicting types for ‘gww_iconv_close’
|  #define iconv_close gww_iconv_close
|                      ^~~~~~~~~~~~~~~
| ../../git/inc/gwwiconv.h:37:13: note: previous declaration of ‘gww_iconv_close’ was here
|  extern void gww_iconv_close( gww_iconv_t cd);
|              ^~~~~~~~~~~~~~~

The reason behind this is that a check for iconv fails during native
configure run, the check fails because the autoconf test to check for iconv
pokes for these gconv's in test runs before declaring iconv support successful.

Therefore when uninative is active the package fails to build but when
uninative is inactive all works fine. this patch fixes that

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/meta/uninative-tarball.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index 38c3a314e1..c38c2a445e 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -12,6 +12,8 @@ TOOLCHAIN_HOST_TASK = "\
     nativesdk-glibc-gconv-iso8859-1 \
     nativesdk-glibc-gconv-utf-16 \
     nativesdk-glibc-gconv-cp1252 \
+    nativesdk-glibc-gconv-euc-jp \
+    nativesdk-glibc-gconv-libjis \
     nativesdk-patchelf \
     nativesdk-libxcrypt \
     "
-- 
2.17.0


