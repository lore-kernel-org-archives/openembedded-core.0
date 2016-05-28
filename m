Return-Path: <paul.betafive@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 303847325A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2016 13:26:09 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id n129so21904284wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2016 06:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=UD2L8ycU85g2lH5rJX74PwIsoTl+Lmmh4JaSNJBBLng=;
	b=yg/Nl9sU874PP2CAVtUPcYPK0FgUBend4ZiUIRa9gYkcTDZ6eoeahGc1G4R/ZYNZgl
	j49qCPdIKPeZxTNZMwwB4sPyI16kDXiv5wk0igQ2QEGlF1IFTvQs5tQJdGeUglPTBWYo
	rNEQ+UoD07wLFZ8bbE9r+mHfW7PlztDt0RAwYrVDWAtkF9q8K/bik2VwsXFuGIQwVh1P
	di9FTM/sSxY4kaELgKdCwrZoriQbrQmxOJDciXUwCk55DKQDnC2KOdfewPOpulhxiXdX
	aqSscqhpLFyttQf7hjdbnr+DPxbqXu/fTZWmGivosvRJRsDst0jWohgUkhvNI5i3lMhQ
	sbGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=UD2L8ycU85g2lH5rJX74PwIsoTl+Lmmh4JaSNJBBLng=;
	b=fL/0Et6N3LAGQu+JiUmeFg2OdM2YwQA5dR6qiCHQjJXcjK4G1u+d9uZJGJuJ1wa2j7
	J/VKq971zEvC8MrVE2Y8HeO0hzEVH/eM/KnRxl5O9WfDU1G/M4t3crTAXFPqH5TYkRI/
	Z0UG+S7zVSIXf7+CjE2aa0ImYomCS+ZM82khp0UakT592FuRJS/ZB9a8h131YQDHgybz
	QK1+IjvsFwMVMxQ/Ea2kEh+RJjiUWwtkarwaqJl2MFydc+b6XJ60liRN3iHGBssB76Yz
	JE2JzmdwyR6Dsdhgnn7wNuK7NNNrUt71ocfyx0giO9MnsapOsZuXfeAKrFrDTe8wJGmn
	mbdg==
X-Gm-Message-State: ALyK8tK4xnPN0+rf0OoI75C8SjYtGrCoOrHZlGIA3/F33tOpwayBC26jW87rHQPsMkcRUg==
X-Received: by 10.194.32.165 with SMTP id k5mr20859223wji.23.1464441970017;
	Sat, 28 May 2016 06:26:10 -0700 (PDT)
Received: from dev-jessie.betafive.co.uk
	(cpc11-shep11-2-0-cust130.8-3.cable.virginm.net. [86.27.96.131])
	by smtp.gmail.com with ESMTPSA id
	m3sm24386895wjc.27.2016.05.28.06.26.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 28 May 2016 06:26:09 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 May 2016 14:26:14 +0100
Message-Id: <1464441975-10342-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] libarchive: Upgrade to v3.2.0
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
X-List-Received-Date: Sat, 28 May 2016 13:26:11 -0000

I've been playing around with the master branch again and thought I'd update
libarchive whilst I'm looking at things.

Tested by building rootfs and installing extra packages on a qemux86 target as
opkg uses libarchive.

Paul Barker (1):
  libarchive: Upgrade to v3.2.0

 .../0001-Set-xattrs-after-setting-times.patch      |  59 --------
 .../libarchive/libarchive-CVE-2013-0211.patch      |  39 ------
 .../libarchive/libarchive-CVE-2015-2304.patch      | 152 ---------------------
 .../libarchive/libarchive/mkdir.patch              |  45 ------
 .../libarchive/libarchive/pkgconfig.patch          |  25 ----
 .../{libarchive_3.1.2.bb => libarchive_3.2.0.bb}   |  11 +-
 6 files changed, 3 insertions(+), 328 deletions(-)
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Set-xattrs-after-setting-times.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2013-0211.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/libarchive-CVE-2015-2304.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/mkdir.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/pkgconfig.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.1.2.bb => libarchive_3.2.0.bb} (83%)

-- 
2.1.4


