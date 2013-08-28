Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 2F57C6BCD6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 23:44:09 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7SNuKbn021085; Thu, 29 Aug 2013 00:56:21 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lcvIlIJ-aZCB; Thu, 29 Aug 2013 00:56:20 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7SNuFFm021080
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 29 Aug 2013 00:56:16 +0100
Message-ID: <1377733420.32502.58.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Zanussi <tom.zanussi@intel.com>
Date: Thu, 29 Aug 2013 00:43:40 +0100
In-Reply-To: <1377721150.1643.17.camel@empanada>
References: <cover.1377720350.git.bruce.ashfield@windriver.com>
	<1377721150.1643.17.camel@empanada>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] linux-yocto/3.10: M4 fixes
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
X-List-Received-Date: Wed, 28 Aug 2013 23:44:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-08-28 at 15:19 -0500, Tom Zanussi wrote:
> On Wed, 2013-08-28 at 16:12 -0400, Bruce Ashfield wrote:
> > Richard/Saul,
> > 
> > Here's an update of the linux-yocto-3.10 SRCREVs for the dropbear
> > ssh issue, and a config change to restore existing behaviour.
> > 
> > Credit goes to TomZ for tracking down the root cause. We'll continue to
> 
> And to Darren for identifying the actual commit ;-)
> 
> Tom
> 
> > dig at this more and see what the permanent fix will be .. and whether or
> > not this needs to be fixed upstream.

Thanks to everyone involved in getting this quickly resolved!

Cheers,

Richard


