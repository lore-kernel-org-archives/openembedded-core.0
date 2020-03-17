Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id A056A60B74
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 15:28:53 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id x3so146457wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 08:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=K5NAXWdYC2U+oPMYYIaMYVnVRo8YOvRqhQjCZ1EDB2o=;
	b=rJCh5aW5GABdjIeid52eY8s35XDC1fduFf657VGulBYAvf4Vig4/DiDVmGmoKKsNS3
	jmmHVWqNlP6MScEldk2/Kc3JfmR8oAhBm1vMUpVRpkcxuUS+G7eyyewJ1kFgRafeWuLQ
	srrt3taSVJdc0hdPSHP/EqRTu537Nw1z6l1c0qCxCmoNJ95MF5WpInNXseUyTzq0skAQ
	+dGm0JKOgcR7pSHgJWyvB8Afl3wWr0xNoKDHiWzMHoxMFafjoELHG103aHHd3W+sHrux
	udxd2XYrUI/s8Gf1qhlX3/838rvnA7umzvard0345hE1jDLJSI9SXamEsl85Ky9e1wZZ
	XN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=K5NAXWdYC2U+oPMYYIaMYVnVRo8YOvRqhQjCZ1EDB2o=;
	b=lPbHIYS3nZgw6983zU5udSWheWjhDxlRArDox7hlcZ8sTW/KlKOVH4cun4kFLG1BiS
	3t+PM1BV8ujoUVEH106dZx6+TYCNsDQ90bSyAq+YPoqif6cyzpvqu2Q6xAuiUvZGdqz4
	3QO5U0LJmmJUG8+si2p9kYuwCwyAJqySxd2jYdHmFBNVkkRjDQs3W4xGOBmmWcp5Xi7I
	tFFObsd6+ML1HSkdZpI4BGRIo7hmDd+CjI2hRMwlne1aS9bxekrIyNGqxRqKZYcxpX5+
	hJYe2ibUFacNlU7CcQe3mBe0cG2RMhHNU4HLKx8FYoioY2ExR9KRuIEaR18cEM/YRyRj
	eJ2A==
X-Gm-Message-State: ANhLgQ3oikvTAG9qSXZDHWnleW9ZgeSFiIE51hh656h8BA5OMwposO2C
	KJJHBayd18pnxY4Gf68XpYQH3edn
X-Google-Smtp-Source: ADFU+vuD2lCOi9qFdwxxhTdQtOJPopXe/6u/V1XxTXKsVbm57v5Vy6tUhJI7hIm0ThI0D0VTCBQc9Q==
X-Received: by 2002:a05:600c:2252:: with SMTP id
	a18mr6093530wmm.51.1584458934155; 
	Tue, 17 Mar 2020 08:28:54 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id c2sm4307128wma.39.2020.03.17.08.28.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2020 08:28:53 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2020 15:22:55 +0000
Message-Id: <20200317152303.4600-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200317152303.4600-1-alex.kiernan@gmail.com>
References: <20200317152303.4600-1-alex.kiernan@gmail.com>
Subject: [RFC PATCH 03/11] systemd: Add sch-fq-codel to RRECOMMENDS
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
X-List-Received-Date: Tue, 17 Mar 2020 15:28:55 -0000

systemd sets net.core.default_qdisc = fq_codel, include
kernel-module-sch-fq-codel in RRECOMMENDS to satify this

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-core/systemd/systemd_244.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index 048021000448..b26f3cb72d2b 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -565,7 +565,7 @@ RDEPENDS_${PN} += "volatile-binds update-rc.d"
 RRECOMMENDS_${PN} += "systemd-extra-utils \
                       systemd-compat-units udev-hwdb \
                       e2fsprogs-e2fsck \
-                      kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
+                      kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 kernel-module-sch-fq-codel \
                       os-release \
                       systemd-conf \
 "
-- 
2.17.1


