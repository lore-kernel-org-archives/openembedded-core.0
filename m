Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RHANw-0003FZ-Mu
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 10:23:24 +0200
Received: by bkat8 with SMTP id t8so4820551bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 01:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=WxLV1PZmSeK81NK6PPSwolXNKVi/1kONLrL1O4oKG10=;
	b=mHkSlGy3x4ofHeNItAoWBirUf3kdoRi5Ks1ff6RfSa60lowqQXy0FCsMaaNfhVPM5i
	P/nmBOb8AX6lzUn3Ezxq296Z/T1CoAjyFtAU5O0s2y1+LQUgbxxaiiDUmvXP9Z/n+xih
	S9oDcOJOKfcEMI2l/3RGuBrWedm6huIdPih9A=
Received: by 10.204.140.153 with SMTP id i25mr9987184bku.102.1319185048175;
	Fri, 21 Oct 2011 01:17:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r12sm12526387bkw.5.2011.10.21.01.17.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 01:17:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2011 10:17:19 +0200
Message-Id: <cover.1319184832.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH 0/8] Subversion-1.7.0 and arm/thumb work arounds
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
X-List-Received-Date: Fri, 21 Oct 2011 08:23:24 -0000

Hi,

arm mode was forced without PR bump, because if it was failing for someone he 
will notice.

Be carefull with using subversion-1.7.0 (read the commit message).

Pulseaudio-1.1 was released, so hopefully this work arounds won't be needed
there or they could be resolved better with upgrade.

Regards,

The following changes since commit 99da9a4e65f9dffb04efc3ad60125194c476d6b3:

  distro-tracking-fields: update fields for tzdata and gst-plugins-good (2011-10-20 13:07:16 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull2

Martin Jansa (8):
  pulseaudio-0.9.23: inherit perlnative to work around build on host
    without XML/Parser.pm
  libatomics-ops: force ARM mode
  pulseaudio-0.9.23: force ARM mode
  webkit-gtk: force arm mode to work around binutils segfault
  apr: add native support
  neon: add native support
  apr-util: add native support
  subversion: add 1.7.0 with native support and negative D_P for now

 .../subversion/subversion-1.7.0/libtool2.patch     |   15 ++++++++
 .../subversion/subversion_1.7.0.bb                 |   37 ++++++++++++++++++++
 .../pulseaudio/libatomics-ops_1.2.bb               |    2 +
 .../pulseaudio/pulseaudio_0.9.23.bb                |    3 +-
 meta/recipes-sato/webkit/webkit-gtk_svn.bb         |   17 +++++++++
 meta/recipes-support/apr/apr-util_1.3.12.bb        |    8 ++++
 meta/recipes-support/apr/apr_1.4.5.bb              |    2 +
 meta/recipes-support/neon/neon_0.29.5.bb           |    3 ++
 8 files changed, 86 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.0/libtool2.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion_1.7.0.bb

-- 
1.7.7



