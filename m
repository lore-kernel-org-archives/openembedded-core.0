Return-Path: <kergoth@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9C8E678464
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 21:07:55 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id q4-v6so1970166pgr.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 14:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dK2sJNs3v7NjCJOIalPvFUi00puKhK/tT651MESiCLA=;
	b=la5lspWCLmRfvUvlGYKYLdSszTXSJGAKgi8I6EAHIocTWZaIYSFEbRNSZ3oAw6NRB2
	u8CA37NHH/Ugy862NbmNDgefa87Jk5KQWt6452aDIaS5Fho/rcchIyv28TyLo3DBfjW9
	5k8IBC96lDl9+q7/5Rz0QoMwSUIKtLTdgQq6AXZ7I542EY86wQnhLxPn86NJKeRHUsaM
	dYnVDu7ul04RxwlzlbBeSWFfA3QayOD5w6NxYYyWfVvlS4coQP13rMelAQQilEnj+4/n
	8nlua+8eAlPNgGbNO1seVhPbTF0Lu3XFjn8vxfUBeYtyR/L0ArIyZHCbRvqGbZC7WzT2
	Qtcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dK2sJNs3v7NjCJOIalPvFUi00puKhK/tT651MESiCLA=;
	b=jhvrvhDEbTh9WxRyU9b9kt4fcD6xUHslN4JSQt4X5PVd/deODy+hbjFo9ZdYrU/qK+
	DWLf++KYykXpiWQYst83gYbvqvmZvNRvcveyh1EpsCWtDOMrMGAF7bSt9yI+doOex6KC
	ekSdG14yX5oycw67+KGpCFg5/2AkNrCd3/svQhsLWduMUO9G1oQ218TuXvXeIZIdf8xM
	60L2AN01aIjfTzYUbAehIRgUcgPdpq6DMIoWf/BGxFicBwCueQa3qZ/htbVi3nA5Znwj
	AgXWK//476fRyrvtu17vzc4F453jDQRT6py8fXvkz9+tPcNWNNDR56tndQDcdJkPrlXH
	7dig==
X-Gm-Message-State: APt69E1Cjv/UX0NY4FIOoInx3Rm0UvOUh8YJ6fpySmkHkspCSe52Z6JY
	vrBJ708ZBY0sxiGpyYdL4FinmTr9
X-Google-Smtp-Source: ADUXVKKzfcXbMrOwfOiOLTFa7Y9vp6fq/S4I5UYeobvimIE6HM+wpK6vi+YOO/n4TcCJyPTfetJhcw==
X-Received: by 2002:a63:7f51:: with SMTP id
	p17-v6mr23789578pgn.36.1529615276493; 
	Thu, 21 Jun 2018 14:07:56 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	l62-v6sm8448499pga.21.2018.06.21.14.07.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jun 2018 14:07:55 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 02:07:33 +0500
Message-Id: <95a90764983ba9570fafb7a6ec49b06af23b21ae.1529604086.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <cover.1529604086.git.chris_larson@mentor.com>
References: <cover.1529604086.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/6] console-tools: add missing flex/bison deps
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
X-List-Received-Date: Thu, 21 Jun 2018 21:07:55 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/console-tools/console-tools_0.3.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
index 6b9c82834cb..ba44fbe60f9 100644
--- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
+++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
@@ -3,6 +3,7 @@ DESCRIPTION = "Provides tools that enable the set-up and manipulation of the lin
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.kbd;md5=9b2d91511d3d80d4d20ac6e6b0137fe9"
+DEPENDS = "flex-native bison-native"
 PR = "r8"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lct/console-tools-${PV}.tar.gz \
-- 
2.11.1


