Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id AA54260BBD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 06:38:23 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id y5so2536925pfb.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2020 22:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sOxPrrAujN5DVlnZRPmsCbaJjyGO7gvZNMd2E3//6b0=;
	b=P3FwWqdwijnGvjdMB9y0kkCWhed0kmHAgOElGAyNNJ1BUL69TQd8AtbBAsHqdo+E4b
	sKRh4z2sdZ+y0DRqlVfT7bAvGE1OH8tlMq4J9x4A/SKRCYzFIJZgntSrJ8n+7RneKdFv
	PsGcU4u8QLKQz5TCwxoV5hT/o/7JNG/wZrgSWthkyVNfsOf4N2AZqeV3R9gc7VscHzOv
	Z9uidvRyGFW0JE1SiTnICTUb+o1KuN206CJD/2XRu7uVYu2YKjML2Fg4zWScf5BLIFgE
	CONmqxb8VrlM9IHI8QPIHkXR2U+nw3Re4922CAnPUvWqafRG4rrZUI1hOCvZKImba+w8
	T70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sOxPrrAujN5DVlnZRPmsCbaJjyGO7gvZNMd2E3//6b0=;
	b=aTKkCrFpDDkyttIipWP8Ze2qzpEXKUuZv/p+rU49h1KRSd64x3vslz1V6GrJc3r585
	XZ3KiXG8aMjmhP5yyb8x1FaanXxrUVLXMYtdnDh65WXcZUY33wYLr7WgMkoY1/LMWX0G
	unblj4dTwwPQZMQCMyLeqxpV97uGN55TTYIos1ROHDXhA+5toffbOSd9uTNrtdbxABeK
	J86d4MsGD4Wl84a//zJFd1SE8Q30vQ4ZcfSiqjYnq54nccTskulCFHMTglBkdhS7ScBz
	o+Kib4z+mxzaXK4fL+hNkvUACv1OfkPHp+D01zaqXxO1sN+isjnvBFjZQvSnvNDSBS+t
	SC5g==
X-Gm-Message-State: APjAAAV2ZQh5dIFTthq1iSiaftr/bKzZ9ebsuFh+KWc45FxKF1+C2FQN
	gQ64k0YJ2Nd+Oct98ehL/s3b/H/p1B4=
X-Google-Smtp-Source: APXvYqwvhK3mj7+e3VZp8SESAM77omjqEhUsKpQYO1BzfpUY/j+dqws8hlBUlBACAtwh3sNhWZ/Y5Q==
X-Received: by 2002:a62:e815:: with SMTP id c21mr12676166pfi.209.1581575904241;
	Wed, 12 Feb 2020 22:38:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c740])
	by smtp.gmail.com with ESMTPSA id
	k63sm1170302pjb.10.2020.02.12.22.38.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 12 Feb 2020 22:38:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2020 22:38:18 -0800
Message-Id: <9bb12593baf723d5b00320c25c0658c77919c304.1581575578.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1581575578.git.raj.khem@gmail.com>
References: <cover.1581575578.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/9] dnf, libdnf: Ignore if PACKAGE_CLASSES does not have rpm
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
X-List-Received-Date: Thu, 13 Feb 2020 06:38:23 -0000
Content-Transfer-Encoding: 8bit

dnf does not work with opkg or dpkg/apt anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/dnf/dnf_4.2.2.bb        | 2 ++
 meta/recipes-devtools/libdnf/libdnf_0.28.1.bb | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
index f38167f1ad..220f1aabbd 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
@@ -84,3 +84,5 @@ SYSTEMD_SERVICE_${PN} = "dnf-makecache.service dnf-makecache.timer \
                          dnf-automatic-notifyonly.service dnf-automatic-notifyonly.timer \
 "
 SYSTEMD_AUTO_ENABLE ?= "disable"
+
+PNBLACKLIST[dnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
index 882c435b32..49afa04812 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
@@ -26,4 +26,5 @@ EXTRA_OECMAKE_append_class-native = " -DWITH_GIR=OFF"
 EXTRA_OECMAKE_append_class-nativesdk = " -DWITH_GIR=OFF"
 
 BBCLASSEXTEND = "native nativesdk"
+PNBLACKLIST[libdnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'does not build correctly without package_rpm in PACKAGE_CLASSES', d)}"
 
-- 
2.25.0


