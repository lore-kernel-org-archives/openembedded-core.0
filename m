Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7A09B7FCD4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 16:11:35 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id bb19so959209pjb.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 08:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=am9KOpIUGUa6D+BhMWAunnc/GFAcQq6rPmATgBih0Jc=;
	b=sFLGxWhiukzuJUpaHXvImYkS8cJSjBqIJQv4xdFVnhjBu8YsxuYJSLmpcMwwyU8AVt
	O02OwsjftFqHgxDFTdu9djE3CMt8sNeJQ77m6y7G2sbLLOxX0DsziYYQBYsRvXcyHTIF
	3oz6771f2+9Gl7WvVFZ3sfE3LH3WKrT23e75GAjXIgx3OUpU9PyAVfNbLOZixC/i2U2x
	GBBPjJNaYXzXfdcffLuX0QrAF0IRZr4JaekaQDkPsSOaiMcrJEGQdjHo3DdMyKAW2JSr
	GPoafQ6j2ArGUwlQ5rxftJqlv7K8dZiqhL6QEMoEqENYPBj2XvR4sK44qiDwP7Yl9q7/
	Dybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=am9KOpIUGUa6D+BhMWAunnc/GFAcQq6rPmATgBih0Jc=;
	b=eyVRZEl5Zo8m/lUg4iyJ91YhgI7SGvUQpuuT0k80RdFYeqJkzcDX8tl5l8U5BZip5j
	hcjXGRFkjtP0+vtH3P3VpgfAsY7Ys9NTOCABjoIZHnRGZ4RSEQ8zMDX0jLm92enYHZbr
	Q0z4Ena69ewWHOdkWJ3UQAnYkjzKbAgBneVkvG5r7vdSc0kGDnU1UwOFL1M5hOFw/M+b
	WGDMMa/ajOy3WzxYQskmz02NI8zZoBD6UkSBvOSEwfXSWobyX9Ddx8746UTXJNMYNvfI
	F8B1py6G7B79N37XQVm3FkZENpVpJ/6hRuSqeFNxnN1LhI1UUIit1X+SxTAgpBL76h5v
	LWqg==
X-Gm-Message-State: APjAAAWQzNSWFPj4mq1U1VgCPR2IwlMG/kIuDAgMjIecg+C0Axs1VWo3
	/g5Y7yr7cGhfYB+gC7hJoMkjtKXM
X-Google-Smtp-Source: APXvYqz7eJo+d4Hpem+hiJ3Z2GBfgqrQR5Dc7qzKk/dd58iDe9lMvHMencQ8bL1/QX0llxhSykARXg==
X-Received: by 2002:a17:90a:26ec:: with SMTP id
	m99mr6491542pje.130.1574525496391; 
	Sat, 23 Nov 2019 08:11:36 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:d5a1:4623:137e:d439])
	by smtp.gmail.com with ESMTPSA id
	199sm2091943pfz.186.2019.11.23.08.11.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Nov 2019 08:11:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2019 08:11:24 -0800
Message-Id: <1574525485-20450-10-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574525485-20450-1-git-send-email-akuster808@gmail.com>
References: <1574525485-20450-1-git-send-email-akuster808@gmail.com>
Subject: [zeus][PATCH 10/11] gst-validate: upgrade to version 1.16.1
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
X-List-Received-Date: Sat, 23 Nov 2019 16:11:35 -0000

From: Carlos Rafael Giani <crg7475@mailbox.org>

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../gstreamer/{gst-validate_1.16.0.bb => gst-validate_1.16.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.16.0.bb => gst-validate_1.16.1.bb} (87%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.1.bb
similarity index 87%
rename from meta/recipes-multimedia/gstreamer/gst-validate_1.16.0.bb
rename to meta/recipes-multimedia/gstreamer/gst-validate_1.16.1.bb
index 1f43706..7d602ea 100644
--- a/meta/recipes-multimedia/gstreamer/gst-validate_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.16.1.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 SRC_URI = "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz \
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
-SRC_URI[md5sum] = "c5c57f3325a2e62aae4a8ec4931f7711"
-SRC_URI[sha256sum] = "9331ae48a173a048243539730cc7a88607777762dea4aebbc3ab55981e68d6c9"
+SRC_URI[md5sum] = "793e75f4717f718ad204c554d577b160"
+SRC_URI[sha256sum] = "7f079b9b2a127604b98e297037dc8847ef50f4ce2b508aa2df0cac5b77562899"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS_${PN} = "git"
-- 
2.7.4


