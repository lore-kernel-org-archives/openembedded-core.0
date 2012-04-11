Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SHyVy-0004N8-GE
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 16:27:18 +0200
Received: by wgbdr12 with SMTP id dr12so791079wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 07:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=jFQWxlRjrTCoIPI6y6UH1KKVqs/IMLhvty5RYbmEuCk=;
	b=OOHfADz8g/ImlhxqYpxX9F8UTkDnbN7AVV/EdL3B36zSjPHr37cYZv2nzYB28iLJ+z
	4EWVs6X+VSyCIUcZ/eOfxGlwYwAZuE6RWwZhzWPR2R3x1C0pISOfeNsRMFlp92fsl6R0
	jUuTD4ad8tI9mHIyUJ+ghk393XE9+sdmfEIRNQQbBNSdhrBGloLmZxT64WlwVuLfPDzK
	oVjEebLibOngMOVbnyzFy2EWoHQnoainAON04SYdOGvIH8X83JgjJV77Sl0g+8pRdWML
	FYvwmyLQQ//XypQHobNX/vcyG+5Xkc+kojbquvkXKEpMGSYGEDhmJXLIKTCNGhiVr8ER
	D0VA==
Received: by 10.216.139.194 with SMTP id c44mr8929452wej.112.1334153879537;
	Wed, 11 Apr 2012 07:17:59 -0700 (PDT)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id fl2sm10105070wib.2.2012.04.11.07.17.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Apr 2012 07:17:58 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Apr 2012 17:17:52 +0300
Message-Id: <cover.1334153781.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQm5+bTkUx1uy5ZKUdBZSGOgYvf/PUG48AIjcefcRADkR0VEZV5ZnrtTmEYKMGHRXFWTWYP3
Subject: [PATCH 0/1][V2] gdbm: Package compat libs in ${PN}-compat
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
X-List-Received-Date: Wed, 11 Apr 2012 14:27:18 -0000

Thanks to: Martin Jansa

The following changes since commit f720b01586bf19bf6f00d705d0d4a2d2a3786780:

  python: Add patch to avoid warning about sunaudiodev module (2012-04-11 16:53:57 +0300)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib ag/pythonbug2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/pythonbug2

Andrei Gherzan (1):
  gdbm: Activate -enable-libgdbm-compat and add symlinks to headers in
    include/gdbm

 meta/recipes-support/gdbm/gdbm_1.10.bb |   18 +++++++++++++++++-
 1 files changed, 17 insertions(+), 1 deletions(-)

-- 
1.7.5.4



