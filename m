Received: from mail-out.m-online.net ([212.18.0.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <yanok@emcraft.com>) id 1Qiyko-0003QX-Iu
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 03:05:49 +0200
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id A458D188A197
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 03:01:39 +0200 (CEST)
X-Auth-Info: QwU0fjf/rkYacHihTLM0kEyjs2aTpbkvJUWW4MeFoGE=
Received: from mail.denx.de (host-82-135-33-74.customer.m-online.net
	[82.135.33.74])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 7B3DB1C000AD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 03:01:39 +0200 (CEST)
Received: from pollux.denx.de (pollux [192.168.1.1])
	by mail.denx.de (Postfix) with ESMTP id 321C634003F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 03:01:39 +0200 (CEST)
Received: by pollux.denx.de (Postfix, from userid 547)
	id D39464BFF; Tue, 19 Jul 2011 03:01:38 +0200 (CEST)
From: Ilya Yanok <yanok@emcraft.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 03:00:51 +0200
Message-Id: <1311037258-11777-1-git-send-email-yanok@emcraft.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/7] Fixes to some gcc 4.5.1 bugs
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
X-List-Received-Date: Tue, 19 Jul 2011 01:05:53 -0000

Hi everybody,

It seems like everybody are using GCC 4.6 already but as support for
GCC 4.5.1 is still here I'd like to publish the changes we've done to
GCC 4.5.1 recipe some time ago.

We've incorporated the patches for some know GCC 4.5.1 problems:
 PR44392: Already fixed by arm_bswapsi2 patch but the patch differs
slightly from the one in the gcc tree.
 PR43810: linking with optspace on PowerPC results in undefined
references to _savegpr_* _restgpr_*_x. Added the patch from bugzilla
but the issue is still here.
 PR44290: __naked attribute is broken on ARM.
 PR44606: Wrong SPE floating point during computation (PowerPC).
 PR45094: [arm] wrong instructions for dword move in some cases.
 PR45052: volatile ignored
 PR45886: [ARM] support for __ARM_PCS_VFP predefined symbol

Hope this will be useful for someone.

Regards, Ilya.
 


