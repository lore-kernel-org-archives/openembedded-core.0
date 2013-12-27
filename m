Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6D56F60D8A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Dec 2013 18:28:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Dec 2013 10:28:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,561,1384329600"; d="scan'208";a="430765415"
Received: from unknown (HELO helios.localnet) ([10.252.122.124])
	by orsmga001.jf.intel.com with ESMTP; 27 Dec 2013 10:28:10 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: krzysztof.m.sywula@intel.com
Date: Fri, 27 Dec 2013 18:28:08 +0000
Message-ID: <1874082.kGqRozfzPF@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <52BDBEB8.804@linux.intel.com>
References: <1388165434-28242-1-git-send-email-krzysztof.m.sywula@intel.com>
	<52BDBEB8.804@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Adding irssi 0.8.16-rc1 recipe
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
X-List-Received-Date: Fri, 27 Dec 2013 18:28:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 27 December 2013 09:54:00 Saul Wold wrote:
> On 12/27/2013 09:30 AM, krzysztof.m.sywula@intel.com wrote:
> > From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> 
> This should really go to meta-openembedded and the
> openembedded-devel@list.openembedded.org mailing list.
> 
> You should also include a "Signed-off-by:" tag in your commit message

A couple of other things:

1) the shortlog (first line of the commit message) should start with the recipe 
name and then a colon i.e. "irssi: ..."

2) When setting a short description, set the SUMMARY variable rather than 
DESCRIPTION

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

