Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 73ECF725F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 16:52:08 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id r10so13258231pdi.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 08:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=3MMT0yv/mh552LhZvqpi34nH1h3IZrV6XKO/Xlec0YI=;
	b=pd187iiL3jeu60hjxXkajGUXLRP773mCb5OWcvKOR857G1yn1Dfaw2fD0qk089Nxz/
	quIWDwDAFZT1TOEp7B9sxuhppwp0O3xks3oETwJxqftCaHtFUQcxAikO6NT9N2TBot65
	aGnRHEj2gpZ+2YGdEKz97RyvX/eKvMT3DsTmBZ30W7wtkGIpaQaFbTqzUPskLK8SL+b0
	Klcjv6KikQc4LfpZt7wiIM5i9WOgrjaXqYCkawVQPMUtkB+jRvRpzerciMMlPLURfKk0
	QfEhA/o/nk02/VvPEX9+0u1PkJ0ImoNcQ0lYODmq+Qnvvz18bvRta63NUUXlC7P3NCcQ
	ScHw==
X-Received: by 10.66.164.234 with SMTP id yt10mr69284282pab.110.1419612729045; 
	Fri, 26 Dec 2014 08:52:09 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	sl5sm21453451pbc.45.2014.12.26.08.52.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Dec 2014 08:52:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Dec 2014 08:51:52 -0800
Message-Id: <cover.1419612455.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] Binutils security fixes
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
X-List-Received-Date: Fri, 26 Dec 2014 16:52:17 -0000

Please consider these security fixes for binutils.

patch CVE-2014-8502_1 brought it dependancy patch for CVE-2014-8502.

The following changes since commit c73a6ca2a82ee1961ede453f6c86937ce3695a0a:

  boost : Add the atomic and chrono libraries to the build. (2014-12-25 22:05:43 +0000)

are available in the git repository at:

  http://git.yoctoproject.org/git/poky-contrib akuster/binutils
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/binutils

Armin Kuster (1):
  binutils: several security fixes

 meta/recipes-devtools/binutils/binutils-2.24.inc   |   8 +
 .../binutils/binutils/binutils_CVE-2014-8484.patch |  67 +++
 .../binutils/binutils/binutils_CVE-2014-8485.patch | 102 ++++
 .../binutils/binutils/binutils_CVE-2014-8501.patch |  60 +++
 .../binutils/binutils/binutils_CVE-2014-8502.patch |  89 ++++
 .../binutils/binutils_CVE-2014-8502_1.patch        | 523 +++++++++++++++++++++
 .../binutils/binutils/binutils_CVE-2014-8503.patch |  47 ++
 .../binutils/binutils/binutils_CVE-2014-8504.patch |  75 +++
 .../binutils/binutils/binutils_CVE-2014-8737.patch | 177 +++++++
 9 files changed, 1148 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8484.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8485.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8501.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8502_1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8503.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8504.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils_CVE-2014-8737.patch

-- 
1.9.1


