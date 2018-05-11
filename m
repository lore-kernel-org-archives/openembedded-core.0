Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id EB9487716E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 16:27:55 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id g21-v6so5892969wrb.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 09:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YM2wzoh8FBhO2Bd9HyveTzj4XMM8Ga+/IH7VMFgy5Ro=;
	b=hEwVUFYx5crIT+2e8CDLqvzKjzfwdGnWEKoOMb+CSwz2VHqqEUUINI2RvdWHswBmrZ
	YzGjplhd36zCB/CdDs5VoRUtjeIeaJG6HI/OdgLrkBxgw8DdmxXV1omRunceOUhZqhfd
	kXbAhTlIZa2qEQozcGwiuc7kllovkntWfGqXWsGs/CMzXT2yc1i1XNJ+x23n1XdR9zi9
	DZiQQWqFfaxGZiCq8i82x/ZkfiEPvSIwTraJ5Yj0HEtfoZ/ZhuGPB0GxDLqX/8dE7nQf
	cp8VZS6oFnJBer2Pt5GgJJgKMhy1XnswRncgm4LfB1KpfblV8p15y4SYeimLcV7kocS0
	cehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YM2wzoh8FBhO2Bd9HyveTzj4XMM8Ga+/IH7VMFgy5Ro=;
	b=Rj+T4AwHQLijltCSfUW2PsGzdtYAep663fggU/nURMnNRcT9yeIyB+/n9Weh1hmLVz
	AevpKQROCvW0UWXkvmDa9MuwtTgTKQeQLlOCr3P3O/pZ2eGjyp907mVcra8CQ3HbjTxF
	MEcyPsVJS7gSCKj39CfgxdHAEMkgBKUOmtDXw5e41Gm1+KzqRQabhocvdXB17pqYX0iT
	Zy21XdrzqXlkdkdrS8UT8G3RnCFbS4/ToOQ9L0z+pzWaoVJkzOCYm9GhiG/R1aASL0IK
	Cbkh8VwMMKvvTOg1DqV0ma9Zx5EjPmnzChhO1/ajMxCdC+iAB4CV5tAjLTcCgo+Db9Vw
	A7zg==
X-Gm-Message-State: ALKqPwcGlxbWXETlhI7KcSIRj6KmnFXOCAS9WubWugswdK8n1bzGl9Q7
	X2mJv5k/SDMk5CkgN+Z2wxGfUhUD
X-Google-Smtp-Source: AB8JxZo7j2ORhG+wfoAOr985Ar14h3K0xO8sl+Oqi6u99s7a/xTOG+diTrFvGvUS0P08mUqpeuWi7w==
X-Received: by 2002:adf:de0c:: with SMTP id
	b12-v6mr4917157wrm.131.1526056076015; 
	Fri, 11 May 2018 09:27:56 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	c21-v6sm3869494wre.81.2018.05.11.09.27.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 May 2018 09:27:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 17:27:53 +0100
Message-Id: <20180511162753.12634-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] uninative-tarball: Add libjis and euc-jp gconv files
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
X-List-Received-Date: Fri, 11 May 2018 16:27:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

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
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/meta/uninative-tarball.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index 38c3a314e16..c38c2a445e9 100644
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
2.11.0


