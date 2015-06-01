Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B7CF755F5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 07:30:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t517U1Fe005242
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Jun 2015 00:30:01 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Mon, 1 Jun 2015 00:30:01 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 1 Jun 2015 15:23:52 +0800
Message-ID: <1433143433-528-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] Remove hdajacksensetest for framebuffer build
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
X-List-Received-Date: Mon, 01 Jun 2015 07:30:04 -0000
Content-Type: text/plain

Hi Richard,

I made some modification after make the commit, but I forgot to add it to the
commit for makefile_no_gtk.patch. 

It requires glib for framebuffer build:

| checking for GLIB... no
| configure: error: Package requirements (glib-2.0) were not met:
| 
| No package 'glib-2.0' found
| 

Update makefile_no_gtk.patch again to remove the hdajacksensetest for
framebuffer build.

Sorry for inconvenient.

--Kai

Kai Kang (1):
  alsa-tools: remove hdajacksensetest for framebuffer build

 meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


