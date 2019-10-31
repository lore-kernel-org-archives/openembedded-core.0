Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8BD5E7F8C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 10:55:22 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c12so870825wml.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 03:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u+xmfLn5oSmPLyjMQ4qjxaQjFxUpZibM+7ZmYgryLq4=;
	b=QA06nlKRI0DN0ajPvlGyLYgXw+ezVzqrOZ6L3so1SV1krdiB2xML/g9nLVj/7VAOYx
	m94beTz25mOVQvJzowbvz5CsamY+wvAsSGujxqb0oM0vclLrf0M6ddc61gFHzSlELhq/
	9URStoZ285QOzR0qiTeuNeRNJ3o4swKF+iBWiERhEGrZRrmCZyfBpBsCyjimmG6dLXfg
	ucgGo+f40929UVych3WeU+tjc2p3H7gwkN7hSwQtiS7lZ6Ti+Y3z0TATIc6OAi6aXlbO
	uGkcDs+fFpdyaYYtmB1T8/c+eDGnABjtjoqRBzaa/Lxh3n6aAFLCaVQRHG826Fmiwh1k
	73vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u+xmfLn5oSmPLyjMQ4qjxaQjFxUpZibM+7ZmYgryLq4=;
	b=k7qZFr5VckU14WJpHpZyHG/SADbyoqQEBP5FBnmTaKbuyKZ8YL2QXaMsPotTxOdQLp
	PH1YWZUxsiPetQXmecpmtKj5m12IgvrEa3E0h8P5JhP6UckEvKuKxJ14Dka7ZQOsod7W
	I1ZHv5abluGbK0DTtYnN1ZbfWlWniB6A/NEvIB/h3Xbyygxiw2QUrdO2TmZgnMA9nVHr
	AwYbOa5yCqUbTpecHBh+KTLQSvrkA2RM7ZC2gmnDuUwSFgMNZV1Tk3fxYiyE+7dWQY3/
	s3tKoZLsOFy8Yi7cDR3tkwSTenN13Yura9op/NBWxXXx1Jd2nSF72Z90AKBXryQvr960
	PhZg==
X-Gm-Message-State: APjAAAXXnYWOv5+Xjkxmu9sM0FUR/cngIoKfS3p+SNCfz0uS2lVch5YL
	vdKHM6lV8Ezvch/WVARN/Lv5Vjyijj0=
X-Google-Smtp-Source: APXvYqxvlKXLRjzpM9OzaBt7jOnwgSPI1Mv6t2bEeXRTGr7uBbSuAvrZt7xDOOTcYvy7/04LqybqMg==
X-Received: by 2002:a7b:cb89:: with SMTP id m9mr2598720wmi.141.1572519322996; 
	Thu, 31 Oct 2019 03:55:22 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id l4sm2836496wml.33.2019.10.31.03.55.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 03:55:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 10:55:12 +0000
Message-Id: <20191031105518.7716-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/7] qemu-helper-native: add missing option to getopt() call
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
X-List-Received-Date: Thu, 31 Oct 2019 10:55:22 -0000
Content-Transfer-Encoding: 8bit

Noticed by -Wall.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/qemu/qemu-helper/tunctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu-helper/tunctl.c b/meta/recipes-devtools/qemu/qemu-helper/tunctl.c
index 16e24a2add6..fc00e997891 100644
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
2.20.1


