Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 93CD97F7BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:29 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id r4so1893777pfl.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=i0NPVYY4Vf4dT759J/IGBttqyXsgBwpKMmDu8jymauk=;
	b=jCBl0JId504oRVosqWuwgq42mPRKERDGJbHkN5d3TtsY+nGVd4O43HQS9dlFn5+EPm
	A395M/qz6sfW1yImOp67+PayOXVNReukjc0QtFc9LZpKMOYzo4o4wlw9n8haTTrbh1+O
	eBgdRQO53SFjAs/MJ6EfgKod+NPTFFj3+sdWAPs1g5R5vIxGs0b8rp8lZlxPS1zJc6/S
	T2sBo4ThsFnZENth11+NtYfQ0TqR0iy+4KxSiP+nxljo0DzykRM3co86tejbdcWxLVPJ
	PJ9HlwAMFSwu2OoKXC/+/uSOgs7LOHIVU7CedN4XorQEiAEvSV7cpH+xBz5dif4et5B/
	282g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=i0NPVYY4Vf4dT759J/IGBttqyXsgBwpKMmDu8jymauk=;
	b=fNGvZKXp7iU0kBBwYdmwEhmn9sPo1+7VZCtPiHZI4RITwKyz+b0a+aLAUgV9ZgQVIV
	uijO/nJL38Wjb7HuDZkQYvF+HWZH59D4iNEqnW4dkm/MuzhVZohg2COqmxB+MeYt3uB3
	fOui3gKW1YxL8huh6PJFuUWbwFmnI/L88gWGsvNDTAgDeKx10j1YASIp1G2XOtqrorXa
	dmRjMuCMqjWZc3g+81itrOJd2yQfJhlTEGDa8TJDl2WYDvl4lN6j/cvE9PUZkooxH8aU
	j+fTqqFkM5r3awAnEbwE3kX1Q2M1CRcluLy4XG8sKNc/egDjIT92X5kNF1LL7IFrHlJX
	hmZg==
X-Gm-Message-State: APjAAAXYfALDst69TX9ZO39zUJKGckd5HYDAa40+VH4w9EfkSDpVnbu/
	6j/i1EOYjzy8MrU/jPiiNByfsMIE
X-Google-Smtp-Source: APXvYqw7smdlq/Lcqeeg6M2rN9jUma+2YpJKCtfuzw7a/x8Ft1aoX80ihvUIbdXvwebs4qkeVBt2yA==
X-Received: by 2002:a62:b611:: with SMTP id j17mr4879919pff.201.1573659150599; 
	Wed, 13 Nov 2019 07:32:30 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:31:47 -0800
Message-Id: <a10b6e0e8d4e6b5778b5ca4db60e96ea025ea475.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 05/31] libpng: whitelist CVE-2019-17371
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:29 -0000

From: Ross Burton <ross.burton@intel.com>

This is actually a memory leak in gif2png 2.x, so whitelist it in the libpng
recipe.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-multimedia/libpng/libpng_1.6.37.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
index 66af2f3..2ed87a8 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
@@ -29,3 +29,6 @@ PACKAGES =+ "${PN}-tools"
 FILES_${PN}-tools = "${bindir}/png-fix-itxt ${bindir}/pngfix ${bindir}/pngcp"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# CVE-2019-17371 is actually a memory leak in gif2png 2.x
+CVE_CHECK_WHITELIST += "CVE-2019-17371"
-- 
2.7.4


