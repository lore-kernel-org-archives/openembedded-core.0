Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id EA3A57F881
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 13:51:09 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 11so16787532wmk.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2019 05:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Nd8TWsrwP4UAVeP/ecM3jzGX6mFmdvC848p5nq2FRtQ=;
	b=pDQiC5RVcv/sMIht5I6SAXtqrEp9XYUoEh3iq1/v+Yu58uARigYrDaZu6rHfh55jq4
	xLAvCfQ6qyOZzf68bAajaDiQjhXyJPVu4vSadbnqU5cd8jwy2ViyREW63GBZIl0jrwcv
	wHeUUFLGvBUY3CIUIfFdsX4BV+VTFuoeD6FANpbuJAtxZXphZ6a79/7HOblqUaMY7Cqj
	/BYEhOfT4TEOcrIf9lo8tCVQmzvjwVVxVkHU2iaag+tT2uDPKaHFTZrlOtBy8L32qlIz
	0H3c3/nTt3SJvgAe70RyfPdBiEG2t+M6VZz3Lij7NdC3kkfm0f54AK4QZl9g9qkFhBrm
	dDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Nd8TWsrwP4UAVeP/ecM3jzGX6mFmdvC848p5nq2FRtQ=;
	b=UQkhC9yS+988S5L3vNF6P2XD4n4bXjrRknL8V5fBZnzoeyHVn/90P8us62WxJQaDdJ
	kt3QsIK0IX3TjvX4gXFVHsuTUV26YXouFLnjTzbQp0yVNX37URperbGNvoz8kZmnjxLC
	KuifZWixlDkpU493ZmYYTZnXmDc49+MtZdrIq3T35S4tFcdKJlkKoOc9hn1E+/VWKkH7
	ZQ6VA15JZSxpPlpIdcHg0Bf+C9ToHTuQ60dwLhSdUVSoPzVeIfvraas6OEh4J0meZYTF
	QTM+c1NYqmj7hoOYCnmiYQPvpQQcZKy1ta9YrWImI4MtldYimSIxTzjvdpMTGnrWZ21N
	sNbA==
X-Gm-Message-State: APjAAAUJES0UIhZknH4JDsdjf53MApDnmqDRytekk98tQnMTf/81x3yZ
	e6aNT5Q2DinAA7PYdnjr2zXWY9Damqw=
X-Google-Smtp-Source: APXvYqzLnEalbUXUz4WlMtOHQnoGxNudMyritNIAglDtA/EbhA7OL9Yuti2qLO3B43LlOADBNb7LWg==
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr9284468wma.38.1572875470471; 
	Mon, 04 Nov 2019 05:51:10 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d11sm13431368wrn.28.2019.11.04.05.51.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 05:51:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Nov 2019 13:51:06 +0000
Message-Id: <20191104135106.14625-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191104135106.14625-1-ross.burton@intel.com>
References: <20191104135106.14625-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libsndfile1: whitelist CVE-2018-13419
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
X-List-Received-Date: Mon, 04 Nov 2019 13:51:10 -0000
Content-Transfer-Encoding: 8bit

This is a memory leak that nobody else can replicate and has been rejected by
upstream.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index ffb45855a4b..0ba58399624 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -33,3 +33,7 @@ PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[regtest] = "--enable-sqlite,--disable-sqlite,sqlite3"
 
 inherit autotools lib_package pkgconfig
+
+# This can't be replicated and is just a memory leak.
+# https://github.com/erikd/libsndfile/issues/398
+CVE_CHECK_WHITELIST = "CVE-2018-13419"
-- 
2.20.1


