Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id D860D7ED7E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 21:37:32 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id t10so4396896plr.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 14:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/m059dXc8fDN2z+nBFWDFOIcqznE4oa+AvW1VnN/CfU=;
	b=FKC8K1Hgx5x7bLrCm6IobEofucIGwykRxzFi3nDwEvUM9x1G9ijxacaZzOrqQ5/wx/
	HHFd/3WX6ZwYOFcpPpY05KV9QbSz4Ny320ae82gvt6z0MCkUXF1oXs3LTURsQb2gqmKl
	PIgN0D2Kwo5j/zJBiK5zCUkVH/UHeRDXA7mWpqbiJK0aZMWuaLWxlJ0Jb4GZjIgZiElt
	QTSeAvS2snKqBsw7Uo5Lsl4AbGSHJzKVgnv/8Vfeejha/B6XsH+hZn8fblaZFwhiCDiA
	qoVp2tRzK+RjzJyfBGCet+6SqvbDScGasO9CrWU0Ut5vnsPMQhviSTUdvqI0ebz6Yf2p
	nCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/m059dXc8fDN2z+nBFWDFOIcqznE4oa+AvW1VnN/CfU=;
	b=KzDWYTNQffb5grLBvrwPTAi/zj3IgDPKO62a4Q+yEh9r2ftJiqap5n9YyjNbLeEVPn
	qDtOx2Bui7NPqwcRPtjRWkaTd0IgTfEEh915JfcsTmUWuKIXFf4+5zrrjk7uRArqQv9h
	9/G+s5THE3+BNqwZpJNkL49ZULOVXtqXl5qW7QWqRRR3QIHpGbUfL/K/P/tnYI64RISM
	O7NO1a/tAReTmpuJ/gojuAa8rZOZmlZiDYsg38G2ExWBds7iXBQILMqzNflDk6x0+YnU
	mEpxBa9M9fuFsvkZ6+yc1/BBBiLWC2KZDuWbo2VgCRsR652s/oJUweEOKF/IkhaKrGvz
	VKjg==
X-Gm-Message-State: APjAAAVmjzHtqhDgpfrkGG1TaDuMVOYLFdUrnkH/YmXuzpuIwOzg/DAZ
	Zp5kUv5wWSIYuo3XUQVRhx1on9Aa0Y8=
X-Google-Smtp-Source: APXvYqzwMNctng7gbrHaANWgl1yb7lUwjPnLQBcpOj6JakA8amatztu+6HzubARW3d0J3KQrN2Qj+A==
X-Received: by 2002:a17:902:59da:: with SMTP id
	d26mr22541584plj.193.1569879452980; 
	Mon, 30 Sep 2019 14:37:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id k66sm476085pjb.11.2019.09.30.14.37.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Sep 2019 14:37:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Sep 2019 14:37:21 -0700
Message-Id: <20190930213721.3320280-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] layer.conf: Add xserver-nodm-init to SIGGEN_EXCLUDERECIPES_ABISAFE
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
X-List-Received-Date: Mon, 30 Sep 2019 21:37:33 -0000
Content-Transfer-Encoding: 8bit

Found signature differences when same machine is used as a copy
see

ERROR: xscreensaver different signature for task do_package_write_ipk.sigdata between qemux86copy and qemux86
Hash for dependent task x11-common/xserver-nodm-init_3.0.bb:do_packagedata changed from de0944d4fcaeed0efdb143a18cc406bd043469ae291de1704a999bc878a7691c to ba7bdaf35860ba5bf5a5f4ce06379a77c88eb9806e09a1fc5373933888a46507

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 27893b633e..a13c8dc9b2 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -44,6 +44,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   opkg-utils \
   gstreamer1.0-meta-base \
   ca-certificates \
+  xserver-nodm-init \
 "
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
-- 
2.23.0


