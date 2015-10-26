Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id 2E09D758D2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 15:30:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9QFUtTu020740
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 26 Oct 2015 08:30:56 -0700
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 26 Oct 2015 08:30:55 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Oct 2015 10:30:53 -0500
Message-ID: <1445873454-108723-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [jethro/master][PATCH 0/1] Disable the image-prelink by default
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
X-List-Received-Date: Mon, 26 Oct 2015 15:30:59 -0000
Content-Type: text/plain

Due to problems discovered inside of the prelinker, it is not safe to use
at this time.  Hopefully people will respond to my plea for help and we can
get the prelinker re-enabled in the near future.

(All supported Yocto Project architectures are affected by problems.)

Note: the prelinker will still be built and components of it will be used
by other pieces of the system.  This usage is ok, as the prelink-rtld is
functioning properly for the purposes of dependency discovery and other
potential needs.

Mark Hatle (1):
  local.conf.sample: Disable image-prelink by default

 meta/conf/local.conf.sample | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
1.9.3


