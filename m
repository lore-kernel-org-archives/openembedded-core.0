Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id 5C2D46D3D5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 12:12:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.93,651,1378854000"; d="scan'208";a="47397583"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 07 Nov 2013 12:12:51 +0000
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>) id 1VeOSB-0002pf-VS
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Nov 2013 12:12:51 +0000
Date: Thu, 7 Nov 2013 12:12:51 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20131107121251.GA10493@mcrowe.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: TOPDIR and BB_HASHBASE_WHITELIST
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
X-List-Received-Date: Thu, 07 Nov 2013 12:12:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Is it safe and/or sane to put TOPDIR in BB_HASHBASE_WHITELIST?

In my own recipes I make a few uses of TOPDIR and this is causing their
signatures to change between different trees. Simply adding it to
BB_HASHBASE_WHITELIST would avoid this problem but since TOPDIR is quite
fundamental I wondered if there might be some unwanted side effects.

In the past I've worked around this by introducing intermediate variables
and adding those to BB_HASHBASE_WHITELIST but it would be simpler to solve
the problem in one go.

Thanks.

Mike.

