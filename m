Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QqqpP-0003UZ-1m
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 20:14:59 +0200
Received: by pzk2 with SMTP id 2so479520pzk.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2011 11:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	bh=1fbUvdY4VKE+Cp8LEg1RUT2A4hpK2txpm7u/aK+wR3I=;
	b=Eqo5NrmAuKmBRa3+zfl3RfIkDFmK1puH/2dCnPt+PELf5jVy8UVJo7t4PNoqIaVlSD
	qcupmLjmR4pEWdF6YovZ9/oLdTTSFZp1TU+HrXer1YndGGQr2RfukZ+E2gpv1cka6Ldy
	NK9mYLH3Ub4FSQmRtve6eZXzgvhS3q4nV5Oyc=
Received: by 10.142.152.3 with SMTP id z3mr6938467wfd.93.1312913428136;
	Tue, 09 Aug 2011 11:10:28 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id e6sm148739pbm.71.2011.08.09.11.10.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Aug 2011 11:10:26 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2011 11:05:58 -0700
Message-Id: <cover.1312903901.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH(v3) 0/2] Rework the devshell
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
X-List-Received-Date: Tue, 09 Aug 2011 18:14:59 -0000

This version addresses the issue brought up by Richard regarding unconditional
export of variables resulting in checksum changes. This exports the required
variables specifically within the subprocess for the terminal.

A future patch will alter things like the patch resolver to use this.

The following changes since commit ced947e989dfbca8055fe57e14207cb6f1357430:

  qemu: Poke more paths for presence of libgl (2011-08-09 15:21:06 +0100)

are available in the git repository at:
  git://github.com/kergoth/oe-core devshell

go here for github's branch comparison interface:
  https://github.com/kergoth/oe-core/compare/master...devshell

Chris Larson (2):
      Rework how the devshell functions
      oe.terminal: improve how we spawn screen

 meta/classes/devshell.bbclass |   24 ++-------
 meta/classes/terminal.bbclass |   40 +++++++++++++++
 meta/lib/oe/terminal.py       |  106 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 152 insertions(+), 18 deletions(-)
 create mode 100644 meta/classes/terminal.bbclass
 create mode 100644 meta/lib/oe/terminal.py

-- 
1.7.5.4



