Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Zumeng.Chen@windriver.com>) id 1Ro8v7-0004Fe-21
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jan 2012 08:29:57 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0K7MFuf022406
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 23:22:15 -0800 (PST)
Received: from pek-yocto-build2.corp.ad.wrs.com (128.224.163.150) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 19 Jan 2012 23:22:15 -0800
From: Zumeng Chen <zumeng.chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jan 2012 15:21:55 +0800
Message-ID: <cover.1327043851.git.zumeng.chen@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Subject: [PATCH 0/1] Bug 1834 rspro lacks the hardware for usbgadget defined in machine.conf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jan 2012 07:29:57 -0000
Content-Type: text/plain

Hi Saul,

It seems usbgadget should not be supported by routerstationpro, we have to
remove it from feature matrix due to the following reasons:
  1 ) No mass storage needed to be accessed by usbgadget.
  2 ) This is routerstation+switch, so it should not be taken as a USBNET too.

This fix has been acked by Bruce, which I forgot to send out the patch,
Appologized for that Bruce and Saul.

Thanks,
Zumeng

The following changes since commit 967de59f35acef7fb258524973473f3d154e4a37:

  buildhistory_analysis: include related fields in output (2012-01-19 14:59:23 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zumeng/rspro-conf
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zumeng/rspro-conf

Zumeng Chen (1):
  rspro-conf: remove usbgadget from routerstationpro

 meta-yocto/conf/machine/routerstationpro.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.5.4



