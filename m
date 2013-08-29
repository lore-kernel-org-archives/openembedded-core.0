Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 7C9656B3C7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 11:56:50 +0000 (UTC)
Received: from [69.196.158.250] (port=43933 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1VF0qJ-0005nh-51; Thu, 29 Aug 2013 07:56:51 -0400
Date: Thu, 29 Aug 2013 07:56:48 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Phil Blundell <pb@pbcl.net>
In-Reply-To: <1377776979.28077.88.camel@phil-desktop.brightsign>
Message-ID: <alpine.DEB.2.02.1308290755290.5634@oneiric>
References: <alpine.DEB.2.02.1308290628130.4283@oneiric>
	<20130829104913.GM3544@jama>
	<alpine.DEB.2.02.1308290657140.5063@oneiric>
	<20130829112725.GN3544@jama>
	<alpine.DEB.2.02.1308290733210.5515@oneiric>
	<1377776979.28077.88.camel@phil-desktop.brightsign>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
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
Subject: Re: appears to be inconsistency re: base-files between oe-core and meta-angstrom
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
X-List-Received-Date: Thu, 29 Aug 2013 11:56:50 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 29 Aug 2013, Phil Blundell wrote:

> On Thu, 2013-08-29 at 07:37 -0400, Robert P. J. Day wrote:
> >   distroless. i realize i *could* set a value for DISTRO, but it would
> > seem that i shouldn't have to in order to avoid a build error.
>
> Well, either you're using angstrom or you aren't.  If you do want to
> use it then you ought to set DISTRO appropriately, and if you don't
> want to use it then you probably oughtn't to have the angstrom layer
> included at all.
>
> Trying to use the angstrom .bbappends and files with a different (or
> no) distro configuration will give you a set of metadata that's
> neither one thing nor the other and, even if you didn't get a build
> error, there's no guarantee that the resulting image would actually
> work.

  ah, gotcha. so if i want to live dangerously, i can select
"angstrom-next"?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

