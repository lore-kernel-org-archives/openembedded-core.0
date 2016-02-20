Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id A59C16FF04
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 02:53:24 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id j125so24857789oih.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 18:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=B7vjZUPEes7M8TwkKI0eHy0KwnQ6205jQLNi9v1Lq60=;
	b=BVY0qKH3bQ49v6QroEEmloTM9CiblofxWaG6zviADh8MhV4/Ck5ugy3SD5pLFQto5d
	WBlTcv5ThhMQeqOD5uPLbxjyO1blTGHtbXXhcT33SlwdWLe00q6nBWSkY+t1Svlaeuvv
	LYWKl3uez2JoET3c98kpNgR+JXbQCr/nKyunI2oTv+xFURpnqgaVzzSZS04vnh5hoQSd
	ainAjIDoy4+32Va9WvWuvOBnHH6HdR+5IlBUMWidHv5oBUWdzHriZD4wB7DEFQR5ah7a
	n+JGXFpcUvCXuyE08bs6c5mMvkjqG47/CUqyKpsAfLsMhSsX2wiR9Y4m6c/nolEpM0yb
	v2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=B7vjZUPEes7M8TwkKI0eHy0KwnQ6205jQLNi9v1Lq60=;
	b=eSD9FaSsbyLog8MPfbVKeE9u9GCDiqzCxVt2uYG8LRK+VAmAZZ1qm9OgBH7VHFdfwX
	VjoAMs8Zt3nw+BoQwKDBEnAKrcqOm1nw4gQsvDasLNAKk9j4z9gto0da5jwdQaGe84rv
	zCO9E8PpNWA3N916py2pqzqWhot9fH2Ih3+sb/fLSE7G8dsS0pFe6gvMeRg1Zn/549cX
	aS9qxUrjh1bY1jQ71+B8WGHPTZCV2c+NjZQGOwKkjvXstvhjMbD5pzdjmAfFXBwz3HyG
	UBrkgiHhFml6Tud66OC+SPEarEu/CIeHE05+EaF07cwKcsSsq2KJrQXVRjBJP+ZBN03w
	e+YA==
X-Gm-Message-State: AG10YOSOUtT6hgETx+9jMNwCUWAV8YOa7H6bu2BiD3fdYm5fOz84Q+wysalGKIMykoUVUg==
X-Received: by 10.202.86.141 with SMTP id k135mr13898300oib.72.1455936805250; 
	Fri, 19 Feb 2016 18:53:25 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	wh4sm9192764obc.10.2016.02.19.18.53.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 19 Feb 2016 18:53:24 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 18:53:11 -0800
Message-Id: <1455936797-13430-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/6] update gstreamer1.0 git recipes 1.7.1 -> 1.7.2
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
X-List-Received-Date: Sat, 20 Feb 2016 02:53:27 -0000

Minimal testing only (ie it builds OK in my distro and the Qt 5.4
browser demo can still play youtube videos using the libav plugin).

Andre McCurdy (6):
  gstreamer1.0_git: update 1.7.1 -> 1.7.2
  gstreamer1.0-plugins-base_git: update 1.7.1 -> 1.7.2
  gstreamer1.0-plugins-good_git: update 1.7.1 -> 1.7.2
  gstreamer1.0-plugins-bad_git: update 1.7.1 -> 1.7.2
  gstreamer1.0-plugins-ugly_git: update 1.7.1 -> 1.7.2
  gstreamer1.0-libav_git: update 1.7.1 -> 1.7.2

 .../gstreamer/gstreamer1.0-libav_git.bb            | 13 +++---
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |  2 -
 ...valid-sentinels-for-gst_structure_get-etc.patch | 51 +++++++++++++++-------
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb    | 10 +++++
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      | 21 +++++++--
 .../gstreamer/gstreamer1.0-plugins-base_git.bb     | 11 ++---
 ...itialized-warnings-when-compiling-with-Os.patch | 41 -----------------
 .../gstreamer/gstreamer1.0-plugins-good_git.bb     |  8 ++--
 .../gstreamer/gstreamer1.0-plugins-ugly_git.bb     | 23 ++++++++--
 .../gstreamer/gstreamer1.0_git.bb                  | 12 +++--
 10 files changed, 107 insertions(+), 85 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch

-- 
1.9.1


