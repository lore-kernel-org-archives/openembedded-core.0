Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9FB3877E9C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 09:21:46 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id o42so4049741wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 02:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=QDUaQzRb6gF9G/UOtFZapSLip+xQd85UrEX3ts+07WQ=;
	b=Z88pWPE4EkWT11A8iaCZOmc5nG5wTSwRhYtL8lJp7vKDwdbAmJi5AZOADDJ3DTIR5x
	moucZr6kFSu/rfxMKv25QLxwZm1yu1eHvqGKRL28auTI+LbGp3+iuPIYQSW6nORykg71
	nAgrwjmiKnqBSUjTEJjo78lGPRC0tTzmhKUJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QDUaQzRb6gF9G/UOtFZapSLip+xQd85UrEX3ts+07WQ=;
	b=ib3RVoxasW0+QGgtV8OJVmGmNdc7SiP2ylaYANTqtqEWB+3bVlBLvxg4h6yMFDnud6
	oD3WEWeshu+MBTIoBcroYnE4f0Qhe/5d1pQppG951DSToxFbOOOl7rd0OvlWYs0oQtB3
	Si46vC6CMu+nbgVTF/W0DTcrlBp42pcVxDKh1ioEmeSLM97rlKYW6MeProvO+j3ixrpE
	s9ufCZxN1i+PZR4hUm2dNsodx8FLwNTTTbO+Mzsv4uxgGlrjvOF1McM4Yl2YBUFbNQum
	UBFvTxlUAqCFp1kryVLYdVjiKkNcvaVeLidOU+I9tVirRGPaWv2CAKwdkT8Bw7Mh6KGL
	5gSQ==
X-Gm-Message-State: AHPjjUjhAvqWXbWdlwR1J9WC26QjqcfLYJ3q42TvV0WNk167mavrlqiH
	eO4fCcNR5W9my9hw3TorxGWEpIBmMZk=
X-Google-Smtp-Source: AOwi7QCJtG5R+Js6QKVJOC6NsZ3Tj8n6nh/36/PGK7J4D/aZu3+XuVwzuxNF73Is6q3yi94+PjP9IQ==
X-Received: by 10.223.184.250 with SMTP id c55mr1247897wrg.134.1505985707231; 
	Thu, 21 Sep 2017 02:21:47 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	g132sm1103466wmd.5.2017.09.21.02.21.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Sep 2017 02:21:46 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2017 11:21:21 +0200
Message-Id: <20170921092131.25537-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 00/10] gstreamer1.0: upgrade to 1.12.3
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
X-List-Received-Date: Thu, 21 Sep 2017 09:21:47 -0000

A boring upgrade from 1.12.2 to 1.12.3. This is a bugfixes only release,
a couple of patches removed as they made it upstream in the mean time.

Nicolas Dechesne (10):
  gstreamer1.0: upgrade to version 1.12.3
  gstreamer1.0-plugins-base: upgrade to version 1.12.3
  gstreamer1.0-plugins-good: upgrade to version 1.12.3
  gstreamer1.0-plugins-bad: upgrade to version 1.12.3
  gstreamer1.0-plugins-ugly: upgrade to version 1.12.3
  gstreamer1.0-rtsp-server: upgrade to version 1.12.3
  gstreamer1.0-omx: upgrade to version 1.12.3
  gstreamer1.0-libav: upgrade to version 1.12.3
  gstreamer1.0-vaapi: upgrade to version 1.12.3
  gstreamer1.0-python: upgrade to version 1.12.3

 ...ibav_1.12.2.bb => gstreamer1.0-libav_1.12.3.bb} |  4 +-
 ....0-omx_1.12.2.bb => gstreamer1.0-omx_1.12.3.bb} |  4 +-
 ....12.2.bb => gstreamer1.0-plugins-bad_1.12.3.bb} |  4 +-
 ...12.2.bb => gstreamer1.0-plugins-base_1.12.3.bb} |  4 +-
 .../0001-v4l2-Fix-4K-colorimetry.patch             | 48 ---------------
 ...12.2.bb => gstreamer1.0-plugins-good_1.12.3.bb} |  5 +-
 ...12.2.bb => gstreamer1.0-plugins-ugly_1.12.3.bb} |  4 +-
 .../gstreamer/gstreamer1.0-python.inc              |  2 -
 ...hon_1.12.2.bb => gstreamer1.0-python_1.12.3.bb} |  4 +-
 .../gstreamer/gstreamer1.0-rtsp-server_1.12.2.bb   |  6 --
 .../gstreamer/gstreamer1.0-rtsp-server_1.12.3.bb   |  6 ++
 .../gstreamer/gstreamer1.0-vaapi_1.12.2.bb         |  5 --
 .../gstreamer/gstreamer1.0-vaapi_1.12.3.bb         |  5 ++
 ...dd-switches-for-enabling-disabling-libdw-.patch | 70 ----------------------
 ...treamer1.0_1.12.2.bb => gstreamer1.0_1.12.3.bb} |  5 +-
 15 files changed, 27 insertions(+), 149 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.12.2.bb => gstreamer1.0-libav_1.12.3.bb} (88%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.12.2.bb => gstreamer1.0-omx_1.12.3.bb} (69%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.12.2.bb => gstreamer1.0-plugins-bad_1.12.3.bb} (88%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.12.2.bb => gstreamer1.0-plugins-base_1.12.3.bb} (84%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2-Fix-4K-colorimetry.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.12.2.bb => gstreamer1.0-plugins-good_1.12.3.bb} (82%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.12.2.bb => gstreamer1.0-plugins-ugly_1.12.3.bb} (76%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.12.2.bb => gstreamer1.0-python_1.12.3.bb} (57%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.2.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.3.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.2.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.3.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-configure-Add-switches-for-enabling-disabling-libdw-.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.12.2.bb => gstreamer1.0_1.12.3.bb} (59%)

-- 
2.11.0


