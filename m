Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0yjg-0006Nb-PY
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 18:15:12 +0100
Received: by eaal10 with SMTP id l10so1226829eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 09:06:50 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.34.9 as permitted sender) client-ip=10.213.34.9; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.34.9 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.34.9])
	by 10.213.34.9 with SMTP id j9mr1013767ebd.117.1330103210220 (num_hops
	= 1); Fri, 24 Feb 2012 09:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=sFeim6ulVbJuQMDhCS5Jta/cBwxrbl5Rajk2BaWNfio=;
	b=dhOXKZRuqCz8SiwZlqgt0C3F/bmJ9ZKil9nCitwCCwcYpSHdwW6lRpxqhtmHxOUTQA
	t0XA4+9ty5THOXVlFG88hh8BNZR8wNoO7PncfBcxvJQw3PYZX9QcgL0I1RylbzuPJyda
	Fgk8e+zZNjI5uiKqEwQajy29UZIN+5HrfFDxM=
Received: by 10.213.34.9 with SMTP id j9mr758577ebd.117.1330103210022;
	Fri, 24 Feb 2012 09:06:50 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n52sm20119103eea.5.2012.02.24.09.06.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 09:06:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2012 18:06:41 +0100
Message-Id: <cover.1330102968.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
MIME-Version: 1.0
Subject: [PATCH 0/7] Pending patches - added even more patches
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
X-List-Received-Date: Fri, 24 Feb 2012 17:15:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

First 4 are the same, not resent (will try RP's suggestion for STAGING_DIR* variables first)

sstate.bbclass: improve performance of sstate package creation - updated ' position
shadow-sysroot: disable package creation - new patch discussed on #yocto
gst-plugin-bluetooth: upgrade to 4.98 and add checksums - old one was missing SRC_URI 
  checksums so was failing to build

The following changes since commit d3de5f7308b4a42b809884119a670af5bedde38f:

  psplash: allow building multiple splash executables (2012-02-24 16:44:37 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Eric BENARD (1):
  gdb-cross-canadian: build gdb with python support

Martin Jansa (6):
  bitbake.conf: use weak assignment for BB_CONSOLELOG
  bitbake.conf: introduce SDK_NAME_PREFIX and NATIVESDK_* variables
  gdb-cross-canadian: use NATIVESDK paths as it happens to be here
  sstate.bbclass: improve performance of sstate package creation
  shadow-sysroot: disable package creation
  gst-plugin-bluetooth: upgrade to 4.98 and add checksums

 meta/classes/sstate.bbclass                        |   39 ++++++++------------
 meta/conf/bitbake.conf                             |   16 +++++++-
 ...etooth_4.96.bb => gst-plugin-bluetooth_4.98.bb} |    3 +-
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |   23 +++++++++++-
 .../recipes-devtools/gdb/gdb-cross-canadian_7.4.bb |    2 +-
 .../shadow/shadow-sysroot_4.1.4.3.bb               |    7 +++-
 6 files changed, 61 insertions(+), 29 deletions(-)
 rename meta/recipes-connectivity/bluez/{gst-plugin-bluetooth_4.96.bb => gst-plugin-bluetooth_4.98.bb} (77%)

-- 
1.7.8.4



