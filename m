Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id D5A0679658
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:40:48 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id k14-v6so8467805edr.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HdCn+18MEoQaKq0J6SNEFgIy/8ooAsKw+mEfuMFH/hM=;
	b=bmGNizNWzDsfE/aUcKO12Y83IVKF2IeNTrlnSOfD54R+FdJdd+AHjboTaLtidkOi0Y
	7QSQhGQIawUwcknJrWh8m/zJ3ceHnlxj2fGG4Q3f2UPoPKh5XKMnz1Bn52y2HAhvilY1
	Puw079Vp7KIWHWbyQ1nfD9M0hVSPlfaWH+Qp1mQwHctyARqhtRfSTPf4XnNhMOCYp9iI
	hZd8vybuc/u1WzcGINslOcljDsBWB3nzXOpo4zPzVjxOiKQEuINjdtg/8Uw8ZiZJLGAQ
	yr7tysSFlQSV/KUI6faJu9tlL358HKgu6i6luITnzga/ZslYnuOP3LH0Ajn56UHei0lC
	0uLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HdCn+18MEoQaKq0J6SNEFgIy/8ooAsKw+mEfuMFH/hM=;
	b=O6q3W9hoqjMGGBtnfIxJt+BEmKcyfIaQpV6mVlsJ4M43CpqYj3q7lYOfxk7AJIAXiK
	ZC4uWkEBW1UbTQvfMHeYhqgxr/GC+yoCWL3JdKJlPU1IS0lYOPjbsulwE+Bmy5SuNVWq
	qiyEv3ekHMOWLbMqCuEJVP6opL6TyKKsIUouN155t8qkYmUl2xrhRKrsHuYTVz0CFRfn
	cQ9lcpzRU3mEq09CIAYF/k2e/SmxI9fZ9qoYh77MQieuREwxmnva33CFnpSzfjiEDauE
	QiGXB1t6RSqPhshajy6pnWhEvQuqiF1JoYDw4lnCc+nmpxYPBMyoj7mYkE1rZc66LmSP
	gqmg==
X-Gm-Message-State: APzg51DrGsmDt3O1buQtXe9h76waQ5xi7Mjrq5k+EB1HMTohA0qhMdS0
	Jtd75OzQUmE9T+VE5bHxwIsN5xPuKXU=
X-Google-Smtp-Source: ANB0VdZ7y/lxfgaZRXGUB1rZ/k2NE+kL7Dc5kSzbJR8vsYKrvxbJqhhDb4zHVp5Bu2fGIXeXdDqhkg==
X-Received: by 2002:a50:b4b0:: with SMTP id
	w45-v6mr2866662edd.254.1536230449521; 
	Thu, 06 Sep 2018 03:40:49 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	k28-v6sm2256506ede.11.2018.09.06.03.40.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:40:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:40:26 +0200
Message-Id: <1536230436-30342-11-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
References: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCHv2 11/21] lighttpd: update to 1.4.50
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
X-List-Received-Date: Thu, 06 Sep 2018 10:40:49 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../lighttpd/{lighttpd_1.4.49.bb => lighttpd_1.4.50.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.49.bb => lighttpd_1.4.50.bb} (96%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.49.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.50.bb
similarity index 96%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.49.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.50.bb
index 272a66a..5373a61 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.49.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.50.bb
@@ -20,8 +20,8 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
         "
 
-SRC_URI[md5sum] = "aaf8165379351c3766e5ad1e5c9dbe8b"
-SRC_URI[sha256sum] = "aedf49d7127d9e4c0ea56618e9e945a17674dc46a37ac7990120f87dd939ce09"
+SRC_URI[md5sum] = "0547831efda8492648b7f0c652865dfd"
+SRC_URI[sha256sum] = "29378312d8887cbc14ffe8a7fadef2d5a08c7e7e1be942795142346ad95629eb"
 
 PACKAGECONFIG ??= "openssl pcre zlib \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-- 
2.7.4


