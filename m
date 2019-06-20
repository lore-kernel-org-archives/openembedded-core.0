Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0A1957E7BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 10:17:05 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id v19so2554710wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 03:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6jOBtk72s23jbc4OqWO2t15YzCUlWzi3kxtB9ssMqzg=;
	b=EJBvzxqpYfpih7OU3ZfI4jJXENYzTLVr5YM8Od41lavMG79AlU6gTzK9PztL6hjlOr
	NA7CFHQeBIYFBUHST7JoeLjqNwcftosMYEJU+6NpCEWbEr7BukXasb+zZ8k8ymUO6KOg
	xEz+mvm0MuKR3sBFNB1XbsE7xDRLsZZIJilFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=6jOBtk72s23jbc4OqWO2t15YzCUlWzi3kxtB9ssMqzg=;
	b=lFUIMzXNxpyYL9JVUzeNH2pe3eFNMdZLsXmNznlz0aL1/20kz6/He3xlED7aE2nV0j
	tphd9y6nN2ZNAwQPfx2NRZ5mxFEgh+KusKiNk73Lj6DJEVE2chQUTtE8iuxK4Gou2dhW
	wat6EyinDrO6bhNSkhVlqBzA6hOoRozL+WXlkW4lCIznKMzE2T8YkDsgGigzSk4LblBa
	veCq2/SIbWhOBrIydNMylui8GqyfZujS2PCRmcC9LLHFJRv1yfWMg9L3pJ6h0+nMTK6v
	5kQ0sVNn3/svPnsGfC4d3Sf0htcL/jbndHFd2J/wvku1DG/ncuSNr6/JfTMI53aFb+w7
	ffkw==
X-Gm-Message-State: APjAAAWJ1czjQp0+cIE3hzZnrETLNDnwRadAh5bG9VheaBZG37x0VldN
	ibKITIYuMJ9IhKkqy6JZHAA/DqdTzQA=
X-Google-Smtp-Source: APXvYqyRHu3oHcR6C9guWpiNBGzrjghvb3aodeyS48oLPluA21HJrI+kLggWZxIGCxhcwGfRbiBbpA==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr2248576wmi.15.1561025826306;
	Thu, 20 Jun 2019 03:17:06 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i188sm5022457wma.27.2019.06.20.03.17.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 20 Jun 2019 03:17:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2019 11:17:04 +0100
Message-Id: <20190620101704.23836-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] cmake: Clarify comment in cmake toolchain file
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
X-List-Received-Date: Thu, 20 Jun 2019 10:17:06 -0000
Content-Transfer-Encoding: 8bit

The comment is misleading and there was confusion in a bug report. In the native
case STAGING_DATADIR would be equal to the native value so there isn't any issue
but tweak the comment.

[YOCTO #12761]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cmake.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index f80a7e2f1d6..2b317c832fe 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -119,7 +119,7 @@ set( ENV{QT_CONF_PATH} ${WORKDIR}/qt.conf )
 # directory as rpath by default
 set( CMAKE_INSTALL_RPATH ${OECMAKE_RPATH} )
 
-# Use native cmake modules
+# Use our cmake modules
 list(APPEND CMAKE_MODULE_PATH "${STAGING_DATADIR}/cmake/Modules/")
 
 # add for non /usr/lib libdir, e.g. /usr/lib64
-- 
2.20.1


