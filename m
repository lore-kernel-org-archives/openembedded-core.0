Return-Path: <>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 26FEF7F9CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 20:38:54 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id q13so22543558wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 13:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fTJRN82AijRXg2GfdQnZDl4SwaJpgEZI9AEaW/FELP0=;
	b=hjm+42jKkkimnG9f9GykCYDnlwYIwAhJb7FdL7IWjqrGiFX5ay0V9I6e50fRJ3iTHy
	QA03AyM3UlmBcFHK5sct5Peb7IluaeNhv5Omg3eniO6Mp4W/iqOqOIqVh573H/1HuqyI
	JKTV+s38JROuv0eSUJhlZsZT/1lJe+rHjsBfHSJDwsUcM0bE3Ikfoo0w5mO9lgQjMsej
	7TMbN/N0ESE2i2iiN32Hop/cd8IXWWNoU+UMPtpHKROfoRLz1RokN0//3ObaKM8505lO
	7xyfnzNWmN3UDeFFmB4kyu7ZuL5aegGC11d7+Vh8QHmGp6NAlQDZFg9IsjBOrF2e7C7y
	D/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fTJRN82AijRXg2GfdQnZDl4SwaJpgEZI9AEaW/FELP0=;
	b=JZC0KLswSSkRvedXr8wHu/32irSU2C3j6c4wPJTE1on0DwuTjFrUhOaptJliwHctR+
	RSP4ZSjEAslsnK+DdRAdsUy0EgAq0x3CKQ1rjgLE7BDHhNK22+DuL+WQoJ5PxC2jTgDY
	0m7TXA2gBIrihl8GGHL7XWF+ENfaG3vAFCB9vw2tcTIhmQvANKIOzno4uzpazacydqxX
	Af6OyA3yJSVVT0LQRaw0/MQHU3YLyUjpLDjDzUYb0fNdVg14G7WAA78Y3B/mW68ZExwX
	MQavQyNTswAquiL0IJKGvRZv+rdUmxAgm/XZfruMTMJawSR3+9wgborhb3ezAiPo6qcU
	oK4Q==
X-Gm-Message-State: APjAAAURzdbr12S5OmQXvHHClwg9kP/7oVMrSgotdJXSOYge6A0pp5CC
	TPtc0Kp0zg7nW6pPfn9dUbGqAy2/
X-Google-Smtp-Source: APXvYqxkojQwVL548970Upxq6YRDWGWTIGUYy/XI8bUwuHU0kGi60bkmpT4S85Z0UR7K0C9EEzdY2w==
X-Received: by 2002:adf:e651:: with SMTP id b17mr5284522wrn.191.1571949534634; 
	Thu, 24 Oct 2019 13:38:54 -0700 (PDT)
Received: from localhost.localdomain ([117.55.204.18])
	by smtp.gmail.com with ESMTPSA id
	x21sm4387178wmj.42.2019.10.24.13.38.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Oct 2019 13:38:54 -0700 (PDT)
From: Alexander Kube <alexander.j.kube@gmail.com>
X-Google-Original-From: Alexander Kube
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 01:08:41 +0430
Message-Id: <20191024203841.71818-3-alexander.j.kube@gmail.com>
X-Mailer: git-send-email 2.17.1 (Apple Git-112)
In-Reply-To: <20191024203841.71818-1-alexander.j.kube@gmail.com>
References: <20191024172908.68056-1-alexander.j.kube@gmail.com>
	<20191024203841.71818-1-alexander.j.kube@gmail.com>
Subject: [PATCH v3 3/3] recipes-devtools/go: Change default GOVERSION to 1.13
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
X-List-Received-Date: Thu, 24 Oct 2019 20:38:54 -0000

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


