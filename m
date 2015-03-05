Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id A9562738BD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 08:06:15 +0000 (UTC)
Received: from [99.240.204.5] (port=51839 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YTQnQ-0002SC-SX for openembedded-core@lists.openembedded.org;
	Thu, 05 Mar 2015 03:06:16 -0500
Date: Thu, 5 Mar 2015 03:06:13 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@Device-040570
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
In-Reply-To: <alpine.LFD.2.11.1503050259530.21019@Device-040570>
Message-ID: <alpine.LFD.2.11.1503050304230.21427@Device-040570>
References: <alpine.LFD.2.11.1503050259530.21019@Device-040570>
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
X-List-Received-Date: Thu, 05 Mar 2015 08:06:15 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 5 Mar 2015, Robert P. J. Day wrote:

>
>   EXTRA_OECONF_append = "--with-python=${WORKDIR}/python"
>                          ^??
>
> does that not require a leading space there?

  just did a quick scan of other possibilities where a leading space
might be needed where _append is being used to append command-line
options, and here's the only other one i could find:

meta/recipes-multimedia/libpng/libpng_1.6.16.bb:EXTRA_OECONF_append_class-target
= " ${@bb.utils.contains("TUNE_FEATURES", "neon",
"--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"

i'll let someone else apply those if they're actually needed.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


