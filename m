Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9C3A77FCE4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:25:38 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id t2so335035wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dcxEZjtnN/pEH2WXQcysg3xLxOAKQp2ctaFncOYKOQU=;
	b=bceatjoSM98Gl+6kHL4nL9i/HbJ8FqQDHI5Ogt5LSGR17RLhAWXIJukigjaw5d4NW9
	lSq8APJme3XO9ukCFl384bB7+8fAS49+UKd+fT6RHV1CO42KFbHcQWgFBqGdWrJQ6tdx
	1yVGV+0cMhx9keAQm756ytDva6c+5+bkSmpAD/Qz+5lZctpp1qwYKnHMsnSnY8g6gvym
	6yLmsh42D5YPt3iqMTAqi5wcmgureaqAtq7ZpZo9rrUIi0zfW5l2AUGr3S82uqom8Gnh
	JHyMwtA567LSlkq2sQmeXgROgdrwNv9hFUDsNt4Q3hgJZmx2N7qZt2Mdt8TV6pePCnE2
	GUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dcxEZjtnN/pEH2WXQcysg3xLxOAKQp2ctaFncOYKOQU=;
	b=SS+qIQ7hmKISyk+UMRbvxHWnXD/PbJQRBkSVCI+erOuj6HX3x3MuRyLJ4JMxArcAUM
	W009qor3t/dsavQajYX9Xdu21jEh+xkyJg9nCeSu1xIoL6/wZFfuydMJz6SYwg0Jv4ER
	Ap1ZaSLNrp+kbJ/AzXvGvM59O7k60XLKPuEKa7QkNyZ741tUsu8+GKTVckAsT23w+akk
	tRBnVKNnRSasTpIsM5YfPVhcqqh30CoFqY45aay1iQmKLbXBZL1CKJoqLgJcEyB6vXWq
	fUyLgrJdSx9Q2iEKblEI4MdTOQv4RJF5DNpRzEZ6f+rZ+KAq6lweG26IPUS+5jI7W5rD
	83jw==
X-Gm-Message-State: APjAAAXnIISHmnyA8DWOTBiQL8GupHfUO1hxAkN1Tc0vk9Q2EvN/B+dX
	jlVMSfRNBnmck03mGYEzo/5E5wef
X-Google-Smtp-Source: APXvYqwiyUEhL63mjJSYd2WSemGQL8G4fb74YEpo1AHvCoyyyMMFhFtofvWQMwjeb9eqpRqDyJYT/w==
X-Received: by 2002:adf:dd4d:: with SMTP id u13mr584180wrm.394.1579541138857; 
	Mon, 20 Jan 2020 09:25:38 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x11sm31526wmg.46.2020.01.20.09.25.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:25:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 18:25:03 +0100
Message-Id: <20200120172510.22648-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120172510.22648-1-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
Subject: [PATCH 17/24] libpipeline: upgrade 1.5.1 -> 1.5.2
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
X-List-Received-Date: Mon, 20 Jan 2020 17:25:39 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{libpipeline_1.5.1.bb => libpipeline_1.5.2.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libpipeline/{libpipeline_1.5.1.bb => libpipeline_1.5.2.bb} (78%)

diff --git a/meta/recipes-extended/libpipeline/libpipeline_1.5.1.bb b/meta/recipes-extended/libpipeline/libpipeline_1.5.2.bb
similarity index 78%
rename from meta/recipes-extended/libpipeline/libpipeline_1.5.1.bb
rename to meta/recipes-extended/libpipeline/libpipeline_1.5.2.bb
index a5802074b13..a1824616072 100644
--- a/meta/recipes-extended/libpipeline/libpipeline_1.5.1.bb
+++ b/meta/recipes-extended/libpipeline/libpipeline_1.5.2.bb
@@ -7,8 +7,8 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/libpipeline/libpipeline-${PV}.tar.gz"
-SRC_URI[md5sum] = "4c8fe6cd85422baafd6e060f896c61bc"
-SRC_URI[sha256sum] = "d633706b7d845f08b42bc66ddbe845d57e726bf89298e2cee29f09577e2f902f"
+SRC_URI[md5sum] = "169de4cc1f6f7f7d430a5bed858b2fd3"
+SRC_URI[sha256sum] = "fd59c649c1ae9d67604d1644f116ad4d297eaa66f838e3dfab96b41e85b059fb"
 
 inherit pkgconfig autotools
 
-- 
2.17.1


