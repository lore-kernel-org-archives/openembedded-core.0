Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id C1E327318C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 22:05:43 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id f81so2822037iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 14:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=znixZATMugEEV+ty2nlnj0v8+xKQtPYiI38bNDQT+l0=;
	b=sWOhB6eagh4gyLyH4fYc36wunSCsW9Nwy9dW3GMH8bKmpetIK0mFFU0wFVdHVEPjUr
	y6E8TKvPvoJA0HJFk+J27iyZNhJLlc51GoQEPrHgZNWat/ug6pu/uoksbCdVohPNNUlN
	2ToBizkwQoYRC4YLioO4POVnX90+e9ZLbnIJEGRKEwhBLScASCZ8f5JyWHdOMRXs+P53
	LMWFMHUXmVOavvC5d7HAYhGOz7bHHMvRYMR0bUV9X7oGJqPFJpifisMO0CtSPyd84NRM
	XSxAqChZP7NzTr4O73lyoFDAej236fKBVv+Sm9GFtfZhbsWsq7qe3euXBnIn4l6xsakq
	FfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=znixZATMugEEV+ty2nlnj0v8+xKQtPYiI38bNDQT+l0=;
	b=CuobLeEr5RJ9xfD+UfFSyLr2V561RBAuqzv0zmKDf5hTDLRZ+tCu03tZnjs0A/B1V4
	FqPn/0E5x3LS2Mn+8RpZf6cQUXSqCaSjQ4c4DnIolgiwTHv/dE378t104FsLLbtH5Zuw
	Jbg8NbthPJGENPpCtItzK54RWVbrFj/SryEk3ZrWsqdlEYgVV6ctoIn58PaIIvTRLwWI
	/ZRYvUMmkdv858SABnloFuAI8QMFa3a9RD51vIzzHeRhZR5FBa5tYlpdibB+Q8fNEerh
	/9Ms0fAaHbMwfxCvEpkYg70gloV4RzPtLfSTYRLy78sgfIXobs1guCll/1KCzWBCIepc
	6blw==
X-Gm-Message-State: AG10YOR8w9yKR73M9VVzYMBwvltw6u3gyJ06yUKd6EuJnoyI62X2h9qu+HVYnPkMDK7e9A==
X-Received: by 10.107.47.162 with SMTP id v34mr38051407iov.19.1455141944296;
	Wed, 10 Feb 2016 14:05:44 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l78sm895235oib.21.2016.02.10.14.05.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 14:05:42 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 14:05:35 -0800
Message-Id: <1455141937-23225-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] git gst-plugins compiler warning fixes
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
X-List-Received-Date: Wed, 10 Feb 2016 22:05:44 -0000

Andre McCurdy (2):
  gstreamer1.0-plugins-good_git: fix gst_structure_get() compiler warning
  gstreamer1.0-plugins-bad_git: fix gst_structure_get() etc compiler warnings

 ...valid-sentinels-for-gst_structure_get-etc.patch | 67 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_git.bb      |  1 +
 ...sure-valid-sentinel-for-gst_structure_get.patch | 40 +++++++++++++
 .../gstreamer/gstreamer1.0-plugins-good_git.bb     |  1 +
 4 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/ensure-valid-sentinel-for-gst_structure_get.patch

-- 
1.9.1


