Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RTI0E-0004r6-NM
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 19:57:02 +0100
Received: by ggnh4 with SMTP id h4so1786538ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 10:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=J+tUbu8rtf4lQLpIF3d3joo4yqWbDP+SxrKX8FN3uJA=;
	b=fIeII57nHcIEX/h0/l5Ga3EIDwiLVnhOl/wiGSS1J6ZlYSGWC0S4jNvfqupGqzwH1l
	vM6uAdgoN/K1KVdTi3IOYinDnmtOxCwDXTgaJj86Cjm8Iv27plTNKOkprpv/HI9fK/Je
	0lmPVenHXyr3NWkvkWFUIh1M6YsMko/PmkPR0=
Received: by 10.236.190.130 with SMTP id e2mr36185970yhn.107.1322074228994;
	Wed, 23 Nov 2011 10:50:28 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id i50sm26371069yhk.11.2011.11.23.10.50.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Nov 2011 10:50:27 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Nov 2011 18:50:19 +0000
Message-Id: <cover.1322074182.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/1] Xorg fix
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
X-List-Received-Date: Wed, 23 Nov 2011 18:57:02 -0000

The following changes since commit b7ffe94a17df389644bc216c56f4b339fcb06362:

  distro_tracking_fields: Update after Manual Check (2011-11-23 16:14:19 +0000)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (1):
  xserver-xorg: only use --disable-dga in xserver-xorg-lite

 .../xorg-xserver/xserver-xorg-1.11.1.inc           |    2 +-
 .../xorg-xserver/xserver-xorg-common.inc           |    1 -
 .../xorg-xserver/xserver-xorg-lite.inc             |    1 +
 3 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.2.5



