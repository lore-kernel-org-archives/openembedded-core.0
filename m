Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q7CvM-0007vn-I3
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 22:32:28 +0200
Received: by gxk3 with SMTP id 3so325366gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2011 13:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=iCpbQhLlFf9VzmMYAHjcGQJt3ak+ibVphRl0dOsF4Z8=;
	b=LzDohaWWdaNEr0vh+LSuGXEIFeObzvKe+j70MitVQtauL5T5KROO4b8liYeRmJum6P
	2k48473zRa3wVJZTKayixr20UStA9MHUoYXIJ+r8LBB1D+ca90qw4AAmRtbUFG1DMP6B
	JdJgWvjCjpNn4a7eqvqrRZxEaQyrF1Dszk5/c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=G9fmBEUPHek8BDU7mrgcOPk9sZp0MsFtYhCbZknaZunAfE72plK6OQDjXUp8KZQ51D
	9qEWwKqcUyk7HpjGI82/phONMp58OfFstJe0sOZpuPNDFRWu2+FJ79rLOKVdxs4IpZco
	7eEcU/wf7hjpn/9c3QNk44URMLxYHTQ2xHizY=
Received: by 10.150.239.7 with SMTP id m7mr1019146ybh.55.1302035420839;
	Tue, 05 Apr 2011 13:30:20 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id q18sm282484ybk.26.2011.04.05.13.30.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 13:30:20 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Apr 2011 13:30:12 -0700
Message-Id: <cover.1302034944.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 0/3][v2] Rework the devshell
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
X-List-Received-Date: Tue, 05 Apr 2011 20:32:28 -0000

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
 meta/classes/terminal.bbclass |   30 +++++++++++
 meta/lib/oe/classutils.py     |   45 +++++++++++++++++
 meta/lib/oe/terminal.py       |  107 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 191 insertions(+), 17 deletions(-)
 create mode 100644 meta/classes/terminal.bbclass
 create mode 100644 meta/lib/oe/classutils.py
 create mode 100644 meta/lib/oe/terminal.py

-- 
1.7.4.1



