Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 879686B463
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 11:04:29 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r17so16895209wmh.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 03:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=+XxVQoueyrQDoxOhDh4VPQYBVvDOhSZSbUtfWKqg1HY=;
	b=cQhduSVZNtwZNVA9kZiwTUqKBv/xKnChDvrCdBBpM7kZrmQ/vR+yFO6mcfWi9XID2z
	zca0zzw+nttK1uFr1bxmRbqHTrE9TT3r+WVGZ6S97L7mQSNF5czZNstaY/ZHFBr8pPaI
	a+HpI0txDFrSqSsbIrWmWRVlvxNeEGGIWrg2UVgZtfhBthINuN86F42+OXiW2ZOH3+o3
	3NumrxX7JD2NXQky04fBUGe7h4Eb2c46NnshPsKmRqK4e2p2wZw/i6H8vQ20AXZzz526
	KmzTqCIL56cPRXAYPFIsl+aEjYGDTRCUvFF18URhrZzMNsxtsBWvWdln6VXNN89XIJ8q
	4xkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+XxVQoueyrQDoxOhDh4VPQYBVvDOhSZSbUtfWKqg1HY=;
	b=kzg/V1S7IcZmmBJHl9lRwY/iih1gFLpCog9pyi6tRIV5MhJyqacxKudIh2lDrP+qTv
	K1DhTwaRACp4u7K/lTr3dygrf3twXzfMly625eGzjaC4N5PAyMmOBnElEij2TgbSEXgT
	CpFT3Sa4fIeNXtyp4SYc7Ssv8VUDgQvY3dk+25qiu5nkshdZD56HwnsQK3K86tWpyzFB
	7auThaFlQgnX6iVJJ/JLQr5uwzOmhh03DjPBcmCJsnDpH20BwANiAssGOFvI1ABmfT7s
	vlv8ZfwwZXPi+aG30HlYIkTywqHvh0aZP1eOgFsg6yyZI9trac7Xbmr8T829zA7o74fh
	ae9w==
X-Gm-Message-State: AHQUAua2msmLGk4gEezttDXhWAoG72U9xbivTQ/+bnpEs3iq/NQTAJBf
	f5DLbSfFVCAIFKY+dTtpW4eXB9IHbPI=
X-Google-Smtp-Source: AHgI3IZuSJKUdH+Ahccx0pEXAJWcljA8/kLdXvbBifkwQb7f7CUuBG/Cjx4ktM3TWtbPqbQJv1/yQQ==
X-Received: by 2002:a5d:4349:: with SMTP id u9mr28044830wrr.223.1549883069688; 
	Mon, 11 Feb 2019 03:04:29 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j33sm18215321wre.91.2019.02.11.03.04.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Feb 2019 03:04:28 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2019 11:04:22 +0000
Message-Id: <20190211110425.11105-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/4] site.conf.sample: remove seq from HOSTTOOLS
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
X-List-Received-Date: Mon, 11 Feb 2019 11:04:30 -0000

This is now in the default HOSTTOOLS so can be removed from here.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-poky/conf/site.conf.sample | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-poky/conf/site.conf.sample b/meta-poky/conf/site.conf.sample
index a4c2f9feed9..5164fedf630 100644
--- a/meta-poky/conf/site.conf.sample
+++ b/meta-poky/conf/site.conf.sample
@@ -26,7 +26,7 @@ SCONF_VERSION = "1"
 # If you wish to use certain hosts without the proxy, specify them in NO_PROXY.
 # See the script for details on syntax. The script oe-git-proxy uses some tools
 # that may not be included on HOSTTOOLS, thus  add them manually through
-# HOSTTOOLS += "getent seq"
+# HOSTTOOLS += "getent"
 
 # Uncomment this to use a shared download directory
 #DL_DIR = "/some/shared/download/directory/"
-- 
2.11.0


