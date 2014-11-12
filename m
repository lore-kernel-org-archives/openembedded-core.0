Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DF81065CED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 09:08:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAC98vJC005523
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Nov 2014 01:08:58 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 12 Nov 2014 01:08:57 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 12 Nov 2014 17:08:54 +0800
Message-ID: <cover.1415782610.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] ghostscript: upgrade to 9.15
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
X-List-Received-Date: Wed, 12 Nov 2014 09:09:07 -0000
Content-Type: text/plain

The following changes since commit 3c741a8d33acbf4b3d5eecc04533bc76e2f37253:

  oprofile: 0.9.9 -> 1.0.0 (2014-11-09 10:21:24 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/upgrade-ghostscript
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/upgrade-ghostscript

Hongxu Jia (1):
  ghostscript: upgrade to 9.15

 .../ghostscript/ghostscript/cups-no-gcrypt.patch   | 19 +++--
 .../ghostscript-9.02-parallel-make.patch           | 99 +++++++++++-----------
 .../{ghostscript_9.14.bb => ghostscript_9.15.bb}   |  4 +-
 3 files changed, 64 insertions(+), 58 deletions(-)
 rename meta/recipes-extended/ghostscript/{ghostscript_9.14.bb => ghostscript_9.15.bb} (96%)

-- 
1.9.1


