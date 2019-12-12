Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id EDA867FB1F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 18:14:56 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id a5so3428111wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 10:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yDZw7GcUODpC8k01rhT+KzX9NZci6coQhYRyFAC9l0I=;
	b=nKfLVzPMsq2sUddE5Jjus3sexBx3s0B9chKrWqoScqks7Yg2cPak3/UjLpaQYMILSU
	S5/QOtomqpjnPX/moPMY1v6ha8TDW4jZpdZfdQa2i3c+25jCoZpRoGcqNL4m5eyLcDvE
	hUy1N8pUO6d7Eza+8hWIYilfqfgobtyHct2Bwy2FRPeHOKpRlcUmhdF0AhOsC+dpMmEb
	XDYS94zO38uiqPzkyu6keojjvWQMQCLuWTMWnkIoOyM1+P1pLwXgT74mvXNQb0DkHvgG
	4n61Oh5br3pqWXXafRW0TiFyLYygPiGlmUjrttMv10yN/l0cIujl2WAQvM4tp4bI9Bmm
	HV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yDZw7GcUODpC8k01rhT+KzX9NZci6coQhYRyFAC9l0I=;
	b=H44/bKYEIWlFydG+rrOglha3sDIJylLs8mrJoV36h2fYFgoT2ZS0Vu6v1W1OzFa11u
	UQ0e8qlaN66AALgLzC+0rme2PVTB47QiKE+dlx8xozzkyS2UYNqgkP4X2hUcdYUtEDLM
	O2OM4C2kq3FmIqt9ZajfBXOoQ3JNDa9h1FbGK+sCVxdrJdt1Am1TAVxZyH8fB6mZXuxV
	Z9mOxAZvL/f51WseiyaYBlwaldUhRTGfMfVsZToj5hzH+tenS2DO7CIxp67kv6pi5Smx
	bohxETUgKQPtjftOm7f2EDqriq16MV3bCdg7gJSFWcyK8cOSTynOKpb5jbiKEPzntq2U
	1lAw==
X-Gm-Message-State: APjAAAX4imrl8msA2eUab0HlJ1Zf4CepErtDIqtAxHiHUfv0P9JpzTP8
	hRiyFcpa0eS32g7RujQRlZIJGJmY
X-Google-Smtp-Source: APXvYqwXifYiCDmggNbKsaMsJcc2EBV/sTCdYiqovqSX1rT0puAMTc00uvvGvfYdJzXTYqAGJjZDSw==
X-Received: by 2002:a05:600c:1:: with SMTP id g1mr7804166wmc.131.1576174497411;
	Thu, 12 Dec 2019 10:14:57 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o66sm3147571wmo.20.2019.12.12.10.14.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 10:14:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 19:14:20 +0100
Message-Id: <20191212181436.1322-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212181436.1322-1-alex.kanavin@gmail.com>
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
Subject: [PATCH 14/30] glide: update to 0.13.3
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
X-List-Received-Date: Thu, 12 Dec 2019 18:14:57 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-devtools/glide/{glide_0.13.2.bb => glide_0.13.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/glide/{glide_0.13.2.bb => glide_0.13.3.bb} (98%)

diff --git a/meta/recipes-devtools/glide/glide_0.13.2.bb b/meta/recipes-devtools/glide/glide_0.13.3.bb
similarity index 98%
rename from meta/recipes-devtools/glide/glide_0.13.2.bb
rename to meta/recipes-devtools/glide/glide_0.13.3.bb
index 7faaf4a3888..ebad0ec60a0 100644
--- a/meta/recipes-devtools/glide/glide_0.13.2.bb
+++ b/meta/recipes-devtools/glide/glide_0.13.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=54905cf894f8cc416a92f4fc
 
 GO_IMPORT = "github.com/Masterminds/glide"
 SRC_URI = "git://${GO_IMPORT}"
-SRCREV = "9ef6ca313b3200079861f2de4e567b1d22081d19"
+SRCREV = "8ed5b9292379d86c39592a7e6a58eb9c903877cf"
 
 inherit go
 
-- 
2.17.1


