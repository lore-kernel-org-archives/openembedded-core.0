Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A538C78470
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 20:08:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Aug 2017 13:08:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,374,1498546800"; d="scan'208";a="1162545525"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga001.jf.intel.com with ESMTP; 14 Aug 2017 13:08:50 -0700
Message-ID: <1502741856.28941.25.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Date: Mon, 14 Aug 2017 15:17:36 -0500
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84CF3D645F@ALA-MBD.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF84CF3D645F@ALA-MBD.corp.ad.wrs.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: master-next
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
X-List-Received-Date: Mon, 14 Aug 2017 20:08:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-08-14 at 19:24 +0000, Slater, Joseph wrote:
> Is there something “different” about this branch? 

this branch is the what at some point will be landed to master, pretty
dynamic and only created/used by key maintainers (RP, Ross) and consumed
by the auto-builder.

>  I find that if I have a local master and master-next, and am on
> master, when I do a pull master-next will wind up both ahead and
> behind origin/master-next.  

use 'git fetch' instead. This will just update your branches but wont
try any merge/rebase.


> If I switch to master-next and rebase, it might fail, or it might
> leave me with one or more “local” commits that are not mine.   For the
> case I tried today, it is commit 3d4f241 which seems to only be on my
> local master-next, but came from Mark Horn/Ross Burton on August 2.
> 


>  
> 
> Can anyone explain this?
> 
>  
> 
> Joe
> 
>  
> 
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



