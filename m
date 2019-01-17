Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id D77447C222
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:27:17 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id l10so8246216lfh.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AetQKQ2cI+PzwYi9FcaVUKwIH9a4cyfFZ3s6vFQIjO8=;
	b=erXejWkJmzYKGyDfC2+VGEQtVxPvwLsKhJOYy+Z99PpejPASo5RJspoAoR+OYw9I0Z
	N4PAF0Xy5U5rOAQme7Bim8nynAlKzEZCpV119xWt+MOU0jrrTgzQXapI1qlelYbnbEmK
	K0M0DWYvmqOdGXiZeYK2CYodUpUa91cVxxRV+kRtIP8sfWoDi41EZu1r3pRkhyD6B2rK
	ZhF5RqqA0Izel3mdtOq0FY0ZfZTYUDUFhGNR1YtTwyQfFJvqkIKoOgmf6iShgmSCudJC
	ux/BgMpyzb+QQhNJW/k+a5AxM8g9OGVMlJ5Gtq2XTfLuvsLnx6dKp3k5tAlyIXkOhY9M
	ojYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AetQKQ2cI+PzwYi9FcaVUKwIH9a4cyfFZ3s6vFQIjO8=;
	b=uUAo1HnFneTNs50lBNIgW+N2ymB6Nc1u9UNOcwtsDNDUv5E7Zly5irx9kIZMBPt+kQ
	LzO8X1Ymz+VsxBBK+X3sdrJr+TZkirRAv1OJX2j7eIDo4Y426KmQPqiRdDVHVt9plbTp
	mqq0jjBFhjZ9sG4XcsQ+1Si3e3GuxDPxjMEjtZ0R7MM/1BDRe3j00xDWIcQ4FWddLuvv
	mwyDfIjaDIsDqYLR1x08+TOcZZj8ZSdWWvBFo8VRjExEm3a2D8muQhWMKJS1q2giI+H+
	x+1SM6llLuSJzgpiySkQUNjNKmtdLu4KWI1aYxHokX98dYhvBWQITGIGvEL45B/ayatt
	zHZQ==
X-Gm-Message-State: AJcUukceKuPA4mjkFucXwKl0l1i+oOf8b/fYIdtsYbjaPwzy7axkH4yK
	RELAYYOTo9O0tyDx7VRUX4eh3Ljo
X-Google-Smtp-Source: ALg8bN4qzirkOie5EYY3JwCZlcbXioUZAf/G7Zb78cjNHW3GouZaNXEYnLLW+JTWBZIQBM/T1P/IlA==
X-Received: by 2002:a19:9a8c:: with SMTP id
	c134mr10312606lfe.152.1547742438009; 
	Thu, 17 Jan 2019 08:27:18 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id q11sm358866lfc.92.2019.01.17.08.27.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:27:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:26:58 +0100
Message-Id: <20190117162659.24997-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190117162659.24997-1-alex.kanavin@gmail.com>
References: <20190117162659.24997-1-alex.kanavin@gmail.com>
Subject: [PATCH 10/11] libsecret: upgrade 0.18.6 -> 0.18.7
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
X-List-Received-Date: Thu, 17 Jan 2019 16:27:18 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libsecret/{libsecret_0.18.6.bb => libsecret_0.18.7.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libsecret/{libsecret_0.18.6.bb => libsecret_0.18.7.bb} (81%)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.6.bb b/meta/recipes-gnome/libsecret/libsecret_0.18.7.bb
similarity index 81%
rename from meta/recipes-gnome/libsecret/libsecret_0.18.6.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.18.7.bb
index 518c71feb17..0061b880533 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.18.6.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.18.7.bb
@@ -8,8 +8,8 @@ DEPENDS += "glib-2.0 libgcrypt gettext-native intltool-native"
 
 PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
 
-SRC_URI[archive.md5sum] = "c6cf132a56bd346fbf49a43abb02e5c2"
-SRC_URI[archive.sha256sum] = "5efbc890ba41a323ffe0599cd260fd12bd8eb62a04aa1bd1b2762575d253d66f"
+SRC_URI[archive.md5sum] = "376153ece17081eb5410870e0dc5c031"
+SRC_URI[archive.sha256sum] = "0d66fe1fc4561b3e046ee281d7c5a703a9baac88a8c4fb42ebc739d31dabd487"
 
 # http://errors.yoctoproject.org/Errors/Details/20228/
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.17.1


