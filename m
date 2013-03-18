Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1UHhDa-0001mO-Ph
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 22:03:43 +0100
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2IKkqxe000164
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 13:46:52 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 18 Mar 2013 13:46:52 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Mar 2013 13:46:50 -0700
Message-ID: <1363639611-21822-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH [v3] 0/1] *** tzcode & tzdata: update to 2013b versions ***
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
X-List-Received-Date: Mon, 18 Mar 2013 21:03:45 -0000
Content-Type: text/plain

In v2, accidently reverted modifications in tzdata recipe made earlier
this year.  Now changes are only to version specific info such as checksums.
One comment has been added.


Joe Slater (1):
  tzcode & tzdata:  update to 2013b versions

 ...code-native_2012j.bb => tzcode-native_2013b.bb} |   12 +++++++-----
 .../tzdata/{tzdata_2012j.bb => tzdata_2013b.bb}    |    6 +++---
 2 files changed, 10 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2012j.bb => tzcode-native_2013b.bb} (52%)
 rename meta/recipes-extended/tzdata/{tzdata_2012j.bb => tzdata_2013b.bb} (98%)

-- 
1.7.3.4



