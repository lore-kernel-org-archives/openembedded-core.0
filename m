Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 94071738EB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 06:50:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3O6oEKw007872
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 23:50:14 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Thu, 23 Apr 2015 23:50:14 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Apr 2015 14:50:21 +0800
Message-ID: <d690fdd4b6924ba28eff25f4f9fb4dc5d2f5ca56.1429858183.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1429858183.git.Qi.Chen@windriver.com>
References: <cover.1429858183.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] uninative-tarball: delete the packagedata task
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
X-List-Received-Date: Fri, 24 Apr 2015 06:50:14 -0000
Content-Type: text/plain

This task is meaningless for uninative-tarball as the package task
has been deleted. Besides, sometimes it would cause problems. To
reproduce, use the following command.

bitbake uninative-tarball -c cleansstate && bitbake uninative-tarball &&
bitbake uninative-tarball -c clean && bitbake uninative-tarball

The error is something like below.

File: 'sstate.bbclass', lineno: 33, function: sstate_installpkg
     0029:        bb.build.exec_func(f, d)
     0030:
     0031:    for state in ss['dirs']:
     0032:        prepdir(state[1])
 *** 0033:        os.rename(sstateinst + state[0], state[1])
     0034:    sstate_install(ss, d)
     0035:
     0036:    for plain in ss['plaindirs']:
     0037:        workdir = d.getVar('WORKDIR', True)
Exception: OSError: [Errno 2] No such file or directory

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/meta/uninative-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index 62bdde8..41f7927 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -23,6 +23,7 @@ inherit populate_sdk
 
 deltask install
 deltask package
+deltask packagedata
 
 SDK_DEPENDS += "patchelf-native"
 
-- 
1.9.1


