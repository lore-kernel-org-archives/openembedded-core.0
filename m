Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 053906AFE7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 21:50:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Jul 2013 14:52:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,983,1363158000"; d="scan'208";a="364371721"
Received: from unknown (HELO helios.localnet) ([10.252.121.242])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jul 2013 14:50:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Date: Tue, 02 Jul 2013 22:50:47 +0100
Message-ID: <2559197.ry45lNsPXD@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-25-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <CAPhnLPBiYU6CGXZV-Y8khPD593iGO5AtgHMeFRMHtf3hG8jNnw@mail.gmail.com>
References: <1372787148-9023-1-git-send-email-elizabeth.flanagan@intel.com>
	<1372791267.2074.25.camel@pb-ThinkPad-R50e>
	<CAPhnLPBiYU6CGXZV-Y8khPD593iGO5AtgHMeFRMHtf3hG8jNnw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] layer.conf: Bumping LAYERVERSION_core
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
X-List-Received-Date: Tue, 02 Jul 2013 21:50:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Beth,

On Tuesday 02 July 2013 12:20:00 Flanagan, Elizabeth wrote:
> This goes back to my RFC:
> 
> http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/39016

Sorry, I meant to reply to that email and didn't get around to it, my 
apologies.

> As we are removing meta-toolchain* and replacing it with bitbake
> <imagename> -c populate_sdk this causes issues with those of us who
> need to do automated builds both on the current development branch and
> on prior development branches.
> 
> Example: For prior releases, I need to build meta-toolchain*. Without
> having a simple way to figure out where this is no longer the case, I
> (and other folks who run automated builds) end up having to jump
> through a lot of hoops trying to figure out where this layer changed.
> Utilizing LAYERVERSION_* to do it makes sense as there is a
> significant change that would cause issues for build engineers. Prior
> to this I was utilizing LCONF, which was the wrong solution, but just
> happened to work in the example I'm thinking of.

I can definitely see this being useful as something you can do a conditional on 
within the autobuilder code; however the original intention was that 
LAYERVERSION would only get bumped on changes that would break other layers 
(being that it was designed to match up with versioned layer dependencies) and 
I'm not sure this is one of those changes.

This situation has come up a lot over the life of this project, and I wonder 
if it's time to look at having something a bit more organised - perhaps part 
of the static configuration of the autobuilder could be within the metadata, 
i.e. just the values needed to specify the right version-specific behaviour? 
For the purposes of the Yocto Project autobuilder we can add the needed 
definitions in the meta-yocto layer rather than needing to modify OE-Core. 
Could that work?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

