Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id A448977A53
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 09:56:51 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20170328095650212_0684;
	Tue, 28 Mar 2017 09:56:50 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=56891 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1csnrn-0006vG-N3; Tue, 28 Mar 2017 05:56:43 -0400
Date: Tue, 28 Mar 2017 05:56:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1490621485.13980.263.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.20.1703280554060.2771@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703251400150.8339@localhost.localdomain>
	<1490621485.13980.263.camel@linuxfoundation.org>
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
X-List-Received-Date: Tue, 28 Mar 2017 09:56:52 -0000
Content-Type: multipart/mixed; BOUNDARY="587868445-162848380-1490695003=:2771"

--587868445-162848380-1490695003=:2771
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 27 Mar 2017, Richard Purdie wrote:

> On Sat, 2017-03-25 at 14:03 -0400, Robert P. J. Day wrote:
> > In entire meta/classes/ directory, replace shell tests of the form
> > "if test -? ..." with POSIX tests of the form "if [ -? ...
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> >   as i cannot abide those silly "if test" constructs, i zipped
> > through
> > and changed them to POSIX form. is there any objection to this kind
> > of
> > cleanup? next up ... all those "x${VAR} = x" tests ...
>
> I've merged most of this. There were pieces of the diff that simply
> didn't apply so I skipped them.
>
> The reason I've taken what applied is that this is very expensive
> for us to test right now and I made the most of the testing time I
> had on the weekend. The issue is changes to the core classes rebuild
> everything so we can't reuse sstate and the tests are much slower.
>
> We're running late with M3 rc2 but just about to build it and I
> thought it was worth getting some of this in rather none at all.
> Please do figure out the remaining pieces and send them and we may
> or may not tweak the remaining bits in M4.

  my next cleanup was going to be (as mentioned above) replace all
those silly "x${VAR} = x" string tests with either of:

  [ -z "${VAR}" ]
  [ -n "${VAR}" ]

is there time to get that in before the next freeze? if so, i can do
it quickly for testing; if not, i guess it can just wait.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--587868445-162848380-1490695003=:2771--
