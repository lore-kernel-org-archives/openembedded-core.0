Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 465A960167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 17:20:40 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 May 2014 10:20:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1053,1389772800"; d="scan'208";a="432143442"
Received: from adelemck-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.194])
	by azsmga001.ch.intel.com with ESMTP; 14 May 2014 10:20:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 May 2014 18:20:35 +0100
Message-ID: <1468686.RJRCQvgyKo@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.3-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <cover.1399978792.git.paul.eggleton@linux.intel.com>
References: <cover.1399978792.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] Recipe upgrades
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
X-List-Received-Date: Wed, 14 May 2014 17:20:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 13 May 2014 12:00:58 Paul Eggleton wrote:
> Recipe upgrades plus a couple of tidy-up patches.
> 
> 
> The following changes since commit 23521fccb122b64f3469d46176f73fe476b0dfc5:
> 
>   gstreamer1.0-plugins-good: add libxfixes and libxdamange to x11 depends
> (2014-05-11 13:07:36 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib paule/upgrades
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paul
> e/upgrades
> 
> Paul Eggleton (6):
>   openssh: update to 6.6p1
>   openssh: move packaging definitions to the end
>   ethtool: upgrade to 3.14
>   nfs-utils: upgrade to 1.3.0
>   dropbear: add missing patch header
>   libsdl2: upgrade to 2.0.3

I've rebased this branch on top of master and re-pushed it, since the OpenSSH 
CVEs have now been merged. The substance of the patches has not otherwise 
changed however.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

