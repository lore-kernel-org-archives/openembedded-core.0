Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4D5C86067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 18:13:17 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id a14so9806036plm.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 10:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Wi2cOhSzbsXVJBIyQnNLWgSYEPg44BWkzgz7svn3sts=;
	b=OhYN9uFY40bT1yiJZRH/zIgxYT45YM4XhaEqFL57JcaIoMF83b5ODqU7OdYcbzOnnb
	ibdubzWoVelCc6+Jg7GqgPiBNw33ZBFdQo9dcma82OlUMCcAuHbP6raVEYh8QcP76n2L
	SW0TJJ6OZEFp7oWTKHAEAJvrz0Fx9xgyfG96evV8pYXSZLTyuMAV+VkAHa3PUmbHfV63
	0HgSxJ0pXTrYUzgTv3F4jih9jrqIBQmbENvde4jk5sK35lHMm9MGY4rt90L5Up510t2w
	XE45NatQmt++a+nYwWHLUFtMyZMkA9YCGJLFP7+pVElum15lJsPkm6OKHKutTb3bSire
	q/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Wi2cOhSzbsXVJBIyQnNLWgSYEPg44BWkzgz7svn3sts=;
	b=DmvJ8f+7XGuzD6SglhBRq/xclCpvdnhipBEB29/V/svQVwnD6pMypWvoJJvsLHAmQj
	p/XjTYqCKpwDoJHlY6DlywurhifcY+oxOgaWzXsrgShP+I9NClG6iehIroiBJiD0JPWl
	/TI+zRqxdGBgNC6UMIVRc4vP0QuN7aUfQFJANYMdXTCmNzvkLFns5g6Ao62LJtPu1Ndb
	gZVHMu+QKnbgIC970p18WZvx/ydL+bC4sDl89hozw9+SIxwyJZr7tpVzAoa33b8zK70E
	ewMtWqqaXOolYTifcE5GGc8agibAKfsisE2hV1/arFcYNK9MmuL9b1zWPJEeRIM8l9QL
	3cnA==
X-Gm-Message-State: AA+aEWarm95uKw8ox3wE+svzpLWlV4vEdTdm+cDOuM07EO0oylDD+YtQ
	Cpalj87tDdDSXrTjXgkrubiFk5fzQR0=
X-Google-Smtp-Source: AFSGD/X8uzl/8yLA0v/SSjrEv5urZWm5pjal14Ua0x4cPAzmrA5DhhFrfaDIo6S2pYHO4My79ir8jg==
X-Received: by 2002:a17:902:9a07:: with SMTP id
	v7mr20569005plp.247.1545243197757; 
	Wed, 19 Dec 2018 10:13:17 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	q75sm27536922pfa.38.2018.12.19.10.13.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Dec 2018 10:13:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Dec 2018 10:13:05 -0800
Message-Id: <20181219181309.8320-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/5] musl: Move away from gcc-initial dependency
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
X-List-Received-Date: Wed, 19 Dec 2018 18:13:17 -0000
Content-Transfer-Encoding: 8bit

gcc-initial step is no more needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 9cc875c4a6..6f6129d7c5 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -20,7 +20,7 @@ S = "${WORKDIR}/git"
 PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc virtual/libiconv virtual/libintl virtual/crypt"
 
 DEPENDS = "virtual/${TARGET_PREFIX}binutils \
-           virtual/${TARGET_PREFIX}gcc-initial \
+           virtual/${TARGET_PREFIX}gcc \
            libgcc-initial \
            linux-libc-headers \
            bsd-headers \
-- 
2.20.1


