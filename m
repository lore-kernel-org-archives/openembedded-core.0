Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7D440735C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 17:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1JH0JI5006970; Thu, 19 Feb 2015 17:00:19 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gtp9mShnKXLG; Thu, 19 Feb 2015 17:00:19 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1JH06ES006952
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Feb 2015 17:00:17 GMT
Message-ID: <1424365206.11836.33.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 19 Feb 2015 17:00:06 +0000
In-Reply-To: <3100587.NflBacsYxf@peggleto-mobl5.ger.corp.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
	<CADkTA4NYnGhGUmi9ZSZZU3PYf7wA2Zj-u7HM8GhQbO5sU9AoTg@mail.gmail.com>
	<3100587.NflBacsYxf@peggleto-mobl5.ger.corp.intel.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/15] devtool and externalsrc improvements
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
X-List-Received-Date: Thu, 19 Feb 2015 17:00:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-02-19 at 16:55 +0000, Paul Eggleton wrote:
> On Thursday 19 February 2015 11:47:01 Bruce Ashfield wrote:
> > On Thu, Feb 19, 2015 at 11:39 AM, Paul Eggleton
> > <paul.eggleton@linux.intel.com> wrote:
> > > I've been attempting to enable usage of devtool with the kernel (which
> > > effectively means using the externalsrc class with the kernel). This
> > > doesn't really work yet due to lack of handling the kernel configuration,
> > 
> > I've always insisted/argued and designed in that externalsrc shouldn't touch
> > the kernel configuration at all.
> > 
> > You are building a tree that is completely managed outside of the build
> > system, and getting the kernel configuration in place is part of that
> > management.
> > 
> > So I'm not convinced it is a problem that needs to be solved.
> 
> So, externalsrc still doesn't touch the configuration, and it is not my plan to 
> make it do so. However, users do need some way of setting up that configuration 
> when checking out those sources for the first time, and if that's to be of any 
> use to someone who just wants to make some minor changes, it should be the 
> exact same configuration you get when you build the recipe as normal. That is 
> what I believe "devtool modify" (at least with -x) should be doing, given that 
> it is one means you can use to set up a development environment if you do not 
> have one already.
> 
> We can certainly talk about the mechanism and work out the best way to do it, 
> such that it fits in with how linux-yocto works and meets user expectations. My 
> intent with this series was to get us to the point where we can at least 
> experiment and have that discussion.

Having the option of triggering the standard configuration process as
per a usual linux-yocto build but on an external direction, standalone
may be the best option?

Cheers,

Richard


