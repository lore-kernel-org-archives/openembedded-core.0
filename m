Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 634D36010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:44:10 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id e195so1417415oig.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=J/z2+G21FBPoyO6yrsaYpxVb6enlq3TFs481t+8iZcw=;
	b=bbH+xULIbYMPclBT01endrcNWUDYmOxdtADSD551afD3D1p3qTi6/l2cPUcn08//sJ
	s+XwXNR434rnUw7zxddPahyT6oKklXnDktqcCNcTf4DCPv+wmOa2hZxQ1OSy5mDm5Ebd
	0RGcW+XNzlF7VQx3YOjSkzAddp+8FJ4CelUcoiilE2XGhmRfn1+38U3D4d4GpmyVw27w
	xpMuRUxXEjvVKxFbfF5GM7+b5fov3pk/iXwr/3JR9v7OXEFDueAIhbZEWxXbc6N7eRph
	rHGkwN6uZhINUlfzdIAvk2lg9BybvYHFDoTohwyn0GbKRPUfOy+ZAs+jiTwDj+rePfkc
	/Yhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=J/z2+G21FBPoyO6yrsaYpxVb6enlq3TFs481t+8iZcw=;
	b=HG717cBDnfKW1yOfQXwrAXmvmxivkIAUdyenJPTn+cjlEr8TuMzKCncGFXvZAbP902
	xa/EVDO+RyNfuovti/HC18TOKXwZc7UQVYdZD7IxWUvhB7Jl4v7K1waBclz0sIqK+VaV
	3NXFEUdZeUTfo6vANzSZMqsqpaT8WNLdaaQquuShjBNTsSVuzNtt1tk2ekW88AyjuexB
	5au325qZd8iutlZEx2wxnvejFa/nVl7l1ClvRm3wLLRwJ0SolfOy6Jpxbpjyz7sm9nVP
	SpmKr2R3NbTHlWrRRcQOueD3G1qj2RFGk9NT1IeC4d0l+bIaSVOwQF3mbX0laiFv4p49
	3PJA==
X-Gm-Message-State: ALoCoQlDyM3nnkWBLSsH2Nef6nWm9GF0MNqAfX7X0tIviRzTofxV3LEmoiPli9Ts51S1WxZhdWF0SZNPmqs+X2sK1o0HTRZwvQ==
X-Received: by 10.202.85.7 with SMTP id j7mr29905196oib.11.1453344251542;
	Wed, 20 Jan 2016 18:44:11 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.44.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:44:10 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:43:18 -0800
Message-Id: <1453344203-7118-21-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 20/25] gstreamer1.0: update git recipe to 1.7.1
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
X-List-Received-Date: Thu, 21 Jan 2016 02:44:11 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
index f7e2351..4fff533 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
@@ -5,14 +5,19 @@ include gstreamer1.0.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
 
-SRC_URI = "git://anongit.freedesktop.org/gstreamer/gstreamer;branch=master"
+SRC_URI = " \
+    git://anongit.freedesktop.org/gstreamer/gstreamer;name=base \
+    git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
+"
 
-SRCREV = "3b8181a8c550e74acaba4e8c55bdc649fa551dc9"
+PV = "1.7.1+git${SRCPV}"
+
+SRCREV_base = "2a188848eb2af3c3b357978ff7786a78aad9dd55"
+SRCREV_common = "86e46630ed8af8d94796859db550a9c3d89c9f65"
+SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
 
 do_configure_prepend() {
-	cd ${S}
-	./autogen.sh --noconfigure
-	cd ${B}
+	${S}/autogen.sh --noconfigure
 }
-- 
1.9.1


