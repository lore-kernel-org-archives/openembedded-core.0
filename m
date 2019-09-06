Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id D12BE7F35F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 07:23:50 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id i1so4822106wro.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 00:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ol9vogNjTKsxitmrlFrk9z5NRu//uDzA3ACua2RilQc=;
	b=QsV3ThzE/SpucZdgy//+4mwNUEC+kHCUeFEyiPr+D2J00zfXvtcql5eblgPDmheQb8
	nJLACeHQWolOLxmKgdGRQcrhVcR5q7GlXjUoPmSmUCef5gDTcJFzaNaqpNr+UZGQTbYV
	UeGd3tNDuqY0CWtpHHDeECNUAT6rPuRWKLXMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ol9vogNjTKsxitmrlFrk9z5NRu//uDzA3ACua2RilQc=;
	b=nQzl5qYLahegii+ps3Xeie8fpYAjzVOrN8QV4u/drqvUvMZYKge9G/rtgH/E3Vex23
	li96Y5OeGuplq7T2GCE1q0a3DEqfs0ZDmz6He5pBD25FCQzo7Wf5Dbd2KCvxsNpjBEiR
	AIohiYfhPKi9uYf5WACe6bCVY1WIPxpnSLuZWHezxAJNtPnS/YPiTVW0zIZbO28yOWvd
	QLTvEXhQx+HRsBnbrVDd9dePfyHoXkpBiCeLuKap4g5EvJ5BfSto4vIovaJZk3rfoSic
	1HIhcsdoAi8KmTVNeS/A8TgNQTcITgMQhFVEGq/c+lkwdatQ0BIirCL50QoV+MWyRxKX
	OoEw==
X-Gm-Message-State: APjAAAXNQeCyDutrEPevXYhw6OfxerFM55DtBzXZWoJRSUpdd7qsLBHK
	RdLEBQ1IFyCVdQbmozu6Juo4uM/Yd6vP4Q==
X-Google-Smtp-Source: APXvYqzZg2P1hgP/YB3owBAs4+OBsp0EQma9iVvdv2Y98QFM18R1U4MyDvrEk7+U45+3T+rr/ZskGQ==
X-Received: by 2002:a5d:6ac8:: with SMTP id u8mr5805092wrw.104.1567754631078; 
	Fri, 06 Sep 2019 00:23:51 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b15sm4777951wmb.28.2019.09.06.00.23.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 00:23:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2019 08:23:46 +0100
Message-Id: <20190906072347.31616-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] systemtap: Test latest and greatest for 5.2 kernel
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
X-List-Received-Date: Fri, 06 Sep 2019 07:23:51 -0000
Content-Transfer-Encoding: 8bit

Systemtap has issues with the 5.2 kernel which are fixed in master, we helped
debug and submitted some of the patches. Update to a git version which includes
all the fixes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index c5348b3204b..f16f851e610 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,7 +1,7 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "984d6d1696ed06626b07cb65ab55d6ae0ece1131"
-PV = "4.1"
+SRCREV = "a25199c9580b9b66424c494d3bf39c4d1b7e1f7b"
+PV = "4.1+git${SRCPV}"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://configure-allow-to-disable-libvirt.patch \
-- 
2.20.1


