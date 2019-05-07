Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF0C7D7AD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 16:17:59 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id z124so6155175lfd.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2019 09:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=YX7GXRYC9VKw3b0h1zC8nagajE8Ior/NxOSfuIpLKGk=;
	b=ULvZ+Q8IhD0bz/JyFdEm1Ht1pZnpl+S1oDsFnxBe7It3FPBLysLcuzPfIk7XCxK1CS
	vIJnUfMptomXin0OOXXc5bOVaOJf1XI6OlHgkMX66YSYlle9oYjPJDlJFv8bQH7GXVvQ
	8bVwVuYzvfTvXpOMNwW+cIjAJOZRRlWlb0FXnFfloEcOC9xICV1T6RZSvNhWq3Hz+YVB
	CXsEIcm5I35LahxfWHJ0QOvn52y0Y8baYRVsaCbn+V3ZKOFxw14kcTmBHuqeXlLXn3kf
	hWutdaEVGs5H356AlbMI0+y8GI5ffuIbNvRvv9i6FscTWOHJZVdoslUMd7J6T35Y+LnT
	cN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YX7GXRYC9VKw3b0h1zC8nagajE8Ior/NxOSfuIpLKGk=;
	b=eN8LPxxgEg5mps7bZt1oRPLlDQlDJtSuyEVG8WAM7nneZBZbLnnaTdHMO6H3RvneXp
	EM/vGS5hKVyMvqmGKRTDzz0webZJrb2md8mf7q4sScUuKcten7MIwfrxXdwFty3ysuL4
	w1MmV20C38kTW3F82pSfxqFoKeibdJS7958FFiwiWfXz1R8Q9u0S1UBlt9ItZKKyp82o
	fts2Rnab0E3RBFnDR6DcU1aOEXGRXHNI31jgTVnTw7EogiXdhMMn4ibmxD48hMuDZwm9
	0nGQ8TcJhE4tRJ5FIy8qqWKggZ42Lg6NbiJZAjo/XyWNV7dgSibSn66Dji0DIbDDB0RO
	qPbw==
X-Gm-Message-State: APjAAAUaRsBmK4VDrZFd1WhoKzgTwIusczz3SK6ipvzc4H7WhHeZFCDr
	+5h9OavvdGEekuHxN/9fIgERschTwnM=
X-Google-Smtp-Source: APXvYqyFbwQJAqFNn20J6pa8ih8Bv84+gfn6vwxI4Yo4NQerC5C6yM0WLvl92S72IRIXTZxIzE3KrA==
X-Received: by 2002:a19:f50e:: with SMTP id j14mr16938603lfb.11.1557245880251; 
	Tue, 07 May 2019 09:18:00 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id 10sm3260596ljv.47.2019.05.07.09.17.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 09:17:59 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2019 18:17:57 +0200
Message-Id: <20190507161757.8105-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] kmscube: update to latest revision
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
X-List-Received-Date: Tue, 07 May 2019 16:18:00 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index b2dd6b30b0..513148f9e0 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -6,7 +6,7 @@ DEPENDS = "virtual/libgles2 virtual/egl libdrm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "d8da3dcfdfe33ee525cf562e928a5266ac69843c"
+SRCREV = "485b385e966a63cecc143765d112d267b299ffe5"
 SRC_URI = "git://anongit.freedesktop.org/mesa/kmscube;branch=master;protocol=git \
     file://detect-gst_bo_map-_unmap-and-use-it-or-avoid-it.patch"
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.17.1


