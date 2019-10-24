Return-Path: <>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id C6D4D7F7DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 20:18:50 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id p21so2763402wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 13:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fTJRN82AijRXg2GfdQnZDl4SwaJpgEZI9AEaW/FELP0=;
	b=I3cgDnwKrPh3NkQ8yIVtJZGuowwf5snXrGVVmUWq8/fpCfHchpP/oPNwptxfbqwb7Q
	ZfYIrS009XrKvyle9Xyf3gq6Z79gVhCLNEY8OXcC1+6YTly1F71qeFBVkrLUQDUNt7jw
	3JCM0XGXNryfZOzZ9Y5vqT93cnOaVLb8ZYxltV0kx1VBP2RPJaAtcuzxJp03WC+4yGBr
	1KZcqqanWP3IRBbweXWP3i5aBI5wlXpud1J8LGwJD1fJ4aqy/TkYNy9L8AIbpV0p57BY
	BnO2rwrGYrKfwNjM7owbRFAW/M8MVDt5h7BsHMbsUBeMYX403uM9MXunUcUp/vbekv8d
	5gEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fTJRN82AijRXg2GfdQnZDl4SwaJpgEZI9AEaW/FELP0=;
	b=KYVqovsymzvzO6BKFKXm5v4JX/Zkk09X6rqIN7gxkOEAavjMWvueAUX5zc/sJKXQc0
	G1GnhTOR0P7JGlUINLbzn17yyq4JQxwfHuu1EcFp7ImAxEh6Zl0i+ptxOtOm6OOOMKc8
	EtO6yKfkFeWyG3GHKkf207NbSygjPxrNThcJ8MsheUsDBs3xaqa2AX1auuQ/trzu3Vti
	2PDjPifk/HILAxCxOrUjJ4TCvYDhRtimq/NsSTgzPIxu7lEgeOLt/Lm2/sUC84oyhidE
	tlvrH/1enooEfiu+Gl5Df55EbOJwIp8hiVC1oCFo6BuoAMfSLfl5WTQr+vzyDla3iuC1
	MVkw==
X-Gm-Message-State: APjAAAUpffk8fcs9PoF7Bathebs+q7bFmpk77qi7chdLihs1ioTPMayr
	UH0sGKM9lWMyk26qr9rQvu4XlVTm
X-Google-Smtp-Source: APXvYqxcnGQ/eQe0aWl1PLVrYrUNWzSsXfjFAUqYl5/YhEDz84osXVJuMhZOB71zjY2P8/paIwLBgw==
X-Received: by 2002:a1c:67d7:: with SMTP id b206mr165660wmc.68.1571948331291; 
	Thu, 24 Oct 2019 13:18:51 -0700 (PDT)
Received: from localhost.localdomain ([117.55.204.18])
	by smtp.gmail.com with ESMTPSA id 6sm4241641wmd.36.2019.10.24.13.18.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Oct 2019 13:18:50 -0700 (PDT)
From: Alexander Kube <alexander.j.kube@gmail.com>
X-Google-Original-From: Alexander Kube
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 00:48:37 +0430
Message-Id: <20191024201837.71023-3-alexander.j.kube@gmail.com>
X-Mailer: git-send-email 2.17.1 (Apple Git-112)
In-Reply-To: <20191024201837.71023-1-alexander.j.kube@gmail.com>
References: <20191024172908.68056-1-alexander.j.kube@gmail.com>
	<20191024201837.71023-1-alexander.j.kube@gmail.com>
Subject: [PATCH v2 3/3] Change default GOVERSION to 1.13
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
X-List-Received-Date: Thu, 24 Oct 2019 20:18:51 -0000

From: queue-b <alexander.j.kube@gmail.com>

Signed-off-by: Alex Kube <alexander.j.kube@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 4a23c50631..c6c4cf7ce0 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -23,7 +23,7 @@ GDBVERSION ?= "8.3%"
 GLIBCVERSION ?= "2.30%"
 LINUXLIBCVERSION ?= "5.2%"
 QEMUVERSION ?= "4.1%"
-GOVERSION ?= "1.12%"
+GOVERSION ?= "1.13%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?= "9.0.0"
-- 
2.17.1 (Apple Git-112)


