Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1ROXiV-0007Gl-Ih
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 17:43:07 +0100
Received: by ywt2 with SMTP id 2so311068ywt.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 08:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=FsHWAThSQx4/dqnBDTLRU3c7clHWVRp4QFgjYZEr8mI=;
	b=DsQZuFRpwSwRWt6YE7dx2X0BW1FcVAt3EOfLDhAOuu1JuRkVeXZhclYRDxDeuKkUKl
	fH2ZV99dLEOrbIyMPCqWfeIbSJKVUOVvUNro9WgeWfF4ggmnrk74Uu22shYXFllFFucp
	euttrEnTbsCHBcvrZAdXbfzUQAoi4b2WRJ8kI=
Received: by 10.146.173.19 with SMTP id v19mr325391yae.4.1320942998341;
	Thu, 10 Nov 2011 08:36:38 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id y71sm12885073yhh.6.2011.11.10.08.36.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Nov 2011 08:36:37 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Nov 2011 16:36:29 +0000
Message-Id: <cover.1320942947.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/1] dhcp fixes
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
X-List-Received-Date: Thu, 10 Nov 2011 16:43:07 -0000

The following changes since commit 4c4498c38232a832bdbfadf54d2e1bf4bc34b171:

  bitbake.conf: Unload pseudo when its not required for a given task (2011-11-10 12:07:29 +0000)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (1):
  dhcp: generate initial leases files for server

 meta/recipes-connectivity/dhcp/dhcp.inc      |    9 ++++++++-
 meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb |    2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

-- 
1.7.2.5



