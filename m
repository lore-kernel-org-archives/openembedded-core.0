Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 368DA794EE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 22:48:02 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n2-v6so9461729wrw.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 15:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=ySIsmZndPoJRpRYhPhSQYcehkKws1YgNmY3cVE09XP8=;
	b=MiuFgiLWaM1sTxgA7JqD3Z0DtLFmcMz+bNNg8vuH2ToJPKokTgiIz0LQa71YABO9Bc
	c6WvbXsocEDN9d7zI2jEN65zWcGDaczzdGw3KYSsiEn7xH+0No+JccusTLRCluula7QY
	loNveVef+LTpRr/dzKJtG4oQn24p3lVNyzvrBKtmHMQ08nBE+5NYnLv/OnPIW5yZIPHg
	CbdIsrxplkr1U7pPaUhCBG1JdjvW5ehes1wtT464ek2Fks+PORgPLxzOMuclMGXqA79V
	L51iKl0wXosaRi+p+eiqBWVraP5FjHi80rc12usM+NnypOAjLFKEKh9/2hqM3mw1SyEq
	fnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ySIsmZndPoJRpRYhPhSQYcehkKws1YgNmY3cVE09XP8=;
	b=j0bKSr2mFMc1d7UNANDsokfAE9/mpvhXcBfrBZ81LE3lmr74NenUzh/qlZo8KGDa7u
	HemGkhBUEY8rN+Ot+nKS182V7Dxi5uqyT6y/pQWe/AISEE/Eu3E7taeyfXhQoO0TfoTo
	B7ApCaF7UR+NJeE24lIFTQXwPSvRzmGryKJHHfgt5KYU0sb2dWm0hgsfoX3AKvh7EHGM
	x0c45O3WS+KTsSnU5OCOKoa8bRizNODUzKznhvEwaUTaQrZuamNculaXO2iJ2KdQArzL
	/GKQ6OBEgKGIK0iHd8ZY2+WmgV4wMxlWuVI7F+VqUsD6wxxtNbTcZcV+LveGHOmpNXgc
	3NAA==
X-Gm-Message-State: APzg51DfMtbK8KfK+q1WO3F3XUyfbKUdNYVgEb5rsHjaUl5o/e20e/UW
	OS4Jwb03Jk7GKFJogzJAGNjJx/4KWNk=
X-Google-Smtp-Source: ANB0VdaimWvz5tG1lTXSRukiuOfi1zvYvxvtoWgiOGH8O7Kv40zMXQy+s7XIWjEd5YGGL5mi9AsEOw==
X-Received: by 2002:adf:a599:: with SMTP id
	g25-v6mr8951004wrc.88.1535669283434; 
	Thu, 30 Aug 2018 15:48:03 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	34-v6sm13493672wra.20.2018.08.30.15.48.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Aug 2018 15:48:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Aug 2018 23:48:00 +0100
Message-Id: <20180830224800.16627-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] harfbuzz: remove stale pkg.m4
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
X-List-Received-Date: Thu, 30 Aug 2018 22:48:03 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_1.8.8.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.8.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.8.bb
index f41db989c70..b904d935317 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.8.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.8.bb
@@ -27,6 +27,12 @@ EXTRA_OECONF = " \
     --without-graphite2 \
 "
 
+do_configure_prepend() {
+    # This is ancient and can get used instead of the patched one we ship,
+    # so delete it. In 1.8.9 this should be removed upstream.
+    rm -f ${S}/m4/pkg.m4
+}
+
 PACKAGES =+ "${PN}-icu ${PN}-icu-dev"
 
 LEAD_SONAME = "libharfbuzz.so"
-- 
2.11.0


