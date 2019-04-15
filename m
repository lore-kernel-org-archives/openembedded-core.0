Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7D5B57D9A7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 10:55:14 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id r186so5916431wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UkiY0vY5zpFWRcePM5WDR150Nbv54pA05DSd8ENKNmQ=;
	b=Byz0jG5osHojE2pPeomBzQS+kBvZvPzDqpM7udamiTz4Dkn6YYYLpJtKQn7U7OhQfN
	BEsC0+IZq+TaFYFyAUWGcPvzZwhmOBuMn0IJCERcY9FM0Mr5be+flK+3tBLTnJ4G9ZL/
	x0zmqQRo1SQ1JgyV/GHVCyJxHONnG35PIyxQj+dSwgEaj3Q57/R/+qY5q3Zkqz5XzYDR
	aF8Q9vDrWw2qVGd8aY+J6q+LZCA+S7icMo2wWADdaNPyPiRLOCcrIeU/Hz1hF+MAlC2s
	z+CWrn85T5KyrKpu615I3WGD6KQ1Enyf5Ac0Plc94R+TMR0ItY9Y4wEaPOcOgFkZe8e9
	tyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UkiY0vY5zpFWRcePM5WDR150Nbv54pA05DSd8ENKNmQ=;
	b=Gshjxmd8K8wYGX0mhATaO3N1almXNkVZipiIb/iFujceC75RVnM2RI6bldFNVVkeFS
	mR/Lhy/1t/lAL0FPES1tl5OsK5gE8nkKsUh4KuzIgVAnljGnM2QqP/c6t6HnNTY5ShyZ
	r6MJDNjf6Qy/89vzz4t+O5qb0FQ4TnSW77DKtignnEgdPkQYfIuyBJlkNzIf6jOZTbfi
	iDJZoefQOs15sWdyq4YzaEX0LvDcSoX8DZ37VUeYLb7/kOhvg16d5l9xgye05qGm0J2G
	EvuiPPUT6foAN0qC/tXPco6n8tCC6CLdSvdvPjOX59DC9HjmnLjxXSkCKvgM7H9oPnh7
	87Nw==
X-Gm-Message-State: APjAAAUPRp88A0+ogCudYALVxt9lpT3FKlJCuN7b1OGS0FZBjuWseAJT
	xQdMRGntFYCJnbwyVlxX2Evo6dfmOXQ=
X-Google-Smtp-Source: APXvYqyO8jevzhyyHKGvB0vDp3zIZP4uFbmOvRQcgVBeSezDzZCek6mYla+qbqrLUKrzx2itv+GT5A==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr21112197wmc.137.1555325715011;
	Mon, 15 Apr 2019 03:55:15 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o10sm75468400wru.54.2019.04.15.03.55.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Apr 2019 03:55:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 12:54:50 +0200
Message-Id: <20190415105457.57067-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190415105457.57067-1-alex.kanavin@gmail.com>
References: <20190415105457.57067-1-alex.kanavin@gmail.com>
Subject: [PATCH 12/19] libmodulemd: update to 2.2.3
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
X-List-Received-Date: Mon, 15 Apr 2019 10:55:14 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/libmodulemd/libmodulemd_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index 84012e41934..40715c06ee2 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -7,8 +7,8 @@ SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https \
            file://0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch \
            "
 
-PV = "2.1.0"
-SRCREV = "072e6ee791fe7822a6d423bdac7e4a5cbb118bce"
+PV = "2.2.3"
+SRCREV = "4c75c6f8b39ee57aebe8fd36ef84808e893048c0"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


