Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id F38E17FF3C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 19:27:55 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id d5so2095861pjz.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 11:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8ywEc7OmOM3/wykIq4Rz7SDKwcEJb7JaZzD660scsYs=;
	b=o7DpT9+09iO6b2IqmEccV/L5TS34cdg4JrA5lLI58nOdQy8a/Of0mpEldCiXQMp746
	/83X/JOqItdag/2Al9W9zRYznaaDGwL6dbCmNMycn0v67mjjEG7i7TNaIZgWcRU5bYCg
	NWkd5YclOtzl5fwo9UFpbsALg2s7jMJBigu2iLvVB6HLTNGFPyRwbfeeHecX7AMMnavr
	CcQJCGL/5D/iGamPFRp8wyBG5ObcleHSolTfXh5B5AwUCP5eQa9H3LjmGMD1ItHG8d0w
	h26GtwE/lXH/r4mRvFuwf7u/M+ICDSY+mN7FAWJI2+kM4wRdUlokrB6bu9xBWuxmHC3L
	vHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8ywEc7OmOM3/wykIq4Rz7SDKwcEJb7JaZzD660scsYs=;
	b=rk2ATWqezX6mXICiGo9VWP5px/QPpNACpASyUT3ZqPlSXe3Qx/p3+8p8iu/a49tjS5
	a017iB0lqx/AqG9m2GvUMm7xkenCrw6i0eS/YbnF+b3oRvvn5tOYeVuFFq8ttrb86P1E
	56UlYHiv+xtKosATDuz/0ulGK6ufBqe8kaSHHKX1SUgAgptjfDDJXXvXys3AxtsgWxg+
	aE5LzTtpPBCLkXI3joPfVSJ1Wh27lPwzf23w/7IJUvaIkjXJLLqV6IZFK9Zl2hArLUAb
	JPkqTwxFJ7sw16drCPiTD02YHLwUioCcWk2ntaiTc7St23flmaD5x055IJ5Y+zGJIw4P
	wNnA==
X-Gm-Message-State: APjAAAVVMgfNL/V75mFGVHLrAXvOR6ONgd2QXD6xHyzBujW8KWplKAzS
	qFrtQWsouNKEdZtfuxJR9sUCThyJK8c=
X-Google-Smtp-Source: APXvYqzzm/vN3KRGVADFaZHdDNcmN/ygNcpzn1mjESu6ISMDO1kb78WFVKRKOPOru9fVfs+/bnQUmg==
X-Received: by 2002:a17:902:fe10:: with SMTP id
	g16mr14166501plj.93.1580066876647; 
	Sun, 26 Jan 2020 11:27:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id
	u20sm12987091pgf.29.2020.01.26.11.27.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 11:27:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Jan 2020 11:27:46 -0800
Message-Id: <efe2c32f1121fe2682debb860ee28d34ef398742.1580066507.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1580066507.git.raj.khem@gmail.com>
References: <cover.1580066507.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/13] riscv32: Bump oldest kernel to 5.4
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
X-List-Received-Date: Sun, 26 Jan 2020 19:27:56 -0000
Content-Transfer-Encoding: 8bit

rv32 port has bumped its minimum kernel requirement to 5.4
as the userspace ABI is still in flux until glibc port is not
upstreamed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2da7c5849a..b6aa9f33e9 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -431,7 +431,7 @@ OLDEST_KERNEL = "3.2.0"
 OLDEST_KERNEL_aarch64 = "3.14"
 OLDEST_KERNEL_nios2 = "3.19"
 OLDEST_KERNEL_powerpc64le = "3.10.0"
-OLDEST_KERNEL_riscv32 = "4.15"
+OLDEST_KERNEL_riscv32 = "5.4"
 OLDEST_KERNEL_riscv64 = "4.15"
 
 # SDK_OLDEST_KERNEL can't be set using overrides since there are
-- 
2.25.0


