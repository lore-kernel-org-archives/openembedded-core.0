Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 7065A65D57
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 08:10:29 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20140806081029890
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Aug 2014 08:10:29 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=52080 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XEwIi-0000Rz-K4; Wed, 06 Aug 2014 04:10:24 -0400
Date: Wed, 6 Aug 2014 04:10:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1407311931.6981.91.camel@ted>
Message-ID: <alpine.LFD.2.11.1408060409040.1325@localhost>
References: <alpine.LFD.2.11.1408060354570.736@localhost>
	<1407311931.6981.91.camel@ted>
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
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: comment trails off in archiver.bbclass
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
X-List-Received-Date: Wed, 06 Aug 2014 08:10:37 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 6 Aug 2014, Richard Purdie wrote:

> On Wed, 2014-08-06 at 03:56 -0400, Robert P. J. Day wrote:
> >   currently doing more proofreading and note-taking, and there's this
> > in archiver.bbclass:
> >
> >         # The libtool-native's do_configure will remove the
> >         # ${STAGING_DATADIR}/aclocal/libtool.m4, so we can't re-run the
> >         # do_configure, we archive the already configured ${S} to
> >         # instead of.
> >
> >   "instead of" what? if someone wants to finish that comment, i can
> > add it into the current patch.
>
> I suspect you need to delete " of".

  and, i suspect, the preceding "to" as well, i'm guessing. thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


