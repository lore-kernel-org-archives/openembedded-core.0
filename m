Return-Path: <tanuk@iki.fi>
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
	[64.147.123.24])
	by mail.openembedded.org (Postfix) with ESMTP id 859AA7DAEB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 12:54:11 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 2F2B35D9;
	Fri, 26 Apr 2019 08:54:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute5.internal (MEProxy); Fri, 26 Apr 2019 08:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=F4l/KYpiaRtLepEcs2YgDUVfa+g02MV7Mc3RIjHqB
	tg=; b=4KCOaf2iMGm3+PuhsKzaQBT+AjiXsrEZOtO1Z+ETgufmnTofAoyT+7ngb
	RfDY/hyvTTgOxNUqWSlpJjIxOisoiXnQQpzey2QQayilhC5J1RMkAJDmw3d70qW7
	XBqaLyDHoeYPUUZetmzSdvdIq//iodcF0nuJR9TO6ZoSx4uXq6BY6VawVqdP3Znj
	6ciq3CVJXUxhwIHQ5BLFXNIQe0yhcbC2zt0ddOE7WKsOBzCcfM0xDJM5OmWz1ltW
	V0XZfUyCWk6oieqlx5KEqbmknLSV/yVy5+KExGrkS6Np99D5+kqiJBmwHHgXyix6
	N4PdE9hJyWha3Y/OR+ugIke4+isdw==
X-ME-Sender: <xms:c__CXJjTBJm3YwzC7oS_kzyC_yxEV8nvnITTOaryNK_j9FviNLVZFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrheeigdehlecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefkuffhvfffjghftggfggfgsehtkeertddtreejnecuhfhrohhmpefvrghnuhcu
	mfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhiqeenucffohhmrghinheplhhisg
	gvrhgrphgrhidrtghomhdpphgrthhrvghonhdrtghomhenucfkphepudelvddrgedtrdel
	hedrfedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhksehikhhirdhfihenuc
	evlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:c__CXGn8ELqyLOoGmfRtPjejVdcKy557GHuqN3_lMo3sFboAgN5aCA>
	<xmx:c__CXAJzx9fzYaMBWFKhe3LKM08i-Fwxojn2UkqlPYeXz4ZUv5uPBw>
	<xmx:c__CXDUh6-8Mxm4lIm0iDdrrL_bhdjdCPgX_OMw6zyJKfog1zqoUUw>
	<xmx:c__CXPm-ARu2j1jHQ_I7xQF0V1mTiBk8DACrwFO9f9_hEkQIDVvQOg>
Received: from laptop (unknown [192.40.95.31])
	by mail.messagingengine.com (Postfix) with ESMTPA id C07F1103CE;
	Fri, 26 Apr 2019 08:54:09 -0400 (EDT)
Message-ID: <ab836c42b9708c98ed658453e7a28620183cf9f8.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Apr 2019 15:53:59 +0300
In-Reply-To: <CAMKF1so+LSFMd8+E1E7O1KGGNt2CZSdbC8sGfjVtNE9iDdNw1A@mail.gmail.com>
References: <cover.1496979431.git.raj.khem@gmail.com>
	<c0e598696af9be3f567751a8641effb08431a7d2.1496979431.git.raj.khem@gmail.com>
	<CAJTo0La6u=Tzzsow5ZYwqmWHY8RzyvgVqT=J4J9UpKy8uKbb9A@mail.gmail.com>
	<CAMKF1srdVU0p-e4gPJx5rNEhk4aQdsiELuz+-1AsD_tgG6b_Gw@mail.gmail.com>
	<1497026309.2435.5.camel@iki.fi>
	<CAMKF1soH0BshzDQorBw7mmXGCgCg_OF=uc5pX1q=J_-ZPqtGMg@mail.gmail.com>
	<49993ca438e2a8b32473ad524404d8927c12d23e.camel@iki.fi>
	<CAMKF1so+LSFMd8+E1E7O1KGGNt2CZSdbC8sGfjVtNE9iDdNw1A@mail.gmail.com>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] pulseaudio: disable PIE flags when hardened flags are enabled
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
X-List-Received-Date: Fri, 26 Apr 2019 12:54:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2019-04-22 at 14:28 -0600, Khem Raj wrote:
> On Mon, Apr 22, 2019 at 6:33 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> 
> > On Fri, 2017-06-09 at 10:10 -0700, Khem Raj wrote:
> > > On Fri, Jun 9, 2017 at 9:38 AM, Tanu Kaskinen <tanuk@iki.fi> wrote:
> > > > On Fri, 2017-06-09 at 13:07 +0000, Khem Raj wrote:
> > > > > On Fri, Jun 9, 2017 at 5:56 AM Burton, Ross <ross.burton@intel.com>
> > wrote:
> > > > > > On 9 June 2017 at 04:41, Khem Raj <raj.khem@gmail.com> wrote:
> > > > > > 
> > > > > > > +SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
> > > > > > > 
> > > > > > 
> > > > > > These tend to go into security-flags.inc, not the recipe.
> > > > > > 
> > > > > 
> > > > > I know that's been the case but I think having a global file is
> > error prone
> > > > > its better to have it in recipe context since it can get attention at
> > > > > upgrade time to test if this has been fixed in new release etc
> > > > 
> > > > Do you mean that there's some bug in pulseaudio, and this is a
> > > > workaround for it? Is the bug that there are textrels? Ross saw
> > > > textrels in pulseaudio before (see the discussion starting at [1]), but
> > > > I was unable to reproduce that. If you give instructions for
> > > > reproducing the problem, I'll see if I can fix pulseaudio (until then
> > > > I'm fine with having a workaround).
> > > > 
> > > 
> > > yes there is a bug lurking when compiling with hardening flags are
> > turned on
> > > so you can do something like
> > > 
> > > in local.conf
> > > 
> > > require conf/distro/include/security_flags.inc
> > > 
> > > then
> > > 
> > > MACHINE=qemux86 bitbake pulseaudio
> > > 
> > > it also happens on arm so qemuarm will reproduce it too.
> > > 
> > > some assembly code is probably missing using GOT relative accesses
> > 
> > Resurrecting this ancient thread... I finally tried to reproduce this
> > problem with the given instructions. No success. Have you still been
> > running into this issue?
> 
> I don’t know for sure if this still exists but we did disable assembly in
> few packages which addresses this issue since in assembly PIC has to be
> respected
> In hand written code
> 
> You might have to check if we did something similar for pulseaudio

There seem to be no such changes to the pulseaudio recipe. Some
upstream fix seems unlikely as well. The only possibly relevant change
that I could find was removing a buggy implementation of reading the
cpuid register (the removed code was replaced with the __get_cpuid()
macro that compilers provide in cpuid.h).

Oh well, if the problem reappears, let me know.

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk


