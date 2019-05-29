Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 669D77E28B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 18:43:30 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b18so2461262wrq.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 11:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=S4KBGIWo8qHtVG+PTwrxTRMRT64t2mNfLBYU8wf/k7c=;
	b=e65BT0vh7Z3E89HcMl+uZLaX3pBRfJ4c+bJ/AeVp2uA5Cjo631GfYyMpKr3lnl6W3a
	I4XjQN+luLh/ZC4J1GXwoyA/er+GzklfLLIYSldhX6ZgIwA8u/Du7+WGmXcjwJWyX+tE
	NbLrEvFjJblJjo+zGemd8rYp9R1Pbyv2f0Jj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=S4KBGIWo8qHtVG+PTwrxTRMRT64t2mNfLBYU8wf/k7c=;
	b=U0ayr5Ie/q4OBQ8Qk9kL6+xcd/59CTOqQqdi1b7t9KADJu62uuz4sa54QYUUl/wK8L
	0Lrw7DoQUKB9FxCnhCsZsMegN6mMk/xxvHAMPIsz84W9SXtEbz7L6PyFPb6gl7Hj0AhY
	zHnvJuOSDFA8Kg2fTBUitjiIgIVpvU/ofnQSxeFu/9kzxOBN797GuQ7Ct5vMuaT66tVQ
	DKwXYX3G8KCNniS83hUDnyOgt5PBhSFgNDLEOA9N1Ddw13DDZhUtkyGVozg3m1Bhj0Bf
	tTxhCaMLUFcxCW+RtxIk1YBCdAZE98ZOeFw+VTTYfGK8NS9UEYlA9+Euxh06GQh7Vwkf
	7EbQ==
X-Gm-Message-State: APjAAAXjHIoXNI8ahisSCnNTwtnNuB8hLWWKduiG97qtGws+6FaKMYaL
	jLIT/C3WRUKRvL+8ms1kdea4KEfcJM8=
X-Google-Smtp-Source: APXvYqy4r8gC4Tzx/4ufePs96/azzl9uaZib0Zfb3bx3zqvRvqtY9JkpHydsO2jFxctWmxIimXT4og==
X-Received: by 2002:adf:e590:: with SMTP id l16mr13695078wrm.257.1559155410960;
	Wed, 29 May 2019 11:43:30 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u5sm115441wmc.32.2019.05.29.11.43.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 May 2019 11:43:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 19:43:28 +0100
Message-Id: <20190529184328.28470-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190529184328.28470-1-richard.purdie@linuxfoundation.org>
References: <20190529184328.28470-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] uninative: Switch from bz2 to xz
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
X-List-Received-Date: Wed, 29 May 2019 18:43:30 -0000
Content-Transfer-Encoding: 8bit

(From OE-Core rev: 29fc9210b973be68de474e75068e4c72371afe5a)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/uninative.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index ba99fb6e8fd..3326c0db3da 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -2,7 +2,7 @@ UNINATIVE_LOADER ?= "${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib/
 UNINATIVE_STAGING_DIR ?= "${STAGING_DIR}"
 
 UNINATIVE_URL ?= "unset"
-UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.bz2"
+UNINATIVE_TARBALL ?= "${BUILD_ARCH}-nativesdk-libc.tar.xz"
 # Example checksums
 #UNINATIVE_CHECKSUM[aarch64] = "dead"
 #UNINATIVE_CHECKSUM[i686] = "dead"
@@ -89,7 +89,7 @@ python uninative_event_fetchloader() {
         cmd = d.expand("\
 mkdir -p ${UNINATIVE_STAGING_DIR}-uninative; \
 cd ${UNINATIVE_STAGING_DIR}-uninative; \
-tar -xjf ${UNINATIVE_DLDIR}/%s/${UNINATIVE_TARBALL}; \
+tar -xJf ${UNINATIVE_DLDIR}/%s/${UNINATIVE_TARBALL}; \
 ${UNINATIVE_STAGING_DIR}-uninative/relocate_sdk.py \
   ${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux \
   ${UNINATIVE_LOADER} \
-- 
2.20.1


