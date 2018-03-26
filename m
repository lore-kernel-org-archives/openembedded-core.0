Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 93196787B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 14:31:26 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id f15so1837712pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 07:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GjALHnO2WnchbsPuIy0XkJ40UOIzo1sCCNCQeL3Xvfw=;
	b=pxbYpHsJsL1BoRDRGfZsWWXDYcXbOZlRbg+CbFjIzKA+LAbAZxXLVm2n0aeZ1+/jkQ
	JmFEh5WXHgyvD80iWKuTgen/mGBbPwtYI2VFTzxrAX5wWTQ7Ejb0wzUt/nGQ2nayP6ip
	ycfG/AxYP5EIQBLZD/GuSfNlmLDhLDa9Jae7tV6f7hpR+ZzifbUyaXMfdQ3OygTtNvic
	p092LvFqzv2rhPYkPpAWtNidgmEi4zxn+g1CEphIJBkDCmC8aPzcpKzXJKNqBV11HKxc
	dcyqoYcP75yN3zngVNsepKpqmhSdd6551TXD32MJ0ywhzxn7+vgKeiSIP+lDl/Y/HQKJ
	xkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GjALHnO2WnchbsPuIy0XkJ40UOIzo1sCCNCQeL3Xvfw=;
	b=eB2g4tzTy8D5Dhepv83oWCz4SP4/hLyGKdjBLKdEzI2jP16aBgqGtXXBVANye0Uz89
	LbBYZrHQlzVjS8+FY8QxjdUbaZhoHDDi4Gi5kcCZ75mjSa51vu4z4Sn5NgOgCj5VKYru
	6mPSEdeAGPirUXChXntOF2A3g8n3vHpMoczxs+K+3ipmvTg5sOFRacj7DPugIdVUs1EE
	V3X1L7mEDWr7r9Rz3CPPOSLvjyaTFtOhL1Nd4NbQEnsFLOEc2OGQ/krJOxKr1UiBXQZ7
	70MsGcsycShBgvCPVroBA37MZvwQRzW4DJRcBBV/tXVhClHR3Fz4FQR594qvsGEv4JSM
	wZdg==
X-Gm-Message-State: AElRT7HzWX1wwD6r8KMupqGp9JBcpi20RMyBh3QXHnVlBEz/edCS/pbv
	WQLXXRfun9jv6RgzAEIOznI=
X-Google-Smtp-Source: AG47ELvXV1GGgJ4z3lggcrVZDjmadM+o/GD3LHqm3UUEUAkU9SpmzPL81ltWR2G2xKk0TTDKxKBa4g==
X-Received: by 10.99.126.73 with SMTP id o9mr29037186pgn.406.1522074688040;
	Mon, 26 Mar 2018 07:31:28 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id
	j11sm29932492pff.94.2018.03.26.07.31.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Mar 2018 07:31:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2018 07:30:15 -0700
Message-Id: <a334c6d311965854fc09a576000bc0a91061807a.1521989435.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1521989435.git.akuster@mvista.com>
References: <cover.1521989435.git.akuster@mvista.com>
Subject: [PATCH 12/21] xset: update to 1.2.4
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
X-List-Received-Date: Mon, 26 Mar 2018 14:31:26 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-graphics/xorg-app/{xset_1.2.3.bb => xset_1.2.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-app/{xset_1.2.3.bb => xset_1.2.4.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-app/xset_1.2.3.bb b/meta/recipes-graphics/xorg-app/xset_1.2.4.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-app/xset_1.2.3.bb
rename to meta/recipes-graphics/xorg-app/xset_1.2.4.bb
index f683b76..5748837 100644
--- a/meta/recipes-graphics/xorg-app/xset_1.2.3.bb
+++ b/meta/recipes-graphics/xorg-app/xset_1.2.4.bb
@@ -12,8 +12,8 @@ PE = "1"
 
 SRC_URI += "file://disable-xkb.patch"
 
-SRC_URI[md5sum] = "dcd227388b57487d543cab2fd7a602d7"
-SRC_URI[sha256sum] = "4382f4fb29b88647e13f3b4bc29263134270747fc159cfc5f7e3af23588c8063"
+SRC_URI[md5sum] = "70ea7bc7bacf1a124b1692605883f620"
+SRC_URI[sha256sum] = "e4fd95280df52a88e9b0abc1fee11dcf0f34fc24041b9f45a247e52df941c957"
 
 CFLAGS += "-D_GNU_SOURCE"
 EXTRA_OECONF = "--disable-xkb --without-fontcache"
-- 
2.7.4


