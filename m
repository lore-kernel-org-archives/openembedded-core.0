Return-Path: <wallinux@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id B84E9608A7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 12:15:12 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id 19so10235890ljj.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 05:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/sQuryrp35PWLUHs9ksLU1HyQsUnkobKL46rd1uY5gs=;
	b=sd9SIqwc5vjH3ncXZgEWXlZaY3BkRfXob81MuiTHEYy+KKhmOsCEdaEiaak3WiEkkj
	3PI3DwjvIrsDn6Eytbaphl2EP8CFzh8fsTa74KN6kAJ/TDowO3rrMspAH0y1jHC0wsyd
	kQKw4t/v0dkGPoypmpp+cJywfInvVkVDTs2hK7Yap32l2RmoystDcXZBs365VnE63O0M
	CXcLgi0nxZSZ5iRWlHg8IUO54GlHhH3zKDDBpTH+b+M93Yp1lIZgy86szhndrngzUmNw
	btjTVQpuDz+wq3sXYZXHYK7UirR8WIv/3IDvy32GiGMMgG+5sIpwivyE1qCwz5xkfzJK
	H+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/sQuryrp35PWLUHs9ksLU1HyQsUnkobKL46rd1uY5gs=;
	b=ghVBGNoXI8JsrhVyaje3pL7mdaGLkRXiLVxOEPdNl2ODbp30dG/KGPOE84sYBuuy/h
	rLC2UoD3GaRwp+LvjDbj1S8MI5fldzuVgViXwDyW7T/oSku2WTnC5Vnp7Hyc2IAYrEBf
	EBV+wvt/lZNce4sxiz4yFCdLhAc628dvkLVSKAO6hBwYSZOMle8ritrXdZ58+nQhtspV
	+LJT8d/GbWMYYsI1CdYyaCTRWbX4XltmcoXNrReKX7OMntIPVNp7kCtSgi8FSo3HC5m2
	i+3csce/1Hw80PPeM5ovgIzXtuAUGBO/8Um6x6jJ4TIXJ8O8+/IRqRrQqg/IfcaeB1fd
	tI9g==
X-Gm-Message-State: ANhLgQ0nzfmACWnDBtkhPYXULu3dG5B2vSR11EcJTgYPIYSCDq4od9WP
	mu4fCcvar7fZkb9uISijJ6PDlnjIsqI=
X-Google-Smtp-Source: ADFU+vubPtisfQR6ap6v6jUM7718e72m/1EIWXX0mbmlSHDwi9LQIisqU2TwSpEKDE0XaPcdnmNaHg==
X-Received: by 2002:a05:651c:545:: with SMTP id
	q5mr8141219ljp.139.1584101712625; 
	Fri, 13 Mar 2020 05:15:12 -0700 (PDT)
Received: from arn-awallin-linux-l5.corp.ad.wrs.com
	(host-95-199-150-227.mobileonline.telia.com. [95.199.150.227])
	by smtp.gmail.com with ESMTPSA id
	q14sm5263431lji.100.2020.03.13.05.15.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 13 Mar 2020 05:15:12 -0700 (PDT)
From: Anders Wallin <wallinux@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Mar 2020 13:14:58 +0100
Message-Id: <20200313121458.32066-1-wallinux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] babeltrace2: updated to 2.0.2
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
X-List-Received-Date: Fri, 13 Mar 2020 12:15:13 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anders Wallin <wallinux@gmail.com>
---
 .../lttng/{babeltrace2_2.0.1.bb => babeltrace2_2.0.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{babeltrace2_2.0.1.bb => babeltrace2_2.0.2.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.2.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
rename to meta/recipes-kernel/lttng/babeltrace2_2.0.2.bb
index e71ac1ad57..0791c654f9 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-2.0
            file://0001-Make-manpages-multilib-identical.patch \
            file://0001-fs.c-initialize-other_entry.patch \
 	  "
-SRCREV = "06df58f89ee51b1a2c6a2c187ec3f15691633910"
+SRCREV = "33003c352ed56aa49e0b3df272bbab6fac36cae8"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


