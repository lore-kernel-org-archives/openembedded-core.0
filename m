Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F2F0C7D589
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 09:23:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4L9Mt7j029591
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 May 2019 02:22:56 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 21 May 2019 02:22:55 -0700
From: <kai.kang@windriver.com>
To: <alex.kiernan@gmail.com>, <raj.khem@gmail.com>
Date: Tue, 21 May 2019 05:22:48 -0400
Message-ID: <20190521092249.175461-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/1] Configure wired network interface with dhcp for systemd
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
X-List-Received-Date: Tue, 21 May 2019 09:23:03 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

v2:
Refer to https://github.com/YoeDistro/meta-yoe/tree/master/recipes-core/systemd

* add section 'DHCP' in dhcp.network which could solve got 2 ips when connman is installed
* not install the configure file for qemu

Kai Kang (1):
  systemd-conf: configure wired network with dhcp

 meta/recipes-core/systemd/systemd-conf/dhcp.network | 9 +++++++++
 meta/recipes-core/systemd/systemd-conf_242.bb       | 5 +++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd-conf/dhcp.network

-- 
2.20.0


