Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id BA61475051
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 15:10:42 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p2-v6so1877277wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 08:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=0fROGMLhv108oMrKLj030wxMz0+JH8gV4tinuGkb4W4=;
	b=dTMl50GKHl1O+IWSU1nry2PfhZuWHKU4348Y/ItVmbPVKu+zUK+Qrd//KbLu5Tl7DE
	PNh86mgOqBDmyEHVfpjTr8G+oTaXK7mIw+ACIJV7EnRX/k3xO2S3v93NG0WkSRVlG8+h
	IEFSbpkwK2+L0b8RrOZToG7f+t2iiMVFr36fI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0fROGMLhv108oMrKLj030wxMz0+JH8gV4tinuGkb4W4=;
	b=IkgHyZw93c7lyDaw0/NpQoE102AfjX7owSPJRFab3ZXIzLHe8YlTKaqBEW5mtiuGRe
	VqlrzMPVCPicE16wnacHi+4qFdKk7fzJvMXRlPXz3eXBMvOjHYDYe2BOXc2j1P4h3YKs
	DEUadTl6HTiDoBoBrkVGmXG5n6iJxYq9RD1hEg+Cm3xCyNSIk/fhbjpm7lyUaFlSigqm
	YMCA4O2nShnxoYE6qoKrxkH6SVWuBJdRT+pwo02aUB/Ioak90alTl5KPoFEe3u3jyysX
	gDZLpoTNgsz8y72TVFQdcGpnq+TSPT7hEF471opf9f0Zdo/sGSKTI36bNbiIDc1czO9m
	06Ag==
X-Gm-Message-State: AGRZ1gI0mqPOomoliy2luTK/VHEf9uMzEhSiL2RKMYffhTwUeDTdXqa9
	Ue0OUNTe/elyfsW5693NqnsCbfUw8+M=
X-Google-Smtp-Source: AJdET5egB92XH6/1nW9p0FlC77vfzlrVkIhrKbvUIYyIgQ/gGBGzh5A9Vnf54J7G4Hah69BmZUXDJg==
X-Received: by 2002:a1c:7419:: with SMTP id
	p25-v6mr2218330wmc.85.1540480242781; 
	Thu, 25 Oct 2018 08:10:42 -0700 (PDT)
Received: from hex.event.pylonone.net ([185.7.230.216])
	by smtp.gmail.com with ESMTPSA id
	f7-v6sm8312093wrr.68.2018.10.25.08.10.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Oct 2018 08:10:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Oct 2018 16:10:40 +0100
Message-Id: <20181025151040.18615-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] yocto-uninative: Upgrade to verson 2.3 which includes glibc 2.28
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
X-List-Received-Date: Thu, 25 Oct 2018 15:10:43 -0000

This allows us to handle distros which contain glibc 2.28 such as
Ubuntu 18.10.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 180d4e54baa..c9d502ba4f9 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.27"
+UNINATIVE_MAXGLIBCVERSION = "2.28"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.2/"
-UNINATIVE_CHECKSUM[aarch64] ?= "5c9636d2683dca8b783763b5e52f80f12ac857c0f445cdaa58a8c2370583da77"
-UNINATIVE_CHECKSUM[i686] ?= "036b60092fe4acfa1a321d110673030db20344a2d56f33a4d047f0279498bdad"
-UNINATIVE_CHECKSUM[x86_64] ?= "e3b77208169bf1ac4e89496f3cdbf27695f5b18a2694a908a793390f28b67f83"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.3/"
+UNINATIVE_CHECKSUM[aarch64] ?= "b7fbbaad1ec86d76eca84d83098f50525b8a4124cc8685eaed"
+UNINATIVE_CHECKSUM[i686] ?= "44253cddbf629082568cea4fff59419106871a0cf81b4845b5d34e7014887b20"
+UNINATIVE_CHECKSUM[x86_64] ?= "c6954563dad3c95608117c6fc328099036c832bbd924ebf5fdccb622fc0a8684"
 
-- 
2.17.1


