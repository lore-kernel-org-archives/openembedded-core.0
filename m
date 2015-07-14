Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 452C965C78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 14:56:42 +0000 (UTC)
Received: by wgjx7 with SMTP id x7so10924976wgj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 07:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rjmGjm5Gb85ILhfmZYNhR12Hgr772Gl/Y4zqjldOfv0=;
	b=HJnAIq/2gNTWYjznSLbpVab+hKcTIjl+pw31hyofmNT0nPV+EUFJ40eZzFcKtMfkga
	rjRTkB3tF8wwY/ZtW1mBCkWz8BVL37tNvUP6J2NYcfEaKMIwMGj5tbU6EuAw8eO6FmGw
	1gxu9ki/J3Ats2GYZd4l1OGjhvKQh6EVHhse1XgPDCIW9GVTaWJyBABqZTTYAlE8u4u8
	171etgQyP9BYVIjEnKZwueiO33vaWaRwlLCeUpPB1hmyCfZjFdQCyrCVytcYMALCN7Tx
	uAjCMES9lNiuKcPFwwtxOFZVL4fcEoyzFbrfPEXWIkpPYoQNMkTy/w9pS/ZTpx1LzuUM
	+IDg==
X-Gm-Message-State: ALoCoQmEmOJnTOvyzLx0TEcOL0Be8CajmLu7fgNwy/zpn5M17+wj+xEVecbcciHEOXgmicQR7Y/9
X-Received: by 10.194.175.65 with SMTP id by1mr84680598wjc.152.1436885802100; 
	Tue, 14 Jul 2015 07:56:42 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	lj14sm3644571wic.18.2015.07.14.07.56.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Jul 2015 07:56:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 15:50:59 +0100
Message-Id: <1436885463-4577-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1436885463-4577-1-git-send-email-ross.burton@intel.com>
References: <1436885463-4577-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/7] qemuwrapper-cross: set S correctly
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
X-List-Received-Date: Tue, 14 Jul 2015 14:56:43 -0000

This recipe doesn't unpack any source, so set S to ${WORKDIR}.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
index 959cd6f..7f4c6d9 100644
--- a/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb
@@ -2,6 +2,8 @@ SUMMARY = "QEMU wrapper script"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
+S = "${WORKDIR}"
+
 inherit qemu
 
 do_install () {
-- 
2.1.4


