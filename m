Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9AD2D60043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 09:23:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 28 Aug 2015 02:23:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,424,1437462000"; d="scan'208";a="792618288"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.252.13.245])
	by orsmga002.jf.intel.com with ESMTP; 28 Aug 2015 02:23:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Aug 2015 10:23:16 +0100
Message-ID: <2250213.7VOarPm7GX@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAMKF1srXapg39duVdoQXD=SfG+S+V+1-KBayZhTNFCLdB3RL-g@mail.gmail.com>
References: <1440691301-8285-1-git-send-email-ross.burton@intel.com>
	<CAMKF1srXapg39duVdoQXD=SfG+S+V+1-KBayZhTNFCLdB3RL-g@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] bind: remove dependency on bind in bind-dev
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
X-List-Received-Date: Fri, 28 Aug 2015 09:23:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 27 August 2015 09:19:09 Khem Raj wrote:
> On Thu, Aug 27, 2015 at 9:01 AM, Ross Burton <ross.burton@intel.com> wrote:
> > bind doesn't ship shared libraries only static libraries, so the default
> > dependency on PN from PN-dev is pointless and means that an image with
> > bind-dev installed (via dhcp-dev's automatic dependency) ends up with
> > named installed and started on boot which is rarely intended.
> 
> I see similar issues in meta-oe I wish this could be abstracted out to
> a general solution would be awesome
> detecting if there are no .so in PN detach PN-dev from it.

Agreed - I've filed an enhancement:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=8222

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

