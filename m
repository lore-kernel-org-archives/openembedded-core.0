Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id BC8DD78438
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 18:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B038B20B04
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 18:21:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id TA40pSzMVqW2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 18:21:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9472420862
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 18:21:12 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1D31F163282; Mon,  5 Feb 2018 13:21:12 -0500 (EST)
Date: Mon, 5 Feb 2018 13:21:12 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20180205182112.GF2786@denix.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: WARNING: Variable key %s (%s) replaces original key %s (%s).
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
X-List-Received-Date: Mon, 05 Feb 2018 18:21:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Am I supposed to see bunch of these warnings (3 during parsing and 20 more 
during build):

WARNING: Variable key RDEPENDS_${KERNEL_PACKAGE_NAME}-base (${KERNEL_PACKAGE_NAME}-image) replaces original key RDEPENDS_kernel-base (kernel-devicetree).


From kernel.bbclass:

# Allow machines to override this dependency if kernel image files are
# not wanted in images as standard
RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image"

-- 
Denys

