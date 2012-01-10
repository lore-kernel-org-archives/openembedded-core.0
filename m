Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Rkej9-0007Bn-EB
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 17:39:12 +0100
Received: by yenm12 with SMTP id m12so2085631yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 08:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=j1FnHvSbn90xRAqonwhAkplEWFO1qubb6TQqpXZvitQ=;
	b=IduXfuso+mK/mYTea1Po6v6FK73Xmvk2YbjcT4+5UWE3kolO3lKC2+3WTchETQmYaN
	fITifCcKpMuJeZi63YfQmdSuUaHqI/gIFbjtHowcGgKslcnSHCPhY7ilpcPosTse/kMz
	dHtG3NVt2zEHBON045WQkl0s3WBQJXBDgMTHI=
Received: by 10.236.9.106 with SMTP id 70mr27444157yhs.118.1326213102355;
	Tue, 10 Jan 2012 08:31:42 -0800 (PST)
Received: from sb-u1004lts-64bit.alm.mentorg.com (hsvwanfw1-nat.mentorg.com.
	[139.181.24.34])
	by mx.google.com with ESMTPS id j11sm133124022anl.8.2012.01.10.08.31.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Jan 2012 08:31:41 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 10:31:43 -0600
Message-Id: <cover.1326213043.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.8.rc4
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/4] copyleft/license bits
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jan 2012 16:39:13 -0000

From: Christopher Larson <chris_larson@mentor.com>

The following changes since commit fff18970706913e7fd7f4a119d798dddb44b388a:

  base-files: filesystems: fix mount order (2012-01-06 14:41:19 +0000)

are available in the git repository at:
  https://github.com/kergoth/oe-core license-bits

Christopher Larson (4):
      copyleft_compliance: add control of recipe types to include
      copyleft_compliance: add debug message with the reason for exclusion
      oe.license: add is_included convenience function
      oe.license: avoid the need to catch SyntaxError

 meta/classes/copyleft_compliance.bbclass |   56 ++++++++++++++++------------
 meta/lib/oe/license.py                   |   59 ++++++++++++++++++++++++++++--
 meta/lib/test.py                         |    3 ++
 3 files changed, 90 insertions(+), 28 deletions(-)
 create mode 100644 meta/lib/test.py

Christopher Larson (4):
  copyleft_compliance: add control of recipe types to include
  copyleft_compliance: add debug message with the reason for exclusion
  oe.license: add is_included convenience function
  oe.license: avoid the need to catch SyntaxError

 meta/classes/copyleft_compliance.bbclass |   56 ++++++++++++++++------------
 meta/lib/oe/license.py                   |   59 ++++++++++++++++++++++++++++--
 meta/lib/test.py                         |    3 ++
 3 files changed, 90 insertions(+), 28 deletions(-)
 create mode 100644 meta/lib/test.py

-- 
1.7.8.rc4



