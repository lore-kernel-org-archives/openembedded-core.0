Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6BC317F81C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:42 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id c184so1910718pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=p2qippAzDsbEGIrVESDCMqqabAka+K1mq2+mJYLx3l4=;
	b=gm2zKsIyK6yRyyiRF027RsbPiM8hjiZfIvME4dGT2M77q8NYAellDm8LoCUwr8WlK5
	Lz0FwLiRE+X29T1vrt5H+qwVGeEVHcVrobA6adjkzWKYRUuB5SO/CaqBCBGprQn8AN5q
	coRVKPDLDdhQVGPn0k+jz325Xrw7h7imZF9VPt/62/6USRvx84BzSgVU4inw/mNyNP74
	fC5+BOQrEznejczOOj3DZM71hOyFUMxSBys8Xs4j/7G48g3nuObdwnN31JC2Gg6qDnBj
	VB7Ru/MfKC8a7+5AEDXVSiDs7C/k7MRsiulDcoSTQONyS6YrrwukyFwHXZt1p2uc1zIA
	Rarg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=p2qippAzDsbEGIrVESDCMqqabAka+K1mq2+mJYLx3l4=;
	b=otK3Gz9z6/f78OSsADVfajiKHGv/LelfxrcWsscnGVNLQPoVCBX6JtmOb64G36JHhm
	juOt6MTbNi9jGMmQney5qsLEn2oKIC/bhh6XZdwG9VeczvZ1fsMDgiWj2NHCDMubIiKL
	hwq/HKvXF/4ecDCIplqGqeM5/0VKgj7UN29vgRVJE8oivyMh+ITyzspevr+7BLZS3ywE
	bUUdM7Q42tJyM5/9jRgy8nikDTnPTVUmiCK2y8W5JIL55vLzPn+W5ZxxQuHbQoJnPMdL
	W5naN/ibAW12NWVgCLVKft4RnAk2IEoRNZRm2mDd4KjumFUbXQ6pWdwBH0SWfgGkMPu2
	7SLg==
X-Gm-Message-State: APjAAAU0MzeeU4Brp8fGI6cBNcu9O5jpbp5Y5fR5Nn/Ja+6qrPK1Wwfx
	t8Yz/XoVXNFGNUZfbsybgFJZoIrd
X-Google-Smtp-Source: APXvYqzN15t5kYlvHenloRGezxytmPN5n3wfejJ+mnqz7egCwDb6dSkUsI+2Mu5ER+Qw6qbkNnJVRQ==
X-Received: by 2002:a17:90a:2470:: with SMTP id
	h103mr5979555pje.12.1573659163315; 
	Wed, 13 Nov 2019 07:32:43 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:32:00 -0800
Message-Id: <7ae318fb4eaa8595c30af68c9df0d6c09116dc4d.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 18/31] qemu-helper-native: add missing option to getopt() call
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:42 -0000

From: Ross Burton <ross.burton@intel.com>

Noticed by -Wall.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/qemu/qemu-helper/tunctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu-helper/tunctl.c b/meta/recipes-devtools/qemu/qemu-helper/tunctl.c
index 16e24a2..fc00e99 100644
--- a/meta/recipes-devtools/qemu/qemu-helper/tunctl.c
+++ b/meta/recipes-devtools/qemu/qemu-helper/tunctl.c
@@ -41,7 +41,7 @@ int main(int argc, char **argv)
   int tap_fd, opt, delete = 0, brief = 0;
   char *tun = "", *file = "/dev/net/tun", *name = argv[0], *end;
 
-  while((opt = getopt(argc, argv, "bd:f:t:u:g:")) > 0){
+  while((opt = getopt(argc, argv, "bd:f:t:u:g:h")) > 0){
     switch(opt) {
       case 'b':
         brief = 1;
-- 
2.7.4


