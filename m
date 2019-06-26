Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 635997E6C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 16:53:59 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id m7so1749779pls.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 09:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/F3KzzywhGSI9y36kCD7rkPWptfk+3RnKs/O/ljbonY=;
	b=YjXvqHw1DBS+K4f4as01rEzcBXS/gtc+q+3SbY8yWE4jkcMtm1SWSCEt0pRxQ1AzQu
	vUdWBNEAAl/4rMsPav/BCmGt1tp/sQR/QSj6nMY/TNFO9q1opJOw7KRmNQmadNM/Mo0p
	KAb5TRVWCrv1ZqL1X9pHnX7rF93Qft3/H5vm2hlxFxiTAHibEAjD7gYWvCvHqieW57zo
	Ms1ITrUTo7fdsw23GSv7om06uiCG/2JsdI+wPUorWoURBhhnl/YLXq8ljN+qX0BFRsMo
	iKOmTP/eUjDFXNLJC9zC0LKBU9SwRQZAcn2Q86f4d2WUTzQm3CxD3i3F/lv/VVnTnRhs
	fHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/F3KzzywhGSI9y36kCD7rkPWptfk+3RnKs/O/ljbonY=;
	b=nStWT5nyckyp5OLqi/8tVgdU5nr8Pvr3+D3UgDzDivfWRgeaNarb0eqaEDqwceq+wt
	XZXzMvs3zmChNVaqh8upQqrh49t+UrewFlpWHNRDZPc5iBZcyZgkAJPUo4TNTi8dc094
	rnx1dh2uhKCbfgEK+lU0m52ChgJgkYPulMGskSTLs4KkvxC+gMFWRNxNM9wQwST9m/zW
	dQQL4vtFLqaeIs3Mkph/LdaS5yKDmawJaHy3xg1LCeqQHOS2MYUl/toVGRti97InxrqI
	G+zk0IOpUqEfI0262S/0BPo+NVhykD9+GRzSaTsiS4Kvr6ptmOLeB7IHN4kRsY5U2M3E
	kxuQ==
X-Gm-Message-State: APjAAAV98ZrmOo4Si40k++Zj3so4LNFYr7/tnakPPjLb1M7igG794v9J
	3rAzmE0Ujc/1XkJlFZsk1cC5vTJgjyo=
X-Google-Smtp-Source: APXvYqyzveHdS65VJWyOfh1HYh2kKHO1w1kX/kVC1TmWEG41hKvfcBJry7c+w9agJt6vF5BpelyJgQ==
X-Received: by 2002:a17:902:2bc5:: with SMTP id
	l63mr6823838plb.30.1561568040389; 
	Wed, 26 Jun 2019 09:54:00 -0700 (PDT)
Received: from localhost.localdomain ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	t11sm15339687pgp.1.2019.06.26.09.53.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Jun 2019 09:54:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2019 09:53:26 -0700
Message-Id: <352ab80333096df92ef0f4cd331baea98e71aa21.1561566521.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561566521.git.akuster808@gmail.com>
References: <cover.1561566521.git.akuster808@gmail.com>
Subject: [thud][ 25/25] uninative: Update to 2.6 release
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
X-List-Received-Date: Wed, 26 Jun 2019 16:53:59 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The 2.6 release contains both libcrypt.so.1 and libcrypt.so.2 which fixes
compatibility with recent fedora/suse releases.

The difference is one is built with obsolete APIs enabled and one disabled.
We now ship both in uninative for compatibility regardless of which distro
a binary is built on.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 0bb8f7a..df24346 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,7 +8,7 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.29"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.5/"
-UNINATIVE_CHECKSUM[aarch64] ?= "ca977ff95c77f983570141908d451ff7d78add2864471605af404302bb36a1fa"
-UNINATIVE_CHECKSUM[i686] ?= "7b5822891c293795faf8a4a80586b36f8cde405387524916a24f9055ea82f7ca"
-UNINATIVE_CHECKSUM[x86_64] ?= "ed0ac07c710b711925cb976685dd855fb1d442dd840d00194751c18bf480c4ed"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.6/"
+UNINATIVE_CHECKSUM[aarch64] ?= "a37118fc8b423f48146120707b81dd15017512c3e8ef9e6ca2cb3a033f4f4046"
+UNINATIVE_CHECKSUM[i686] ?= "3234fc3ded810225071f23a0e9a99f4f8c2480059945a848eff076ce78122ade"
+UNINATIVE_CHECKSUM[x86_64] ?= "133387753a9acf3e1b788103c59fac91e968e2ee331d7a4b9498e926ada7be57"
-- 
2.7.4


