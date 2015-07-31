Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 89E5F76504
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:12:37 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 31 Jul 2015 04:12:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,584,1432623600"; d="scan'208";a="533637589"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.252.23.101])
	by FMSMGA003.fm.intel.com with ESMTP; 31 Jul 2015 04:12:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 31 Jul 2015 12:12:34 +0100
Message-ID: <1923146.uIJODXP6Gm@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.8-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAP71Wjwh7VZJubtjL0oy4CmzKFh3p9+7c9v92we06U6KE5YfZQ@mail.gmail.com>
References: <55BB1C0F.90508@windriver.com>
	<2950215.CmNeN3gmTU@peggleto-mobl.ger.corp.intel.com>
	<CAP71Wjwh7VZJubtjL0oy4CmzKFh3p9+7c9v92we06U6KE5YfZQ@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta/lib/oe/rootfs.py: dont' remove any packages by default
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
X-List-Received-Date: Fri, 31 Jul 2015 11:12:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Nicolas,

On Friday 31 July 2015 13:09:29 Nicolas Dechesne wrote:
> On Fri, Jul 31, 2015 at 12:46 PM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> >> I think that we should not remove any pkgs by default, we can add some
> >> interfaces/ways to let the user decide whether to remove them or any
> >> other pkgs, for example, add a REMOVE_PACKAGS variable, leave it as NULL
> >> or only add run-postinsts to it by default.
> > 
> > There is a reason for these not to be there by default when you don't have
> > runtime package management - the assumption is you won't be adding or
> > removing any users, thus the binaries that those packages install aren't
> > needed.
>
> I am not sure to understand the relationship between runtime package
> management, and adding/removing users? Why would no runtime package
> management, imply no need to add/remove users?

I guess the underlying assumption is that if you have no package manager, in a 
typical embedded context (if there is such a thing) that implies you won't be 
changing the system after setup.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

