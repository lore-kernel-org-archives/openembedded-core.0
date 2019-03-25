Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8CDFF7D123
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 23:44:27 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id bg8so697996plb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 16:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ut424262P/6t+QVoluN4anMkJwQTtpC5Fq/VlMd2BRc=;
	b=Gtfva3tjeHrDPcPxvK8Mlbz680mGgqHE8rMuL2PkcWrvVVW2wigjX1RH1bT2uhmTku
	MnVLdfUFSvgEgXdOn/15z83prGrt25QAsrtF2M7o5mI/RQimY5alOcHrUKJ0h/gSQEtk
	G96mm1svPOQfGjB5ZDszu5RrAqxLJYSzm7XLRdn3Y/Hg+iidlzYWCNIaGkntqdB45oMf
	nDuCEIFOqHfjAlalx+fMkXBP8ai3gqLt6K5V8htcHNSW9Ie24xsS21kcDE/GNl8R24xu
	ZyF8X1/2DpmTnroNKl5KHzJZYm5JFWpSDPH0PqCrWqAfYgH9vg9/gCyaEYP8HQMXsDE8
	ZpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ut424262P/6t+QVoluN4anMkJwQTtpC5Fq/VlMd2BRc=;
	b=QjCW3QHSo7fk2Z5PFKT+gG6POnonFPtCQUdLFKeSRsvrThZ0SpFKVkGq1goJZ6HbdZ
	gpJICXosUdy4WyXuQcoujUXvBY+MTVy8C2Db6zdyq+h6mlsrL8IvIeqFgqyUWmx/vtBs
	O9uRorc35h7H8+oTEDhEARjUe53WQISgo8wVDIcdFpuysjOv/KJGJNcO44Fw9Im2+ube
	CdEgRlUMsITvRZtAPbE8+esYKJn+xImCfn60GGMvlxc1YvWdhQ7/H77EdxIGiQEKFYwj
	zVoQs0vPhNBqck48RCOyQN21aQj8bv1AUzZnPB6M78Y7kykDujoa040ZEltkdFyjH31u
	vBmA==
X-Gm-Message-State: APjAAAUhs+Z0udgNa98v/xHEtTaleh+kZloevUklKBf4MbDgdiy6ncy7
	0wfu7Ajj2dZafrveXqMvdkyUlNTr
X-Google-Smtp-Source: APXvYqwmTGU7NNYwOqZuHVBobeAEQTngjf4kyjCGHajcOxBz7TC5By+4caD63CnHRRSh2GRywQjOSw==
X-Received: by 2002:a17:902:a60c:: with SMTP id
	u12mr26807512plq.301.1553557468676; 
	Mon, 25 Mar 2019 16:44:28 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:3dea:ddac:f0ad:db91])
	by smtp.gmail.com with ESMTPSA id i1sm1393193pgc.63.2019.03.25.16.44.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Mar 2019 16:44:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Mar 2019 16:44:25 -0700
Message-Id: <1553557465-4980-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1553557465-4980-1-git-send-email-akuster808@gmail.com>
References: <1553557465-4980-1-git-send-email-akuster808@gmail.com>
Subject: [thud][PATCH 2/2] yocto-uninative: Update to 2.4
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
X-List-Received-Date: Mon, 25 Mar 2019 23:44:27 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This supports glibc 2.29 which is appearing in distros like Ubuntu 19.04

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 0d484f6..59ccd69 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,9 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.28"
-
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.3/"
-UNINATIVE_CHECKSUM[aarch64] ?= "e495046969c796b7fbbaad1ec86d76eca84d83098f50525b8a4124cc8685eaed"
-UNINATIVE_CHECKSUM[i686] ?= "44253cddbf629082568cea4fff59419106871a0cf81b4845b5d34e7014887b20"
-UNINATIVE_CHECKSUM[x86_64] ?= "c6954563dad3c95608117c6fc328099036c832bbd924ebf5fdccb622fc0a8684"
+UNINATIVE_MAXGLIBCVERSION = "2.29"
 
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.4/"
+UNINATIVE_CHECKSUM[aarch64] ?= "af2e2faf6cf00ff45cc1bcd5e3fb00cee7f79b3ec7c3be15917ad4ff8c154cfe"
+UNINATIVE_CHECKSUM[i686] ?= "fafacfc537a6ce2bd122bd16c146881ab5ac69bd575abf6cb68a0dd33fa70ea2"
+UNINATIVE_CHECKSUM[x86_64] ?= "06f91685b782f2ccfedf3070b3ba0fe4a5ba2f0766dad5c9d1642dccf95accd0"
-- 
2.7.4


