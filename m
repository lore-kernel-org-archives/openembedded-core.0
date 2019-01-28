Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id C97BA7C474
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:47:10 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id m22so13826127wml.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 04:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ivjJniFb/wwbQgAX9KhfCtrW1dG8QEVlcZ7AHXCeDX0=;
	b=Ysp2MJN8bUDlt6He72KKyo46d+T2BB44gHywAPRIuIQzk012POcBAUT1fv6mzNqRrl
	0GCZkIX3CY9MIjMDMEnKO0HweFBt/x9G4rN7M5aucczhqnv68SabqDEgIPIGH++K1EKZ
	Yg3nHHRk+1lGjQ+MbQvaKJeqpVwgCqzKgWWdW3sNdkqZrZndWTBrpDNxRvPTr/dGbKpb
	GCAtP1AzzB0YE78UrxDgsBbnEojbJIRrZu3UXnbj/U/Poda7p62hMeC0ZawR/BGgGPsv
	tqOejCm1yOEl22MK7CZR/J7AXCWW9OnMMw0GRTsJdaLdkaKGA69UqnfFGbRNanOuEv0O
	1z/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ivjJniFb/wwbQgAX9KhfCtrW1dG8QEVlcZ7AHXCeDX0=;
	b=IQQINq5bVupphcZV8qhtbCQy/Q3oEd1sWLeZybx06/vXY7UVObHlpzgVgTpZIFzCQ4
	CeorQIHOrn8nAqNqqy6YtzxHU0C2l7fWGarxtK8GsT7WSU/fOtMI80a0jkHlm5vBlBba
	SYhSrmzm56Dc7dPq3GnN744LkysJkRmySG0ckL7sov7jG22xREA3q/LNFH4Cuv8FMSSs
	0//xDBLOMrpFsa84G23Xn7yZiKZDcV5wpEFHYhR6MWugvMNOnXPXtc5uu0iTcxis9Q9/
	gd0k4fdMpj0TrDVa/+i7Iv5eHQ4yTJnk3aDd5njO7KSK/lPIM6VBoiJFrm8Xn3r0ki0h
	yHPA==
X-Gm-Message-State: AJcUukf3kkXR6VeVbkg5Qytvqo9gc4VQB8BuvQ7kM8JYFZ4Hio8065Gd
	k9q7QnBTSNWdLGCBvS3C2SLlfTE9
X-Google-Smtp-Source: ALg8bN7s1WYLB1c10S7hDyOGMZXT8bmrAn6o9OShSV9CQA4ZJli2PuIKXQyiEsn8oJW/hoC2aWc//w==
X-Received: by 2002:a1c:df46:: with SMTP id w67mr17442055wmg.51.1548679631429; 
	Mon, 28 Jan 2019 04:47:11 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm186026218wre.91.2019.01.28.04.47.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 04:47:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:46:35 +0100
Message-Id: <aeae1623b4c7cd5ef91ab3865a6a185fa3d45b63.1548679462.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548679462.git.alex.kanavin@gmail.com>
References: <cover.1548679462.git.alex.kanavin@gmail.com>
Subject: [PATCH 04/24] pixbufcache.bbclass: remove a dependency loop introduced by enabling gtk+3-native
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
X-List-Received-Date: Mon, 28 Jan 2019 12:47:11 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/pixbufcache.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index 3378ff2c806..fb50cd49659 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -3,7 +3,7 @@
 # packages.
 #
 
-DEPENDS += "qemu-native"
+DEPENDS_append_class-target = " qemu-native"
 inherit qemu
 
 PIXBUF_PACKAGES ??= "${PN}"
-- 
2.17.1


