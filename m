Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
	[209.85.216.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2A792615D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 16:53:08 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id m13so1129322pjb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 08:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8zQ6ZVyaHWUD2Rsoaw+iugLEbrVZoW249OpynocPxaA=;
	b=dgzXbgSbuY9XOXH14LnXP4ZoH/AOQMcHp50valrDXoI2u/A6KahazHh+XYmzbvVxlF
	6Nm5CpwOeRX9x2cbhQ4JwkeaLylJdc2CrcqJ93ovXOjxvJg3mXNbySub8CEGPnNiaHSx
	A008O/7W3NwdIKHzKUhx215zaIZ7VXWM2jCSdgLqEiy4D9cVCCeFP1w3FsWneE+/ACZq
	9AEPpgHSl62IYtkKL2OwHSgtcpuJ02ODOmhR8i+wcYh+tREgjDMQ2xnNJSyej0cEfab6
	oN4eyzpXFXqOCIYSpQfrq9XeglatYVwwB0J9GecxWyerw/sA0grlUBSomPvbRnHVoXoH
	C1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8zQ6ZVyaHWUD2Rsoaw+iugLEbrVZoW249OpynocPxaA=;
	b=oGEwVEEPeFHCU+t7QCNN5I4gimN0OeWXEf2Fg/smgDId7n54I5ao2jzNkLJYqiR5fJ
	bB9bJBfkEo+fgnspkZJAhZ4/1VofymcVMDj6RUAk5oA+x5uu76EgsFgEGDG0+mjXb9t9
	kTQz8zArWfsfrPqRMMJsga1lPow//hTJsnGwd+jIBcw4PkSyEyVF3esd4p+HxzdYAZh/
	BYIJgeLJ5XKBAwlZoModcBF3ajrRHbID15gvdbrWKh6dY+KoxY/apNC0PxhwgC8Osz2L
	yjU8QAeS2Dpgi0kKiU4HkCLlC5hmaMWR9pWor29cDde/wQI0wx7dgaqq8ywZvIt5GFpm
	aWig==
X-Gm-Message-State: APjAAAXweNOutBSaGWIUocp6cun4mqTJr+kR6HRJ4zn/PJws2WJIZng2
	umzJMrrInSZQzo4yARnjKltsZTw8oo0=
X-Google-Smtp-Source: APXvYqxVdWSvf785I6vp+8AdrmEUOboXR0zoBFq4vjXtTKuj8uXM114a+pcPxpSiKaSHoQd28F5x9A==
X-Received: by 2002:a17:902:7b92:: with SMTP id
	w18mr31626055pll.72.1582217588931; 
	Thu, 20 Feb 2020 08:53:08 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id f3sm4392384pga.38.2020.02.20.08.53.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 08:53:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2020 08:53:18 -0800
Message-Id: <20200220165318.3677793-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200220165318.3677793-1-raj.khem@gmail.com>
References: <20200220165318.3677793-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] dnf, libdnf: Ignore if PACKAGE_CLASSES does not have rpm
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
X-List-Received-Date: Thu, 20 Feb 2020 16:53:08 -0000
Content-Transfer-Encoding: 8bit

dnf does not work with opkg or dpkg/apt anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/dnf/dnf_4.2.2.bb        | 2 ++
 meta/recipes-devtools/libdnf/libdnf_0.28.1.bb | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
index f38167f1ad..220f1aabbd 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
@@ -84,3 +84,5 @@ SYSTEMD_SERVICE_${PN} = "dnf-makecache.service dnf-makecache.timer \
                          dnf-automatic-notifyonly.service dnf-automatic-notifyonly.timer \
 "
 SYSTEMD_AUTO_ENABLE ?= "disable"
+
+PNBLACKLIST[dnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
index 882c435b32..49afa04812 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
@@ -26,4 +26,5 @@ EXTRA_OECMAKE_append_class-native = " -DWITH_GIR=OFF"
 EXTRA_OECMAKE_append_class-nativesdk = " -DWITH_GIR=OFF"
 
 BBCLASSEXTEND = "native nativesdk"
+PNBLACKLIST[libdnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
 
-- 
2.25.1


