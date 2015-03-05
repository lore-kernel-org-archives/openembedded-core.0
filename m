Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 681A765C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 08:40:15 +0000 (UTC)
Received: from [99.240.204.5] (port=52035 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YTRKK-0004YJ-6J; Thu, 05 Mar 2015 03:40:16 -0500
Date: Thu, 5 Mar 2015 03:40:12 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@Device-040570
To: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <54F80F8A.4040909@windriver.com>
Message-ID: <alpine.LFD.2.11.1503050324320.24445@Device-040570>
References: <alpine.LFD.2.11.1503050259530.21019@Device-040570>
	<54F80F8A.4040909@windriver.com>
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
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: "_append" error in gdb-cross-canadian.inc?
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
X-List-Received-Date: Thu, 05 Mar 2015 08:40:16 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 5 Mar 2015, Robert Yang wrote:

> On 03/05/2015 04:01 PM, Robert P. J. Day wrote:
> >
> >    EXTRA_OECONF_append = "--with-python=${WORKDIR}/python"
> >                           ^??
> >
> > does that not require a leading space there?
>
> It is required, this one doesn't cause error is because in gdb-common.inc:
>
> EXTRA_OECONF = "[snip] \
>                --disable-rpath \
>                "
>
> If:
>
> EXTRA_OECONF = "[snip] \
>                 --disable-rpath"
>
> Then there would be errors.

  yeah ... that's not the sort of luck i'd like to count on on a
regular basis. :-)

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

