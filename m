Return-Path: <kergoth@gmail.com>
Received: from mail-pl0-f52.google.com (mail-pl0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 77B9D78542
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 21:08:01 +0000 (UTC)
Received: by mail-pl0-f52.google.com with SMTP id g20-v6so2328544plq.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 14:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=A1IHM0ZNoogCak759QEHDa/JN6X0SqXAaFxIjGLo1OM=;
	b=nWWEEAYdWsNXVSW+jsoV8xLj0QNGEBl9/E+osJEg2u4lt5rCNQ35AydxYCcfJqS6g7
	G8n2gyYDch/Q4v3TXTnYVym1emCcU5hzue8xy9tHc5/W37UJqDUWlgopHoj9DB9s6iYu
	TUT7RYVspFg0r9frtd7YCVtwqEyQrVshStD/1IhyurDaREjrDxjJUh2zsugH37hwbxlx
	yMfHUXEgjwhQeCXMrrau3apGI0WKh8zAtUM9+nfU0wDQE7LRXokyb/2UflJPA2jhC913
	nxOB96zXQuP9xHHA2Jb9AxW9hnsyfC1m7NEnryGJUQ3ax9JhBxQOdrZQlyLVI8kg69fY
	1NAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=A1IHM0ZNoogCak759QEHDa/JN6X0SqXAaFxIjGLo1OM=;
	b=HKGFn3ibV8OcapxaQVhyUj4tWpNHlpK9PEw56ek7FmuWp0rx9kvLMRUbm6d6tpIhbC
	ZHwJpjxqunSNH4RE9KjqgdZJDV5BQ1FwNntKFrRurbtVYw3HF6i4VYSQnVZXqiMycOO/
	5kBiZzvEBLBClDKFgVN8pmVCW2Ww6Zc2B0iG1NpmM9X/r8XavT31GucJw00zt/RjFd9m
	dKAIilQxl1c6SM5EbvqI2nnu3B7/7BGjDVCZx4HesiRnYemrhop+UVMxYyJpfs8sZT//
	SL6vx0GLjv4VReCoc7OCXykfcC7t39RYtHuhivPrLm/OZ2tUl1tOOGkC4HPvSXfiWXcP
	Palg==
X-Gm-Message-State: APt69E2wftNSiCY9fncoJ2LZkdXRfjoKULj65DUBJ87531DlkdEZrCm/
	6PziFM+pDlyGPtp8v647E658XU8u
X-Google-Smtp-Source: ADUXVKKg9LgFaDnRnUCEESoB0ubd8rBj8+JELeNcqW5sFIHUDciNlHwoXg+Ceo80sUe1YqkktcUsrw==
X-Received: by 2002:a17:902:d68b:: with SMTP id
	v11-v6mr29632618ply.16.1529615282336; 
	Thu, 21 Jun 2018 14:08:02 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	l62-v6sm8448499pga.21.2018.06.21.14.07.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jun 2018 14:08:01 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 02:07:35 +0500
Message-Id: <86eb26452d25187a4f545533a5d851d73c5ff0cc.1529604086.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <cover.1529604086.git.chris_larson@mentor.com>
References: <cover.1529604086.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 5/6] dmidecode: correct docdir
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
X-List-Received-Date: Thu, 21 Jun 2018 21:08:01 -0000

From: Christopher Larson <chris_larson@mentor.com>

Without this, the package clutters up the root of /usr/share/doc.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-devtools/dmidecode/dmidecode_3.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.1.bb b/meta/recipes-devtools/dmidecode/dmidecode_3.1.bb
index f83281e2359..b423fda6d24 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.1.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.1.bb
@@ -9,6 +9,10 @@ COMPATIBLE_HOST = "(i.86|x86_64|aarch64|arm|powerpc|powerpc64).*-linux"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
+# The upstream buildsystem uses 'docdir' as the path where it puts AUTHORS,
+# README, etc, but we don't want those in the root of our docdir.
+docdir .= "/${BPN}"
+
 do_install() {
 	oe_runmake DESTDIR="${D}" install
 }
-- 
2.11.1


