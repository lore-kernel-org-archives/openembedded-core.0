Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RonRf-0001KN-8I
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 03:46:15 +0100
Received: by iabz21 with SMTP id z21so3187478iab.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jan 2012 18:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=F9i1uYcS5Az/Wl3K9APgohLmWfxbzRrEnfE0mOArKeo=;
	b=kVfOpzk3tBXPs0AaJOMSRbQAcZ0UGbs2KKMkh7L3tnRcYSeL3zXYe3o7ijfVL7aI53
	iRuispqnHJ9fSfHGeukpNcJfCjqAVlx1FHvrpFWzrA+z7Y/OWgEzhAxipDdXuWWNJMLW
	AYUiBAt2jU6lwg8YcRTJTd+1JD4v8mkgaYwQQ=
Received: by 10.50.77.226 with SMTP id v2mr4902987igw.12.1327199911673;
	Sat, 21 Jan 2012 18:38:31 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id l28sm29005271ibc.3.2012.01.21.18.38.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 Jan 2012 18:38:30 -0800 (PST)
Date: Sat, 21 Jan 2012 18:39:24 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120122023924.GB27997@sakrah.homelinux.org>
References: <1326395831-5121-1-git-send-email-koen@dominion.thruhere.net>
	<1326737165.2933.7.camel@ted>
	<CAGDS+n=HwjOz-QKMDyGy6qKf74WESsUFR-mCUT1HV+qaOzcCfg@mail.gmail.com>
	<1326739512.3367.32.camel@pb-ThinkPad-R50e>
	<4F15A22B.6060004@balister.org>
MIME-Version: 1.0
In-Reply-To: <4F15A22B.6060004@balister.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [Patch v3] gconf: enable gtk+ 2.0 support to build gconf-sanity-check-2
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
X-List-Received-Date: Sun, 22 Jan 2012 02:46:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (17/01/12 11:30), Philip Balister wrote:
> On 01/16/2012 01:45 PM, Phil Blundell wrote:
> > On Mon, 2012-01-16 at 10:19 -0800, Steve Sakoman wrote:
> >> My tested-by was indeed performed with the meta-oe layer enabled.
> >>
> >> In the future I will make clear what layers were used in my testing.
> >>
> >> I fear that this kind of thing is going to bite us repeatedly :-(
> > 
> > It's never been entirely clear to me why meta-oe needs to override quite
> > so many bits of oe-core as it does.  I think you're probably right that,
> > as long as it continues to do so, and people enable meta-oe during
> > testing, this sort of issue probably is going to continue to occur.
> 
> It sounds like we need to collect a list of bits of oe-core that meta-oe
> overrides and work out a plan to resolve these differences.
> This sort of thing creates a lot of confusion for people (like me) that
> are primarily concerned with getting work done using OE, and are less
> concerned with the inner workings of layers.
> 
> Does anyone have suggestions for identifying these cases and explaining
> why they are that way?

We need to bean out the recipes e.g.

1. Dont exist in oe-core ( they are harmless)
2. Are existing in oe-core but older/newer versions ( find reasons )
3. config changes. Are they common or distro specific can they be moved
   to other appropriate layers

overall look at if some of the recipe differences can be merged into say
oe-core

> 
> I see no sense in forcing people to basically fork layers due to
> unresolved issues between OE-Core and meta-oe.

true

> 
> Philip
> 


