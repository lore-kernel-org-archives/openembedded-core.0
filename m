Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D029772F5B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 16:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490631418; x=1522167418;
	h=message-id:subject:from:to:cc:date:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=zdRWWYb/uA7wPGUujwWjhSQPAJrs5WLvGmD4680liw0=;
	b=IEdXXz7tUtV795zk+rh/h8sqarWbLW3GtLbyHDDJFzRbJB5klL+sRR/C
	nsNuVI/svNkCZ/+Ypr5P9oaVmvyK3Q==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Mar 2017 09:16:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,232,1486454400"; d="scan'208";a="1112607703"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by orsmga001.jf.intel.com with ESMTP; 27 Mar 2017 09:16:53 -0700
Message-ID: <1490631895.28281.103.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Munagala Naresh <munagala.nareshbabu@gmail.com>
Date: Mon, 27 Mar 2017 10:24:55 -0600
In-Reply-To: <CACfW1NoPeUfyJ7a7cNZ=UfK9pXKPfnoJ0M2sOQGWbs+9ZedH2Q@mail.gmail.com>
References: <CACfW1NoPeUfyJ7a7cNZ=UfK9pXKPfnoJ0M2sOQGWbs+9ZedH2Q@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: CPU profiling at thread level
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
X-List-Received-Date: Mon, 27 Mar 2017 16:16:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2017-03-25 at 21:44 +0530, Munagala Naresh wrote:
> Hi Team,
> 
> 
> 
> To analyzes the CPU load consumption of a particular process, we need
> to find the thread level consumption. Default top and ps utils are not
> supporting all the parameters that are available in Linux/Android. 
> 
I am not a performance expert, but you may try the software package htop
located at meta-oe; other than this, you may try querying /proc/[pid]

> 
> 
> Could you please suggest some alternatives which works in openembedded
> platform?
> 
> 
> Appreciate any pointers. 
> 
> 
> 
> 
> Thanks
> 
> Naresh 
> 
> 
> 
> 
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



