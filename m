Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1069C6E668
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 18:01:34 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 29 Nov 2016 10:01:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,717,1473145200"; d="scan'208";a="197056037"
Received: from cloo7-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.144.199])
	by fmsmga004.fm.intel.com with ESMTP; 29 Nov 2016 10:01:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jiajie Hu <jiajie.hu@intel.com>
Date: Wed, 30 Nov 2016 07:01:30 +1300
Message-ID: <4232623.fUgL5pQE4S@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.8-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1480388349-4206-1-git-send-email-jiajie.hu@intel.com>
References: <1480388349-4206-1-git-send-email-jiajie.hu@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] devtool: execute associated functions while preparing the source tree
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
X-List-Received-Date: Tue, 29 Nov 2016 18:01:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Jiajie,

On Tue, 29 Nov 2016 10:59:09 Jiajie Hu wrote:
> Execute prefuncs and postfuncs associated with the task while preparing
> the source tree. If any changes are made to the source tree by these
> prefuncs or postfuncs, a separate commit will be created so that the
> changes won't get incorporated with other patches.

So this in itself looks reasonable in theory, but I have to warn you that when 
we switch to tinfoil2 [1] these commits are going to be done via the metadata 
instead, and beyond a possible hack that I'd really rather not think about 
it's going to be a bit difficult to intercept the prefuncs/postfuncs there. At 
least they will be executed though since with tinfoil2 we'll be going through 
a much more standard path to run the tasks.

Cheers,
Paul

[1] https://wiki.yoctoproject.org/wiki/Tinfoil2

-- 

Paul Eggleton
Intel Open Source Technology Centre

