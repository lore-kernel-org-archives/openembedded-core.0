Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 86D4B6FF0E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 21:03:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 May 2017 14:03:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,316,1491289200"; d="scan'208";a="1145849044"
Received: from nmaideen-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.191.208])
	by fmsmga001.fm.intel.com with ESMTP; 09 May 2017 14:03:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Wed, 10 May 2017 09:03:47 +1200
Message-ID: <9228554.pYdVeCRJpP@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <cad9898d-2994-5643-0917-81d2b2a917eb@linux.intel.com>
References: <1494240698452.53619@mentor.com>
	<CAMKF1sqNov69Q+AQVRqTaseODJ4_jHKNPB1LDNL0bX2qb+DyqA@mail.gmail.com>
	<cad9898d-2994-5643-0917-81d2b2a917eb@linux.intel.com>
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GUI based images
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
X-List-Received-Date: Tue, 09 May 2017 21:03:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 10 May 2017 8:39:58 AM NZST Alexander Kanavin wrote:
> On 05/09/2017 11:19 PM, Khem Raj wrote:
> > I think we should always intend to align the reference stack with
> > whats commonly used in
> > userbases we target to address with project, we will not be serving
> > the project goals and its username if we
> > trim down to packages which are just used for reference, if majority of
> > the community we intend to address uses QT or any other stack for that
> > matter then we should align our requirements accordingly which will be
> > mutually beneficial IMO
> 
> I strongly disagree. Oe-core is not a Greatest Embedded Hits collection 
> or any kind of 'reference stack', and decisions on what goes into it 
> should not be based on how popular it is. 

A number of things have been added to OE-Core because they are widely used, so 
I don't think that's true. However, that doesn't mean that would be used as a 
justification to add Qt5. I'm not even convinced we would need to add Qt5 to 
OE-Core in order to use it as part of a reference UI - the key requirement 
would be for us to commit to being part of its testing and maintenance, 
everything else is just logistics.

> If you do this, you risk overextending the layer, and ending up not doing a
> particularly good job on any of the things it tries to do. It's best to
> allow other layers to  flourish, let the domain specialists do their job and
> decide for themselves how they want to do things, and have a curated list of
> layers that are known to be high quality and approved by Yocto Project.
> 
> If you want qt5, use meta-qt5 and meta-b2qt, both made by people who 
> actually develop the Qt stack itself. End of story.

Your opinion is noted. My opinion is that we ought to be providing a good 
reference that can be used as a basis for real products (regardless of whether 
whatever direction we choose to go is Qt-based or not) - the rest of our stack 
*is* used that way, after all. We regularly get comments about how Sato isn't 
suitable as such a basis, so the expectation is there. I don't think adding 
Wayland support alone will answer that.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

