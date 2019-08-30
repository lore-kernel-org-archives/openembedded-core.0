Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3BBF07CBE3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 05:46:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7U5kRRX000609
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Aug 2019 22:46:27 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 29 Aug 2019 22:46:14 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 30 Aug 2019 01:46:08 -0400
Message-ID: <20190830054609.165333-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] Fix avaihi daemon start error
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
X-List-Received-Date: Fri, 30 Aug 2019 05:46:27 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It shows error message which causes oe-selftest case parselogs fails:

Aug 29 13:50:23 qemux86 avahi-daemon[151]: ../../avahi-0.7/avahi-daemon/chroot.c: open() failed: No such file or directory
Aug 29 13:50:23 qemux86 avahi-daemon[148]: Failed to open /etc/resolv.conf: Invalid argument

Kai Kang (1):
  avahi: launch avahi-daemon after connman

 .../files/0001-Fix-opening-etc-resolv.conf-error.patch     | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

--
2.20.0


