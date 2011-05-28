Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QQ9ZN-000472-HH
	for openembedded-core@lists.openembedded.org;
	Sat, 28 May 2011 04:48:05 +0200
Received: by pvc30 with SMTP id 30so1068165pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 19:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=Crxq7co7PORawOksYRmiqrxQi/FDT1kpNrCv7I053wI=;
	b=PO8sX0hfT/CXqZr0rfYbvL7r+ODKLbX034+0RQivGWrevDt/TIPFpc+PUn36Am9NJJ
	8iyZGR2GCeiXJCG75ajjasBWiSO1u2TuPRyvqSDL9K90zFsOwgOsQ+gWnl0EUiHHZ6TX
	539Q6YTA/aYzIeU9q4YGVozQaIJTcYnM9YOyw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=bIQTMCDbE65fkxo5VzBCdihmeUIIEBaYR5UnTd+/ZX9bXpbuKnHjqfBLfP8p51S+qc
	p85Fjsi6ongb+kvhC6As6T3M4NGcq1R/9CrzsMRKdSr/RP7u+USBaOA06XAlRNhWfYtT
	CD2oRTvowOtTzq4eMULxHoMLxTAQgXW8GwllA=
Received: by 10.68.17.234 with SMTP id r10mr1135829pbd.98.1306550699247;
	Fri, 27 May 2011 19:44:59 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p5sm968551pbd.92.2011.05.27.19.44.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 19:44:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Fri, 27 May 2011 19:44:51 -0700
Message-Id: <cover.1306550616.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/2] misc fixed to compile uclibc in thumb mode and fix prserv
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
X-List-Received-Date: Sat, 28 May 2011 02:48:05 -0000

The following changes since commit ae1ba18f70c0dac5bed376f6677258c33290ce30:

  uclibc: Add disabled COMPILE_IN_THUMB_MODE to uClibc.machine for all ARM configurations (2011-05-27 19:41:33 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/misc-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-fixes

Khem Raj (2):
  uclibc: Add disabled COMPILE_IN_THUMB_MODE to uClibc.machine for all
    ARM configurations
  package.bbclass,prserv.bbclass: Compare USE_PR_SERV with "1" or "0"

 meta/classes/package.bbclass                       |    2 +-
 meta/classes/prserv.bbclass                        |    2 +-
 .../uclibc/uclibc-git/arm/uClibc.machine           |    1 +
 .../uclibc/uclibc-git/armv5te/uClibc.machine       |    1 +
 .../uclibc/uclibc-git/nslu2be/uClibc.machine       |    1 +
 .../uclibc/uclibc-git/qemuarm/uClibc.machine       |    1 +
 6 files changed, 6 insertions(+), 2 deletions(-)

-- 
1.7.4.1



