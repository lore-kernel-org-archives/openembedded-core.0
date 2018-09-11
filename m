Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5A1C079034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 09:37:38 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v16-v6so25028290wro.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 02:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Czp3Ye0uUMPCqNoFA3QxxPVDQPsxUJXhbs7oA/Kn19E=;
	b=xGqg/2DoSmRh3QTJJC4LvfcsdLaQYuXB76tdLD6UUHFHVDSWDbTLPYoYcXTS4Ma8DT
	Sx+r4nJFzDoOxOMCRCHbtf4WxW4EKvQffj7hJVwKuNrHU0HfPdWPIGG5kawhKXjZ3UEw
	VzBSdqBaha9OsslvMQNLCMsgYSFilxiDcNKTWOHgvkFO+5wl8QHxvhkPbRMumu8iNcyJ
	V4IWhRe3nTzToJHmd2vpdO6JnZkCL7ef7kWIek4KYUyWQpyXxRs+Ju1Pwm9bIUPknZ2r
	9h7/ExsbSe0tuGzDkp5WnVANv3Uj3E/DugPl1Q2rThiR1tGdez+lrxI4aJ1JoO+c4NUj
	rI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Czp3Ye0uUMPCqNoFA3QxxPVDQPsxUJXhbs7oA/Kn19E=;
	b=Gb6Om9jsoOHxMlWtWV5MLNW8ydTIJTUU8qyLtMuofxChE3J9zYy31Shc2VVtCMHgYc
	7ioAarYNg4AIYmkaR7p0t6Vhw3cyo4jEIZ6T6BN8LWdXy6FcL7os/WtL+p9hUcJDtSEA
	6CxXVMScMOs0Pt9BUaHGTjRbNxTRKjIOnWyZ5pbqhm9iUEEE4iasxPTWHzOvDA/pu1Ue
	ySCN/e8pmkK0AXahJWY1aLgRQzCRL7gdMXq7L3Olvv2XskAC8akWsVz3GkaWRgQPGzEg
	n4IrD/PPeg6KVzbFRn2GuI6p+K3X1aGZV8NgZ2rVZp7udW+8vg9jmBsKLypdiMRL6vzY
	Abtg==
X-Gm-Message-State: APzg51C5HcggjfIf6WkuhGmPAJ2RShW/85fv2vyj8gzKtKtubAwMhFND
	rVqkmZ29lKaH0tDOQjs8/7x8MZhWLfc=
X-Google-Smtp-Source: ANB0VdZ85rafkuu1L91XWMGFAoSZJisfyu/moEz7gi2uLQ1Muwn17R4cRiTUlwOS579hWi1xxggLcA==
X-Received: by 2002:adf:fd12:: with SMTP id
	e18-v6mr18839261wrr.280.1536658658554; 
	Tue, 11 Sep 2018 02:37:38 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	g7-v6sm15845710wrw.30.2018.09.11.02.37.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Sep 2018 02:37:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2018 10:37:36 +0100
Message-Id: <20180911093736.5271-1-ross.burton@intel.com>
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
X-List-Received-Date: Tue, 11 Sep 2018 09:37:38 -0000

harfbuzz shipped an old pkg.m4 which overruled the pkg.m4 from the sysroot.
This is now fixed upstream, but until another release is made delete it from the
source tree.

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


