Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id DCF5570A30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 13:25:03 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20140811132503146
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 13:25:03 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [69.196.158.250] (port=38358 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XGpaw-00018O-D4; Mon, 11 Aug 2014 09:25:02 -0400
Date: Mon, 11 Aug 2014 09:24:58 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1407763417.22187.12.camel@ted>
Message-ID: <alpine.LFD.2.11.1408110924260.11599@localhost>
References: <alpine.LFD.2.11.1408110909060.11035@localhost>
	<1407763417.22187.12.camel@ted>
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
Subject: Re: should all RDEPENDS always have an attached package name?
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
X-List-Received-Date: Mon, 11 Aug 2014 13:25:04 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 11 Aug 2014, Richard Purdie wrote:

> On Mon, 2014-08-11 at 09:11 -0400, Robert P. J. Day wrote:
> >   according to yocto ref manual, all uses of RDEPENDS should be
> > suffixed with a package name (normally, _${PN}, of course), but i just
> > noticed that the buildtools-tarball.bb recipe file contains:
> >
> >   RDEPENDS = "${TOOLCHAIN_HOST_TASK}"
> >
> > i suspect that still works just fine, but it does disagree with the
> > rather adamant admonition in the ref manual.
>
> The buildtools-tarball doesn't have any packages so in this
> particular case, it is acceptable (and accepted by bitbake and the
> QA tests).

  ah, i should have realized this was a special case.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


