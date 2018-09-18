Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 535CE795E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 15:16:17 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id j192-v6so3296450wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2018 08:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=glFLIQ3XkfrX6hD8CSV0djks2TxNJB8MbTxyCARAjcQ=;
	b=g2EODpDtOThGjQZxorQ46nfPpyRpGxG2tGefUSLqHjFXeHm6yDBsUm9MhGMOmf2iTA
	RfRSuEVoYOVMZIQRC6GcmCTBpB/pVPZyhd56Y0Km+sAjRhcOPEkZ5BHk/bjhyOEPZN/1
	hqpxUuQwUUgM6SKKE7aYdYL+YWQMhXMhmBaJZ3/B42BTIs3bj7o0dOoEcpw/XWOmfN6r
	t5Vx17OguNI8TnwRHmqF9MvI57tmptoVXSg8dS1lfKFuedYU0DYfc4QrcqGO4FPVrCPQ
	tCFrFvO67UZKuuXxXCgIPqo7sCAgKmnhpPnNC40zDGPfBhr9jNu7isG3n/DpNNAxSBqF
	j/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=glFLIQ3XkfrX6hD8CSV0djks2TxNJB8MbTxyCARAjcQ=;
	b=qoQiF6F+j6cpz2Y/CUyL9O1Q0Ukc/mTAYKjljtHU487bFckHw1SP+X5tke9VqtoCtZ
	XKrp1EbZjEHKIlhCXUUCUHXrgR0+raSlaH2RfyG4jztf9UKV+lhkFBAf+Od6wVq8ZnKB
	plxj9aTLvzno8vqidrSxhQO27uXVpZ0BClTzRc4rIw+MzW1JwO8/UNKZ595DH3sl1/uR
	Xti3y466rwPSgMN5tjEbwSki1IDWM6hiLr8Ar+ZZlTuGZFpgTiuD0Y15TDevTOlYUCin
	ei50gvs4DEnRbhOFWLq1bG8EvU+MxcAvyeLsLdxmULZw9hEPM2twp8vFmkdPIT2mRJ80
	iVcA==
X-Gm-Message-State: APzg51AaRuvHvBDM76wZyiMPruTOcYBP53rgbqyIdfHiAFFHGPomD5xI
	9W5y5neo5vdipo2vii1yUp6TQ3Yk
X-Google-Smtp-Source: ANB0Vda5hz+YXAbfMpROn5OVhJ0uBJmE4XrTZ14nQEMc1K3STDoVkRNdo6iwh06q/M4Qxt+0fS8FIw==
X-Received: by 2002:a1c:8406:: with SMTP id
	g6-v6mr15327763wmd.18.1537283777746; 
	Tue, 18 Sep 2018 08:16:17 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18]) by smtp.gmail.com with ESMTPSA id
	142-v6sm1904838wme.35.2018.09.18.08.16.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Sep 2018 08:16:17 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2018 15:15:20 +0000
Message-Id: <1537283723-27429-2-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1537283723-27429-1-git-send-email-alex.kiernan@gmail.com>
References: <1537283723-27429-1-git-send-email-alex.kiernan@gmail.com>
Subject: [PATCH 2/4] kernel-fitimage: Fix dangling symlink to image tree source
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
X-List-Received-Date: Tue, 18 Sep 2018 15:16:17 -0000

When deploying the its file, the target of the symlink is missing the its
extension, add it here.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index a4d7acae40ba..4c4fd99ff4ac 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -490,7 +490,7 @@ kernel_do_deploy_append() {
 	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
 		echo "Copying fit-image.its source file..."
 		install -m 0644 ${B}/fit-image.its ${DEPLOYDIR}/fitImage-its-${KERNEL_FIT_NAME}.its
-		ln -snf fitImage-its-${KERNEL_FIT_NAME} ${DEPLOYDIR}/fitImage-its-${KERNEL_FIT_LINK_NAME}
+		ln -snf fitImage-its-${KERNEL_FIT_NAME}.its ${DEPLOYDIR}/fitImage-its-${KERNEL_FIT_LINK_NAME}
 
 		echo "Copying linux.bin file..."
 		install -m 0644 ${B}/linux.bin ${DEPLOYDIR}/fitImage-linux.bin-${KERNEL_FIT_NAME}.bin
-- 
2.7.4


