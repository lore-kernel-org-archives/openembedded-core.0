Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2E0CF780A1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 14:49:30 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Jun 2017 07:49:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,373,1493708400"; d="scan'208";a="118043528"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by fmsmga006.fm.intel.com with ESMTP; 22 Jun 2017 07:49:31 -0700
Message-ID: <1498143522.31575.41.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Thu, 22 Jun 2017 09:58:42 -0500
In-Reply-To: <1498141053.22706.4.camel@intel.com>
References: <20170619143936.20912-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<1498141053.22706.4.camel@intel.com>
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
X-List-Received-Date: Thu, 22 Jun 2017 14:49:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-06-22 at 16:17 +0200, Patrick Ohly wrote:
> On Mon, 2017-06-19 at 07:39 -0700,
> leonardo.sandoval.gonzalez@linux.intel.com wrote:
> > From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> > 
> > Do not mix the stderr into stdout, allowing test cases to query
> > the specific output.
> 
> This changes the behavior of functions that are also used outside of
> OE-core in a way that won't be easy to notice. I also don't think that
> it is the right default. For example, for bitbake it is easier to
> understand where an error occurred when stderr goes to the same stream
> as stdout.

how would that make it easier?

> 
> Can't you keep the current semantic and just override it explicitly in
> those tests that need separate stdout/stderr?
> 

My proposed patch was mainly based on a RP's comment [1], suggesting to
split std[out|err].


[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=9693#c2





