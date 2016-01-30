Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8FEB876DE1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jan 2016 01:39:43 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id gi1so4334552pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 17:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=B+XbNU2NSX0e0+IE83XAAVrd8OzfhVKRc/zgMfala90=;
	b=glCqPpU4V4yX+wa2NZu5q2tbZLPuCw6nSMSkLHPGqd9Um+NjTLbdbZBh4TFTGn9IdF
	oVOHoi6RYfAT+e+SG5UHrS9hFFgMt98QGk65blKKIDlPkwEI6QWnN4pOpb1u9eoIFyYK
	hanZ7cqenIKrariQbWlQgrT0dRL34taBe9WkwfUxZ6Bz0vWDfSAeEOfqYIuxvZf2Cs0M
	o0TXjZ9zFuR6/bX8XtTsku4vxCftfUV03ZiWFYBIXzFpNeIME1QfL5oX7z6bsKY/eC1d
	AifYOyzM4yxktHvo3R6tYsBrlT4BkVLc5BW6z/Sbn6VpsgAXI2Xoz/VTRHQ9Jrp2gMI/
	Vp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=B+XbNU2NSX0e0+IE83XAAVrd8OzfhVKRc/zgMfala90=;
	b=YBBJrEyezjIukJT2xI69bWR+sQJtwkhs5v/317DwW/se01N65fCh7zn6yiFkRMPXtO
	W8rXodxAn4NOiZK5/ih1W4QltoexWQWvGX6stQHDTE77/22CLidLXGVivJXha9oa+tqI
	j4tPEXMQJ8+rbLSaB19eAO70P1ugWcDKCj84y6bX8igOabFwv//V1ZZXi0vECYWx/Upo
	yrZpZQpX/liIWwx3JMjZpZw8nAniiiuyUP701fSGmextlE44t4E0XkxzKRxvZHadfdpE
	0VbCI8zsZ2aIodZULcSWkk+bp3zg/7DICtLxhMs2QwblgsrH/FKmUU3G8ASlUgixjqLt
	1Llg==
X-Gm-Message-State: AG10YORivDSX2uOzISGSFMXg9jUmzSplAGr/U21oiV9tgY+vs4ZBUjLs65xCwyBDtSK7Xg==
X-Received: by 10.66.182.202 with SMTP id eg10mr18466868pac.50.1454117984315; 
	Fri, 29 Jan 2016 17:39:44 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	m70sm26198092pfi.90.2016.01.29.17.39.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 17:39:42 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri, 29 Jan 2016 17:39:35 -0800
Message-Id: <cover.1454117072.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 0/2][jethro] Jethro-next qemu security fixes
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
X-List-Received-Date: Sat, 30 Jan 2016 01:39:45 -0000

From: Armin Kuster <akuster@mvista.com>

please consider these tiff security fixes for the next jethro update

The following changes since commit 0dc553ca2e14940af3093a496aa991d87a13c896:

  openssl: Security fix CVE-2016-0701 (2016-01-29 14:07:48 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/jethro_qemu_sec
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/jethro_qemu_sec

Armin Kuster (2):
  tiff: Security fix CVE-2015-8781
  tiff: Security fix CVE-2015-8784

 .../libtiff/files/CVE-2015-8781.patch              | 196 +++++++++++++++++++++
 .../libtiff/files/CVE-2015-8784.patch              |  73 ++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.4.bb      |   2 +
 3 files changed, 271 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch

-- 
2.3.5


