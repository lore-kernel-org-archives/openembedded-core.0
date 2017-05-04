Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8787377C28
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 17:18:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 04 May 2017 10:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,287,1491289200"; d="scan'208";a="1126485510"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by orsmga001.jf.intel.com with ESMTP; 04 May 2017 10:18:49 -0700
Message-ID: <1493918803.1761.53.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 04 May 2017 12:26:43 -0500
In-Reply-To: <CAJTo0LbVxh8udLko405=dm9G1o20rXpSsP_ohWcB3SpvEYo5PQ@mail.gmail.com>
References: <20170502173735.11700-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LbVxh8udLko405=dm9G1o20rXpSsP_ohWcB3SpvEYo5PQ@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] scripts/oe-selftest: avoid deprecated imp.reload function
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
X-List-Received-Date: Thu, 04 May 2017 17:18:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-05-04 at 17:41 +0100, Burton, Ross wrote:
> 
> On 2 May 2017 at 18:37, <leonardo.sandoval.gonzalez@linux.intel.com>
> wrote:
>         As explained in [1], the module function imp.reload has been
>         deprecated for
>         importlib.reload, so use the latter instead.
>         
> 
> $ oe-selftest -r package
> 2017-05-04 17:40:10,352 - selftest - INFO - Running bitbake -e to get
> BBPATH
> Traceback (most recent call last):
>   File "/home/ross/Yocto/poky/scripts/oe-selftest", line 806, in
> <module>
>     ret = main()
>   File "/home/ross/Yocto/poky/scripts/oe-selftest", line 500, in main
>     importlib.reload(oeqa.selftest)
> UnboundLocalError: local variable 'importlib' referenced before
> assignment
> 
I saw the error also. The strange thing is that the import importlib has
global scope but the interpreter does not have it visible at the 'main'
function. any idea? will send a v2 once I figure out the latter.

Leo

> 
> Ross



