Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3425B7FCDB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 16:18:51 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id bb5so4554408plb.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 08:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=d583mcwyno4Z9tOJHndA5WRA/xEMzGjZeuq5KxT+LnA=;
	b=vCojz+pbiEvy4yFwhlTh1s8aaOcwImXI9nndZTUYpSZ0FoRR39ZBlcFJstmOX7vy5W
	55ug4W+czBEo2KphYn0EXRF6OZ92akZycxSW6RLcDQMccfp+oxbP+eOI1LxzlRBrT/2Q
	Oc7XHXKt4NGbGy8QHwwT9EFEU03NrQH7QHMnpi7dtQAudthdbHe5+P2mHHkTXCgajSCj
	32Zi3UZgPUHpvx3801UI87eI91aewhkVaREAAVElDrJg3hOX9qNcd/elopBy/HQ2Debm
	E9na/58O9JVweR9siLaBLrUI3X6jUEY0/JJARAQmb47QSqxmN98M4VQPuqhGlVq2zD0r
	R95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=d583mcwyno4Z9tOJHndA5WRA/xEMzGjZeuq5KxT+LnA=;
	b=BzJq0m9L8TCfruAy5d2BN4TFwWp647Ch4sSuOz/CgBUy/ajEySnSQWlgyHvw3C+5I9
	JH7TJbHG3mRfuLPbg/D4SEI/ppFWYtH4uCe1wDzsLyFv4vywzeVBs9K1zhuHKm5XlNyy
	uAQMj508kEVDN8sFNJxtOVB1mJtiS6ZjN86HO/IDQwN38TzcC9LoX7L7OxfyIOpF1zMZ
	NP74rKqZBciooEXDfx/1CNsAGVmuz2FIyni3jO98nGzPMOzFi6zGDC9sJxS+fNX/5Zem
	DX5QZhz8eA9Cuy+T/ukr6ffgD8K2vyIgSMUrRpXTsY/hUEmlVk3+Vq1yea6qnsQpdk9O
	NByw==
X-Gm-Message-State: APjAAAVJw0dCo4IvGskDrXoJ0eRUBNhJ1+tp5QIDoXdcQBWHPm0/m2lw
	FVNfkgCMe3KedoQwJ9sjD1o42Yqx
X-Google-Smtp-Source: APXvYqyHLgdN0dMGiGA7L5uKsixPhFX92bZXV9SpOwzsv1FT1mJ6lds+gZECRcPCPFsWpoooQ2eqzg==
X-Received: by 2002:a17:902:b681:: with SMTP id
	c1mr19641585pls.202.1574525932132; 
	Sat, 23 Nov 2019 08:18:52 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:d5a1:4623:137e:d439])
	by smtp.gmail.com with ESMTPSA id u7sm2647804pjx.19.2019.11.23.08.18.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Nov 2019 08:18:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2019 08:18:43 -0800
Message-Id: <1574525924-20765-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574525924-20765-1-git-send-email-akuster808@gmail.com>
References: <1574525924-20765-1-git-send-email-akuster808@gmail.com>
Subject: [zeus][PATCH 6/7] cairo: the component is dual licensed
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
X-List-Received-Date: Sat, 23 Nov 2019 16:18:51 -0000

From: Alexander Kanavin <alex.kanavin@gmail.com>

Somehow, over the years, no one noticed that cairo does in fact
offer a choice between mpl and lgpl, but the COPYING makes it clear:

https://gitlab.freedesktop.org/cairo/cairo/blob/1.16/COPYING

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/cairo/cairo_1.16.0.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index f32e9ba..e3de3f6 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -10,12 +10,12 @@ HOMEPAGE = "http://cairographics.org"
 BUGTRACKER = "http://bugs.freedesktop.org"
 SECTION = "libs"
 
-LICENSE = "MPL-1.1 & LGPLv2.1 & GPLv3+"
-LICENSE_${PN} = "MPL-1.1 & LGPLv2.1"
-LICENSE_${PN}-dev = "MPL-1.1 & LGPLv2.1"
-LICENSE_${PN}-doc = "MPL-1.1 & LGPLv2.1"
-LICENSE_${PN}-gobject = "MPL-1.1 & LGPLv2.1"
-LICENSE_${PN}-script-interpreter = "MPL-1.1 & LGPLv2.1"
+LICENSE = "(MPL-1.1 | LGPLv2.1) & GPLv3+"
+LICENSE_${PN} = "MPL-1.1 | LGPLv2.1"
+LICENSE_${PN}-dev = "MPL-1.1 | LGPLv2.1"
+LICENSE_${PN}-doc = "MPL-1.1 | LGPLv2.1"
+LICENSE_${PN}-gobject = "MPL-1.1 | LGPLv2.1"
+LICENSE_${PN}-script-interpreter = "MPL-1.1 | LGPLv2.1"
 LICENSE_${PN}-perf-utils = "GPLv3+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
-- 
2.7.4


