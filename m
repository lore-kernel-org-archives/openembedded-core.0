Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QDJF9-00035F-Cq
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 18:30:07 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Apr 2011 09:27:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,254,1301900400"; d="scan'208";a="632711527"
Received: from unknown (HELO [10.255.12.218]) ([10.255.12.218])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2011 09:27:26 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Apr 2011 09:27:26 -0700
In-Reply-To: <DE8BA75F34A0404282AC5E15F691BC765136F5ED@orsmsx504.amr.corp.intel.com>
References: <1303342638.5518.325.camel@rex>
	<D7FBAE99-F5F4-4293-8DC5-BC356F7CF903@dominion.thruhere.net>
	<DE8BA75F34A0404282AC5E15F691BC765136F5ED@orsmsx504.amr.corp.intel.com>
X-Mailer: Evolution 3.0.0 (3.0.0-1.fc15) 
Message-ID: <1303489646.2293.9.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [poky] OE-Core Rebranding Phase 1
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
X-List-Received-Date: Fri, 22 Apr 2011 16:30:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-04-22 at 07:16 -0700, Rifenbark, Scott M wrote:
> I grep'd all the XML files in the documentation directory and got three hits:
> 
>  * 'meta/recipes-sata/tasks/task-poky.bb' appears in the Poky Reference manual
>  * '$ bitbake -c clean task-boot task-base task-poky' appears in the Poky Reference manual
>  * 'local.conf.sample' appears in the Poky Reference manual.
> 
> Should these be the following:
> 
>  * meta/recipes-sata/tasks/task-core.bb

correct bar the typo:  meta/recipes-sato/tasks/task-core.bb 

>  * $ bitbake -c clean task-boot task-base task-core

correct

> 
> Not sure what to do with the occurrence of 'local.conf.sample'.  Just remove it?

We still use and need that file, the only thing that's changed in it are
some variables it sets have been renamed. Please leave local.conf.sample
in.

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Build System Monkey
        Intel Open Source Technology Centre



