Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id DCEC47FC09
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2019 14:32:08 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id 139so10501692ljf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2019 07:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sEGg9Sj1BP/bFt75GPjmKhLqV5N9tjB1lEizwnDJxJE=;
	b=sNLGdXCTMSJL2Au9oHjmg8nXxaIYft7lXWSV3hizs1V0Natw8IYz+jtaieIntF6Zpt
	KRx9TfmL2zuZ0jpRiRmPqWGFpxJTVXGT8UI2qZrdERI9gT8j6GKFhu23mMLnPMcBBLHr
	qectmCP4kUsVGJG7b856121dxdzqGRb4r0fNRl9G673nA1on70lLvnUg5m00S7amCey4
	wt5h+YJJhP677KAwqyukOo/2YFG+RIQy3wJb2tIszhTatE1WTfDIJAZ1XgocOjXwcwju
	edVgVjv2UbZCK1vLDdfvCQHQSVgT3yLN6KiU3NtcNFW/wBGm6mH0QHqG/jWG1ZvzoNEx
	dyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sEGg9Sj1BP/bFt75GPjmKhLqV5N9tjB1lEizwnDJxJE=;
	b=aH9PLa7BzgsjKx3g8uI6AGcLoX5wMj1iKYh1L1S//7ht6AXV4/qts129AAQf6PaAry
	pN8/GaegYvYWMGaxcFCBFOR3i3TldI2DrtZu7yHFjMAG9DI5wC0qwDL4UPl0ycfZ5P1j
	aq7QaFGtdCOT5su++OG5wK4viANZRX673ntzgysTj3romWF03V1kS3KnHT/+WKmNyDod
	HUFb3BvUi/UJhXtLarSPNMwFz3WjenBLuEw9UESKSyjSfNo23XaD7I/CE7wg1scEzH8Z
	+PNreM/iH5HnrbGsh131W9m1mcNH5AghMT3jhrIooJJqD/XigqZ/x2FbyZzoE/mDTPuE
	9p0Q==
X-Gm-Message-State: APjAAAVx0s98s3J8n/aqAbSZ+D7/GmiZMswgIBsKaGcUG4tDx8XfHsst
	pzRrTGVk+r7VIC0l/qHdWjruFMYUn/s=
X-Google-Smtp-Source: APXvYqx0x7u7ySInyeO5P4OUNOyPv9RJy1r/GtVDUcD2YXgWDweCGVdVcAyiYZzFQ4VmNPMfHjvmGA==
X-Received: by 2002:a2e:8990:: with SMTP id c16mr8660953lji.226.1572618728977; 
	Fri, 01 Nov 2019 07:32:08 -0700 (PDT)
Received: from localhost.localdomain ([188.162.65.93])
	by smtp.gmail.com with ESMTPSA id o5sm3626226lfn.78.2019.11.01.07.32.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 01 Nov 2019 07:32:08 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Nov 2019 17:31:48 +0300
Message-Id: <20191101143147.26812-3-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191101143147.26812-1-dbaryshkov@gmail.com>
References: <20191101143147.26812-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH 2/2] multilib.conf: add systemd-boot to non-multilib recipes list
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
X-List-Received-Date: Fri, 01 Nov 2019 14:32:09 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Add systemd-boot to NON_MULTILIB_RECIPES so that it won't be built for multilib targets.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/conf/multilib.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index cfed3fbbd07f..c734a121e12d 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -29,4 +29,4 @@ PKG_CONFIG_PATH[vardepvalueexclude] = ":${WORKDIR}/recipe-sysroot/${datadir}/pkg
 
 # These recipes don't need multilib variants, the ${BPN} PROVDES/RPROVDES
 # ${MLPREFIX}${BPN}
-NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf"
+NON_MULTILIB_RECIPES = "grub grub-efi systemd-boot make-mod-scripts ovmf"
-- 
2.23.0


