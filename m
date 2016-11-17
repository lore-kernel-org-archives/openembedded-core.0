Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id E5AD560720;
	Thu, 17 Nov 2016 18:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7D3C920AED;
	Thu, 17 Nov 2016 18:50:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 6Bzce-ND7ndQ; Thu, 17 Nov 2016 18:50:05 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4C1A9204AF;
	Thu, 17 Nov 2016 18:50:02 +0000 (UTC)
Received: by gandalf.denix.org (Postfix, from userid 1000)
	id 9FDCB1621A5; Thu, 17 Nov 2016 13:50:01 -0500 (EST)
Date: Thu, 17 Nov 2016 13:50:01 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20161117185001.GE26131@denix.org>
References: <CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com>
	<4181f25d-a2bc-bb94-2b94-4d18ad654ab8@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4181f25d-a2bc-bb94-2b94-4d18ad654ab8@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Enabling uninative by default in oe-core?
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
X-List-Received-Date: Thu, 17 Nov 2016 18:50:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 17, 2016 at 10:06:46AM -0800, Khem Raj wrote:
> 
> 
> On 11/17/16 9:31 AM, Burton, Ross wrote:
> > Hi,
> > 
> > Background: uninative is a class that downloads a precompiled host glibc for
> > use in the sysroot, thus isolating the native sysroot from the host
> > environment.  This means greater sstate reuse, as instead of native builds
> > being dependent on the host system they're able to be shared between all
> > hosts.  There is a reference tarball hosted on www.yoctoproject.org
> > <http://www.yoctoproject.org>, and the URL can be overridden by distros if you
> > would prefer to build your own.
> > 
> > We enable this in Poky so that we get greater reuse on the autobuilders, and
> > due to some issues with the C++ ABI the eSDK generation in master now requires
> > uninative to be enabled.  The question is: do we now enable uninative by
> > default in oe-core's nodistro (pointing at the yoctoproject tarball), or do we
> > keep it disabled by default and require the user to enable uninative if they
> > wish to build an eSDK?
> > 
> > Personally I'm torn: I don't like eSDK not working out of the box, but I don't
> > really like oe-core nodistro depending on uninative.  Though enabling
> > uninative globally does mean everything works out of the box, so following the
> > principle of Least Surprise that's what we should do.
> 
> If we are supporing e-SDK in OE-Core then we should enable uninative too
> on the same lines.
> 
> It does improve the user experience so I am in favor of adding it
> unconditionally. May be tarball can be hosted on oe mirrors as well for
> redundancy

I still believe this new feature is moving to become mandatory a bit too 
soon...

-- 
Denys

