Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4A6517F2E4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 16:11:57 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id x1so45592762wrr.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 09:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AQm+WNcZ5Yoo1s0O2Jj1632t0SjnfFmBMdstJnad3Ak=;
	b=nJRBFft4EP5aMBvxlLfHdmIZlYTw1HX4hKqJghuowDql3MrhIZWPQbDQnuEcrNDH9W
	1VQ009/4RUNkvl1RcX/G7/WpTGpCTwBtMkP5e+bxngmAMq+ThqGiM6bEExwZy1IM7dSP
	RMpSyXFkj8Ar0yZbAmK80X3OhiXAGGz4s0AG0GJ1ms8cYmPE90YY4FnYMH6YgFylHlQq
	/6ByZiJQ0RnFy2yab11EZG77Ei36k/H9ouuPippnk4uTnQnazODjnJv3W53HYFeoo48p
	x7++OfWgnpOuBYX6Zn6kUKr6LYXjeUaCl5uIts09rknP5DjNpz1TDLqvoPHgELMvTdWi
	WYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AQm+WNcZ5Yoo1s0O2Jj1632t0SjnfFmBMdstJnad3Ak=;
	b=YnJn2jc/WoOlLf2wveuCDW+LxJlAlad7LS2lNpYm+D/5qtUIPX7JuroDtsfiPv8tja
	5qobAX1sJ8rAInn1Nd8MuTz2pqry0TELyuodK7iAjLD8BDSZMLk+Y2dZME+WYokW6HDK
	IP7iooFW3njY9wctLThwKQwPgVCAgx4ZTuRUTIY7KwgCz4JJS26L+in+B/AnHO+E4VPw
	+dR8AsLRpSWUwmVn9nVRzLekF34r2zI+j3bkS9Mbp4jMeEBlDHTlK9rWeDOaJ7UUbbaE
	Ps/OtV14nc7AyrUFgesxXqiTQHsOfT26DB51LctyutiQBn+u7JQFMbjBeukdZPHKcaKu
	hNkw==
X-Gm-Message-State: APjAAAVsn8YeZbikPyRG3Fti6FKTH+nT9osq9EdG/VPj3afgLmb4qxJi
	q7Mwzs8yDMStQk2Mhm+kYsu2R/cWW60=
X-Google-Smtp-Source: APXvYqzLYTqJUI+GmlZMMFJ5OdOEEGatM5SB0tXMmHpd4Uj7GkDaclM6ZYtOhgdWuxYyo813AAZ/Sw==
X-Received: by 2002:adf:e883:: with SMTP id d3mr3028086wrm.330.1565280717836; 
	Thu, 08 Aug 2019 09:11:57 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	i66sm5499876wmi.11.2019.08.08.09.11.57
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 09:11:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2019 18:11:47 +0200
Message-Id: <20190808161150.44877-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190808161150.44877-1-alex.kanavin@gmail.com>
References: <20190808161150.44877-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/7] python-numpy: remove the python 2.x version of the recipe
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
X-List-Received-Date: Thu, 08 Aug 2019 16:11:57 -0000

The 1.17.0 release of NumPy no longer supports Python 2.x.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc               |  1 -
 .../python-numpy/python-numpy_1.16.3.bb                | 10 ----------
 2 files changed, 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5cf9c7a8e80..c713c811ffa 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -588,7 +588,6 @@ RECIPE_MAINTAINER_pn-puzzles = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-python = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python-native = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python-scons = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python-scons-native = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
diff --git a/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb b/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
deleted file mode 100644
index a1133dad41c..00000000000
--- a/meta/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-inherit setuptools
-require python-numpy.inc
-
-RDEPENDS_${PN}_class-target_append = " \
-    ${PYTHON_PN}-subprocess \
-"
-
-do_install_append(){
-        rm ${D}/${bindir}/f2py
-}
-- 
2.17.1


