Received: from mail-pd0-f173.google.com ([209.85.192.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UL7qJ-0003q5-F2
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 09:05:54 +0100
Received: by mail-pd0-f173.google.com with SMTP id v10so3966877pde.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2013 00:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=ka7Daz8wVwaYc0IFaSH2BCjK6FN35MAqnpSGgGVVhrs=;
	b=yKXWgHJf4e6Y8+bBrIleFGDEGFtEvYHQagIjQ9cuDSST7ReX0QQ52eKO9jkbuVpcFI
	qgNQp/tT5i31kNEfLujQZtHRP+EfCnUbY/4mhyyPRA8yLfx34CdCTVrCWatvVadHbu1Q
	deG0sLdg7+tSIkgD7TxfZwJZfMsIFlq8FNaVZ4sVs71x5s4a2fQdcUG3lUykh5MYBznU
	w+lzBlbJ/N0gTft95SaQnxgjQ6dVmzNpGeCae9Cpi85dkD8dmMTVYJTIiW/uDQfrRLxD
	I8Qnmq/ZdAsV4jBp/l8scKiInF5v/9rvDy9G1hUv+HZ41eCMsqxzgYZArVE+xsNURP8J
	EM8g==
X-Received: by 10.68.125.169 with SMTP id mr9mr33720992pbb.74.1364456928603;
	Thu, 28 Mar 2013 00:48:48 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id yp2sm14316630pab.10.2013.03.28.00.48.47
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Mar 2013 00:48:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Mar 2013 00:48:01 -0700
Message-Id: <cover.1364456659.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] Upgrade systemd to 199
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Mar 2013 08:05:56 -0000

Hi

This patch upgrades to systemd 199. Additionally fix packaging issues seen due to
move of udevadm from usr/bin to /bin upstream

adds missing udev-journald system group

Build and run tested on qemuppc with eglibc/uclibc

  qemuimage-testlib: Capture stderror in the logs as well as stdout (2013-03-27 13:54:06 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/systemd-199
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/systemd-199

Khem Raj (1):
  systemd: Upgrade to 199

 .../0002-readahead-chunk-on-spinning-media.patch   |  142 ++++++++++++++++++++
 .../systemd/systemd/0003-readahead-cleanups.patch  |   86 ++++++++++++
 ...ctl-Handle-missing-etc-sysctl.conf-proper.patch |   33 +++++
 .../systemd/{systemd_198.bb => systemd_199.bb}     |   11 +-
 4 files changed, 268 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-spinning-media.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0003-readahead-cleanups.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch
 rename meta/recipes-core/systemd/{systemd_198.bb => systemd_199.bb} (95%)

-- 
1.7.9.5



