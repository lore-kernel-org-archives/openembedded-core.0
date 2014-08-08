Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 03D3265CD8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 15:14:59 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20140808151459632
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Aug 2014 15:14:59 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=42714 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XFlsd-0005i7-0C; Fri, 08 Aug 2014 11:14:55 -0400
Date: Fri, 8 Aug 2014 11:14:50 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Christopher Larson <clarson@kergoth.com>
In-Reply-To: <CABcZANn2DUaCHavWVPhFnoOgEQM9nF8fiWAyfNcD4e5i89xB8A@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1408081112180.18468@localhost>
References: <alpine.LFD.2.11.1408080629500.13627@localhost>
	<CABcZANn2DUaCHavWVPhFnoOgEQM9nF8fiWAyfNcD4e5i89xB8A@mail.gmail.com>
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
Subject: Re: how does SCR_URI_OVERRIDES_PACKAGE_ARCH affect building tslib?
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
X-List-Received-Date: Fri, 08 Aug 2014 15:15:04 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-243555887-1407510893=:18468"

--8323328-243555887-1407510893=:18468
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 8 Aug 2014, Christopher Larson wrote:

>
> On Fri, Aug 8, 2014 at 3:35 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   looking at SRC_URI_OVERRIDES_PACKAGE_ARCH variable, and i notice
> first that there is only one usage of it in all of oe-core (tslib),
> but i'm confused as to what value it has.
>
>   the ref manual reads:
>
> "By default, the OpenEmbedded build system automatically detects
> whether SRC_URI contains files that are machine-specific. If so, the
> build system automatically changes PACKAGE_ARCH. Setting this variable
> to "0" disables this behavior."
>
>   first, i'm not sure what about the tslib SRC_URI appears to be
> machine-specific. also, just for fun, i commented out that line in the
> tslib .bb file, and did a global "bb show" to see what difference it
> made, and i saw no difference at all. so what exactly is the purpose
> of that line in that recipe? what difference should i be able to see
> with versus without it? thanks.
>
> Any file:// file in an SRC_URI can become machine specific if placed
> in a machine subdir in the search path. That said, I don't know why
> the automatic behavior of setting package_arch in that case is
> something that needs to be disabled for tslib. I'd suggest using
> git-blame to examine the commits which added this variable.

  should have done that first thing ... "git blame" shows that line
goes all the way back to 2006, when tslib *did* have machine-specific
files under tslib/. now that that's no longer true, i suspect that
line can be tossed.

  pity ... i was just looking for a single recipe that used
SRC_URI_OVERRIDES_PACKAGE_ARCH, and now i have none. i haz a sad.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-243555887-1407510893=:18468--
