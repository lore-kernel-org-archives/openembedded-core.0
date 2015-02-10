Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E9D71732E7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 19:17:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1AJHsPL017440
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Feb 2015 11:17:54 -0800 (PST)
Received: from op3.wrs.com (128.224.56.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 10 Feb 2015 11:17:54 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Feb 2015 14:17:36 -0500
Message-ID: <1423595858-24970-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.2.1
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 0/2] git: add manpages and tab completion support.
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
X-List-Received-Date: Tue, 10 Feb 2015 19:18:01 -0000
Content-Type: text/plain

As part of improving the end user experience for installs where the
end user interacts directly with the generated filesystem (e.g. the
build-appliance) these two commits ensure that we can have real
man pages and tab completion for git on the target if desired.

The pre-generated man pages are created by the git folks themselves
and hosted right along side of the git tarballs, so updates will
be relatively seamless.

Paul.
---

Paul Gortmaker (2):
  git: expand recipe to take advantage of pre-gen'd manpages
  git: add basic tab completion support

 meta/recipes-devtools/git/git.inc      | 17 ++++++++++++++++-
 meta/recipes-devtools/git/git_2.2.1.bb |  6 ++++--
 2 files changed, 20 insertions(+), 3 deletions(-)

-- 
2.2.1


