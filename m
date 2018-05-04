Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6B3B1749BD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 22:53:03 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id o76so18505182pfi.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 15:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5ngi/+EiE9mqn9vx4rxYbERh1MS0qaa5wD/MP4avl64=;
	b=vYmCW0ARVlQSqw/NQr2JOyx4eTFuCNz3A/gadfrojMBmPt4dVpVpg3LcSXj6QEe815
	FULKQ5Y9149WbwGWbcx6DUVgrrcYuNN43+CjUsLUhchmVe8Iya+rkvshKM/zx68Sd9Vs
	RU3a0C2yb2AYaCP4ZvETTcN85qyXPUEvgtzQ4l6HNPySDYKFCo8SZOWzrweQtJUjC4jR
	OoH4b4670NfE+aQt46osLkjgO82vhK+LdJzwLTfijenU8suYAq0rx6DNug9dlo7CnLOB
	0O8Z09JbNLT3tC33xejm+PWYMUJaDw8Ld/XAwmXpR+PxXD2N+CSJxl/MvhzxcpEuYwes
	B7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5ngi/+EiE9mqn9vx4rxYbERh1MS0qaa5wD/MP4avl64=;
	b=ZJlArukB81oKfxIYwTetyJl+9HiwzOiHwOJMzIz9vNAXRNhrnJ9v2AAcoLWBV1TLRK
	kBbrqSEYZJGjSELKKB1/kRFxChfPWobGWLB9PvwHmSrzvj8hIe5EeyMgq5bqGjPKLEut
	JPiXnYQOVnkayr73jqfSZoUW8VJL9i0GxBHSvd42Fk1IBgZKwk2EoxfNHelxqAq+4xMg
	aGn2bZ94vFHRCgtTKheL5vv+i+FgKLoQN/HWnTgNqCDS6Squ1jLnqI+FIfoe9oxcfvIE
	0UmD1BRYG9lFFFk8TzxW/amIB58blmfKAc77+4s3NKQKto4IzOMXGIya43mSGgwDA858
	H7Tw==
X-Gm-Message-State: ALQs6tDGBt/ToFz9+0xhmsEGH70blQcNj7BThUNdHNObw686VMs5vdRW
	n1e4TWy0MgUmgUMbvowxhjnNVw==
X-Google-Smtp-Source: AB8JxZou1Vwd4hhw+6A2ZENLMRXbW3sDk7rvLgheMLX4H5EkM8cUs+RP4cvyf/yJdhq3+Q8E/Eqe7Q==
X-Received: by 10.98.66.143 with SMTP id h15mr28488734pfd.156.1525474385043;
	Fri, 04 May 2018 15:53:05 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	w26sm41378391pfi.17.2018.05.04.15.53.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 04 May 2018 15:53:04 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 15:52:48 -0700
Message-Id: <1525474370-7913-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1525474370-7913-1-git-send-email-armccurdy@gmail.com>
References: <1525474370-7913-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 6/8] pciutils: move ASNEEDED over-ride into the pciutils recipe
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
X-List-Received-Date: Fri, 04 May 2018 22:53:04 -0000

Move the recipe specific over-ride for ASNEEDED into the recipe to
make it more apparent that the over-ride is being applied (and that
it should be re-checked on version updates, etc).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/as-needed.inc      | 1 -
 meta/recipes-bsp/pciutils/pciutils_3.5.6.bb | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/as-needed.inc b/meta/conf/distro/include/as-needed.inc
index 305e654..c67f2f3 100644
--- a/meta/conf/distro/include/as-needed.inc
+++ b/meta/conf/distro/include/as-needed.inc
@@ -2,7 +2,6 @@
 ASNEEDED = "-Wl,--as-needed"
 
 ASNEEDED_pn-openobex = ""
-ASNEEDED_pn-pciutils = ""
 ASNEEDED_pn-puzzles = ""
 ASNEEDED_pn-rpm = ""
 
diff --git a/meta/recipes-bsp/pciutils/pciutils_3.5.6.bb b/meta/recipes-bsp/pciutils/pciutils_3.5.6.bb
index b18b7da..de974ed 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.5.6.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.5.6.bb
@@ -38,6 +38,8 @@ export MANDIR = "${mandir}"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS= ${PCI_CONF_FLAG}"
 
+ASNEEDED = ""
+
 # The configure script breaks if the HOST variable is set
 HOST[unexport] = "1"
 
-- 
1.9.1


