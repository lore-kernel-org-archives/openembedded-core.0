Return-Path: <>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id BC9907F9B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:29:38 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id n15so16214105wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 10:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GAXNYWAQ4l7aJYqCk9EK6GF7zirxbjqpTeKnkoyq4JU=;
	b=aIM8U0q2VEDgHnmjmNUFYJy6lxx1HFQpEg7L9Lvz8310njx6aiisah+xitPmZTwaFu
	CMeopwkXi3Qyx3+9682qvRy4U5CNHC63RZXt5lDn/zVYKWCIxYbgdNSQtA12+mauH7Bn
	hp55/qhnH5ei9XnUGW5iir9gKLYE0PtLh7SHd82dOvc+9/Ti7ZEF7GD7hAr0yPB8Lki7
	FynQa8KfIvy7EYIFzufEX9cC6wJetJqNl8mXUHL+IX3Ws3juZNcP23Mk9LkmE4zBD+vo
	iiDFOm5w7A/boMJDEhQCAVGx/eFUWKRQ9e1SDOFqaE7J1p7Myg+RgyjN3F3reFqHUj+u
	gnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GAXNYWAQ4l7aJYqCk9EK6GF7zirxbjqpTeKnkoyq4JU=;
	b=ZIpP9hlROskESP2WnxBRxSyVcoZKL1Kc0VkDNNPyKAHwyTmcO8aoCJzHx9AmOaeV0e
	dFrCxdOTqaSUyM/Zu+6dqwr99JRsrsPfeEMiD9ooqTxnf34YBvaMVpcD/FqC1kqs7p0B
	dpADRa1cP4Trkw1fA+l64zZlRtfu7Q+KU5DPCko239bilqLZCRNss4WKj10BBYe/hBcB
	Wy4cRcJMhD8iBaUNebYh4DScE9o8AFcN6Nm+StRMGuVOvK9V0yoMdNccLN+GpSzbWzkn
	TtcvMAJ5RpZ/UK1yGVDu3Rt1HGFge5Ylbsu6dG+zokGU+Py2AEoTL5VEGVaRYY7t5DcL
	fB4Q==
X-Gm-Message-State: APjAAAWIQaUs2VCP9KApacx3KRcQlpD5a5k/+xskw0q/8WCikhhx3GCW
	SA2GDlh5pTgp+BEHI1eULF9sTq1G
X-Google-Smtp-Source: APXvYqy+N6P1SBFlvOj1/opgAaWM8OMyo8AIJLmvgEzI4TjgPR+XczNPEreQqcapfypaUzwKQl+enA==
X-Received: by 2002:a5d:66c1:: with SMTP id k1mr5181757wrw.73.1571938179308;
	Thu, 24 Oct 2019 10:29:39 -0700 (PDT)
Received: from localhost.localdomain ([117.55.204.18])
	by smtp.gmail.com with ESMTPSA id
	p10sm28141824wrx.2.2019.10.24.10.29.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Oct 2019 10:29:38 -0700 (PDT)
From: Alexander Kube <alexander.j.kube@gmail.com>
X-Google-Original-From: Alexander Kube
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2019 21:59:08 +0430
Message-Id: <20191024172908.68056-4-alexander.j.kube@gmail.com>
X-Mailer: git-send-email 2.17.1 (Apple Git-112)
In-Reply-To: <20191024172908.68056-1-alexander.j.kube@gmail.com>
References: <20191024172908.68056-1-alexander.j.kube@gmail.com>
Subject: [PATCH 3/3] Change default GOVERSION to 1.13
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
X-List-Received-Date: Thu, 24 Oct 2019 17:29:39 -0000

From: queue-b <alexander.j.kube@gmail.com>

Signed-off-by: Alexander Kube <alexander.j.kube@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 4a23c50631..c6c4cf7ce0 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -23,7 +23,7 @@ GDBVERSION ?= "8.3%"
 GLIBCVERSION ?= "2.30%"
 LINUXLIBCVERSION ?= "5.2%"
 QEMUVERSION ?= "4.1%"
-GOVERSION ?= "1.12%"
+GOVERSION ?= "1.13%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?= "9.0.0"
-- 
2.17.1 (Apple Git-112)


