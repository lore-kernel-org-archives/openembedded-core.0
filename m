Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 67CB06DA62
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 02:45:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAF2jqme007269
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 18:45:52 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 14 Nov 2013 18:45:51 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Nov 2013 10:46:02 +0800
Message-ID: <cover.1384483343.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH V2 0/1] sanity.bbclass: check for validity of TMPDIR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Nov 2013 02:45:50 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Changes since V1:
1. Create the directory hierarchy for TMPDIR only if TMPDIR is valid
2. Handle ABI version change only if TMPDIR has been created.
3. If we had a valid TMPDIR for last build and this time the TMPDIR hasn't
   changed location, we don't check the validity for TMPDIR. 

The following changes since commit ea92671d9823e3667d6ced7ac2af20f991da404d:

  bitbake: cooker: replace "w" file opening mode with "a" mode (2013-11-12 17:01:37 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/TMPDIR
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/TMPDIR

Chen Qi (1):
  sanity.bbclass: check for validity of TMPDIR

 meta/classes/sanity.bbclass |   27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

-- 
1.7.9.5


