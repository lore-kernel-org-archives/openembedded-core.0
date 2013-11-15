Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id E69DD6D72F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 14:02:30 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.93,708,1378854000"; d="scan'208";a="44768806"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 15 Nov 2013 14:02:29 +0000
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>)
	id 1VhJyf-0002fC-2y; Fri, 15 Nov 2013 14:02:29 +0000
Date: Fri, 15 Nov 2013 14:02:28 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20131115140228.GA9820@mcrowe.com>
References: <cover.1381944889.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1381944889.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: base-passwd: upgrade to 3.5.28 (was [CONSOLIDATED PULL 00/30] Package Updated & Fixes)
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
X-List-Received-Date: Fri, 15 Nov 2013 14:02:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wednesday 16 October 2013 at 10:54:03 -0700, Saul Wold wrote:
> This is set of updates and fixes that I have reviewed and run through
> the autobuilder.

[snip]

>   base-passwd: upgrade to 3.5.28

This ended up being merged as:

 commit 5cab5935d6924e0aca5da4b682bb83e54f20bc1d
 Author: Saul Wold <sgw@linux.intel.com>
 Date:   Sat Aug 31 13:26:40 2013 +0300

    base-passwd: upgrade to 3.5.28
    
    Disable docs creation for now it uses po4a and sgmltools-lite which are
    not currently part of OE-Core
    
    Signed-off-by: Saul Wold <sgw@linux.intel.com>


It looks like this commit introduced extra dependencies in
base-passwd_3.5.28.bb:

+DEPENDS = "docbook-utils-native linuxdoc-tools-native"

which appears to be contrary to the commit description.

I've tried without those DEPENDS and base-passwd still appears to build for
me.

Was that DEPENDS line left over from before you disabled building the
documentation? Do you think it can be safely removed?

Thanks.

Mike.

