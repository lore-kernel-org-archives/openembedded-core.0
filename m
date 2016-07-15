Return-Path: <eu@felipetonello.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8120E606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 16:36:34 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id x83so2814136wma.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 09:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=felipetonello-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=0vHsuYkDJh/DTtLQtHtLFnG21wbqTwFJRw7C/0kM1cY=;
	b=RGhAq32utIZkMizv2UmSrWaWW9QqJUZqVtNTi4zSuyuEkmMeTzQ12loQWB61uUYu6F
	Sgd9LjhWdlQEbkMYUYJL5I01u3QZ4a7bjW4TWvffHO0yfCO5NtA3Lxe06ipCfR3iYrIx
	iAjbGxiQZ38gYSmpL4RI0GM+1WvgmlNI03e5Ik+Sal0NUHoohhHYB9cBQ0i15/UC5sK9
	TMNovE8WI8W68BbSd5FB8LSRsK1X/5t5ZhBfia6/TWr6RF6nIymTaRrw4GrHGHD7qIYM
	shGB5ZVSf/m1Sd9iQ8lykY7hewZ1prYynno+h+8bp1cUG4/Nw1O3X7xwpxPuujJjt2K/
	BMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0vHsuYkDJh/DTtLQtHtLFnG21wbqTwFJRw7C/0kM1cY=;
	b=Ti1lQNajI4KDt2FuuzzfdKj8SsLlF9fxyeDuuujY/Bnj1znMRN1pkGLtaCIE4+sq9C
	MxldB8dej/ntTMS6Qv8Hu70PF+W3KWv8nmqp/NTPYgDY+RSHCGzruybyXbPOT0Gb5pkO
	k1akP3HFzMUQnQbti5RYhbNw8KdArTyx6oVv8dmR3HCsuytVTnhIPX5DYbtzmm2nB59h
	DDx7kbSxWbqoeVq0/w4+QaANhxVvMrKzzZ2MjThF8d4OrHQxEYpIJ90Tn+cqTsCTseO1
	OwF2MepujioRpFdPzKqB77/uFMPvVk7TsxfoMBllejdMVipwCoelrneWXmCMkDlhNI35
	v1RA==
X-Gm-Message-State: ALyK8tKJmBPl+LubRKqK94tty4IB/J4GIpH9YqvR/X7TAnOAl8j9pCFA/KUkKODVg1/yaw==
X-Received: by 10.28.223.9 with SMTP id w9mr22984272wmg.65.1468600594195;
	Fri, 15 Jul 2016 09:36:34 -0700 (PDT)
Received: from localhost.localdomain ([81.145.202.106])
	by smtp.gmail.com with ESMTPSA id
	um3sm1546807wjb.44.2016.07.15.09.36.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jul 2016 09:36:33 -0700 (PDT)
From: "Felipe F. Tonello" <eu@felipetonello.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2016 17:36:31 +0100
Message-Id: <20160715163633.6854-1-eu@felipetonello.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH 0/2] JUCE Framework support for OE
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
X-List-Received-Date: Fri, 15 Jul 2016 16:36:35 -0000

This patchset contains the needed infrastructure needed in order to easily
support JUCE applications on OpenEmbedded.

For more information about JUCE, check the patch #2.

Felipe F. Tonello (2):
  recipes-graphics: Added native and nativesdk support for some
    libraries
  juce: Added support for JUCE framework

 meta/classes/juce.bbclass                          | 37 +++++++++++++++++++
 meta/recipes-devtools/juce/projucer_git.bb         | 41 ++++++++++++++++++++++
 meta/recipes-graphics/freetype/freetype_2.6.3.bb   |  2 +-
 .../recipes-graphics/xorg-lib/libxcursor_1.1.14.bb |  2 +-
 .../recipes-graphics/xorg-lib/libxinerama_1.1.3.bb |  2 ++
 .../xorg-proto/xineramaproto_1.2.1.bb              |  2 ++
 6 files changed, 84 insertions(+), 2 deletions(-)
 create mode 100644 meta/classes/juce.bbclass
 create mode 100644 meta/recipes-devtools/juce/projucer_git.bb

-- 
2.9.0


