Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id B5AE27F0C5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2019 18:01:07 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id r1so15507524pfq.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2019 11:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=P4iKRYOBQbON/6oKETWw0EFOrjVvFPqonhF2MzgrJLI=;
	b=eH+4HDinDH3Wl+YEJFLhh/ZMjdoNUVHLE9R0WI20O3GKn9rQf47JQPndxFXCFPvFv1
	SRLVH2WP7HMVyu0aFGUIXAiw6IiiU+kMYHA2r/HXIFXVu+6pDHjqlMizizhsuTWMmeKL
	C3dUfcnaZz71mNiQgKxtfnmjiur+Vz8Xmxn/pSbAH3BVFaK/cZokj32HSz99/Mb0NXHG
	RkWEmlcrVTmLJZDRsPIJ85bWij6DXCHzf1/pu2XKHOaJqJO89JAhRYQ88XAkRE7eVhyr
	48X+TxnEq44LK61REfoLIsCDRU8OReS49enGecT0viMOaoFAe5eS/M1NGRLvYxceYePS
	G51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=P4iKRYOBQbON/6oKETWw0EFOrjVvFPqonhF2MzgrJLI=;
	b=XKQRE5d7HrlLjH9yh0yTw+lvhS2Gjny2wg61dqhatSb2rW9ghtMQMj9hVAwnpF3qFS
	lqBS9T81GTwq64m0E7NBC1i5F9NH7RRRvdRhsegIWgQyJXtVxZHvA3f5bWGFvjcO4hDf
	Chuk4Rg3GGcwZ0PmWOnVX0fs33Zsfal9Q6eHnSJm9a91EZhP7Xq37KpJZ0RjodC2NPND
	ENTnCivRyXAtpx/0t0d6qqceAWzBIl05MUSbN+k0hyD373KTi69lTgeRf04SgZLcqRIn
	OvMeP7TeCH26owoagee7g1EuUfBdBt6Lx+amUhWDitgCmZaMlX0bmYXf1PpeHKIgcUnB
	sP4g==
X-Gm-Message-State: APjAAAVngrenxpTw7+itCe+hd8bVHAVzQlCPNZptInvYb15ATLHIoZzi
	x5sMelhSVp9jEQ9U0Wxf3/j4BYeVu2Q=
X-Google-Smtp-Source: APXvYqwBctaULlq8zhu7bCi/PqqcNI1ENrZwXoMXQCilcczC7B8322353BjE9O7xUlodYs9JCtUifA==
X-Received: by 2002:a63:205f:: with SMTP id r31mr61052450pgm.159.1563645668287;
	Sat, 20 Jul 2019 11:01:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	v27sm46118706pgn.76.2019.07.20.11.01.07
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 20 Jul 2019 11:01:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Jul 2019 11:00:58 -0700
Message-Id: <20190720180058.10672-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190720180058.10672-1-raj.khem@gmail.com>
References: <20190720180058.10672-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH V4 4/4] maintainers: Account for musl-obstack and libssp-nonshared
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
X-List-Received-Date: Sat, 20 Jul 2019 18:01:07 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index d403ed7938..77a753a5bf 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -387,6 +387,7 @@ RECIPE_MAINTAINER_pn-libsm = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-libsndfile1 = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-libsolv = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libsoup-2.4 = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-libssp-nonshared = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libtasn1 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libtest-needs-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libtheora = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -517,6 +518,7 @@ RECIPE_MAINTAINER_pn-mtd-utils = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-mtdev = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-mtools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-musl = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-musl-obstack = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-musl-utils = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-mx-1.0 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-nasm = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-- 
2.22.0


