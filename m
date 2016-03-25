Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3DF186B6EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 11:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2PBT5kx032163; Fri, 25 Mar 2016 11:29:05 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lXIQzOMGpacp; Fri, 25 Mar 2016 11:29:05 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2PBSx1k032160
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 25 Mar 2016 11:29:00 GMT
Message-ID: <1458905339.3073.53.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Fri, 25 Mar 2016 11:28:59 +0000
In-Reply-To: <20160325105025.GC2555@jama>
References: <1456610987-17836-1-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0LaVL04OQaipNFn1hyCGruFZ7itmrxH00i=L+OkcsZexQw@mail.gmail.com>
	<20160325105025.GC2555@jama>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] base.bbclass: Introduce EXTRA_CONF_PACKAGECONFIG variable
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
X-List-Received-Date: Fri, 25 Mar 2016 11:29:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-03-25 at 11:50 +0100, Martin Jansa wrote:
> On Wed, Mar 02, 2016 at 12:40:31PM +0000, Burton, Ross wrote:
> > On 27 February 2016 at 22:09, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> > 
> > > * add separate variable for configuration options generated from
> > >   PACKAGECONFIG setting, this helps other bbclasses and recipes
> > >   to take advantage of PACKAGECONFIG mechanism, without including
> > >   other options from EXTRA_OECONF
> > > * e.g. meta-qt5 recipes are abusing EXTRA_OECONF to get options
> > >   from PACKAGECONFIG:
> > >   EXTRA_QMAKEVARS_PRE +=
> > >   but with
> > >   conf/distro/include/no-static-libs.inc
> > >   it means getting --disable-static as invalid option inside
> > >   EXTRA_QMAKEVARS_PRE as reported by Alexandre Belloni who tried
> > >   to use poky with meta-qt5.
> > > * once we migrate all bbclasses and recipes to
> > > EXTRA_CONF_PACKAGECONFIG
> > >   we should also restrict EXTRA_OECONF append only to
> > > autotools.bbclass
> > >   like I did for cmake.bbclass
> > > 
> > 
> > Sorry, some of us have been a bit busy trying to get M3 stable. 
> >  This does
> > look good and I'm for squeezing it into M3.
> 
> Any update on squeezing this?
> 
> meta-qt5 is still broken with default poky config

I'm a little confused, was there going to be another version with some
tweaked variable names?

Cheers,

Richard

