Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D6DF86FEFA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 20:55:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 09 May 2016 13:55:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,601,1455004800"; d="scan'208";a="976015448"
Received: from hlim7-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.171.117])
	by fmsmga002.fm.intel.com with ESMTP; 09 May 2016 13:55:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 May 2016 08:55:29 +1200
Message-ID: <1538680.bjqJGDTe28@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.8-300.fc23.x86_64; KDE/4.14.18; x86_64; ;
	)
In-Reply-To: <CADkTA4OUeFUdVVqoLaTH6+yW+E6rL6sbz4pZnBn1e6RnMOUCgg@mail.gmail.com>
References: <cover.1462768634.git.paul.eggleton@linux.intel.com>
	<CADkTA4OUeFUdVVqoLaTH6+yW+E6rL6sbz4pZnBn1e6RnMOUCgg@mail.gmail.com>
MIME-Version: 1.0
Cc: Tom Zanussi <tom.zanussi@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/6] Kernel configuration check for recipes
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
X-List-Received-Date: Mon, 09 May 2016 20:55:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mon, 09 May 2016 08:08:55 Bruce Ashfield wrote:
> On Mon, May 9, 2016 at 12:43 AM, Paul Eggleton <
> 
> paul.eggleton@linux.intel.com> wrote:
> > Add the capability for other recipes to verify that kernel
> > configuration options they depend upon at runtime are present, and warn
> > if they are missing. This seems functional enough to me but is still in
> > RFC - please let me know if it looks OK to you or I've missed anything
> > (no doubt there are recipes we could add the checks to, I refer mainly
> > to the mechanism itself).
> > 
> > 
> > Please review the following changes for suitability for inclusion. If you
> > have
> > any objections or suggestions for improvement, please respond to the
> > patches. If
> > you agree with the changes, please provide your Acked-by.
> 
> See my replies to the patches. I'm sure it won't matter in the end, but
> this is a duplication of the mechanisms that we already have in the kernel
> config check phase. I have a whole set of changes that I completed early
> this year that extends that mechanism to any kernel (not just kernel-yocto)
> classes. In that mechanism there's the concept of "required" and
> "optional" Kconfig options. If they aren't present in the final .config, we
> warn and optionally error (this is versus the currently mechanism of only
> warning if boot critical options are dropped).

OK - so I guess this gets down to the question of whether we can practically 
define all of these userspace dependencies on the kernel side rather than 
individual recipes. I actually couldn't tell you how many other recipes this 
might be useful in - systemd and udev are where it's come up numerous times 
for users, and IMAGE_FSTYPES was one that I could think of. Perhaps we ought 
to analyse that in greater detail before proceeding.

> I'm betting that the follow on to this series will be "Hey recipes should
> set the options for the kernel if they really need them" .. which IMHO is an
> incredibly bad idea.

We'll never be getting to that level. Fundamentally one recipe cannot 
influence the configuration of another, at least not directly, and I agree in 
this case it wouldn't make any sense. I'm just proposing a check here.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

