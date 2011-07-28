Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QmR38-0000ei-Lc
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 15:54:54 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jul 2011 06:50:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,282,1309762800"; d="scan'208";a="32560490"
Received: from unknown (HELO helios.localnet) ([10.255.17.244])
	by azsmga001.ch.intel.com with ESMTP; 28 Jul 2011 06:50:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jul 2011 14:50:36 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1309883050.git.paul.eggleton@linux.intel.com>
	<201107281400.54581.paul.eggleton@linux.intel.com>
	<49FB232D-B0CF-4A49-8E55-EA3825C1F900@dominion.thruhere.net>
In-Reply-To: <49FB232D-B0CF-4A49-8E55-EA3825C1F900@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201107281450.36927.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/1] combo-layer-tool: add tool to manipulate combo layers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jul 2011 13:54:54 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 28 July 2011 14:15:55 Koen Kooi wrote:
> Is that a hook in git or the combo script?

The combo script. The sample config file has an example of how to configure one 
(as well as an example hook script that adds origin commit IDs).
 
> With my distro maintainer hat on, I wouldn't use a combined repo for my
> day-to-day development setup, but I would hand it to my downstream users.
> The use-case I was trying to use it for is to create a git snapshot for a
> release where everything is in one place.

This is definitely the kind of thing combo-layer is useful for.

> Phil mentioned subtree, which is also worth looking at:
> 
> https://github.com/apenwarr/git-subtree

I've looked at it in the past but not tried it, must have a proper test soon.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


