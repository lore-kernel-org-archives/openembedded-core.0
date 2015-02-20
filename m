Return-Path: <rpjday@crashcourse.ca>
X-Greylist: delayed 612 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 20 Feb 2015 11:14:35 UTC
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 0914A73605;
	Fri, 20 Feb 2015 11:14:35 +0000 (UTC)
Received: from [99.240.204.5] (port=41669 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YOlXV-0000Jw-70; Fri, 20 Feb 2015 06:14:33 -0500
Date: Fri, 20 Feb 2015 06:14:34 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <A21D923B-21A3-428D-A49D-250221761B5A@gmail.com>
Message-ID: <alpine.LFD.2.11.1502200613400.29087@localhost>
References: <BB19F3C7-2950-4E41-BF62-70BFE4FB9C9B@gmail.com>
	<alpine.LFD.2.11.1502200603100.28632@localhost>
	<A21D923B-21A3-428D-A49D-250221761B5A@gmail.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: yocto <yocto@yoctoproject.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] gcc 5.0 recipes available for testing
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
X-List-Received-Date: Fri, 20 Feb 2015 11:14:39 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-751009675-1424430876=:29087"

--8323328-751009675-1424430876=:29087
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Fri, 20 Feb 2015, Khem Raj wrote:

>
> > On Feb 20, 2015, at 3:04 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> > On Fri, 20 Feb 2015, Khem Raj wrote:
> >
> >> Hi All
> >>
> >> Encouraged by help received on testing out glibc 2.21, now  I have put together OE recipes for gcc-5
> >>
> >> GCC 5.0 is in prerelease stage 4 ( open for regression and doc fixes only)
> >>
> >> https://gcc.gnu.org/ml/gcc/2015-01/msg00156.html
> >>
> >> The recipes are available here
> >>
> >> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-5.0
> >>
> >> you just need the topmost commit and then set
> >>
> >> GCCVERSION = "5.0"
> >> SDKGCCVERSION = "5.0"
> >>
> >> in local.conf
> >
> >  i assume this new layer should be used *in place* of the current OE
> > layer for testing purposes?
>
> Not really, you can do following to grab just the patch on top of your working branch ( of course OE-Core master snapshot don’t try on older releases)
>
> git remote add contrib git://git.openembedded.org/openembedded-core-contrib
> git fetch contrib
> git cherry-pick 85cf9c0e77378ca8f93868e9f91001214c8d8f3e

  ah, gotcha.

rday

p.s. i fixed the OE core mailing list address for you. :-)

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-751009675-1424430876=:29087--
