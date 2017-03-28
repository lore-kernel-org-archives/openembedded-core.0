Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 60D8977A57
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 10:55:10 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20170328105505271_0684;
	Tue, 28 Mar 2017 10:55:05 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=34372 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1csom9-0003oQ-S0; Tue, 28 Mar 2017 06:54:57 -0400
Date: Tue, 28 Mar 2017 06:54:55 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
In-Reply-To: <e91ff8ce530942ef8f6711d3c7726f36@XBOX02.axis.com>
Message-ID: <alpine.LFD.2.20.1703280651250.4321@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703251400150.8339@localhost.localdomain>
	<1490621485.13980.263.camel@linuxfoundation.org>
	<alpine.LFD.2.20.1703280554060.2771@uk63952.mitel.com>
	<e91ff8ce530942ef8f6711d3c7726f36@XBOX02.axis.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: Replace "if test" file tests with POSIX file tests
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
X-List-Received-Date: Tue, 28 Mar 2017 10:55:11 -0000
Content-Type: multipart/mixed; BOUNDARY="587868445-1356616314-1490698497=:4321"

--587868445-1356616314-1490698497=:4321
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Tue, 28 Mar 2017, Peter Kjellerstedt wrote:

> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Robert P. J. Day
> > Sent: den 28 mars 2017 11:57
> > To: Richard Purdie
> > Cc: OE Core mailing list
> > Subject: Re: [OE-core] [PATCH] classes: Replace "if test" file tests
> > with POSIX file tests
> >
> > On Mon, 27 Mar 2017, Richard Purdie wrote:
> >
> > > On Sat, 2017-03-25 at 14:03 -0400, Robert P. J. Day wrote:
> > > > In entire meta/classes/ directory, replace shell tests of the form
> > > > "if test -? ..." with POSIX tests of the form "if [ -? ...
> > > >
> > > > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> > > >
> > > > ---
> > > >
> > > >   as i cannot abide those silly "if test" constructs, i zipped
> > > > through
> > > > and changed them to POSIX form. is there any objection to this kind
> > > > of
> > > > cleanup? next up ... all those "x${VAR} = x" tests ...
> > >
> > > I've merged most of this. There were pieces of the diff that simply
> > > didn't apply so I skipped them.
> > >
> > > The reason I've taken what applied is that this is very expensive
> > > for us to test right now and I made the most of the testing time I
> > > had on the weekend. The issue is changes to the core classes rebuild
> > > everything so we can't reuse sstate and the tests are much slower.
> > >
> > > We're running late with M3 rc2 but just about to build it and I
> > > thought it was worth getting some of this in rather none at all.
> > > Please do figure out the remaining pieces and send them and we may
> > > or may not tweak the remaining bits in M4.
> >
> >   my next cleanup was going to be (as mentioned above) replace all
> > those silly "x${VAR} = x" string tests with either of:
> >
> >   [ -z "${VAR}" ]
> >   [ -n "${VAR}" ]
>
> There is no reason to have the -n in there. This is better:
>
>   [ -z "${VAR}" ]
>   [ "${VAR}" ]

  i'm fine with that, as long as it's officially POSIX. that also
suggests the alternate tests:

  [ "${VAR}" ]
  [ ! "${VAR}" ]

i am happy to defer to the will of the masses, it's just nice to have
a style standard one way or the other.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--587868445-1356616314-1490698497=:4321--
