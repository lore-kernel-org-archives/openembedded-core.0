Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9100860670
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 05:54:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sB25seGu016664
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Dec 2014 21:54:41 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 1 Dec 2014 21:54:40 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Dec 2014 13:53:33 +0800
Message-ID: <cover.1417499570.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] gnutls: disable tpm
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
X-List-Received-Date: Tue, 02 Dec 2014 05:54:47 -0000
Content-Type: text/plain

The following changes since commit b8631416f12b8a904ce3deb036f9d5ce632937b0:

  package_regex.inc: Update REGEX'es in order to find upstream versions correctly (2014-11-28 14:03:02 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/gnutls
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/gnutls

Chong Lu (1):
  gnutls: disable tpm

 meta/recipes-support/gnutls/gnutls.inc | 3 +++
 1 file changed, 3 insertions(+)

-- 
1.9.1


