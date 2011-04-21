Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QD1ZZ-0002LB-9U
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 23:38:01 +0200
Received: by pxi1 with SMTP id 1so93846pxi.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 14:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=/anKTgkjPUbKUZIMxbnznzLDtB9RKFEtwOO5Y9xPLjg=;
	b=hgNdxV6OaaYQsv940qo9VmutJsreQxDIi5pzWM3u+aPrqEycetRKDHx6qB7wqXl9SR
	K14iL4ptRcuOyl0Sm15HtmMQRHF0XwRO0xx0obT1YFswP68cVLcOLXd8O2NVPiIzHCeP
	Zy+WuNTw86vlPHWBPWfQOiha54i6H2UmSYkAk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=KlqrFTDj1mpvWfKMlqzshtUvTucwEiXD+pGCWls5OLUbrTb80PbdktqMVt1/8oj76m
	pB8GpvCzYehoinedLSEYJkUO0nL54kmckm22ZoBtjKnaLMUCRbU6aiIsatzOLf/lx3F8
	PMXMJV7bS37KLgfAmi8M7iNtMugKCaCrrdY3w=
Received: by 10.68.39.105 with SMTP id o9mr626036pbk.45.1303421736445;
	Thu, 21 Apr 2011 14:35:36 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id r10sm1538811pbn.94.2011.04.21.14.35.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 14:35:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Apr 2011 14:35:29 -0700
Message-Id: <cover.1303421567.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH V2 0/1] Upgrade pcmciautils 017 -> 018
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
X-List-Received-Date: Thu, 21 Apr 2011 21:38:01 -0000


Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/pcmciautils
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/pcmciautils

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (1):
  pcmciautils: Upgrade 017 -> 018

 .../pcmciautils-017/version_workaround.patch       |   16 ------------
 .../makefile_fix.patch                             |   25 +++++++++++--------
 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |    1 +
 meta/recipes-bsp/pcmciautils/pcmciautils_017.bb    |   12 ---------
 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb    |   11 ++++++++
 5 files changed, 26 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils-017/version_workaround.patch
 rename meta/recipes-bsp/pcmciautils/{pcmciautils-017 => pcmciautils-018}/makefile_fix.patch (87%)
 delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils_017.bb
 create mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb

-- 
1.7.4.1



