Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id ED65771A3E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 14:44:47 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20170203144445192_0684;
	Fri, 03 Feb 2017 14:44:45 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=45316 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cZf6L-0005wv-W2; Fri, 03 Feb 2017 09:44:38 -0500
Date: Fri, 3 Feb 2017 09:44:35 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1486131492.14144.70.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.20.1702030944190.5156@localhost.localdomain>
References: <alpine.LFD.2.20.1702030641310.2549@localhost.localdomain>
	<1486131492.14144.70.camel@linuxfoundation.org>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: whatever happened to a proposal for "read-only" sstate?
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
X-List-Received-Date: Fri, 03 Feb 2017 14:44:49 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-2075003011-1486133078=:5156"

--8323328-2075003011-1486133078=:5156
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 3 Feb 2017, Richard Purdie wrote:

> On Fri, 2017-02-03 at 06:45 -0500, Robert P. J. Day wrote:
> >   for purposes of teaching, i wanted to check into the feasibility of
> > having students take advantage of a single shared state cache, but
> > still have the option of building whatever source they needed in
> > their
> > own *personal* sstate cache.
> >
> >   i found this reference from 2014:
> >
> > http://lists.openembedded.org/pipermail/openembedded-core/2014-August
> > /096486.html
> >
> > but it seems clear nothing became of it; there's certainly no
> > .bbclass
> > file that matches that.
> >
> >   what are the options for setting up something like this? or is that
> > already supported and i'm just not seeing it?
>
> It was never merged as its not really necessary, you can do this with
> existing functionality.
>
> Just point SSTATE_MIRRORS at the common shared directory and
> SSTATE_DIR at the directory you want to be the personal one.

  ah, and that solves my problem entirely. thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-2075003011-1486133078=:5156--
