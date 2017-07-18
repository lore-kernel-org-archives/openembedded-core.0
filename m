Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5AE5977F7D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 10:03:54 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id w198so9469316lff.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Af4UCHMWBbd5drTyUNKUOSmHZoFudipRhJuMWA0zq54=;
	b=XgZ5E7AB+3MUGkJSZ8Uag5+iWJ76m7cRQ8li2j/IlXxfgedd1Y+vkNEtZVeVfVap9E
	fYEH5OTdNjR7eUUnFoVJ7Ma+gNZM76N7AUohuRZ2P1BxnntZEEGUFecUYBZEGDenWOkz
	OpTbiytApJjhiGWUVbYsSVjswb23dn5wbwNXJF2Ryx9fbm6gKfMOt5f1ty/BJ9Y1OdKc
	K9zGrKisVLWktI/QEfMfXx0oHLeUS5345ePtT40hom8z7jSC/VOvfI6YjF89ytYTRZcC
	p2+ThtKZWPvxWaLSeMEYS2eCzZGtRM7GI2vHJhv4Sn6tnmjfkbLiKryd9xGY+s5w4wbX
	eE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Af4UCHMWBbd5drTyUNKUOSmHZoFudipRhJuMWA0zq54=;
	b=Tvp05UdZ4atHMQ5wEylY6wxtile2W42Hebghgy4Y6nlQyAPX+AMqRU7asFmjo3bbtR
	fNIxp/NbyixTFriCgfX5X+0WpxOXQh2cgCpTDXBHyeBUkP/t6eZ4o1sQk3Xrdesc+k/V
	J922JUQBLWIlagMiV7/lgvksvHI86M/t5WO82LLf7nqJ4m83FEScHD0kAO4YytzgWKyw
	YnpRLrt2RW5lEAnETTs8g8meSXskrsRIBV1nkfWM4Ou8dDoOv3eETzc50gj60CuL+6h/
	ZGqnrtRkT/cWDNqzfTyVB848xYPOSf6uTj+KCLiAtZNXrujm5Q3qy18o42hQyQHb2Q3K
	SPig==
X-Gm-Message-State: AIVw110/uw3L+4Opm/vherkkjHxhJZXDHPFg5qp/5DLqDmep43+TUE2R
	TCUr5U/qrp4n3NmtNgQ=
X-Received: by 10.46.87.65 with SMTP id r1mr421074ljd.4.1500372235430;
	Tue, 18 Jul 2017 03:03:55 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id c7sm449171ljd.27.2017.07.18.03.03.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jul 2017 03:03:54 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jul 2017 12:03:52 +0200
Message-Id: <20170718100352.2686-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH] bitbake.conf: Add unzip hosttool
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
X-List-Received-Date: Tue, 18 Jul 2017 10:03:55 -0000

Unzip is required for jar files. Without this patch:
ERROR: junit4-4.3.1-r0 do_unpack: Unpack failure for URL:
'http://downloads.sourceforge.net/junit/junit-4.3.1-src.jar'. Unpack
command
PATH="/var/lib/jenkins/workspace/qt5122-dyspro/build/tmp/sysroots-uninative/x86_64-linux/usr/bin ......."
unzip -q -o '/var/lib/yocto/downloads/junit-4.3.1-src.jar' failed with
return value 127

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9a3aa8bbf29e..35608d0fa787 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -477,7 +477,7 @@ HOSTTOOLS += "ip ping ps scp ssh stty"
 HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"
 
 # Temporary add few more detected in bitbake world
-HOSTTOOLS_NONFATAL += "join nl size yes zcat"
+HOSTTOOLS_NONFATAL += "join nl size unzip yes zcat"
 
 CCACHE ??= ""
 # ccache < 3.1.10 will create CCACHE_DIR on startup even if disabled, and
-- 
2.13.2


