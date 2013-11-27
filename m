Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 77C856CCEF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 10:24:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Nov 2013 02:24:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,781,1378882800"; d="scan'208";a="442946468"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 27 Nov 2013 02:24:26 -0800
Date: Wed, 27 Nov 2013 12:24:25 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20131127102424.GB6099@lpalcu-linux>
References: <1385495362-20784-1-git-send-email-ross.burton@intel.com>
	<20131127090946.GA6099@lpalcu-linux>
	<CAJTo0LYDgCRxMXE1G61M4YKs5eaneftSmW6FL1PtLDNcd+pbkw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYDgCRxMXE1G61M4YKs5eaneftSmW6FL1PtLDNcd+pbkw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] fontconfig: upgrade to 2.11.0
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
X-List-Received-Date: Wed, 27 Nov 2013 10:24:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 27, 2013 at 10:09:04AM +0000, Burton, Ross wrote:
> On 27 November 2013 09:09, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> > On Tue, Nov 26, 2013 at 07:49:19PM +0000, Ross Burton wrote:
> >> Drop sysroot patch as a rewritten form has been accepted upstream.
> >
> > How did you test this? The last time I checked, their implementation was
> > not able to generate the cache properly when using sysroot. Apparently
> > they didn't bother to test if their code works. :| I tried to have a
> > look and, after fixing the command line argument parsing bug, I realized
> > it has other issues which needed further investigations.
> 
> The fonts worked :) and the host-generated caches were the same
> (according to md5sum) as the ones on the machine after it had booted.
> If you've concerns I'll double-check, anything in particular that you
> noticed?

Then they must've fixed the issues. When I tried their code, the cache
wasn't generated at all when using --sysroot. And the fact that the fonts
worked it's a good sign. :)

Laurentiu

> 
> Ross

