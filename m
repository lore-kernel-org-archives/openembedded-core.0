Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
	[209.85.167.49])
	by mail.openembedded.org (Postfix) with ESMTP id EAA247CE5F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 01:04:03 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id u13so3975167lfm.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 18:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=kPeVEVpiQt4fn8ycK/OWpXbZ+0P2GLdGA9FXpBHFqXo=;
	b=rOhg3vLnGLReQz8jIpNqDsZ7l6CR3e/z9ZebnOv7FORj+n0kFFYdeAF6doVB+QYwvD
	7lA4zjq10CdACVvHpzzkmHRLkpw8WExzqo5moIKIPKr2PIwbOI9B3iEkquPlf/vEBA4N
	Dvp7+Cqbe0w0oe5nTBPyF33CDeMSI+ZFBGCK/BIYasQ7AqqMqrOJ9sjMxzAZ0XwpXy3d
	mqJ5fOP99nqq3cg7pzs8blJg6bg868MU7hCSrI62Eoye2MXf8qXnMKoHQZzJDjvUWIQ1
	c7hmDLhEvOvSqLQ95N0QBYd7/tLKeK1s/mu1mnEB5id9UD2n72W2KbPQ8Vbjzb41alcl
	aobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kPeVEVpiQt4fn8ycK/OWpXbZ+0P2GLdGA9FXpBHFqXo=;
	b=V+MYWSAGK2VZsP9LFXd9iF81cTkcTlL6sIpfNLXwlMDa0p3DToUsAaBJ3Iq0WjYkt9
	luRhttyufrrjOQa7RG8V66ZkBP0zH8CWBWsO5hF4lkvobOs0Dvi4friRwNo38GuuWEuE
	shgXcORPZ0LrzSFjAExtAhMusitzEzhPwU0TFp2BsFzNI6DU+RFl/gcCoIqmMtv/S7Pc
	vm2GlBHgWxIi7b40NiGCnWE5RPJoQtHSe+GdqyM6itUmQlsfhodQM5UXMj9xNzG3F8uk
	c+7k1C+9C6n1gFFDKK9neXVBj6DRDofIEArBoNdA7hOwp5jHR2oBy7b86nyIYfCrplww
	JdEA==
X-Gm-Message-State: APjAAAWTDYxlT1cMlod4WBdtqAueU/zmTFrJ6CrJYDznbm2maLgZ2k4S
	BVuHvSyHUc07DiqAUh+qp+zYAMFi74U=
X-Google-Smtp-Source: APXvYqzSTC4lDttPXHXch2cbXyJraKmRCRDN2YfexGrwXozDrKIAVgzrh9i30Y9u9C8m81XwxrWQyQ==
X-Received: by 2002:ac2:5c4f:: with SMTP id s15mr8596480lfp.74.1567127043870; 
	Thu, 29 Aug 2019 18:04:03 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id v27sm580592ljv.86.2019.08.29.18.04.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 29 Aug 2019 18:04:03 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 03:04:01 +0200
Message-Id: <20190830010401.23042-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] go-dep: update to 0.5.4
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
X-List-Received-Date: Fri, 30 Aug 2019 01:04:06 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/go/{go-dep_0.5.0.bb => go-dep_0.5.4.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/go/{go-dep_0.5.0.bb => go-dep_0.5.4.bb} (90%)

diff --git a/meta/recipes-devtools/go/go-dep_0.5.0.bb b/meta/recipes-devtools/go/go-dep_0.5.4.bb
similarity index 90%
rename from meta/recipes-devtools/go/go-dep_0.5.0.bb
rename to meta/recipes-devtools/go/go-dep_0.5.4.bb
index a4d631f8ea..ead87870e2 100644
--- a/meta/recipes-devtools/go/go-dep_0.5.0.bb
+++ b/meta/recipes-devtools/go/go-dep_0.5.4.bb
@@ -8,8 +8,7 @@ SRC_URI = "git://${GO_IMPORT} \
            file://0001-Add-support-for-mips-mips64.patch;patchdir=src/github.com/golang/dep \
           "
 
-# Points to 0.5.0 tag
-SRCREV = "224a564abe296670b692fe08bb63a3e4c4ad7978"
+SRCREV = "1f7c19e5f52f49ffb9f956f64c010be14683468b"
 
 inherit go
 
-- 
2.17.1


