Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 54932601F5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Oct 2014 12:02:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9QC2C16001268
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Oct 2014 05:02:13 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 26 Oct 2014 05:02:11 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Oct 2014 20:03:43 +0800
Message-ID: <cover.1414324946.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] bind: fix to use correct environment file in service file
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
X-List-Received-Date: Sun, 26 Oct 2014 12:02:16 -0000
Content-Type: text/plain

The following changes since commit 4143f3b0ce0d0c52f5b0babc1bb16ac0ac9610eb:

  nativesdk-cmake: Adjust toolchain paths dynamically (2014-10-24 21:59:34 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/systemd-bind9
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/systemd-bind9

Chen Qi (1):
  bind: fix to use correct environment file in service file

 meta/recipes-connectivity/bind/bind/named.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


