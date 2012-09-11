Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Vladimir_Zapolskiy@mentor.com>) id 1TBFVH-0000AW-MQ
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 03:43:03 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1TBF2N-0007bn-Jp from Vladimir_Zapolskiy@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 18:13:11 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 10 Sep 2012 18:13:11 -0700
Received: from eyas.fin.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.1.289.1; Tue, 11 Sep 2012 02:13:10 +0100
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Sep 2012 04:13:42 +0300
Message-ID: <1347326028-32469-1-git-send-email-vladimir_zapolskiy@mentor.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 11 Sep 2012 01:13:11.0659 (UTC)
	FILETIME=[9C89FBB0:01CD8FBA]
Subject: [PATCH 0/6] classes/license: various bugfixes and improvements
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
X-List-Received-Date: Tue, 11 Sep 2012 01:43:03 -0000
Content-Type: text/plain

This trivial set of changes fixes several bugs including:
* check license.manifest for multiple records about the same
* put precise information about licensing into license.manifest
* specify licensing of packages, where info is in form of LICENSE_${pkg}

Also the change set has some intention to improve performance and
source code readability.

Vladimir Zapolskiy (6):
  classes/license: define LICENSE_MANIFEST variable
  classes/license: check license manifest for double records
  classes/license: remove redundant nested if statements
  classes/license: account LICENSE_${pkg} values in manifest
  classes/license: correct license info in lisense.manifest
  classes/license: place all found licenses on one line

 meta/classes/license.bbclass |   55 ++++++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 21 deletions(-)

-- 
1.7.10


