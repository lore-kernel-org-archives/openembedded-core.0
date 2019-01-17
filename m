Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182])
	by mail.openembedded.org (Postfix) with ESMTP id 455427C23A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:43 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id t9-v6so9125955ljh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+mV7qq0RnYfXCrxHPYE8hQD1oUcwIoHz4Zvov8/vK8s=;
	b=jA7caSIRWsJepU9m8loJgvC1KZkGyg7ka1xGoiUJDO9KV31rVFwHbUOOj/aYknIJph
	1Yfq6Rwwih4Gx2J/Q+f0ppfuJjYBw3PndrEkISrMeTLiSph8EYhR9V+rDF2Y1SbsxB6h
	/1pmtEZvHITLYGBhC9tAzifph7BPg6qGcsxOG4B3kb7Zzl0RVlJ/0jstaaIwVPJApz8x
	oEUyMEBgqEAd2UGAsN8K8C9NcoJmP6SH+kCRXhNJaDDl0zD8kX3GdwMOXxP8Zs36TYh3
	c2He2SJRBuf66Hw9X9bdVitTtxhMhGuR5QThzQZI1PcY5OG9OpyBa0sEjdI7XJ6P7j7q
	zvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+mV7qq0RnYfXCrxHPYE8hQD1oUcwIoHz4Zvov8/vK8s=;
	b=cAg2O7xanqpJv3sAepojJCwDsk+sBP9z/cZDyfeWX/RF8j6UGSBLvbv7Ve+dFwmlFv
	CDW/YBZKiXWh0OnKjsN0thV6fzu36Cp/svJKcSWvj49KGj2UO9fMi9sNpslRbyp1K5Jm
	a0WaCVS1EXwu/LDtgdSrGXHi/wcphna0WuafO2+Oaz+/j7xRvP2lIXbAlM5aH6+2vXTL
	v4xXj1oNJJiN8nvlEObFjgerA99ghUUi18RQDepn/xwdaC8pxmQ7MaGJriTbfNc3bQUB
	6ubefmdFVj7xvKoxoNGT5jMHTGa1eU8H6zgqRDtaIk/ECp7eI5Dp39c/j1uvTv36fqRC
	4bfw==
X-Gm-Message-State: AJcUukcRGmUbP9Ab6F8lVQJqx/LAiVIzWRURv8NYE721pMPsTPbOJujk
	wa6ytbQdxh9W82FM+NwdOG62+Xr5
X-Google-Smtp-Source: ALg8bN41Mii1ucFXd7YjfUIgoF0CGQA3zpMGIH4cR1eqwJ5kdgsHgFt5EGybmC8joVsXi+6Apmckvg==
X-Received: by 2002:a2e:87c3:: with SMTP id
	v3-v6mr10914127ljj.13.1547743243534; 
	Thu, 17 Jan 2019 08:40:43 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:40:02 +0100
Message-Id: <1805b463d2b368c5d685f6afd1f5b51fd8e61b62.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 17/27] libjpeg-turbo: fix nativesdk build in same way as native builds are
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:43 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb
index d9d877dc0df..029847ff5f4 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb
@@ -31,6 +31,7 @@ inherit cmake pkgconfig
 
 # Add nasm-native dependency consistently for all build arches is hard
 EXTRA_OECMAKE_append_class-native = " -DWITH_SIMD=False"
+EXTRA_OECMAKE_append_class-nativesdk = " -DWITH_SIMD=False"
 
 # Work around missing x32 ABI support
 EXTRA_OECMAKE_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-DWITH_SIMD=False", "", d)}"
-- 
2.17.1


