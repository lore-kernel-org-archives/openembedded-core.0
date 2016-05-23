Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E75B665CC3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 16:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4NGdaaD031215; Mon, 23 May 2016 17:39:36 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DMkQTUvKNbwO; Mon, 23 May 2016 17:39:36 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4NGdUlu031207
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 May 2016 17:39:31 +0100
Message-ID: <1464021570.9570.25.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 23 May 2016 17:39:30 +0100
In-Reply-To: <57430774.7000805@linux.intel.com>
References: <5f5c927d9a012122af814032161f3f12b476a442.1464004128.git.jussi.kukkonen@intel.com>
	<5dbd238f28ac08a748bbdcd549286a8d48da9c2c.1464004128.git.jussi.kukkonen@intel.com>
	<5742FDE2.1090306@linux.intel.com>
	<1464009007.9570.21.camel@linuxfoundation.org>
	<57430774.7000805@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 5/5] matchbox-keyboard: Upgrade
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
X-List-Received-Date: Mon, 23 May 2016 16:39:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-05-23 at 16:36 +0300, Alexander Kanavin wrote:
> On 05/23/2016 04:10 PM, Richard Purdie wrote:
> > > > -SRCREV = "ebc330eac8b9d38e9aef9f01e7241c904bd01073"
> > > > +SRCREV = "69d03e2aceb79cf7a616c07f8e0be4e1f9f7976b"
> > > >    PV = "0.0+git${SRCPV}"
> > > 
> > > This is a good moment to start using git version tags instead of
> > > just
> > > updating commit ids.
> > > 
> > > Let's bring down the amount of 'unknown' upstream versions to
> > > zero or
> > > close to it:
> > > 
> > > http://recipes.yoctoproject.org/rrs/recipes/2.2/M1/?upstream_stat
> > > us=U
> > > nknown#
> > 
> > Sadly, "tags" need a network to resolve them and hence using them
> > means
> > the metadata doesn't work standalone. We can't do that.
> 
> I need to clarify: I would like the version number in PV to match an 
> existing upstream version tag. So that the upstream version check
> works 
> correctly.
> 
> The actual git revision for builds will continue to be determined by 
> commit ids in SRCREV.

That does indeed make sense. I'd be happy to see some release tarballs
for some of these things and some upstream version tags...

Cheers,

Richard

