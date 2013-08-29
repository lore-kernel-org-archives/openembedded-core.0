Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 15B756B260
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 11:57:39 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7TC9trx010302; Thu, 29 Aug 2013 13:09:55 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id q-2YW489ykG1; Thu, 29 Aug 2013 13:09:55 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7TC9okD010288
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 29 Aug 2013 13:09:52 +0100
Message-ID: <1377777433.32502.71.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>
Date: Thu, 29 Aug 2013 12:57:13 +0100
In-Reply-To: <1377776979.28077.88.camel@phil-desktop.brightsign>
References: <alpine.DEB.2.02.1308290628130.4283@oneiric>
	<20130829104913.GM3544@jama>
	<alpine.DEB.2.02.1308290657140.5063@oneiric>
	<20130829112725.GN3544@jama>
	<alpine.DEB.2.02.1308290733210.5515@oneiric>
	<1377776979.28077.88.camel@phil-desktop.brightsign>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 29 Aug 2013 11:57:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-08-29 at 12:49 +0100, Phil Blundell wrote:
> On Thu, 2013-08-29 at 07:37 -0400, Robert P. J. Day wrote:
> >   distroless. i realize i *could* set a value for DISTRO, but it would
> > seem that i shouldn't have to in order to avoid a build error.
> 
> Well, either you're using angstrom or you aren't.  If you do want to use
> it then you ought to set DISTRO appropriately, and if you don't want to
> use it then you probably oughtn't to have the angstrom layer included at
> all.  
> 
> Trying to use the angstrom .bbappends and files with a different (or no)
> distro configuration will give you a set of metadata that's neither one
> thing nor the other and, even if you didn't get a build error, there's
> no guarantee that the resulting image would actually work.

I'm not sure I agree. Ideally layers should be includable without
turning on behaviour unless it is enabled. This is why we have things
like an array of OVERRIDES to chose from.

So I'd actually suggest this is a bug in the angstrom layer. There are
also other layers which probably have issues, maybe including meta-yocto
but we should fix them.

I'll go further and suggest that Yocto Project Compatible status might
depend on this in future (the current questions suggest it should be the
case already).

Cheers,

Richard



