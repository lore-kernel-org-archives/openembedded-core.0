Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id CC9A9782F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 16:34:49 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 13 Jun 2017 09:34:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="867541822"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Jun 2017 09:34:49 -0700
Message-ID: <1497372226.23013.4.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Tue, 13 Jun 2017 11:43:46 -0500
In-Reply-To: <7f117fed-029a-56e9-b7cd-f342a1f377e6@linux.intel.com>
References: <20170612145805.11599-1-alexander.kanavin@linux.intel.com>
	<1497295764.26945.217.camel@linux.intel.com>
	<1497370534.23013.3.camel@linux.intel.com>
	<7f117fed-029a-56e9-b7cd-f342a1f377e6@linux.intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rpm: run binary package generation via thread pools
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
X-List-Received-Date: Tue, 13 Jun 2017 16:34:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-06-13 at 19:13 +0300, Alexander Kanavin wrote:

> 
> Have you ran these all at once? If so, then the wall times aren't very 
> meaningful: if the CPU is already saturated by having a lot of bitbake 
> tasks running, then adding further threads to these tasks isn't going to 
> make anything finish faster than before.

I ran them serially

> 
> 
> Alex
> 



