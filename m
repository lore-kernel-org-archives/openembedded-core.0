Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id C45C578B30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 11:34:32 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id i83-v6so30006928lfh.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 04:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2A6oHf0oWHAdIPhLBCrNbeMRlCLzmCuEiDAF/SpFy/Y=;
	b=lzBlItQJy7kMb/94PnMsn/I40pSHyb3ObrTBVycyyiuzPjuI7ARThK5YJst80je5Qn
	WrAWtfmxgRuzJKBxeQ7IJZPb9tZtpawK3sUzwUSn9W/bLFt2eKF5vkqWj25U0U8dcXEi
	FltW3IDW1sL52p5mUjenzUZGs+/fxbkEvQo41R+jyE2ZdIVJwoeqtp+LKMd/pDipVuxr
	qDkI4nZFgfCVu7NNmC0NLFca35WUYhz9bzwYMyUXmbSdU/+luIG47AzKdDF43j8CSYYY
	EwQO9o/BDRxduAx9jbPPAw2z23sWcoCPLaeCE8elcaVCf4xlUMQFvrXOBEi1xx8lfnfi
	5FSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2A6oHf0oWHAdIPhLBCrNbeMRlCLzmCuEiDAF/SpFy/Y=;
	b=XdAkLRUjo1dSy5GiP+uvDuljdN/yxr8Nw7+VAIaHW8Mz88soDNelK0kgK03k82PJrQ
	/1JychwSF3BJEsymppTisyjgGq+gh5zmSgebxzDo1jPMFdNWm7RB6irmt/sUTo8E5xlo
	kYB52dz3OPQKTY9X8CD2SH0ggFrgAFptJB+Xow9kpbGayyN0E0VLTm++Yxp8MWUCXYdM
	M/br3qCi50X+R67Ob/bizCaSe/D8vcre+TAWX62RUDmVwYQoR4ghoBrXKNK7IVW6knVb
	znunIDTspmm9jz0vpkr8sxc4otNuXEVj7Mg0Jy5G2aBfNtf1W8beWpWts1E6MzjZAEJB
	mHEA==
X-Gm-Message-State: APt69E20zqx3yYN0iE/6dUxOsV/WqZW7ExJo/hv7CXcJ/diH9mYPHYCl
	bS+mFW2DlSqAp32TZafystLsYFg2
X-Google-Smtp-Source: ADUXVKKQo2BOwUTenIPnPqeUR6kGCeXkn+QQu8fkbRIwEK0iFhsmWVBqESEbAWBZTUNcPgzDDoC4vw==
X-Received: by 2002:a19:890a:: with SMTP id
	l10-v6mr9762360lfd.117.1528716873164; 
	Mon, 11 Jun 2018 04:34:33 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	(m83-185-243-46.cust.tele2.se. [83.185.243.46])
	by smtp.gmail.com with ESMTPSA id
	b204-v6sm4684620lfb.12.2018.06.11.04.34.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Jun 2018 04:34:32 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jun 2018 13:34:27 +0200
Message-Id: <1528716867-20270-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH V2] bitbake.conf: add BB_CURRENT_MC to OVERRIDES
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
X-List-Received-Date: Mon, 11 Jun 2018 11:34:33 -0000

From: Ming Liu <liu.ming50@gmail.com>

This is useful when the users want different variables/tasks when using
multiconfig.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3b2ef9f..0c803d5 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -731,7 +731,7 @@ DISTRO_NAME ??= "OpenEmbedded"
 # And finally '<foo>_forcevariable' overrides any standard variable, with the highest priority.
 # This works for functions as well, they are really just variables.
 #
-OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
+OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:mc-${BB_CURRENT_MC}:forcevariable"
 LIBCOVERRIDE ?= ""
 CLASSOVERRIDE ?= "class-target"
 DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
-- 
2.7.4


