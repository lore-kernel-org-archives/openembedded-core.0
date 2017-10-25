Return-Path: <vomegaz@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id C1B4871CBD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 17:55:20 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r196so3444546wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 10:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jHVIGhW7mlGcT0Aip+IM9ze2tg1gdTrZvWRjGEYyo3E=;
	b=EUoNnrxs0sei3dWCdJqFhvC4EtGgn0fBVL3eduMQkbrcwrym2OQoJDd3tBVEx9kQbw
	/AgzQ5V6O54rBui8zfiLbHQSUMGr2Yycgn2Dsh6nsVuTpjea7LBwVHwTqSyhybQwdwRQ
	do6WhUNOlkL2bHrR6J4WKrh2GzGCPrHMwpNMItlmRUy1TprUsCfgps27OpULT/DV0VfM
	orL2ymRyqgxEezkbCrCnq8ojIAlFQghSY+wgphN7jETdNkckhTLWf+I+ONq9xSHcBMdI
	+IPq1buHJtcXUBcws4GkmDsO7aSm4D4z7po+RtwQmGimQ1TO51TUa7v/fBntxRl4YELB
	NfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=jHVIGhW7mlGcT0Aip+IM9ze2tg1gdTrZvWRjGEYyo3E=;
	b=uXaJJ4lUi/Qha8cE/5pge96jwSww/GC4Ljme5HdbOZstiLhpWIAsdyERZbipPp1zzD
	InpaoMCV2ktYYOQjssY7eEKaiCpqJdolaoL2bAMW4cfk3wSG4uMfjinHaBQcWdAnC7t4
	Vb0+qOhZwH6oCbs6NGsjvYkfDjRZTupgR2mi7uqExRxBI2sBb6JYa2E59wjzyeKV+FXo
	QGSXqmvOpCtV/Iob8S6xqjKgJP9OxrPtH6DerjUq+3JWEelrpzU2auHd85syn97FF5A9
	iPNbqA0AH9odd1EXLm2DcUsOIkFDei+mfLPudEKC/maL5fE5lZRIWJHD1/+bZDTlWZhA
	t91A==
X-Gm-Message-State: AMCzsaWm0R283ruzaN4e2uXH4/y8/zJlr2AhFCXi/ziztKV+5VnzB4F6
	wtP9al59qY6U9h5GefH2mTcsVzW3
X-Google-Smtp-Source: ABhQp+SYp08SmxteJlVsSe4n/m1ckARlCKRgn9qtVZdROrxWZPQ3dX1GpNrsU4xeiPFyPMrZVlFatQ==
X-Received: by 10.28.6.6 with SMTP id 6mr2688500wmg.114.1508954121251;
	Wed, 25 Oct 2017 10:55:21 -0700 (PDT)
Received: from sgxcmp483.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id v5sm2634923wme.5.2017.10.25.10.55.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Oct 2017 10:55:20 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Oct 2017 19:55:07 +0200
Message-Id: <20171025175509.32310-2-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171025175509.32310-1-thomas.perrot@tupi.fr>
References: <20171025175509.32310-1-thomas.perrot@tupi.fr>
Subject: [meta][PATCH 2/4] Fix some issues in the fitImage generation
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
X-List-Received-Date: Wed, 25 Oct 2017 17:55:21 -0000

Ignore fitImage type in do_bundle_initramfs task because the packaging is made by do_assemble_fitimage_initramfs

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 meta/classes/kernel.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 756707a3c2..7f8c8985f3 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -208,7 +208,9 @@ do_bundle_initramfs () {
 		# Backing up kernel image relies on its type(regular file or symbolic link)
 		tmp_path=""
 		for type in ${KERNEL_IMAGETYPES} ; do
-			if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
+			if [ "$type" = "fitImage" ] ; then
+				continue
+			elif [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
 				linkpath=`readlink -n ${KERNEL_OUTPUT_DIR}/$type`
 				realpath=`readlink -fn ${KERNEL_OUTPUT_DIR}/$type`
 				mv -f $realpath $realpath.bak
-- 
2.13.6


