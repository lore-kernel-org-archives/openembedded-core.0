Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9886D617B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 09:53:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7I9reCe029686
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 02:53:40 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 18 Aug 2014 02:53:39 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Aug 2014 17:49:17 +0800
Message-ID: <cover.1408355312.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] librsvg: disable Bsymbolic if it is not supported on some hosts
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
X-List-Received-Date: Mon, 18 Aug 2014 09:53:41 -0000
Content-Type: text/plain

The following changes since commit b7e451894c2c9b02570deb053f76bae611968151:

  site/common-darwin: Really fix common-darwin typo (2014-08-18 10:00:26 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/librsvg
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/librsvg

Chong Lu (1):
  librsvg: disable Bsymbolic if it is not supported on some hosts

 meta/recipes-gnome/librsvg/librsvg_2.40.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

-- 
1.9.1


