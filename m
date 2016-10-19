Return-Path: <o.mandel@menlosystems.com>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id D8ECA71B22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 10:06:02 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3szSJB5rr4z3hk0R;
	Wed, 19 Oct 2016 12:06:02 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3szSJB5Z7dzvkcw;
	Wed, 19 Oct 2016 12:06:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id YIBn9SiG-gII; Wed, 19 Oct 2016 12:06:02 +0200 (CEST)
X-Auth-Info: WLSTJLc4zPnB5s+y/XTls8dNpYVLtd/Xhz8AmXxp60Wpr3VBIyugCSSElo7wLrhA
Received: from menlobuildsrv.menlosystems.local
	(host-141-40-253-38.customer.izb-online.de [141.40.253.38])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 19 Oct 2016 12:06:01 +0200 (CEST)
From: Olaf Mandel <o.mandel@menlosystems.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2016 10:05:12 +0000
Message-Id: <1476871513-19739-1-git-send-email-o.mandel@menlosystems.com>
X-Mailer: git-send-email 2.1.4
Cc: Olaf Mandel <o.mandel@menlosystems.com>
Subject: [PATCH 0/1] $COREBASE/LICENSE in LIC_FILES_CHKSUM
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
X-List-Received-Date: Wed, 19 Oct 2016 10:06:04 -0000

I ran into QA issues when inadvertently replacing OEs LICENSE with
Yoctos LICENSE file. Why should recipes depend on the license for
the complete collection of layers? At least for "normal" recipes
that generate target device packages, this makes no sense to me.

I patched out the global LICENSE file from all those recipes that
are short enough and where I feel reasonably confident of not
having actually changed the claimed license terms in any way.

There are additional recipes that reference the global LICENSE
file, but where I am not sure if a less blanket license declaration
is appropriate or not. Especially for meta-toolchain and
build-appliance-image, the global LICENSE is probably correct.
Any comments?

If there are really recipes where the global LICENSE file is
appropriate, how to allow people running their own combo-layer to
quickly replace the file? Maybe add a variable CORELICENSE_MD5 that
gets used by all such recipes?

-- 
2.1.4


