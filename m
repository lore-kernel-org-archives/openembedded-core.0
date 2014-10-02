Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0A85A708B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 15:13:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 02 Oct 2014 08:10:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,639,1406617200"; d="scan'208";a="612160242"
Received: from cpariyar-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.78])
	by orsmga002.jf.intel.com with ESMTP; 02 Oct 2014 08:13:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Thu, 02 Oct 2014 16:13:03 +0100
Message-ID: <2071526.AGrvLGiTzH@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.1 (Linux/3.16.3-200.fc20.x86_64; KDE/4.14.1; x86_64; ; )
In-Reply-To: <542D65BD.1000904@windriver.com>
References: <542D65BD.1000904@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Bash security vulnerabilities - Question for master
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
X-List-Received-Date: Thu, 02 Oct 2014 15:13:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 02 October 2014 09:48:29 Mark Hatle wrote:
> With the recent vulnerabilities, a bunch of patches are being sent up to the
> list.  The content is generally fine, but I'm wondering if for master we
> should apply all of the official bash patches to get to the latest patch
> version, instead of applying various 'security' fixes that may or may not
> be the official version.
> 
> For instance, bash_4.3:
> 
> SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
> [followed by a bunch of local patches]
> "
> 
> ncftp .../bash/bash-4.3-patches > ls
> bash43-001        bash43-004.sig    bash43-008        bash43-011.sig
> bash43-015        bash43-018.sig    bash43-022        bash43-025.sig
> bash43-001.sig    bash43-005        bash43-008.sig    bash43-012
> bash43-015.sig    bash43-019        bash43-022.sig    bash43-026
> bash43-002        bash43-005.sig    bash43-009        bash43-012.sig
> bash43-016        bash43-019.sig    bash43-023        bash43-026.sig
> bash43-002.sig    bash43-006        bash43-009.sig    bash43-013
> bash43-016.sig    bash43-020        bash43-023.sig    bash43-027
> bash43-003        bash43-006.sig    bash43-010        bash43-013.sig
> bash43-017        bash43-020.sig    bash43-024        bash43-027.sig
> bash43-003.sig    bash43-007        bash43-010.sig    bash43-014
> bash43-017.sig    bash43-021        bash43-024.sig    bash43-028
> bash43-004        bash43-007.sig    bash43-011        bash43-014.sig
> bash43-018        bash43-021.sig    bash43-025        bash43-028.sig
> 
> The community has 28 patches for various bugs (and these security issues)
> posted.  Would it make sense to update to bash 4.3 (28)?
> 
> In our bash 3.2.48:
> 
> SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
> 
> ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-049;apply=yes;striplevel=0;name=p
> atch001 \
> 
> ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-050;apply=yes;striplevel=0;name=p
> atch002 \
> 
> ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-051;apply=yes;striplevel=0;name=p
> atch003 \
> ...
> "
> 
> Some of the upstream items are applied, but I'm wondering if we should
> extend that to patch level 55 (the latest) in the same way.
> 
> Both patch level 4.3 - 28 and 3.2.48 - 55 will apply all of the fixes that
> keep getting submitted plus a set of other general bugs.  It will also make
> it easier for security scanners to simply check the version and know the
> right fixes have been applied.

FWIW, I'm inclined to agree - given the severity and high profile of these 
issues I think we should patch up to the latest patchlevel. Do we have enough 
tests to mitigate any risk of doing that for the 1.7 release, given how late 
we are in the release cycle?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

