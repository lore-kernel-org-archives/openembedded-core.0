Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7D34B78AAF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:21:14 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id q83so17516263wme.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=FmO/H/2Zc1SXpxNhkQYNmhbxvENn0c7n7FVQeg29aUE=;
	b=oUqG4UMz0e2kPfIJFjFyXtCqIC9ToV2XTYW5JluAEWiSo4ejAcpqOzhJml77qwYlMU
	HUescBK/bBN6fnIS2hs7c+g/qKaeJDf9RLf+k+qSOo5BCJe9zqS/GLhrN2KdjR33WOqu
	vY+bySN44yd3lmnRzq1eVCLSdhG2c0qnVaXn7EFeyYdGLnkuCsHPqJnS42e1f/LPRcpR
	XHpxZsgIwztl6EXwTXhJnxvp3q4/bExydJIXiq/oeHqjfDZ6IR+4/S/JV5wr7+56zpo1
	YP3q59rvtFyFSTacmZPmpUOOKOQpIwPu/cTI5GNrOkof1+atLH3XgUDpEMhXi2o4nsEP
	qAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=FmO/H/2Zc1SXpxNhkQYNmhbxvENn0c7n7FVQeg29aUE=;
	b=NoItwng2yPhVAZJwW0ChvIwAHxsaFWmQDhpb0KOlhd5OW56uxmjGexfxPrVnRL5Jd5
	PwqbJrqiK7RaYWMgg6VG+cbH/f0OcLxXKrzRY8B+xbD9YQiRzwivExxJhudvhY4j9UuY
	DfzpqVgjnpguvfqeihpvLCc5lQvWJLu7iu8Bt5kKJk8wEngGvtdNsKzthd2YcDZEi+Xk
	S+GBDv3mhXbfhZ/Hj5OmHo30nbyfZB5fZnXCiZqonr6uv79wsTNUAd3oHdgBXreIwJE9
	BOANy0JMZ4hGw6xebKGzFckrqfK/Cg+icZguL1+jWjo+tZzHbaNEGe1tkqJw92rHM6p8
	N7cw==
X-Gm-Message-State: AElRT7GxRc4g+YoI3y2nMV7mLB8U57Rk0nrp5gvSj9dZjjOONA4T5bzW
	pwE1k2bJIElfZ8NxpWnErTNK/Uk7
X-Google-Smtp-Source: AG47ELuBcRmF42/zjCX75wUi8ACUPl8xivk78oBl8a8fXvawMywGSYbjCVuILX3ncVNMW46YvEJdiA==
X-Received: by 10.28.48.85 with SMTP id w82mr8801558wmw.95.1520270475087;
	Mon, 05 Mar 2018 09:21:15 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.21.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:21:14 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:40 +0000
Message-Id: <20180305172046.21729-23-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 23/29] lsb: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:21:15 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...ons-avoid-exit-1-which-causes-init-scripts-to-.patch | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts/0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch b/meta/recipes-extended/lsb/lsbinitscripts/0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch
index 17c90029c38..c0076453f2b 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts/0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch
+++ b/meta/recipes-extended/lsb/lsbinitscripts/0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch
@@ -7,18 +7,15 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  rc.d/init.d/functions | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/rc.d/init.d/functions b/rc.d/init.d/functions
-index 6850046..11223f7 100644
---- a/rc.d/init.d/functions
-+++ b/rc.d/init.d/functions
-@@ -597,6 +597,6 @@ if [ "$_use_systemctl" = "1" ]; then
- 	fi
+Index: initscripts-9.72/rc.d/init.d/functions
+===================================================================
+--- initscripts-9.72.orig/rc.d/init.d/functions
++++ initscripts-9.72/rc.d/init.d/functions
+@@ -686,6 +686,6 @@ if [ "$_use_systemctl" = "1" ]; then
+     fi
  fi
  
 -strstr "$(cat /proc/cmdline)" "rc.debug" && set -x
 +strstr "$(cat /proc/cmdline)" "rc.debug" && set -x || true
  return 0
-
--- 
-2.1.0
-
+ 
-- 
2.11.0


