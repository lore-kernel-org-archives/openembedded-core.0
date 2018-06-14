Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 83A3C78A60
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 06:50:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5E6oq9B009062
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Jun 2018 23:50:52 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 13 Jun 2018 23:50:51 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Thu, 14 Jun 2018 14:18:02 +0800
Message-ID: <20180614061803.12275-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [V2 0/1] set SECURITY_CFLAGS for mips64 in goarch.bbclass
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
X-List-Received-Date: Thu, 14 Jun 2018 06:50:52 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

V2:
* use override 'mipsarch' to set SECURITY_CFLAGS for both mips and mips64

Build packages go-dep and glide successfully on qemumips and qemumips64.

Kai Kang (1):
  goarch.bbclass: set SECURITY_CFLAGS for mips64

 meta/classes/goarch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.17.1


