Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RFjQu-0008NW-Ia
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 11:24:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9H9IewL012723
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 02:18:41 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 17 Oct 2011 02:18:40 -0700
Message-ID: <cover.1318843077.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 17 Oct 2011 17:17:57 +0800
Date: Mon, 17 Oct 2011 17:24:31 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [OC-core][PATCH 0/1] lsb: Change link of ${baselib} to lib64 for 64bits system
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
X-List-Received-Date: Mon, 17 Oct 2011 09:24:33 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Hi Richard,

I modified my submitting according to your suggestion.
Change ln -sf ${baselib} lib64 to 
if [ "${baselib}" != "lib64" ]; then
	ln -sf ${baselib} lib64
fi

and correct a warning item caused by mandir. 

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/lsb64
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/lsb64

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (1):
  lsb: Change link of ${baselib} to lib64 for 64bits system

 meta/recipes-extended/lsb/lsb_1.4.bb |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)



