Return-Path: <jpuhlman@gmail.com>
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6089361260
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 04:43:07 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id gv17so4835092pjb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 20:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FWf1p7QFSiKcxkNwftWXEwM2iHm5rRlq7RezCV1f3fY=;
	b=jymmwGzZZKJF1FuDnLXkUPWtUnIpXgmjpMWb8cY7eUp4EYtu/A2jTwtTXTLeFVy8Hx
	GEWhu8WqimdXmKHhrjNxVFkGW3/I2jq4vFW76dOoBiCSesbJun5TLN2AmZIT5eCYpw4w
	dtKCaWfXb2YbDgBft+YN+C5RFSBUrihN3pwO1vOFZkBj2Dzcx2JwPWweGwBTetcXhhd4
	LUxTZtc3Z5GHcl81OOYXEndBVOML9yg6wPnQoowGnGHsIAO3McroMNlNYCkZltJXY5pY
	VX26ElUYhL2KJsgKriB8hPKwnkwiw+o92lV0OwV/ZkPI40iUsDP5q0HHCEAA5b2QZcI7
	IRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=FWf1p7QFSiKcxkNwftWXEwM2iHm5rRlq7RezCV1f3fY=;
	b=ibBnkFEtXfgARfEMT6wOOc1s63Lg2WH5SXOkWzjEvTJpZs2uxs+PV4AOP0Z/Fq16Ts
	73XrAVbKBiT/FgWWZHA5boOkAFw+KvFKI9SvnzM6lUOulDwKwpMmWcoV6LsLDmSQ/Yxa
	2G32E8O+J7q8XsSZeoXxg97BZDyAkHYuYYliK+KPBc0XsfG8R5sPFj7AtrsN5/tOF/x8
	X2NmGTLSY/kl6FbBHzb/DvRp1VeWuEEg0cLz6k1+S4nDSmmjJtEVvkR/wWEPCsrUmWaC
	eVlFlIGyT3f31RASySoC9NZTCwjRs64h/Sq8oBOGg7PzsOBvXOkEqQSymd9CTo0D9izu
	XkXA==
X-Gm-Message-State: APjAAAWlNp5IpWZd4bEsXYZy1beL9BA6tPyWSSrMi809j7wljAXmK+Zl
	q9HueZ5sPNu98rCmqlpc4gpnEw0GAclhcw==
X-Google-Smtp-Source: APXvYqwH4MnKZ62kI4fzjodwbegBN9vgtlSs1fOYMBZmclVgWf91pzDX9Ntz2KOLqa4DuXJzv1Yn6Q==
X-Received: by 2002:a17:902:7790:: with SMTP id
	o16mr6330203pll.271.1581741788462; 
	Fri, 14 Feb 2020 20:43:08 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	y16sm8319475pfn.177.2020.02.14.20.43.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 14 Feb 2020 20:43:08 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id CC8612A0506; Fri, 14 Feb 2020 20:43:05 -0800 (PST)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Feb 2020 20:42:50 -0800
Message-Id: <20200215044253.5596-3-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20200215044253.5596-1-jpuhlman@mvista.com>
References: <20200215044253.5596-1-jpuhlman@mvista.com>
Subject: [PATCH 3/6] libsndfile1: mutlilibize sndfile.h
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
X-List-Received-Date: Sat, 15 Feb 2020 04:43:08 -0000

From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>

sndfile.h can differ depending on the combined architectures.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index 7855008f3d..b100108766 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -32,7 +32,11 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)}"
 PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[regtest] = "--enable-sqlite,--disable-sqlite,sqlite3"
 
-inherit autotools lib_package pkgconfig
+inherit autotools lib_package pkgconfig multilib_header
+
+do_install_append() {
+    oe_multilib_header sndfile.h
+}
 
 # This can't be replicated and is just a memory leak.
 # https://github.com/erikd/libsndfile/issues/398
-- 
2.13.3


