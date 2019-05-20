Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6FA707DECF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:45 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id f8so8399647wrt.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gjTzYDu+cCWG3OG3izgrClo4VJ3URUBmY7SewjGUzTA=;
	b=DDNELG0Jo0RvrkNnd8VA3yuxwXHdBrxhuW5gwad76BU/Hom/XWD4BwEkiqyVJIm1PN
	JcuR1RrvdY4kI9F9/kv976ivdoMhm+k91sOf8LX9Ce59k/yAYa/q/BRBHwjohPmR1gjs
	fnJbJixAS0/69gkmcI1JFPoF283rE/S93HejDrO6S5pKrMTNftF54ttSK59SMbGyGFV8
	q7/hodYj9B3fxwLR5q+RUlbXXMMEHPhl8IS/SFUQw0r3ZFhzQhxaB/cd2cfVEABDOP61
	xYz8S3dyLAScJIYq08YmMjVE/5G17Lor67uDyYuUUQHzg6hlwbVimhAYbW65MLxQZXAB
	mdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gjTzYDu+cCWG3OG3izgrClo4VJ3URUBmY7SewjGUzTA=;
	b=g6qXzAOeqG1hIyE0prHsv9bT5dLU8nc2W6z+qhbR3Oxb7NjSoxxjPelzqaOn8CqIwu
	l/WLP8+HVOIVqe+8kQJm0SeOACGPrgkenUIaQGnVRyokVjzXjoQigqNr0wNbgJEx26Fs
	MO06lI841d3lr8EOojKwBzuttT1G8dQgfDJ2NTPzuxTFyKhSM034YVlSbs/q9x0n3Vzc
	/pQ0E1CpbOKfzI3Y5S5lGMLB1rNbWkhF4eRPJeWoLKuf6Q9njWXnm84lMIiL6eA8i/QA
	Cj7+9C+JfPaP8yyOneULNr8ux8Gsh2/i0ESbjpKdQLfohyJcf7dCJx6F016qWAutEDRF
	vQyQ==
X-Gm-Message-State: APjAAAUgI+l02sYFaAbZESEt0Ar3Yh9+1sBxgCUKg2WqSKTeEbJ2eVzy
	wOIN3SjWXkG+FT+D0IKnsa/ko3T2
X-Google-Smtp-Source: APXvYqzob7oznKqMEWdbsZtBhriCqREpyst6V03wUS2o3+oObC0kO2d1UhgTQCUp2VOm9Dq+09RHdQ==
X-Received: by 2002:a5d:69cf:: with SMTP id s15mr33457037wrw.75.1558361506095; 
	Mon, 20 May 2019 07:11:46 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:10:56 +0200
Message-Id: <20190520141125.10805-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 13/42] systemtap: upgrade 4.0 -> 4.1
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
X-List-Received-Date: Mon, 20 May 2019 14:11:45 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 54de7226608..c5348b3204b 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,7 +1,7 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "90ff34ac0506f0d5440393a4c78565f6aaf9b726"
-PV = "4.0"
+SRCREV = "984d6d1696ed06626b07cb65ab55d6ae0ece1131"
+PV = "4.1"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://configure-allow-to-disable-libvirt.patch \
-- 
2.17.1


