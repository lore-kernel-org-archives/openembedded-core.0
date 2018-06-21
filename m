Return-Path: <kergoth@gmail.com>
Received: from mail-pg0-f44.google.com (mail-pg0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id C471478464
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 21:07:52 +0000 (UTC)
Received: by mail-pg0-f44.google.com with SMTP id e11-v6so1968534pgq.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 14:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=J87NBc0aa6krraDm+Vr3f7rfIF4H7IsKwQbYme8dHRc=;
	b=tvW+M2GhFYk5lV8zYx0hlqD0kG5BwDvuaO4NIdsR1w/CCDhLC0SPQcVJORozgCND1o
	n5w5ynFL1Iq08k81TlbqogQjxFlGtWjaYIoUq9mhl3e8KK5c9VLcRduCFypWh5H/09rX
	XU1l1qa8PgeGrxiaY2LKwP05/Owfl7tCPaxUvDmjzDepH1+mntcYmKTVUd50gzjAl0tC
	ob/f0vHX9/ENTzvY8C04e2ZBo5v1rdTdQu0qNiEmNb581UtN7hD0qTF8CSfhnQEQtyCs
	gTj5oXfUx4qMqeCJLh68KkybiUJShOUkM3NyoQ7U11Ekmj1OBE8qlN5xfYaz96AAnuPv
	GMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=J87NBc0aa6krraDm+Vr3f7rfIF4H7IsKwQbYme8dHRc=;
	b=shD34lJWCF4GepPe+COfr5gl+ZWfF0TiiDROI8Mw6jGn5HiC0gjpM0tKScfuTYCaV1
	CgbdbVf+lJQ5RIRva8AAQiY6AwAnY1whKlcfY4gjnflgQq8n4K+t4AqCYwtw4X7vRty6
	g64BjvkkashhPBAIwFWQ2C43KO34JV9Y0sd5NHpUci3/i6ovgapD04KMzSauGLmDSKDY
	XTW0gpyGNRhlv95SIA+ZGDz5hr9s+gJHFC/5OBTx0u7VjtJmZ2cvT4CXBHPmxLwbGPaM
	q0yYRhF+/u0Qb6Rpniv8LUiB7nXn0W36EWbJFePqJI8dJDsqFygexA8vrW+pra5z7jEP
	CS3g==
X-Gm-Message-State: APt69E0rUNuUi3htmFoMT0OGtUzB8HhFzjlJAd0P7L+N87TiFTWiM/ow
	BwXrAsNdUMe1zgVYKr4Us2R4Z6hv
X-Google-Smtp-Source: ADUXVKIuuSEBLX6YXzC608VPxOSpIEuRnz3TEbww9yRST4t6uXv5hrm6uWlffAz8rdX+G0GAweKw5Q==
X-Received: by 2002:a63:6f8d:: with SMTP id
	k135-v6mr24192461pgc.48.1529615273614; 
	Thu, 21 Jun 2018 14:07:53 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	l62-v6sm8448499pga.21.2018.06.21.14.07.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jun 2018 14:07:52 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 02:07:32 +0500
Message-Id: <3cdbcafa952f3b0b7901f53c0bf252edfa7f10ca.1529604086.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <cover.1529604086.git.chris_larson@mentor.com>
References: <cover.1529604086.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/6] pcmciautils: depend on bison-native
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
X-List-Received-Date: Thu, 21 Jun 2018 21:07:52 -0000

From: Christopher Larson <chris_larson@mentor.com>

pcmciautils needs yacc as well as lex.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-bsp/pcmciautils/pcmciautils.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
index 05249805098..26c6d75d4b7 100644
--- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
+++ b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
@@ -5,7 +5,7 @@ SECTION = "kernel/userland"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "udev sysfsutils flex-native"
+DEPENDS = "udev sysfsutils flex-native bison-native"
 RDEPENDS_${PN} = "udev module-init-tools"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/pcmcia/${BP}.tar.xz"
-- 
2.11.1


