Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
	[209.85.208.48])
	by mail.openembedded.org (Postfix) with ESMTP id B569179622
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 10:40:45 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id a20-v6so8492094edd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 03:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XrDnmEG5izJ/eGrm6vtb2YfzQ7nroxJvsurFM7wVG1Q=;
	b=fMbHO0eYb0CVk2XHGuT9ijL/9g9vYE++tkb55pCgFOJk558Lo35htX+XJpyYkHUrPu
	Obfa1KIsjvtul9W9wukkDXiSfD82aVhsgFxnoz0dZr8C9I74JyrKpwF3/gE71QbxaZbn
	WkMYIrU329IYNmdwkTYU30+ZvpbsGLBESU/yMfq4ApX5HBBfVm9a2cniZxIu8f47aHto
	Tshl3v3pqT5FbA1RK7Gs9VSZECvZtPUeKUHMcW9PNBbU50SoqqYG16tTtSAPR1xGyUIy
	hATMcDasW8gvTC+kY4TMCJQ+Gulsyl8B/j7xxrjOPtHp303P+E0DlQLBA+/cquyxYMGp
	l9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XrDnmEG5izJ/eGrm6vtb2YfzQ7nroxJvsurFM7wVG1Q=;
	b=oslkGkwzkR1rJ31X8zxEes28ZeKrVmNW6kbCmnArWH0uo2AadoZ4shhC5i0RL0m2Cq
	xOIobCB6w2B69QtqxK0EI7vuxyJIA/IxYxTOsPmSkNoxCLX2TUZvDadwljUOvgyk5860
	futjCA0SZzgG7XC1NpEVvogLI1ysTfdtUii9bcwXAhvbJ22Gr/RTRqcEtUu+6O/gfuq6
	9kUb7RCHZW/c7qMTjLmGkRWchFpyD5E7B/7DE/9foSnkYn7Mgqe941ZJk3cTgeEBRW+G
	F79ltvWEDPYqEjPNM8MDY4ecweZbDH9khU4uQR9OxJ1crWQauqLy9NpYu6BFUNKDts6C
	MwDQ==
X-Gm-Message-State: APzg51AKckj83igNZ7uWPA/1+9xCest4YF5RfNADJU5aKftO7TL6jtdw
	LcsLm6k+TQc6j8/ZRK+ZjAQnDsA38iM=
X-Google-Smtp-Source: ANB0VdaUhRO0Ct53gpP6iNeEwZlX3DL7qFjCxOjdrTlZXxQi2vvi7FOO/5Rz2w6VaMgEEdXfrLeZ8w==
X-Received: by 2002:a50:b003:: with SMTP id
	i3-v6mr2745273edd.120.1536230446240; 
	Thu, 06 Sep 2018 03:40:46 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	k28-v6sm2256506ede.11.2018.09.06.03.40.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Sep 2018 03:40:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 12:40:22 +0200
Message-Id: <1536230436-30342-7-git-send-email-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
References: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
Subject: [PATCHv2 07/21] libsolv: update to 0.6.35
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
X-List-Received-Date: Thu, 06 Sep 2018 10:40:46 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libsolv/{libsolv_0.6.34.bb => libsolv_0.6.35.bb}                 | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.6.34.bb => libsolv_0.6.35.bb} (88%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.34.bb b/meta/recipes-extended/libsolv/libsolv_0.6.35.bb
similarity index 88%
rename from meta/recipes-extended/libsolv/libsolv_0.6.34.bb
rename to meta/recipes-extended/libsolv/libsolv_0.6.35.bb
index 5950194..0956453 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.6.34.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.6.35.bb
@@ -7,13 +7,12 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 
 DEPENDS = "expat zlib rpm"
 
-SRC_URI = "git://github.com/openSUSE/libsolv.git \
-          "
+SRC_URI = "git://github.com/openSUSE/libsolv.git"
 SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation.patch \
                              file://0002-Fixes-to-internal-fopencookie-implementation.patch \
                            "
 
-SRCREV = "f0ef172a591d9c1ca0e13e09955054ac9c473d67"
+SRCREV = "38c5374d4712667b0b6ada4bf78ddbb343095d0c"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


