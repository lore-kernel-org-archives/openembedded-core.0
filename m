Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6C91D60B1E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 19:43:59 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v11so17405619wrm.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 12:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YOJlened5uVbZ0+HFlR3W5QMUE7wGCVljsLgDhW+gPo=;
	b=SKOnAYKX9ooSaD+Al+4u5+kyo4UuE86ZfiaQAtkUcb8KzLnhv3/yCWslncaQ/ag1+F
	Spb5oHJU0LlR9YfE0ZI81bBxFjTxhA6IqSYiYP5RVrPBQhxNwtPJX1bZeOW+cRi5zK7R
	pEKjXGKutbXmKnf0arHkVAxReoj6s1ucXysf9JgG1dO0Pafe0I5dshd/Sw9NAVhNqotd
	ctcyLp6I5dfhMz8NUh4VKXTedbzKQBnfTKnCJG3mYTlbewc4gHSVeDuXNu1t+VBe8sbw
	pXiHQqlWFTCzckwx0fX52TuNy0xGu9VmcIrW5uqG3+7izuUr3q8LyhwmDwxsUdh2kojT
	42SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YOJlened5uVbZ0+HFlR3W5QMUE7wGCVljsLgDhW+gPo=;
	b=h2HL25EGeQ/64zYn6LhtTiym8XY3OOb/EidDrvI4dXFOWITE+Cf0OpTNwksIGvM7e9
	8Va7CubHC1wbO7zC3d/7ZOF9H/Evotw/ZYqnULfDoqJmibw0BzW+vcxfwwUZTAtsV0wd
	7ZyF1+nWFLR/2TmzUTAMfuAkD0+mmMLqKyos7U2EPb8x2WvjxdmqxFhefO9s90Y4I58j
	t9Zozaja+MxDFUCfajpuggPw09xXPlNese+GEUMuBYuKX9FbUdpZgHfZ+aBEfJcOIaEo
	aCSp+nZYxpQRAOVXuPc+VPWATJ9SxiPSarb/0a2j2bJcd+sjY1n4chak4a+baXnZRBOZ
	kT8g==
X-Gm-Message-State: ANhLgQ1S1Q1O0tV6XI+ztrMmrHL/tc74rm4Ou2fX8crnjwGYAj1zu9Bs
	3/xV0FTE9ntIinn++lNtAXU1Jhr3Vqk=
X-Google-Smtp-Source: ADFU+vucykKADVeNPloN09T8I8fVMmUDFCkOwjGu61kOtig4yNXLdl4d56+Wfm/2sZPo8GzoIskWNQ==
X-Received: by 2002:adf:f342:: with SMTP id e2mr28580417wrp.15.1583869440309; 
	Tue, 10 Mar 2020 12:44:00 -0700 (PDT)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	y3sm30350631wrm.46.2020.03.10.12.43.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 12:43:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2020 20:43:28 +0100
Message-Id: <20200310194328.8131-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] libdnf: fix upstream version check
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
X-List-Received-Date: Tue, 10 Mar 2020 19:44:00 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/libdnf/libdnf_0.28.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
index 163a2eec26..cc2ceb8816 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf \
            "
 
 SRCREV = "751f89045b80d58c0d05800f74357cf78cdf7e77"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


