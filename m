Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 867FD6D781
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Dec 2018 11:36:07 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id u3so7657704wrs.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Dec 2018 03:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Yz2fs42r0r7pktEM0+ekAL502b4qFiqsLJ/VVMBkYZE=;
	b=Hh/bfnX12jE+3UKiy+2sEUQCeGCOXCaCNXMrE/tsXLLL2Ai4APqpwRB/pWEaWuQQPm
	pXALXubqlhqkeKFzEcmXHREFn7mbSuxqZ9YrAj8jCQbPdmp4wM1+4WYAZkrZy+5Mi1Eu
	mHM0upUtyFrrF8GsS81o3HcNk+Z9XUeJJ07WQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Yz2fs42r0r7pktEM0+ekAL502b4qFiqsLJ/VVMBkYZE=;
	b=k3kL+Y+Y4nZHAIblJi+zEkhff5bp2m7Ja+d98t6o/OCz6/SOt3+38nxeW5dpUDDeSu
	f1pSseToXnGtqC4dmDKRavEDyhVtnONqIYVdljO5sYHQMPBT+nhomfIkd3KjyZZxWTxK
	CCEE0powq1BtzlsR6If52W+vgMLEiAvkqZN7gteNEKk8JxsIYuz2sg5o5EK1G6+WVq9/
	soNsGTX6Y8BE4tqrCF9DVFmycQ1dc8OAx6bo1GEc/NlQ6BJokuW6WKQC7/PrHFjc7a+a
	r5THgFouvrTq/nBjrsns+iXZ8oDWK1DAhWFcwOOeS8jVawCy/j8o9nDodSATXTjMSCuJ
	33wg==
X-Gm-Message-State: AA+aEWZigQzoW0I09nhaU+FBJqL5ecQhKgkDl6Nd551VBKMao8NwofJU
	5S5AtcfeGcy5bLopHs8n9Pkr40TrkiU=
X-Google-Smtp-Source: AFSGD/WoAQFuU9gVIzccOd+137vDOskx07I8nnBlQQ5zpg6Xq3cho0/tKVzxdDiNijiA9dT95Vk2Qw==
X-Received: by 2002:adf:c505:: with SMTP id q5mr7716458wrf.84.1543664167942;
	Sat, 01 Dec 2018 03:36:07 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n82sm1404662wma.42.2018.12.01.03.36.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Dec 2018 03:36:07 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Dec 2018 11:36:04 +0000
Message-Id: <20181201113604.5212-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] libmodulemd: Extend to nativesdk
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
X-List-Received-Date: Sat, 01 Dec 2018 11:36:07 -0000
Content-Transfer-Encoding: 8bit

Avoids universe fetch warnings:

WARNING: Nothing PROVIDES 'nativesdk-libmodulemd' (but virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-devtools/libdnf/libdnf_0.22.3.bb DEPENDS on or otherwise requires it). Close matches:
WARNING: Nothing RPROVIDES 'nativesdk-libdnf-dev' (but virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-devtools/libdnf/libdnf_0.22.3.bb RDEPENDS on or otherwise requires it)
WARNING: Nothing RPROVIDES 'nativesdk-libdnf' (but virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-devtools/libdnf/libdnf_0.22.3.bb RDEPENDS on or otherwise requires it)
WARNING: Nothing RPROVIDES 'nativesdk-dnf' (but virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-devtools/dnf/dnf_4.0.9.bb RDEPENDS on or otherwise requires it)
WARNING: Nothing RPROVIDES 'nativesdk-dnf-dev' (but virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-devtools/dnf/dnf_4.0.9.bb RDEPENDS on or otherwise requires it)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/libmodulemd/libmodulemd_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index 556478b5b77..d9bfdc0878f 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -18,4 +18,4 @@ EXTRA_OEMESON = "-Ddeveloper_build=false"
 
 DEPENDS += "glib-2.0 libyaml"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.19.1


