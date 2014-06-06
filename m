Return-Path: <sledz@dresearch-fe.de>
Received: from zk223.dresearch-fe.de (zk223.dresearch-fe.de [217.92.177.116])
	by mail.openembedded.org (Postfix) with ESMTP id 6C7406FAD2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 06:49:36 +0000 (UTC)
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 9A816E0061;
	Fri,  6 Jun 2014 08:49:36 +0200 (CEST)
Received: from [IPv6:::1] (localhost [IPv6:::1])
	by fensuse.internal.dresearch-fe.de (Postfix) with ESMTP id 2AAEB70132B;
	Fri,  6 Jun 2014 08:49:36 +0200 (CEST)
Message-ID: <5391647F.5070003@dresearch-fe.de>
Date: Fri, 06 Jun 2014 08:49:35 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.6
Cc: Koen Kooi <koen@openembedded.org>,
	angstrom-distro-devel <angstrom-distro-devel@linuxtogo.org>
Subject: No recipe for recipes-tweaks/qt5/qtbase_5.2.1.bbappend
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Steffen Sledz <sledz@dresearch-fe.de>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jun 2014 06:49:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We're currently switching to th daisy branches.

According to [1] meta-angstrom depends on openembedded-core, meta-oe, and meta-systemd layers.

The angstrom-v2014.06-yocto1.6 branch of meta-angstrom contains recipes-tweaks/qt5/qtbase_5.2.1.bbappend. But there's no qtbase recipe in the required layers. So we get

---------------> snip <-------------------
ERROR: No recipes available for:
  /pm/sledz/hipos-dfe/meta-angstrom/recipes-tweaks/qt5/qtbase_5.2.1.bbappend
ERROR: Command execution failed: Exited with 1
---------------> snip <-------------------

A bug in the daisy branch of meta-angstrom?
An incomplete dependency list in [1]?

[1] <http://layers.openembedded.org/layerindex/branch/master/layer/meta-angstrom/>

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

