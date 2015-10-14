Return-Path: <sjl@dent.vctlabs.com>
X-Greylist: delayed 411 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 14 Oct 2015 19:20:08 UTC
Received: from dent.vctlabs.com (dent.vctlabs.com [68.183.110.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3364E770B5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 19:20:08 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id BFE80C05A2; Wed, 14 Oct 2015 12:30:33 -0700 (PDT)
Date: Wed, 14 Oct 2015 12:30:33 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20151014193033.GD3552@dent.vctlabs.com>
MIME-Version: 1.0
In-Reply-To: <1439220090-3305-1-git-send-email-s.mueller-klieser@phytec.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [oe] kernel.bbclass: Fix do_shared_workdir task ordering
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Oct 2015 19:20:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

http://patchwork.openembedded.org/patch/99875/

Apparently this patch is still not in master, and I just ran across the
problem with an externally built module (omaplfb from omap3-sgx-modules) 
in meta-ti layer.

What's the plan for getting a correct Module.symver into shared_workdir 
for external modules to build against? Above patch, or does someone have
an even better idea?

