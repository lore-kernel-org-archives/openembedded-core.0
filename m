Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F07A371DC7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 14:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491314705; x=1522850705;
	h=message-id:subject:from:to:cc:date:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=2OT8nKXjRWpjOaWQe+1pUDZe1CrVKQB5RchHwWLQxhg=;
	b=m6YkeOX7V6qGjfb8uughI1Z6eyMLh4hFttwATo/MVZX4+8bks4j9C22K
	spZgSTPOZPBIxDuZrQH5beCVxuJF2Q==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2017 07:05:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,275,1486454400"; d="scan'208";a="243900253"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by fmsmga004.fm.intel.com with ESMTP; 04 Apr 2017 07:04:59 -0700
Message-ID: <1491315198.17259.96.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 04 Apr 2017 09:13:18 -0500
In-Reply-To: <CAJTo0LYynrv+_6-T_x6Z1Q9nkBCOV1Ah9u66tdeMvYEkE7BWZg@mail.gmail.com>
References: <20170404042008.23356-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LYynrv+_6-T_x6Z1Q9nkBCOV1Ah9u66tdeMvYEkE7BWZg@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] selftest/devtool: skip test in case of poky-tiny distro
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
X-List-Received-Date: Tue, 04 Apr 2017 14:05:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-04-04 at 11:22 +0100, Burton, Ross wrote:
> 
> On 4 April 2017 at 05:20, <leonardo.sandoval.gonzalez@linux.intel.com>
> wrote:
>         The recipe being tested (devtoo-test-patch-gz) by devtool has
>         dependencies (at
>         least libxres and virtual/libx11) that cannot be built with
>         poky-tiny distro so
>         skip the test for this particular policy.
>         
> 
> I think that whilst this is probably a good fix for now as we're
> trying to stabilise, changing the test so that it can be built with
> poky-tiny would be sensible.

Agree. We need to think of a 'simpler recipe' used by devtool test case
that can be used together with non-poky distros.
> 
> 
> Ross



