Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZgzN-0006ts-TW for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 12:18:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5NAElLE015794
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 11:14:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15671-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 11:14:43 +0100 (BST)
Received: from [192.168.1.45] (dynamic15.rpnet.com [192.168.1.45])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5NAEadm015786
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 11:14:38 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1308822049.21613.128.camel@phil-desktop>
References: <cover.1308732995.git.dongxiao.xu@intel.com>
	<d7c256ba838d05c85c6e7c2569f0a6c7b276ab17.1308732995.git.dongxiao.xu@intel.com>
	<1308743075.21613.82.camel@phil-desktop>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D6A3E0A9@shsmsx501.ccr.corp.intel.com>
	<1308822049.21613.128.camel@phil-desktop>
Date: Thu, 23 Jun 2011 11:14:35 +0100
Message-ID: <1308824075.20015.109.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] libc-locale: split locale handling from libc recipe.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jun 2011 10:18:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-23 at 10:40 +0100, Phil Blundell wrote:
> On Thu, 2011-06-23 at 12:08 +0800, Xu, Dongxiao wrote:
> > > -----Original Message-----
> > > From: openembedded-core-bounces@lists.openembedded.org
> > > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > > Phil Blundell
> > > Sent: Wednesday, June 22, 2011 7:45 PM
> > > To: Patches and discussions about the oe-core layer
> > > Subject: Re: [OE-core] [PATCH 1/1] libc-locale: split locale handling from libc
> > > recipe.
> > > 
> > > I still don't quite understand why the virtual/libiconv provider has moved from
> > > eglibc to eglibc-locale.  Can you explain what's going on there?
> > 
> > Generally, the purpose of this patch is to reduce eglibc's do_package time.
> > 
> > Since many other recipes' do_package have dependency on eglibc's do_package, thus the sooner eglibc could finish its do_package, the ealier can other do_packages be executed, which improves the parallelism. 
> > 
> > From our study, we found most of eglibc's do_package time is used to handle locale. Therefore we split all the locale related stuffs into a separately recipe eglibc-locale.
> 
> Yes, I understand that.  But I don't think this answers the question
> about why, specifically, glibc-locale is now PROVIDEing
> virtual/libiconv.  Does that recipe, in fact, implement libiconv?

I must admit I was wondering about this too. Isn't the libiconv
functionality still packaged as part of the libc recipe, not the locale
part?

Cheers,

Richard



