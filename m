Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RiFAg-0003sM-4t
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 01:57:38 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Jan 2012 16:50:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="92071571"
Received: from unknown (HELO helios.localnet) ([10.252.122.101])
	by azsmga001.ch.intel.com with ESMTP; 03 Jan 2012 16:50:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed, 04 Jan 2012 00:50:11 +0000
Message-ID: <2101328.0yZ7sRDDBg@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <4F039524.4030306@linux.intel.com>
References: <cover.1325079532.git.paul.eggleton@linux.intel.com>
	<4F039524.4030306@linux.intel.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/1] Locale package installation
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
X-List-Received-Date: Wed, 04 Jan 2012 00:57:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 03 January 2012 15:54:12 Saul Wold wrote:
> On 12/28/2011 05:43 AM, Paul Eggleton wrote:
> > Implement locale package installation as we had in OE-Classic; please
> > review. In particular I'm not sure of the naming of
> > rootfs_check_package_exists() (since it resolves the package to a
> > filename in the case of RPM). Note that because of the default value of
> > IMAGE_LINGUAS this patch will result in images growing slightly.
>
> Merged into OE-Core

Er, this was actually an RFC patch and I was hoping to get some more review 
and comments especially as it came during the holidays...

It may be too late to stop it going in but if anyone has any comments/issues 
please raise them now and we can look at further patches if necessary.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


