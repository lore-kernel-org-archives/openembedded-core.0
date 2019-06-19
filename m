Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2E1147E95A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 13:56:47 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id v19so1957709wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 06:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=dZAE5bCa17zZbTzBjzH166qBfdsSVFxjQbqx3ZS/GxI=;
	b=KRYUs2p/3hx+QboOb8E4JJW7JsQ10BUxf9VlKwg8Emt+kiS9qkKEap6S1YtpCucCjf
	dFODqFeFiPLVVhVQB9OMYCi4X6ocBZHXX3ZP6IK1q/j4OGo7+EdFcAl0QELIEtJ99EsQ
	+AyYjKIzPVULSo2apZCfZOiDQGIG9O21sXRcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dZAE5bCa17zZbTzBjzH166qBfdsSVFxjQbqx3ZS/GxI=;
	b=JIYMRvmdMnopM8CVBHl7kVq5TNaZ9WQWm2lpTx8mQMsQGPkAW032Vtdeqs76gcHDl+
	bpTNfaBEs0uZGdHcXP27Gru449MqsH8GEG+4slGmMnEUqqd0gL415xVhc/mQ9Iw0UmMn
	v6EIBKSWEQ0HBDQT8CVCWo9BXyVVBWZ5gcsIANVBIi117iSOpkR5iMVCKt/4NB0Du6Oo
	bkaUevRndf2M+9Do4NNYHw6ethANRH0qaDW5Ta4HRbA5J4M+Rt0Q9/3q8hOT2YPV0ZWn
	168VzbH1N4lTcgmIqzCbETars/pGFC98Lxhc2u7xi5dwVcQQkRDIkYhu2dxpTweTQvwp
	q7aA==
X-Gm-Message-State: APjAAAUg0jKXmuuaBEnrIcIjU2SxrXVA6u1jgIEfr8k7CXzhQjerVdLm
	9KoqsFgtFGXilHfu8U/WWseZ8VQUuA8=
X-Google-Smtp-Source: APXvYqxQoOPFNcfaVzatkvaq+ERtjeM+kLVRtb4zYfoVf95nUxYLPxSsQY1z/yPVQ3G6/xejQqggCw==
X-Received: by 2002:a1c:f314:: with SMTP id q20mr7898672wmq.74.1560952607785; 
	Wed, 19 Jun 2019 06:56:47 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k125sm2090642wmf.41.2019.06.19.06.56.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 19 Jun 2019 06:56:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 14:56:43 +0100
Message-Id: <20190619135643.23332-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190619135643.23332-1-richard.purdie@linuxfoundation.org>
References: <20190619135643.23332-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/3] uninative-tarball: Add libxcrypt-compat
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
X-List-Received-Date: Wed, 19 Jun 2019 13:56:47 -0000
Content-Transfer-Encoding: 8bit

This avoids sstate/uninative relocation issues where a binary was built against
a system with libcrypt.so.1 or libcrypt.so.2 and then run on the opposite by
ensuring both libraries are in uninative.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/uninative-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index 25635fc2f50..39638eb8c55 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -16,6 +16,7 @@ TOOLCHAIN_HOST_TASK = "\
     nativesdk-glibc-gconv-libjis \
     nativesdk-patchelf \
     nativesdk-libxcrypt \
+    nativesdk-libxcrypt-compat \
     nativesdk-libnss-nis \
     "
 
-- 
2.20.1


