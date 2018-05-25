Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f49.google.com (mail-pl0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id AA1E474B11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 00:14:26 +0000 (UTC)
Received: by mail-pl0-f49.google.com with SMTP id f1-v6so1574316plt.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 17:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qwHLbA+0j8Cp1Jb8BphaznP2Gqc8jAf9FnRLDQyNirk=;
	b=vdrhkcmpELp9/pAvICUczd8C6TJToNQQHFdRHsvzDJSZWGvKRkvkHqLTW0Jg96gCjG
	3mm4InZd6LCeE7woQky8mN1blxVjTpL+sLAnx4YAbJDHjvGAr85NRwS9IvND5Jdy934n
	I0SMqFuZktgYQjePdeg/0c2S3JX7MLPAXkkt3ZoQymPoKOqguhCHynyvZi4IbpIwrHxW
	S8RS4rdB5RMGVTFudVfqOJvQOrKAY4DXS+Fe4rS+LPKPFpBfkhD4F/2hp59SfmrgxwMy
	+VXvzqgRZbYKd2Cja2Bg3xWbqmwLDsN3xLoOnD0057lc9xn3Hyf2JRM0oG1g9owBdaUM
	QFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qwHLbA+0j8Cp1Jb8BphaznP2Gqc8jAf9FnRLDQyNirk=;
	b=o8kUYt23yu5ElHbsrdjpAF1/2AjZ9qqM/jI26FTjRe+sBJZkq0WwWosFfRPQJc3MHg
	VJoiJP56IQGxqaM+ysz6FoGRtavTk44OfmujE3jr43It5buNd5/vO6TuY+NMZjKRLt7d
	c4p7eIJsPMDZzj2FXUkJzH5pnUc1AJErB4qNbV1firlWinr+QIOdAWUwWrB4CYITCqJo
	5QRfI7pGlBhMgF5IELszh8J2iCRMMJaig0mE9OrScibtjbQ/sf8FYa3cGJ7pXxctRZUo
	q3KvblmDgzabEcxYVTa8MnrEPE9wyGu8T3MHm3qsTMKmjsbZZafD2OSHXCkQt5CvYb9h
	/ayg==
X-Gm-Message-State: ALKqPwdocF3tMpVag695dPnm5015C7yYqDjPXPtcgI5CBCugsfVF5QN8
	YmYPSlr45+im7YObhnY6rbZzuw==
X-Google-Smtp-Source: AB8JxZqHjJSz7TY2vP+kurD6ciiVoGQB6hhh7wkOWCwMpKWogIojBNRV9fVObrLey0uiURfwV3ZrgQ==
X-Received: by 2002:a17:902:e85:: with SMTP id
	5-v6mr183711plx.318.1527207267456; 
	Thu, 24 May 2018 17:14:27 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	h75-v6sm44191913pfh.148.2018.05.24.17.14.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 17:14:26 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2018 17:14:18 -0700
Message-Id: <1527207259-30592-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1527207259-30592-1-git-send-email-armccurdy@gmail.com>
References: <1527207259-30592-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/3] cpio: rely on texinfo.bbclass for texinfo-native dependency
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
X-List-Received-Date: Fri, 25 May 2018 00:14:26 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-extended/cpio/cpio_2.12.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-extended/cpio/cpio_2.12.bb b/meta/recipes-extended/cpio/cpio_2.12.bb
index 0b83e9b..19ad69b 100644
--- a/meta/recipes-extended/cpio/cpio_2.12.bb
+++ b/meta/recipes-extended/cpio/cpio_2.12.bb
@@ -6,8 +6,6 @@ SECTION = "base"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
-DEPENDS = "texinfo-native"
-
 SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://0001-Fix-CVE-2015-1197.patch \
-- 
1.9.1


