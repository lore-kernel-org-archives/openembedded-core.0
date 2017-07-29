Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id B456578559
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 08:35:54 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id y129so119630829pgy.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jul 2017 01:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version:in-reply-to
	:references:content-transfer-encoding;
	bh=q2FKLczvj7PIK72oyNBi9+0T4t0/zdIingJRbVnyjJM=;
	b=ogbogRqRlqs7ThSQuulYGgpI6Aj49XZmHSY0wQIpsj5+yb5PuOkqPBaMm0ayLXIg81
	Kq2YErqfS+uFHPsKtyG3ZoXnpCpG8y+msdxVPYodPwHVFPC3654cssihpm9Zuv3oQ/FL
	8lqxa8C4mqhFmEed66z2xNxsVk5uKAECPDK3eGMYfK0H6KHouaZkQvq3BWPSZOk6Ir2y
	DuSP3grr735NmxO+JIGMha1NhDgb6vV+TLYSTPOkL4wn6PdxtkaZS8xOjGrHotOQ6wfp
	cjEmoa4wuqaqYZSfBIf5rSJhCAwP95aKNJ3BXlqX7RoVNGfg+UzAHELDY0zdZhrnmFOw
	vlKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=q2FKLczvj7PIK72oyNBi9+0T4t0/zdIingJRbVnyjJM=;
	b=feQqZ7m/l+NNqojFVsOUa8kFdXY/SDreJAXXij5VEneZYwssGFNTW2x55bugHxxyt8
	pt90VXxIg97iZDNCkovx73X8YgiyjGeraU1IjZWvDtiz7NEn6x0VgVV64p/W8lTJ99Ke
	Kh2YOfiS801NN46jMPW6UiVDL90J0GiGhjcWM66KNBTdQUAahxbLYyd85kJAClpBWQ7W
	1HCcOUzT/HhvCs6gt65KxkJ92npIschczk6Vzdf+dVLnj1um9ppYnKFoW9zqnUQGuOmI
	svmL5AbCNZtIhUTXIspUQjimMwWFZHltu8Na7WbNCAED+eRPiPmd0H88w850UQs9D1G+
	Rh1Q==
X-Gm-Message-State: AIVw113UQ2XDlJ7FzWm//2oKvL3E+vHJg3J5+7wM1dbg3EwXpoCxms46
	SoAW+5Rdo9RLHFJA
X-Received: by 10.99.181.29 with SMTP id y29mr4648818pge.135.1501317355897;
	Sat, 29 Jul 2017 01:35:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f6f])
	by smtp.gmail.com with ESMTPSA id
	s73sm26396059pgc.73.2017.07.29.01.35.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Jul 2017 01:35:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Jul 2017 01:35:38 -0700
Message-Id: <79327dc628d9e37c4f6b98e0d5799f55031dc36b.1501317178.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
In-Reply-To: <cover.1501317178.git.raj.khem@gmail.com>
References: <cover.1501317178.git.raj.khem@gmail.com>
Subject: [PATCH 2/4] re2c: Transfer recipe from meta-oe and upgrade to 0.16
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
X-List-Received-Date: Sat, 29 Jul 2017 08:35:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ninja needs it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/re2c/re2c_0.16.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-support/re2c/re2c_0.16.bb

diff --git a/meta/recipes-support/re2c/re2c_0.16.bb b/meta/recipes-support/re2c/re2c_0.16.bb
new file mode 100644
index 0000000000..e82502c5f2
--- /dev/null
+++ b/meta/recipes-support/re2c/re2c_0.16.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Tool for writing very fast and very flexible scanners"
+HOMEPAGE = "http://re2c.sourceforge.net/"
+AUTHOR = "Marcus Börger <helly@users.sourceforge.net>"
+SECTION = "devel"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://README;beginline=146;md5=881056c9add17f8019ccd8c382ba963a"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
+"
+SRC_URI[md5sum] = "3bf508fabd52ed7334647d0ccb956e8d"
+SRC_URI[sha256sum] = "48c12564297641cceb5ff05aead57f28118db6277f31e2262437feba89069e84"
+
+BBCLASSEXTEND = "native"
+
+inherit autotools
-- 
2.13.3


