Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S12Ei-0001sb-Ul
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 21:59:29 +0100
Received: by ghbz2 with SMTP id z2so20288ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 12:51:05 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.236.177.74 as permitted sender) client-ip=10.236.177.74; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.236.177.74 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.236.177.74])
	by 10.236.177.74 with SMTP id c50mr7384986yhm.130.1330116665500
	(num_hops = 1); Fri, 24 Feb 2012 12:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=9/inUySSi0uO5NPEihxrEZA7pp26xJI2AFHjyYOJ5Y8=;
	b=pC6ctUnASWJAJ8aAOeO8pTebxmWyQNIw6IuCD8sO/9+R+BI4ZSMH8I0w7tXeFPE5SI
	sH0qfno5mZOsxojAIVyITvkFgiCr6WbQ6Lmw1x53DWc+eRSyI02urTXTBft2Jtf2DJN8
	6Vwohbcc59GsYmhyYsputayamoTsewBHJul6w=
Received: by 10.236.177.74 with SMTP id c50mr5563441yhm.130.1330116665428;
	Fri, 24 Feb 2012 12:51:05 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id w44sm15149743yhk.17.2012.02.24.12.51.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 12:51:04 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2012 20:50:52 +0000
Message-Id: <cover.1330116559.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/2] Pending patches in O.S. Systems' tree
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
X-List-Received-Date: Fri, 24 Feb 2012 20:59:29 -0000

The following changes since commit 22194a04f224864dd687660e351a3a10da1f06fa:

  scripts/hob: Launch the new hob (2012-02-24 18:05:46 +0000)

are available in the git repository at:
  git://github.com/OSSystems/oe-core master
  https://github.com/OSSystems/oe-core/tree/HEAD

Otavio Salvador (2):
  qt4-native: set headerdir as done in regular builds
  useradd.bbclass: override USERADDSETSCENEDEPS to empty when building
    cross packages

 meta/classes/useradd.bbclass       |    1 +
 meta/recipes-qt/qt4/qt4-native.inc |    3 ++-
 2 files changed, 3 insertions(+), 1 deletions(-)

-- 
1.7.2.5



