Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 08873607A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 13:15:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Jul 2015 06:15:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,480,1432623600"; d="scan'208";a="764927849"
Received: from nbrady-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.45])
	by orsmga002.jf.intel.com with ESMTP; 15 Jul 2015 06:15:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Date: Wed, 15 Jul 2015 14:15:22 +0100
Message-ID: <1903241.4x2tzf1qho@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.7-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1436353189-21566-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1436353189-21566-1-git-send-email-markus.lehtonen@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] combo-layer pull changes
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
X-List-Received-Date: Wed, 15 Jul 2015 13:15:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 08 July 2015 13:59:47 Markus Lehtonen wrote:
> These patches are an effort to make combo-layer pull operation a bit more
> predictable. The first patch avoids unwanted merge commits in local
> component repositories by requiring fast-forward when pulling. The second
> patch adds a --hard-reset command line option to make sure that the local
> component repositories are always in sync with the remote.
> 
> 
> The following changes since commit df6ddc4bf9795212fda87f9d401893eb254074da:
> 
>   file: fix long-options (2015-07-07 23:57:14 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib marquiz/combo-layer
> 
> 
> Markus Lehtonen (2):
>   combo-layer: only allow fast-forward when pulling
>   combo-layer: implement --hard-reset option

These look good.

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

