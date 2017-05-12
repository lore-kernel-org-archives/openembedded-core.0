Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF6C60111
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 18:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7221520B86;
	Fri, 12 May 2017 18:15:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Ok925wbvEsrE; Fri, 12 May 2017 18:15:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 38ED220069;
	Fri, 12 May 2017 18:15:08 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BF9DD1624C1; Fri, 12 May 2017 14:15:07 -0400 (EDT)
Date: Fri, 12 May 2017 14:15:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170512181507.GJ28053@denix.org>
References: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C5FA@ESS-EX01.essvote.corp.local>
	<7f60f107-1157-3991-b5bc-0fa4564e6905@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C67F@ESS-EX01.essvote.corp.local>
	<6f1e8992-7469-12bc-1307-2a9d0ca7d61e@linux.intel.com>
	<811d49ba-ac83-5a52-6687-e3447d06659b@mlbassoc.com>
	<abc26baf-5417-7565-cb69-08aff5559e95@linux.intel.com>
	<CAMKF1sqvc3YsrMNxkyv1ZHXF82Uy1hYRUL4sduaayYcf1Le5_g@mail.gmail.com>
	<655290B7709079438B7932553958E60D16D2C9F2@ESS-EX01.essvote.corp.local>
	<CAMKF1sr8ZypyM4mk=s1-W9oajRr952x7iVe9L8eDu-Hddthzpg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr8ZypyM4mk=s1-W9oajRr952x7iVe9L8eDu-Hddthzpg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Gary Thomas <gary@mlbassoc.com>
Subject: Re: [RFC PATCH 00/10] Add openssl 1.1
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
X-List-Received-Date: Fri, 12 May 2017 18:15:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 10, 2017 at 02:08:26PM -0700, Khem Raj wrote:
> On Wed, May 10, 2017 at 1:48 PM, Davis, Michael
> <michael.davis@essvote.com> wrote:
> > I think most of the major distros have either switched or are in the process
> > this year.
> >
> 
> are there some info on the policy decisions of other distros ?
> we should try to follow the suite then

Khem,

https://wiki.debian.org/OpenSSL-1.1

Binary packages have X.Y version in the package name:
libssl1.1_1.1.0c-2~bpo8+1_amd64.deb
libssl1.0.0_1.0.2k-1~bpo8+1_amd64.deb

As of OE, we've handled such updates with incompatible API in the past 
similarly - gstreamer vs. gstreamer010

-- 
Denys


> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Khem
> > Raj
> > Sent: Wednesday, May 10, 2017 3:36 PM
> > To: Alexander Kanavin; Gary Thomas; openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [RFC PATCH 00/10] Add openssl 1.1
> >
> >
> >
> >
> >
> > On Wed, May 10, 2017 at 12:34 PM Alexander Kanavin
> > <alexander.kanavin@linux.intel.com> wrote:
> >
> > On 05/10/2017 09:56 PM, Gary Thomas wrote:
> >> Why not do this in a "softer" way - make the new 1.1 package have the
> >> obscured name (and not be preferred by default)?  That way existing
> >> uses of the older 1.0 package can continue but users can migrate to
> >> 1.1 as they see fit?
> >
> > I have an answer which you might not particularly like. But here goes:
> >
> > What will actually happen is that no one will do anything to port their
> > stuff until it's time to remove 1.0 because upstream has EOLd it. And
> > then there'll still be complaints that more time is needed for the
> > transition. I'd like to gently push people to plan this transition
> > already now - and it's as gentle as it can be: if you pull from master
> > and your things no longer build, make one simple change and they will.
> > It's part and parcel of being on the bleeding edge, or rebasing to the
> > new yocto release: not everything works exactly as before, and most
> > components are newer and different and not always fully compatible.
> >
> >
> >
> >
> >
> > It is a cross distro item really we should find out what other Linux
> > distributions are doing about it moving forward unless major distros also
> > have same policy there won't be much momentum this would gain among the
> > packages ecosystems this could also help in sharing the porting burden
> >
> >
> >
> > The other reason is that it's more work for me: I would have to update
> > everything in oe-core to use the new recipe, instead of fixing just a
> > few recipes that need to stay with 1.0. And then again the same thing
> > will happen when 1.2 is out.
> >
> > Alex
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

