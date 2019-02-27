Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3FB407BF09
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 13:49:47 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id y15so5669225wma.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 05:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wK81DLoFj5SPUS9+wRNPNqv1J0ZPlwvujYCC6AZswkY=;
	b=b1bsVnByRROG6qKSpAH0rgmBJvIP4hbeMbP7hvCB2GavAKoICutqe0YHsdclU7jVv+
	xandoduX6boFxMO3K8/FJ32sKLWIeGTor7GmIbq3N32SRT7A+mDkKpsZndmbzNd5RmdB
	EaN4jW0JuzJmTjzlo1mBBCjKWyxXF4aiJDrOB5COMi3HZBb4jyjL2VS9lVlTCOzsov69
	7qVMgt89CbnbmB+z4ib+LLrMr42mRsEHAws01+7+/OHSTAvzL2uokdlfhSmuvsJJs2yQ
	EveIuy7tw9BiBqegiScVL9e2Mj+DvmENuXJBmR1TO+XChicWi50z3zD7/dROpY3MmSY7
	fcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wK81DLoFj5SPUS9+wRNPNqv1J0ZPlwvujYCC6AZswkY=;
	b=tQvPyhic7am7JHcUKJfmIv9KPRKLnbOMsGaZmVystrUDq9R99IeHLnSv1gGOxwazmY
	ulXnmdgI7QRg6b15I5qpwooeBOsPg32/OgigROhBYv3zjLvj+Kb0Uxluk+IOozBnAEKz
	jNDDg2X1R655m5PS5EtTuzw3+JBblAbeiSTw7DhkzWnAq2Ti0u3mCMgBgFrtoLo3AoxX
	cHficGvuMlWKhh3C+44+s1Of4xc9AxrVmGQPZiPWZRhB19L+6e4YYXgD4YPqKoZlKBpH
	u7Wjf0QziqY1Cpxl+07aVROLgSByhUDZEJtKKFBCLPQb4CNEy6dyVgda7eRANqShLteQ
	Q77g==
X-Gm-Message-State: AHQUAua2+CEoySlgiCoFYo8WUqW9OE0OleYIXQfEXDl629o+Xovfzf/h
	nuepvC9NUV4wyfe8L6F4dT9931lL
X-Google-Smtp-Source: AHgI3IbFWundNFhcp3okz3p6CRWu88xK3ePaH3hWhpvHMheG63bmtKEnhOMCOx3hIzw7nO6Bg1/Cqw==
X-Received: by 2002:a1c:ac87:: with SMTP id v129mr2516429wme.72.1551275387371; 
	Wed, 27 Feb 2019 05:49:47 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	62sm13610831wra.46.2019.02.27.05.49.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Feb 2019 05:49:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 14:49:38 +0100
Message-Id: <20190227134939.51320-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190227134939.51320-1-alex.kanavin@gmail.com>
References: <20190227134939.51320-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/3] python3: depend on qemu-native, not qemu-helper-native
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
X-List-Received-Date: Wed, 27 Feb 2019 13:49:47 -0000

qemu-helper-native would erroneously pull in the qemu system
parts, where we only want usermode parts for pgo.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python3_3.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.7.2.bb b/meta/recipes-devtools/python/python3_3.7.2.bb
index 4a1cbae8670..9626ee546b2 100644
--- a/meta/recipes-devtools/python/python3_3.7.2.bb
+++ b/meta/recipes-devtools/python/python3_3.7.2.bb
@@ -72,7 +72,7 @@ PACKAGECONFIG_class-native ??= "readline"
 PACKAGECONFIG_class-nativesdk ??= "readline"
 PACKAGECONFIG[readline] = ",,readline"
 # Use profile guided optimisation by running PyBench inside qemu-user
-PACKAGECONFIG[pgo] = "--enable-optimizations,,qemu-helper-native"
+PACKAGECONFIG[pgo] = "--enable-optimizations,,qemu-native"
 PACKAGECONFIG[tk] = ",,tk"
 
 CPPFLAGS_append = " -I${STAGING_INCDIR}/ncursesw -I${STAGING_INCDIR}/uuid"
-- 
2.17.1


