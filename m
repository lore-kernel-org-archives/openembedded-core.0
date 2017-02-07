Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 3695D605C2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 12:48:01 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20170207124759959_0484;
	Tue, 07 Feb 2017 12:47:59 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=43187 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cb5BZ-0002bA-A4; Tue, 07 Feb 2017 07:47:53 -0500
Date: Tue, 7 Feb 2017 07:47:51 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1486471568.24931.0.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.20.1702070747250.12241@uk63952.mitel.com>
References: <alpine.LFD.2.20.1702070704440.10245@uk63952.mitel.com>
	<1486471568.24931.0.camel@linuxfoundation.org>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how many ways can a recipe place content in its own ${STAGING_BINDIR_CROSS}?
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
X-List-Received-Date: Tue, 07 Feb 2017 12:48:02 -0000
Content-Type: multipart/mixed;
	BOUNDARY="587868445-2021647155-1486471673=:12241"

--587868445-2021647155-1486471673=:12241
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 7 Feb 2017, Richard Purdie wrote:

> On Tue, 2017-02-07 at 07:21 -0500, Robert P. J. Day wrote:
> > ok, that's easy enough, but let's look at "apr" now. if i look at
> > what
> > apr installs under its sysroot and specifically under the same
> > usr/bin
> > directory, i see:
> >
> > $ tree usr/bin
> > usr/bin
> > └── crossscripts
> >     └── apr-1-config
> >
> >   so how did *that* script come to be under there? if i look at the
> > apr_1.5.2.bb recipe, there's no manual installation of that script as
> > there was with apache2. rather, there's all this:
>
> Look at binconfig.bbclass which I'd bet apr inherits (although I didn't
> actually look).

  that is exactly what it inherits, thanks, that clears it up.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--587868445-2021647155-1486471673=:12241--
