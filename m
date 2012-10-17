Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1TOUqK-000802-Kk
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 16:43:32 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so683549wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 07:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=dhgAOWd1YKZYbTSyVSwVtWKbKFXGWncvvtudWtarB/0=;
	b=PUwU/NcHGhF8tc0z/MY9ImYyRXjbOR5H5ZEG81Y7sYewpPNrobh0ui7gtIoDvomX8i
	374WdHYONPk1uGgpQEsGYlc9rmmR0NSCPk7PsXFQkNei4t/a99MnHUckc1Q7jnZFKaEg
	irtbi4ijNDx/gnvrxYY42yp7jCEhuvdsjc1E6HVDeoAjsdocMxYTqhBnsTlKaO91GUkV
	DAA6asOeYkXWs6OlWyW73JXP+HbX/vjptYCjb0W2YkNIkP57wY6Zs3b8b4BpBdZGTdRY
	NhjDabiGMgwM53u/wrT4eN615wdFEbE3utXeWXLpVY6Z2ViETky0mgIiCTvObNmtTfBb
	jjhQ==
Received: by 10.180.88.130 with SMTP id bg2mr4504889wib.22.1350484214650;
	Wed, 17 Oct 2012 07:30:14 -0700 (PDT)
Received: from s-stirtzel-linux.zera.local
	(ip-109-91-251-94.unitymediagroup.de. [109.91.251.94])
	by mx.google.com with ESMTPS id fp6sm4508834wib.0.2012.10.17.07.30.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Oct 2012 07:30:13 -0700 (PDT)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2012 16:29:30 +0200
Message-Id: <1350484172-9188-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] gtk-immodules-cache.bbclass
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
X-List-Received-Date: Wed, 17 Oct 2012 14:43:32 -0000

This adds a class for on-screen keyboards to update the GTK inputmethod modules

This will be used by:
openembedded-core/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
meta-openembedded/meta-oe/recipes-support/maliit/maliit-framework_git.bb

Samuel Stirtzel (2):
  gtk-immodules-cache: Add initial class to update gtk inputmethod
    module cache
  matchbox-keyboard: Use gtk-immodules-cache.bbclass

 meta/classes/gtk-immodules-cache.bbclass           |   72 ++++++++++++++++++++
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |   21 ++----
 2 files changed, 76 insertions(+), 17 deletions(-)
 create mode 100644 meta/classes/gtk-immodules-cache.bbclass

-- 
1.7.9.5



