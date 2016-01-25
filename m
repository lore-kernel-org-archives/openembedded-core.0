Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1CAC86FFC7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 19:35:00 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id n128so7202886pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 11:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=26o5Br1ZxVGVZlPD9XQKrxviMYLg2vCJfjtFE8ANgU4=;
	b=Xjvvutjw2a+7eRVGLuw0XmTCEFw1AscjNf9/AX+9xynYSZJbavBRAf6U22hw3cdYdV
	rgQ2NQa7eahRB97/R9dtd1F7UXRKq3+AwBdflsCUvZpMOOLMECevQlM3i8v+e0Nrbrce
	NH1G8FA0EcqFlwRwq4gS3SIJ0c3SThIvB/oNeW4KV7g/RmYtXV+fW8dwM0VHOOQgBAkE
	J4KHDgleOw2XDlczRCxySF3IvewyJMdmRRtkn+LVowQS8IA9of8UQYb7gp2g9PnamMf7
	C/MxjCgcH6zRaj5yY7r/Etu1L+AAMEn/KaV76Px49Z4tmpd5vd5kbZUiMafQdana/Yq2
	JPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=26o5Br1ZxVGVZlPD9XQKrxviMYLg2vCJfjtFE8ANgU4=;
	b=LHD59y3+R1GlUugNeezglepcr2zvPYwLH7re5nrb6KnTcm1SMnt4o+PjTprU2eflce
	+u/oqtjqYX4S0yxLLk84ak3KJUWzFsKJTJk2lQGX1rVT1RgaF1LPRFKml1WCb/fQwP9/
	g3Gg8l68uXKDUsfyyt/tWBXmJ1gMaWX1jKlSTVlitS+57vlOdOApkZ6eSxEuHmcDp5Z9
	rh1KxH3BEnhu4pyM7A3ZQqhzwXdTiNlq9rxDWJPXucAuNSpYtyzuasjLwgLCgH7VaKIW
	52lLLREETjPEICfQFmKurPxzSURmB3m+BSF5vo0ZHEmm0c7e5LXhfFwcGVJhwLN9ET2h
	4q0g==
X-Gm-Message-State: AG10YOTpxyOiPOAUpFYL1z9VALKxtme9/QdJxqlc8U2uVWlVJzYp6bG4DZBOCVtK5JM22g==
X-Received: by 10.98.72.136 with SMTP id q8mr28604193pfi.86.1453750501634;
	Mon, 25 Jan 2016 11:35:01 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	ry1sm30477015pab.30.2016.01.25.11.34.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 11:34:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 11:34:48 -0800
Message-Id: <cover.1453750404.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 0/4][fido] Glibc security fixes
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
X-List-Received-Date: Mon, 25 Jan 2016 19:35:03 -0000

noticed this did not hit the patchwork. resending.

Please consider these for the next fido update.

The following changes since commit 9845a542a76156adb5aef6fd33ad5bc5777acf64:

  openssh: CVE-2016-077x (2016-01-20 17:08:30 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/fido_glibc_cve_fixes
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/fido_glibc_cve_fixes

Armin Kuster (4):
  glibc: CVE-2015-8777
  glibc: CVE-2015-8779
  glibc: CVE-2015-9761
  glibc: CVE_2015-8776

 meta/recipes-core/glibc/glibc/CVE-2015-8776.patch |  176 +++
 meta/recipes-core/glibc/glibc/CVE-2015-8777.patch |  143 ++
 meta/recipes-core/glibc/glibc/CVE-2015-8779.patch |  282 ++++
 meta/recipes-core/glibc/glibc/CVE-2015-9761.patch | 1452 +++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.21.bb             |    4 +
 5 files changed, 2057 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8776.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8777.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-8779.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2015-9761.patch

-- 
2.3.5


