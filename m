Return-Path: <tim.blechmann@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id C89EF7E08E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 10:37:32 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id s49so30752358edb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 03:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=W6wWMyuMIONvyxyhh2c/Pvk4SF+b2z8jrIzJan8SgYA=;
	b=bKe3HQsjRFxwiImwHBz1Qvs/KljALY4wXg4AAw/wIxN3fRaFSpNARuF0+8hOzAS9ev
	byav8uied8D2WP0knMbeYbuwWzOj1rhBsZtq4Cdxe/tria8/3XLpLpjXZKNSDihAsF3k
	uMz38DLxop/Ma78j9/MdI8WcuIus+9pD3gNheju2ubTQ/57iaZE7Q3hBk9hNr/CLRezh
	4pjb4Opum5zqQX+alI39dkfDEt6Lq1PhB4EbW3fbBzWUl90fuLhHm6kqNByVRuwjTKu3
	ZAPaDXfgHFtBMoABwUG95bNWkXjiRfSgLlHG1YrxS1ffSETHNqYHdoLbQT6ZxH22SRs0
	EnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=W6wWMyuMIONvyxyhh2c/Pvk4SF+b2z8jrIzJan8SgYA=;
	b=YQtcre83xY7PEKGMSTS6pEydmsqQ4juytFWfdApSMpfX+RYHdHvf5Ztjez1Y2Zue2x
	1dWgfwt1B9WWS2oByicl6QajetTM68I1/HqhmI5TXq1bbdY4/uO3FBaFMG5e5YB6sfiN
	geDEARcu0NSsLAKbmbRD8+vUju3dtZPlRBvpB4W+aadbHJoBAQGjbJCot8WjL895f2i0
	gHKOW6rCPOOZZcV8K2vU3FZ9qYpKcge3+UcYH+qWzotaXa3nk7eZo5FAQWDW6eG8xbrs
	xJyNV30+t5N1xXZn7qU3f5XxCMrABYGIbVgzChCas1EOqHJuPuIs8xyZZt3+mr7ONddo
	kvDw==
X-Gm-Message-State: APjAAAVPbQZLqXybXat1sVTBEaTOL/t7ugrM7tNpv3dOFJyEGD1OhuXQ
	DQbh3eOu5TVRMa/WYiTwmQoM2ife
X-Google-Smtp-Source: APXvYqzJYynibcyhm22TDxPWWvp/VMSVrUnVIn8FgXdHksV+PPWMHNqC4cqdqpi/ZU54bzv3aE+elg==
X-Received: by 2002:a17:906:1dd6:: with SMTP id
	v22mr20758457ejh.277.1566902253119; 
	Tue, 27 Aug 2019 03:37:33 -0700 (PDT)
Received: from localhost.localdomain ([115.132.198.120])
	by smtp.gmail.com with ESMTPSA id
	l26sm3439725ejg.70.2019.08.27.03.37.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Aug 2019 03:37:32 -0700 (PDT)
From: Tim Blechmann <tim.blechmann@gmail.com>
X-Google-Original-From: Tim Blechmann <tim@klingt.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2019 18:37:07 +0800
Message-Id: <20190827103707.98377-1-tim@klingt.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Tim Blechmann <tim@klingt.org>
Subject: [PATCH] icecc: blacklist systemtap
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
X-List-Received-Date: Tue, 27 Aug 2019 10:37:33 -0000
Content-Transfer-Encoding: 8bit

compiling systemtap with icecc causes the following build failure

> build/tmp/work/silvermont-64-poky-linux/systemtap/4.0-r0/recipe-sysroot/usr/include/python3.7m/modsupport.h:120:66: note: in definition of macro 'PyModule_AddIntMacro'
> HelperSDT/_HelperSDT.c:145:34: error: 'PyTrace_RETURN' undeclared (first use in this function); did you mean 'PyTrace_C_RETURN'?

Signed-off-by: Tim Blechmann <tim@klingt.org>
---
 meta/classes/icecc.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index edb0e10434..1a4b4ab526 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -73,10 +73,13 @@ ICECC_ENV_DEBUG ??= ""
 #
 # libgcc-initial - fails with CPP sanity check error if host sysroot contains
 #                  cross gcc built for another target tune/variant
+# systemtap - _HelperSDT.c undefs macros and uses the identifiers in macros emitting
+#             inline assembly
 # target-sdk-provides-dummy - ${HOST_PREFIX} is empty which triggers the "NULL
 #                             prefix" error.
 ICECC_SYSTEM_PACKAGE_BL += "\
     libgcc-initial \
+    systemtap \
     target-sdk-provides-dummy \
     "
 
-- 
2.23.0


