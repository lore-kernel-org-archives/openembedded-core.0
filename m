Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9CFF67D434
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 May 2019 20:15:01 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id y19so116580lfy.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 May 2019 13:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sCExBxXfZICgNhNajLW5cKZR+VL5m9qRh3NkNbYbHEA=;
	b=R2iz6hcOaBTRNqS0W0df6voq3TjghItgd5RWLfDL1Oy2BtUpRfBTFBY0evUqQtggYR
	Hqz3CD/4lisQG+sWAUC5BRMclIw1+B8GQ/ltNAbsep7Mn6egLdqIN8X0R1cFxf0zrVrL
	uLj36z+NPTb+9jQZhJp++wo7HcAdMCOTR8Unf97HFHvF+6RkJUbs3t9KoXqw7xpyYb3z
	Yl+50WAFsdAy44t6Op+H47X5yowAToThmxH6XFieOXhU54rcksOJi0WwngLH08E3AmHw
	0xY0wixiwhQ+EK534CMkuz+6PEALo0tuLBBzDHU5KSvRzshUzDO27K3T7UqsVD7lnErN
	pzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sCExBxXfZICgNhNajLW5cKZR+VL5m9qRh3NkNbYbHEA=;
	b=e18BOKTt3zTBFt6sDJBG1r1VyGe72bMNR1aH9VxN5nyiMLpFpW+OB3UV8Vjcvp+mvU
	RDfAQTcSOiWwnJdgEMQ6gVwiQ5qdxAElDNa7p3Gwv4Hfx0AvsC3kh8KX1v+nHtjHSkKO
	YqAPmkFpPQY6atztF674pPdqKglgtth4XM8LCKRuHHeiuw5RequkwUPbVIqPfapXX2xw
	/WnQe2anLmus824Vvvspp6NIcSiMY9Mu30pxwDiJxf5aGZgedqcg7y/AGAJ03uO7wMP1
	ZrmAMbkb2MqTAQn5uyoAX/aqi3++pB3g3+B0J5mju3koJXJW+xGkMTFSF3oGzi6Ms//N
	E7gA==
X-Gm-Message-State: APjAAAX4LPyDRvmj/1KeLO2AJj3EdKaDRKzi12MjJQxYdqna7SakDcpv
	cUdhXYUQcnNipCiBDftP2bdOm6TT
X-Google-Smtp-Source: APXvYqw5qdv2uUY26DDGwlOKbGKP2zHPpoAHOC69acZuhIePNqxZWY73Oln9sNV0sm9XchuajCmDfw==
X-Received: by 2002:ac2:533c:: with SMTP id f28mr774614lfh.81.1557087302011;
	Sun, 05 May 2019 13:15:02 -0700 (PDT)
Received: from peterliu-Precision-M4800.lan
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id s27sm542072lfo.22.2019.05.05.13.15.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 05 May 2019 13:15:01 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 May 2019 22:14:52 +0200
Message-Id: <1557087292-30921-3-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557087292-30921-1-git-send-email-liu.ming50@gmail.com>
References: <1557087292-30921-1-git-send-email-liu.ming50@gmail.com>
Cc: gerard.salvatella@toradex.com, Ming Liu <liu.ming50@gmail.com>,
	luka.pivk@toradex.com, stefan.agner@toradex.com
Subject: [PATCH V2 2/2] libxkbcommon: RDEPENDS on libx11-locale
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
X-List-Received-Date: Sun, 05 May 2019 20:15:01 -0000

From: Ming Liu <liu.ming50@gmail.com>

This fixes a following runtime error:
| xkbcommon: ERROR: couldn't find a Compose file for locale "C"

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb
index 8fcae12..4d31638 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb
@@ -7,6 +7,10 @@ LICENSE = "MIT & MIT-style"
 
 DEPENDS = "util-macros flex-native bison-native"
 
+# Fix a following runtime error:
+# xkbcommon: ERROR: couldn't find a Compose file for locale "C"
+RDEPENDS_${PN} = "libx11-locale"
+
 SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
 
 SRC_URI[md5sum] = "3c4409058dfd203f641a563358e0187d"
-- 
2.7.4


