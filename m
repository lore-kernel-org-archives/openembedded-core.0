Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q7Bdv-00069f-0Q
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 21:10:23 +0200
Received: by yia13 with SMTP id 13so290548yia.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2011 12:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=2lbYyJ6k7Pe1VJDEdTIXRBIp3OjkSn3+Oc8wrjxqUE8=;
	b=LP+7Yibyk9Z/7jc+ssqhCBrwBVsHei8aWPJ0CfDh4sK4hpnhL+Ygtf6v7DefkOTGOu
	K1kzDRNwjwvCgKUNo62b0QoeaR6+IHLzvWMSK+g/NBt5IrsXBtN0NN39mkr05oid10Fx
	VNWDZrL/UHv/RDObZRwtCl9vJktvHRyQITC28=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=IziBqKEPd6DkbCzU7dfGDbg349bgBgmgF9SIw9tkF+cZBR4DXbyyHIiqvgwSq6lp3Q
	g5nxaBwDxF3Rbgt4YJR869wL7CQEI4QuMgkKhHn83zRw1Ee4IJdJATW4lmgbOi4yUiJB
	IY580O5NkVCvTiWo0wnl6Mdd3x/PxJxOGt3Fk=
Received: by 10.236.62.69 with SMTP id x45mr3577yhc.351.1302030496291;
	Tue, 05 Apr 2011 12:08:16 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id x28sm2974573yhc.81.2011.04.05.12.08.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 12:08:15 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Apr 2011 12:08:04 -0700
Message-Id: <cover.1302030219.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 0/3] Rework the devshell
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
X-List-Received-Date: Tue, 05 Apr 2011 19:10:23 -0000

From: Chris Larson <chris_larson@mentor.com>

- Adds a utility metaclass for maintaining class registries
- Shifts the handling of spawning a terminal into a new 'terminal' python
  module
- Automatically selects an appropriate terminal based on what you have
  available on your machine
- Still allows manual selection, but in a more convenient way, and falls back
  to auto if you select an invalid or unavailable (not installed) terminal
- Improves how we spawn screen:

  - Shows a warning when spawning it, so do_devshell doesn't appear to hang
  - Spawns a named screen session 'devshell', to avoid confusion when the user
    already has other screen sessions running

Pull URL: https://github.com/kergoth/oe-core
  Branch: devshell
  Browse: https://github.com/kergoth/oe-core/commits/devshell

Thanks,
    Chris Larson <chris_larson@mentor.com>
---


Chris Larson (3):
  oe.classutils: add module
  Rework how the devshell functions
  oe.terminal: improve how we spawn screen

 meta/classes/devshell.bbclass |   26 ++++-------
 meta/lib/oe/classutils.py     |   24 +++++++++
 meta/lib/oe/terminal.py       |  105 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 138 insertions(+), 17 deletions(-)
 create mode 100644 meta/lib/oe/classutils.py
 create mode 100644 meta/lib/oe/terminal.py

-- 
1.7.4.1



