Return-Path: <mac@mcrowe.com>
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
	by mail.openembedded.org (Postfix) with ESMTP id 848587CB36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 13:25:23 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id woLqgibxfx6b6woLrgOpf3; Thu, 21 Feb 2019 13:25:24 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=T4GiscCQ c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=CFTnQlWoA9kA:10 a=qx-tHiomXqrDvtMcUc8A:9
	a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1gwoLq-0007H5-Oc; Thu, 21 Feb 2019 13:25:22 +0000
Date: Thu, 21 Feb 2019 13:25:22 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190221132522.3c43l5bmk5m2cvud@mcrowe.com>
References: <20190111164951.8329-1-mac@mcrowe.com>
	<47731964b9ae52ac23e67b92bbfd1a1ad3e2acc0.camel@linuxfoundation.org>
	<20190111165944.gussrefs6j5o6ffq@mcrowe.com>
	<20190123162759.yjdev2mpx24zwbaf@mcrowe.com>
	<20190220164729.4rkhazvhtyzwkeh3@mcrowe.com>
	<5471c44e078f61500d0d0801e3c9c43a093d6006.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <5471c44e078f61500d0d0801e3c9c43a093d6006.camel@linuxfoundation.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfMUrpuTM5UiNbSbcnclv0N4JhrtgdTyAorUcHlD1icp8/ReV5HkY2Wd02d1dMVgmd5JRNM9nn/aXkCrvrQ3zNrFnOa1xEftgPnPzq9t3vX3j/E2cbySF
	bv00LaZ9lXBd0oUzCiw8cD2y9U22ydbm5mDL6bAtYyDq/LecOwOXRhWO
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] glibc: Separate out AArch64 multilib loader symlink creation
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
X-List-Received-Date: Thu, 21 Feb 2019 13:25:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thursday 21 February 2019 at 13:01:27 +0000, Richard Purdie wrote:
> On Wed, 2019-02-20 at 16:47 +0000, Mike Crowe wrote:
> > On Wednesday 23 January 2019 at 16:27:59 +0000, Mike Crowe wrote:
> > > 
> > > Does the lack of response mean that both approaches are horrendous?
> > > If so, do you have any better ideas?
> > 
> > There doesn't seem to be much interest in this one.
> > 
> > The only other idea I've had is to create the symlink at rootfs-creation
> > time. However, that seems to be detaching it too much from glibc, which
> > would cause confusion.
> > 
> > I can apply one of my fixes locally (we currently have some far uglier
> > hacks than these that I'd like to remove), but I'd really rather not have
> > to diverge from upstream this much.
> 
> Sorry for the lack of feedback.
> 
> I'm fairly strongly against a separate aarch64 only recipe for this.
> Realistically we therefore have to fix this in the existing
> class/code/recipe.
> 
> The changes you sent previously didn't look that horrific, did you find
> a working version of that?
> 
> I'm wondering if we can come up with something which works and
> hopefully we can spot some way to then clean it up to be a bit nicer...
> 
> The delay was that I was going to try and come up with something but
> that hasn't happened yet. If you have a horrific non-separate recipe
> version that is complete, we can see if we can do anything to improve
> it.

I had suspected that was the reason for the delay.

I shall knock my modifications to glibc-package.inc into shape and send a
tested patch. I've already improved it a little compared to the version I
sent previously.

Thanks for the response.

Mike.

