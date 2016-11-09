Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 69D51719FA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 13:26:31 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP; 09 Nov 2016 05:26:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,614,1473145200"; d="scan'208";a="29297729"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.22.16])
	by orsmga005.jf.intel.com with ESMTP; 09 Nov 2016 05:26:30 -0800
Message-ID: <1478697984.3182.10.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>
Date: Wed, 09 Nov 2016 13:26:24 +0000
In-Reply-To: <1478694607.23123.176.camel@linuxfoundation.org>
References: <1478694607.23123.176.camel@linuxfoundation.org>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: krogoth 2.1.2 status
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
X-List-Received-Date: Wed, 09 Nov 2016 13:26:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-11-09 at 12:30 +0000, Richard Purdie wrote:
> I ran a krogoth 2.1.2 build. It did have some issues:
> 
> * one runtime sanity test had a timeout issue
> * some urls are stale (perpetual problem)
> * musl runtime testing fails (never tested on krogoth previously)
> * no-x11 runtime testing had a failure (never tested on krogoth
> previously)

We can update the autobuilder not to run these tests for krogoth.
I've filed a bug for musl:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10634

for no-x11 there's a single failure, it might be worthwhile backporting
fixes to make that work?

Regards,

Joshua

