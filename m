Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 54D2E60667
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 19:45:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Aug 2013 12:42:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,872,1367996400"; d="scan'208";a="386554054"
Received: from akagikob-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.214])
	by orsmga002.jf.intel.com with ESMTP; 13 Aug 2013 12:45:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 13 Aug 2013 20:45:16 +0100
Message-ID: <2166743.qly9touZmz@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <520A6ECF.8000002@windriver.com>
References: <520A6CE6.3010000@mlbassoc.com> <520A6ECF.8000002@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Enabling x264 support in gstreamer
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
X-List-Received-Date: Tue, 13 Aug 2013 19:45:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 13 August 2013 12:37:19 Mark Hatle wrote:
> On 8/13/13 12:29 PM, Gary Thomas wrote:
> > I see that some of the gstreamer recipes have changed so that x264
> > is now a PACKAGECONFIG option.  However, I don't see anything that
> > enables this option anywhere.
> > 
> > How do I get x264 support back - it was working with Poky/Yocto
> > just a few weeks back...
> > 
> > Note: I have imported meta-oe/recipes-multimedia/x264 from
> > meta-openembedded into my layers for this [library] package.
> 
> I havn't worked with this myself, but my guess is.  In your
> distribution.conf file (or your local.conf):
> 
> PACKAGECONFIG_gst-plugins-ugly = "x264"
> 
> or
> 
> PACKAGECONFIG_gstreamer1.0-plugins-ugly = "a52dec lame mad mpeg2dec x264"

You missed out the "pn-" which is necessary for such per-recipe overrides to 
work. The correct examples would be:

PACKAGECONFIG_pn-gst-plugins-ugly = "x264"
 
or

PACKAGECONFIG_pn-gstreamer1.0-plugins-ugly = "a52dec lame mad mpeg2dec x264"

If preferred you could use ..._append_pn-... = " x264" to add to the existing 
options rather than setting them outright.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

