Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AAA10BA449
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 08:31:21 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68450.1774600274178388797
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 01:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PK2VBt9V;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so17940275e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 01:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774600272; x=1775205072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAYR3ZSfVW5X86WRFH78salrCpWTUcp6vSQ+giJ53I4=;
        b=PK2VBt9V9lg0BkXQsdPlZwkOunjn4dEU2J4cCq1ck4PhoJq7zn6JQP0LNKO/pIZMPF
         zDXFg00ygchuTX0Hq+qVwWBvTEfvBUaE68ZGi1lwFZ7NrwX21VP30vcoF42NkLhedQKa
         rtQjSLrpzuXeovdJnUh+Hoh1cPvoivvNsiNR6w23cRtLuI4yIcCN7gGCW8BcvCXH+ywm
         pYqXtiScDXkkScQPy4VZ3knRZjTZZs6v+QJIkAigCmF8RYhQ+jPnsGu+NUojyirPmP3G
         N1c82Oc9XNwvJDdt89dx+Ur8KGOaUkAqvA1tcFaNUHjGvpxQH7Akb4spntkglbWQYy7P
         hQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600272; x=1775205072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kAYR3ZSfVW5X86WRFH78salrCpWTUcp6vSQ+giJ53I4=;
        b=WYa+xInTBI8qtU94zgw3VAxQdGzykln5YCbhsFuXAnMfPc7gQN2I1VMAOdoYsrIaIu
         dmUEx3hdMFg0udOf9l81a43YPDnDvG6ioEQDOXgti1r6BqZh38K8zk2KsOTIHRIW0jJJ
         BVOYwkDq/zQxC/JX0Mxo4vrgRQs8/rrjAp75IiURBv/rL0wCAKmySUOAfj8KAGFgozN2
         MNRQ6nFA12q1WNUQn9IPrCAuarhJSKIqky5g/JEDel5WVhugiKiM65NCJ/EUft01iE4M
         MuCUyQ69xaL8rcoSYMxvSSs+WdMcQ9cgLWShLsepk5Y52SUAAhRJ/MzgT/WroZGRlWym
         0XuQ==
X-Gm-Message-State: AOJu0YyAPPr2lH+fTlQ68qpdd18mPEWrAEhi9KfUlrps6oM9+WuntLSF
	vM4U5lKHfEvp+yoYvOLw6qMX8Uk73cjfln6kINbvjvoyL1mza31WKylIE+POww==
X-Gm-Gg: ATEYQzyiuNFukBGpaUnSkkoguhqVrF0/k1vRTnt1zbppfrz2Yh/JP2UveYwCMYAmosP
	mNHBdmA4IFdkyv3jJ8c9k1OaNy4pWl71muGDpJESkp6yq6100wHF9RvdgrN1D8G5qBCtByjPOzM
	c8lwCfVqz0QRELqAVTuJeid7c3yn+/yo9+1zCvZ/lwdokt1v3TG5nxbrbjifR9/ppUCKxO9DmER
	GUpaxa3iZcbTMC9vruejaY9LORFMYLGAMQlm/wRYL25c29K7lET9VD+pU1zXyDREtuxM7u8W07v
	L0PkTXABWk9D57UMeW+ZjgfUZinLXP4/e/OiWrJJHV5P3+34NUIs0TVBC6OSrao06vwSk9pi7wD
	JHEkuZB7mO0DMp+swdslVm5UrMuV9zE6UpQAMOWT4si0RSMiqFjxiCM9MvbT1KMCkScOksVnxCR
	ukYJpi9r6WJE+/Uw==
X-Received: by 2002:a05:600c:8207:b0:480:4a8f:2d5c with SMTP id 5b1f17b1804b1-48727ee4444mr24929035e9.29.1774600272067;
        Fri, 27 Mar 2026 01:31:12 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c95041sm76411485e9.6.2026.03.27.01.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:11 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v3 08/12] boost: Stop using PYTHON_ABI
Date: Fri, 27 Mar 2026 09:30:51 +0100
Message-ID: <20260327083055.12571-8-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327083055.12571-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260327083055.12571-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234063

PYTHON_DIR now contains PYTHON_ABI, fix the settings accordingly.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-support/boost/boost.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 64a57ddfb2..7b02ed4282 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -174,7 +174,7 @@ do_configure() {
 
 	# If we want Python then we need to tell Boost *exactly* where to find it
 	if ${@bb.utils.contains('BOOST_LIBS', 'python', 'true', 'false', d)}; then
-		echo "using python : ${PYTHON_BASEVERSION} : ${STAGING_DIR_HOST}${bindir}/python3 : ${STAGING_DIR_HOST}${includedir}/${PYTHON_DIR}${PYTHON_ABI} : ${STAGING_DIR_HOST}${libdir}/${PYTHON_DIR} ;" >> ${WORKDIR}/user-config.jam
+		echo "using python : ${PYTHON_MAINVERSION} : ${STAGING_DIR_HOST}${bindir}/python3 : ${STAGING_DIR_HOST}${includedir}/${PYTHON_DIR} : ${STAGING_DIR_HOST}${libdir}/${PYTHON_DIR} ;" >> ${WORKDIR}/user-config.jam
 	fi
 
 	if ${@bb.utils.contains('BOOST_LIBS', 'mpi', 'true', 'false', d)}; then
-- 
2.53.0


