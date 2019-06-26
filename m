Return-Path: <mac@mcrowe.com>
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
	by mail.openembedded.org (Postfix) with ESMTP id 124506B5C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 14:27:33 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id g8tZh9O4r6ogsg8tahn6wq; Wed, 26 Jun 2019 15:27:34 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=Y62GTSWN c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=dq6fvYVFJ5YA:10
	a=DduravJzYLD1B5Yb9gcA:9 a=CjuIK1q_8ugA:10 a=AQ-k_zJjQSsA:10
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>) id 1hg8tZ-000217-CX
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Jun 2019 15:27:33 +0100
Date: Wed, 26 Jun 2019 15:27:33 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20190626142733.7ieucydj4r6ugcg3@mcrowe.com>
References: <20190626142108.2554-1-mac@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <20190626142108.2554-1-mac@mcrowe.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfNPsPkBC3PPMrqEg5YxWe1b6/LrejiXBACvrsvPnuEIMxs3Dd8ZfnE10rCSGyRtoMqyqz8Qy4ylUP6Sd8pPaIGThqoX7imoki+4MHGRDfeVGO+D/S+iq
	33QN8UKrBNX4OwEU5QIHnzAMHF9aBsx8B/WoqKU6BBZbP3e+CZBlZdnb
Subject: Re: [sumo] [PATCH] busybox: Include complete fix for CVE-2011-5325
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
X-List-Received-Date: Wed, 26 Jun 2019 14:27:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wednesday 26 June 2019 at 15:21:08 +0100, Mike Crowe wrote:
> It looks like not all the parts required for fixing CVE-2011-5325 made
> it into oe-core master before the recipe was upgraded to the upstream
> fixed version.
> 
> The partial fix meant that symlinks deemed unsafe enough to delay were
> never actually realized. This backport from upstream fixes the
> problem.

Grrr, I managed to send the version that lacked the [sumo] prefix. :(

Sorry.

Mike.

