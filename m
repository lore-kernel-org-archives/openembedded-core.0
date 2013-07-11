Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1C89A60289
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 12:20:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jul 2013 05:20:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1043,1363158000"; d="scan'208";a="368593283"
Received: from unknown (HELO helios.localnet) ([10.252.122.35])
	by fmsmga002.fm.intel.com with ESMTP; 11 Jul 2013 05:20:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Jul 2013 13:20:10 +0100
Message-ID: <2680058.xDZ0dG4UEH@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <CAJTo0LZ7POY-i61qz8hUE=JXbc0=0uoNo_i1aTmgi-ma_cc8hw@mail.gmail.com>
References: <1373303785-8508-1-git-send-email-eu@felipetonello.com>
	<51DDACEA.1080503@linux.intel.com>
	<CAJTo0LZ7POY-i61qz8hUE=JXbc0=0uoNo_i1aTmgi-ma_cc8hw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pulseaudio: Added consolekit dependency for pulseaudio-module-console-kit package
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
X-List-Received-Date: Thu, 11 Jul 2013 12:20:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 11 July 2013 11:32:14 Burton, Ross wrote:
> On 10 July 2013 19:50, Saul Wold <sgw@linux.intel.com> wrote:
> > Is this really a build-time dependency or a runtime dependency specific to
> > the pulseaudio-module?
> 
> It's a runtime dependency, but from memory bitbake doesn't manage to
> piece the chain together enough to actually build consolekit (probably
> because the packages are dynamically created).

If it's a stated RDEPENDS in the recipe it must be, and pulseaudio.inc already 
has RDEPENDS_pulseaudio-module-console-kit =+ "consolekit" so unless the 
module package doesn't actually end up being "pulseaudio-module-console-kit" 
I'm not sure why anything else should be needed. It's usually only when the 
dependencies get added dynamically at package time that bitbake not building a 
dependency can be a problem (we've seen this with recipes containing perl 
scripts for example).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

