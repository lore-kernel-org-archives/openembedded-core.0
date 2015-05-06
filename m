Return-Path: <igor.santos@aker.com.br>
Received: from asmg.aker.com.br (asmg.aker.com.br [177.159.144.67])
	by mail.openembedded.org (Postfix) with SMTP id EC14673F3C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 22:04:51 +0000 (UTC)
Received: from mail.aker.com.br (bat.bsb.aker.com.br [10.0.0.20])
	by asmg.aker.com.br [10.0.1.3]; Wed, 6 May 2015 19:04:51 -0300
	(envelope-from igor.santos@aker.com.br)
Received: from igor.santos.devel.com.br (10.4.59.1) by mail.aker.com.br
	(10.0.0.20) with Microsoft SMTP Server id 8.3.342.0;
	Wed, 6 May 2015 18:38:54 -0300
From: Igor Santos <igor.santos@aker.com.br>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 May 2015 18:38:46 -0300
Message-ID: <1430948328-17891-1-git-send-email-igor.santos@aker.com.br>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
X-AkerSMTPGW-ServerID: a5fc2d2b506f49fc2bd6d1c7ad2f56ee346d5d27
X-AkerSMTPGW-MessageID: 90a1c5e8d2d49b6d078c5e34dd9a5ba79cd0f845-15o
Subject: [PATCH 0/2] Add ctags and cscope
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
X-List-Received-Date: Wed, 06 May 2015 22:04:53 -0000
Content-Type: text/plain

Hi, these series add ctags and cscope to the devtools.
It's interesting to add these tools to the stable branches.

Igor Santos (2):
  ctags: add exuberant ctags
  cscope: add cscope

 meta/recipes-devtools/cscope/cscope_15.8b.bb | 24 ++++++++++++++++++++++++
 meta/recipes-devtools/ctags/ctags_5.8.bb     | 27 +++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/cscope/cscope_15.8b.bb
 create mode 100644 meta/recipes-devtools/ctags/ctags_5.8.bb

-- 
2.1.0



