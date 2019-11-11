Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 226FC7FA88
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 18:30:15 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id 193so11181124pfc.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=p2qippAzDsbEGIrVESDCMqqabAka+K1mq2+mJYLx3l4=;
	b=CP9VBG0zkwKx0XovDnuP1HLpljiOeeyBn6RAwqqbSZdiEkNo5RQnB1xTtCoZ/ZUbnS
	8VROh2Lrdba17JzRQrKvUc+h9ZOmEYOZ2KjPrzcXZ7tgkBDIRaec1l1ybY1iD6NvB1z6
	+LpUQSfCyIExcsl4NgEupeh7BO6z9BMdt5JfI2relhIdrkOf9Mzr4hDj3ej9OuaGYAVA
	/OelNCT3kmFjbhX2+igTUFQgvl4McVzL+EhTa+bcl2ILwixFRuM0Yt13D6XoBc1mY51M
	l8q+ekDUtP8rHd4oYeyzdQi6k/Tn+std4+fHbEmtLwEzTKUxjehY5qDTxrXoDF6IlAG2
	eF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=p2qippAzDsbEGIrVESDCMqqabAka+K1mq2+mJYLx3l4=;
	b=HyrZpCd4IKhDXWiOw1n0aWTE82p99ZUAjDNRoLXA4B2/qjQIbhczHsIyVJmsEVZNS/
	54QekrgUHu38W0rzNccPjvtx5KaI5JPfFNFc0qmrnzsbyqnibKAqlTuFgsyKV3DynoGf
	gMLdaL9f6bE8C96vWJ+RGxW2sCp7jWDucrVeC4f2uW6o7lNXCNkyOKUxDM+synURWT8B
	QXvCsKyL5AlzleChh8asAq+SxzODT7oLcyCq75txe2UceiBRs/vvjDeKbJjoJYJFSxbV
	nmiririuIMr0kZm1Sucl5GlHGHKfwjuHch+QUbR4Btzv+O7seZuvBHFVJKeQiIT/gFok
	Qv+w==
X-Gm-Message-State: APjAAAXWR9QzHSjLAEiH9Et2ZTAzRSpponk7DJkBOnV38daUcaT17UNS
	NKbLvfDApleFOBlXcdtdhd4AXmcw
X-Google-Smtp-Source: APXvYqx8zC2xgiwAMZdB295TIzCIlHTnrnshGg2vUuH5BMUjkX9kmy+3RxR03TBtAC0rk1Zixgr+wA==
X-Received: by 2002:a63:ec4b:: with SMTP id r11mr29951590pgj.147.1573497016181;
	Mon, 11 Nov 2019 10:30:16 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:604a:b703:29ca:5c7d])
	by smtp.gmail.com with ESMTPSA id
	l62sm17731698pgl.24.2019.11.11.10.30.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 10:30:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 10:29:50 -0800
Message-Id: <7ae318fb4eaa8595c30af68c9df0d6c09116dc4d.1573496794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573496794.git.akuster808@gmail.com>
References: <cover.1573496794.git.akuster808@gmail.com>
Subject: [zeus 08/21] qemu-helper-native: add missing option to getopt() call
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
X-List-Received-Date: Mon, 11 Nov 2019 18:30:15 -0000

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


