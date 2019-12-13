Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5D5C97CE26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 23:22:00 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q10so462463wrm.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 15:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=2isAA5pABOTrwzgaeD4jKu484NnMq4KG4UHw/clgnLQ=;
	b=OaRq0XOxTlFchwgOAbNAvi+rxO1/Fmibn3Us3PTZCu1mVeTnqcnXg86GITh7EjMjiC
	ADU+TEE2ZQDLN7xECukKSQIlgbv0/+AU4GJaiAeTyonX9y3RuP3GotMy8vSLopw/o62q
	JqKkVbC4k4uZxa7htR6MlqGOT8i5PoLMzxLOop1avC2oOde91QgDPmglcbsZRQg7YJ1z
	yRMYS/Y0omXEYI+2n4JWNS5bxuXjuBy/YbvT3zR2KO69Z9aRd0RbT2DVhB2l9S1gNLLt
	N5QA/WxG2Tu6yzcwWw0ZYj7GwCMVnyaqPj1KzJ8yX1KEL5ek6c2HzYJFDVwfC5FLjE+E
	Z1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2isAA5pABOTrwzgaeD4jKu484NnMq4KG4UHw/clgnLQ=;
	b=fqHMolFSCx9oXL3cVtuBBTQr27fueX3MRQo0ImCOjpYSpOv03sR4+OTMv0mX8iNMdG
	HhRdblK5S2MvluxYZH+hQgvJRtqP4lwX2cLlJHuTVn/LqE1FRnKs0WTtUdLJOgzC1xOV
	gdI7LaSYSlxy7P+teBlaU3I/b2rx4m7R0CBZbTdRafKXzJOKrRc7DZepqmoXe/U0vOe6
	QcLRbD0ZNdaYITwX7hMRSoKdAbTeuwoFGnUDkfUhV5VlYLnlbfze/Em+psGEuXehxvrn
	V8BOWe9Mjc3/a0ddxnr36Zo/hJMare6DgatjoZkX4RzdP6BR66uDPyQnzRVnxKmL8W2H
	h+ZQ==
X-Gm-Message-State: APjAAAX+B4ElVQ3u1nB6gNuysopbFDtRiMjZJ59iIJv297w6Ir9KNqX4
	6JtigYz9/vNg2MJNukhlr+0ntLNwYa4=
X-Google-Smtp-Source: APXvYqzSaGjUDUq4uZxfBZC6lHxSZas+a5mTmGvpMaURk0zxJBLLBxmnGBq/hqCe34/31fVaE2wdbA==
X-Received: by 2002:a5d:4044:: with SMTP id w4mr15204196wrp.322.1576279320934; 
	Fri, 13 Dec 2019 15:22:00 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z6sm11180507wmz.12.2019.12.13.15.22.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Dec 2019 15:22:00 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Dec 2019 23:21:56 +0000
Message-Id: <20191213232156.28367-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191213232156.28367-1-ross.burton@intel.com>
References: <20191213232156.28367-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [RFC PATCH 2/2] reproducible_build_simple: inherit podfix
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
X-List-Received-Date: Fri, 13 Dec 2019 23:22:00 -0000
Content-Transfer-Encoding: 8bit

When doing reproducible builds inherit podfix to remove the possibility
of differing Perl versions causing manpages to change.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/reproducible_build_simple.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/reproducible_build_simple.bbclass b/meta/classes/reproducible_build_simple.bbclass
index 8a60deef3d6..d0842f0f902 100644
--- a/meta/classes/reproducible_build_simple.bbclass
+++ b/meta/classes/reproducible_build_simple.bbclass
@@ -8,3 +8,4 @@ export SOURCE_DATE_EPOCH ??= "1520598896"
 
 REPRODUCIBLE_TIMESTAMP_ROOTFS ??= "1520598896"
 
+inherit podfix
-- 
2.20.1


