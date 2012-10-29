Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TSlpc-00076Q-2w
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Oct 2012 10:40:28 +0100
Received: from localhost ([127.0.0.1]:60419 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TSlcU-0006oS-FD; Mon, 29 Oct 2012 09:26:54 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=from:to:cc
	:subject:date:message-id; s=default; bh=lB+2b5pcLrLkjMsq6oonO9eX
	9jk=; b=K9jPaWA5vNHqcTiwfJK/rSU6VYJPuyh54TE/CBPLvAo/fyJ96LkH5W6V
	sPWAY16iaD7zPrwt7n8Y/rEc+my05nSMXwbePWMgpO2wwNw14h5WJab3ohNy7Wph
	HhqwkyYzDrph66rq0Ey6QRwNLPhbaYcRaf0o0nDwftdGjAFyITw=
Received: from [195.171.99.130] (port=2554 helo=archHP.dbnet.local)
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TSlcU-0006o4-AC; Mon, 29 Oct 2012 09:26:54 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Oct 2012 09:28:47 +0000
Message-Id: <1351502930-2348-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.0
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCH 0/3] Improve x11 distro_feature checks
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
X-List-Received-Date: Mon, 29 Oct 2012 09:40:28 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Improvement to the detection of the x11 distro_feature in a few recipes
with the final achievement being that GTK+ is no longer required in 
core-image-minimal if dbg-pkgs, tools-profile and tools-debug are enabled 
when x11 is not in distro_features.

V2

Added PR bumps to all recipes

Jack Mitchell (3):
  latencytop: disable GTK and remove gtk+ dependacy
  packagegroup-core-tools-profile: include sysprof only if x11 is
    distro feature
  babeltrace: fix depends

 .../packagegroups/packagegroup-core-tools-profile.bb        |  4 +++-
 .../latencytop/latencytop-0.5/latencytop-makefile.patch     | 13 +++++++------
 meta/recipes-kernel/latencytop/latencytop_0.5.bb            |  6 ++++--
 meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb            |  2 +-
 4 files changed, 15 insertions(+), 10 deletions(-)

-- 
1.8.0



