Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 366B8601F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 09:03:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 26 Nov 2014 01:03:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,461,1413270000"; d="scan'208";a="638294196"
Received: from ambyrne1-mobl2.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.19.108])
	by fmsmga002.fm.intel.com with ESMTP; 26 Nov 2014 01:02:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Trevor Woerner <trevor.woerner@linaro.org>
Date: Wed, 26 Nov 2014 09:02:43 +0000
Message-ID: <2493239.ehZILRZaeS@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.3-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <5474DEDE.4000005@linaro.org>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<5474DEDE.4000005@linaro.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/7] Developer workflow improvements
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
X-List-Received-Date: Wed, 26 Nov 2014 09:03:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Trevor,

On Tuesday 25 November 2014 14:56:14 Trevor Woerner wrote:
> Just thinking out loud here... is there a way to way to have the
> devshell come up without having applied any patches but with the patches
> already queued in, say, a quilt series?
>
> It seems to happen often enough to me that: a recipe has 10 local
> patches which applied fine yesterday but now patch 7 is failing because
> the upstream developers changed something. I would be nice to be able to
> devshell to the point where patch 6 has been applied and patch 7 is
> waiting to go on. Then I could apply the patch myself to figure out why
> it's failing. Or just having all the patches ready to apply (in a quilt
> series, as mentioned above) would be great too.

We do already have PATCHRESOLVE = "user" that's supposed to handle exactly 
this, although to be honest I've never really felt comfortable using it (that 
might have something to do with my lack of familiarity with quilt, though). 
devtool is using the same code that we use for applying patches, which 
supports quilt, so in theory it should be pretty easy to provide an option to 
use quilt rather than git when doing "devtool modify" or "devtool extract" for 
those that prefer it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

