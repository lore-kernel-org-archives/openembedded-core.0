Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4C48F771B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 10:53:25 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id y2-v6so1452655wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 03:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1iGAv9xwxIvJi1+wAczVyQSzRFc/BDlx+9TstZFDJac=;
	b=JPk+XWqwqr89H2bY7bpWtz0t0x+tfMvAoVOJJ9lIHOdzn+6ljefcWZkikmPdscbVlw
	CcxS1LIFAmaKiR1Z/EQX2Mg+qU5r7lk6VEh9gAokYIljGQIW/e91okTHztp379rn/Fsn
	cvM8vH9Esk4IMThiP8Oci+CmDGwmidSNlVX6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1iGAv9xwxIvJi1+wAczVyQSzRFc/BDlx+9TstZFDJac=;
	b=iPKEmWc4N4Wff4REY2mFBOz33ZgAuJnluEzVBAWxkx+jyz6Ylay7r/JqnCos/RXdah
	tbnG7QWHozeotv0Rw58AGHP+eW2mfAyI3YGnozk1JN8msjKtVpxNRPP6c7IVOfVQKAA3
	UdgrW4tLtAFA6YZuBgYTeMVBr88x1yW1QxPQ1CPKQXmarP/196Su4SG+U9++GE6ZrvUw
	7EapUoJ/PY8EPlG64Ge6FLpCYMotbHtTUv6iLM1Rx/sEXPTC5ZmDVifuDoAEq7Q0vE5r
	uT0xDKcMe6ANLb2SQDgEg7+X90bynrxvAkJWXim23Fvg/AOL/0Nvm67L5jf9BWNmEhS8
	V+ug==
X-Gm-Message-State: AOUpUlGgy4ruWcJgRl8Ji0ccz6SDjMqAon4Fh6KJ6e6ZG0SonUhCu+H1
	oHzxLR8VamfEfDJUGZA2cor+/itzxeiKPA==
X-Google-Smtp-Source: AAOMgpdfqCgYxjGtRuEpWs2I2S7vpAVh/srw9AtGsNRMW0EAB+K/DbylJgIj5BTk7pJMk9IQiamClQ==
X-Received: by 2002:a1c:f03:: with SMTP id 3-v6mr1619997wmp.129.1532429605849; 
	Tue, 24 Jul 2018 03:53:25 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e10-v6sm2037488wmh.19.2018.07.24.03.53.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jul 2018 03:53:24 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2018 11:53:16 +0100
Message-Id: <20180724105316.2085-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180724105316.2085-1-richard.purdie@linuxfoundation.org>
References: <20180724105316.2085-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 6/6] uninative-tarball: Add nativesdk-libnss-nis to resolve glibc symbol issues
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
X-List-Received-Date: Tue, 24 Jul 2018 10:53:25 -0000

We need this to avoid symbol mismatch issues for binaries that use this
on newer systems which then won't run on older ones where it isn't present.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/uninative-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index c38c2a445e9..e0cb9ffee0d 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -16,6 +16,7 @@ TOOLCHAIN_HOST_TASK = "\
     nativesdk-glibc-gconv-libjis \
     nativesdk-patchelf \
     nativesdk-libxcrypt \
+    nativesdk-libnss-nis \
     "
 
 INHIBIT_DEFAULT_DEPS = "1"
-- 
2.17.1


