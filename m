Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 5C00F719A9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 07:06:05 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20161025070605090_0684;
	Tue, 25 Oct 2016 07:06:05 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=46934 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1byvo6-0002Uj-9s; Tue, 25 Oct 2016 03:05:58 -0400
Date: Tue, 25 Oct 2016 03:05:00 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Christopher Larson <clarson@kergoth.com>
In-Reply-To: <alpine.LFD.2.20.1610250246460.19688@localhost.localdomain>
Message-ID: <alpine.LFD.2.20.1610250303460.20837@localhost.localdomain>
References: <alpine.LFD.2.20.1610241644480.15919@localhost.localdomain>
	<CABcZANnYLS0pfSpdzf3NVV4KEg_88b9mPark9gpstJUFHZTzxQ@mail.gmail.com>
	<alpine.LFD.2.20.1610250246460.19688@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: most efficient way to map perl RH rpms to OE package names?
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
X-List-Received-Date: Tue, 25 Oct 2016 07:06:06 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-759533550-1477379102=:20837"

--8323328-759533550-1477379102=:20837
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 25 Oct 2016, Robert P. J. Day wrote:

> On Mon, 24 Oct 2016, Christopher Larson wrote:
>
> >
> > On Mon, Oct 24, 2016 at 1:53 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >         i've just been handed a list of about 200 perl packages by their
> >       centos rpm names, and i want to map most, if not all, of them to their
> >       equivalent OE package names.
> >
> >        my first instinct (based on not having used a lot of perl OE
> >       packages) is to add both "perl" and "perl-modules" to IMAGE_INSTALL,
> >       just to fetch and build every possible module available through the OE
> >       perl recipe -- that will at least give me an idea of what's available.
> >
> >         next, i can see the pattern in some OE package names -- i've
> >       verified that the Time::HiRes package is available in OE as
> >       perl-module-time-hires, which i assume is part of the dynamic naming
> >       being done in perl_5.22.1.bb.
> >
> >        am i approaching this the right way?
> >
> >
> > Could also bitbake perl, then use oe-pkgdata-util to locate the
> > actual perl modules in the packages, i.e. */Time/HiRes.pm.
>
>   i once wrote a wiki page on "bb", distinguishing between queries
> you could make before you did a build, versus queries that needed a
> build. it seems like oe-pkgdata-util needs a completed build for
> pretty much everything, do i have that right?

  never mind, i just read this snippet from the YP ref manual:

"You can use the oe-pkgdata-util command-line utility to query
PKGDATA_DIR and display various package-related information. When you
use the utility, you must use it to view information on packages that
have already been built."

so i'm assuming that means for *all* oe-pkgdata subcommands, no
exceptions.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-759533550-1477379102=:20837--
