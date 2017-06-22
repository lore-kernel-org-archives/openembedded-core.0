Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C52CB77E65
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 20:42:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jun 2017 13:42:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,374,1493708400"; d="scan'208";a="984129437"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by orsmga003.jf.intel.com with ESMTP; 22 Jun 2017 13:42:25 -0700
Message-ID: <1498164697.31575.68.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Thu, 22 Jun 2017 15:51:37 -0500
In-Reply-To: <1498160101.22706.53.camel@intel.com>
References: <20170619143936.20912-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<1498141053.22706.4.camel@intel.com>
	<1498143522.31575.41.camel@linux.intel.com>
	<1498144469.22706.10.camel@intel.com>
	<1498145851.31575.50.camel@linux.intel.com>
	<1498147164.22706.30.camel@intel.com>
	<1498150775.24449.120.camel@linuxfoundation.org>
	<1498160101.22706.53.camel@intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] commands: send stderr to a new pipe
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
X-List-Received-Date: Thu, 22 Jun 2017 20:42:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-06-22 at 21:35 +0200, Patrick Ohly wrote:

> 
> And please, whatever we do, let's not change oeqa in a way that breaks
> existing tests, whether they are in OE-core or some other layer.
> 

The AB issue that was reported recently may be related to this change
but locally I have not seen the problem, so it may either another commit
breaking it or AB setup.

Leo


