Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RYxzF-0003Uk-KC
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 11:47:31 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Dec 2011 02:40:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="83964760"
Received: from unknown (HELO helios.localnet) ([10.252.122.20])
	by azsmga001.ch.intel.com with ESMTP; 09 Dec 2011 02:40:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, ulf@emagii.com
Date: Fri, 09 Dec 2011 10:40:35 +0000
Message-ID: <6586493.ofj4pSsnLf@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-13-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <4EE1E350.4010304@emagii.com>
References: <4EE1DE55.1040303@emagii.com> <1426848.m8dnn0MDvm@helios>
	<4EE1E350.4010304@emagii.com>
MIME-Version: 1.0
Subject: Re: Change in	"openembedded-core/meta/files/common-licenses/LGPL-2.0" breaks opie-image
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
X-List-Received-Date: Fri, 09 Dec 2011 10:47:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 09 December 2011 11:30:40 Ulf Samuelsson wrote:
> I think someone needs to sit down and do this in a structured manner.
> A number of license files were modified.
> For each file, the old checksum needs to be searched for in the tree,
> and the license modified.

In case it wasn't clear I'm actually doing something which is not recommended 
in meta-opie since it provides none of the protection of LIC_FILES_CHKSUM and 
no small amount of fragility, as we have discovered. Nobody should really be 
doing this if they can possibly avoid it, and if they are then they shouldn't 
be too surprised when things break.

FWIW, none of the recipes in OE-core itself (nor meta-oe for that matter) 
refer to files in the common license directory - I just checked.

> A grep for "LICENSE =" should reveal offending recipes with "<recipe1>
> && <recipe2>"
> or "<recipe1>/<recipe2>" etc.

This is a separate issue.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


