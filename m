Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RbAM1-0006BX-Uy for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 13:24:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBFCH8gI003357
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 12:17:08 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03150-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 12:17:04 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBFCGwoH003351
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2011 12:16:59 GMT
Message-ID: <1323951419.4568.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 15 Dec 2011 12:16:59 +0000
In-Reply-To: <CAMKF1sqLHP1cWfBswrqnwhAPj4Tt3XCV8GpQv7Dm71PX3F=rAw@mail.gmail.com>
References: <1323851280-6342-1-git-send-email-raj.khem@gmail.com>
	<1323856946.25491.31.camel@ted>
	<CAMKF1sqLHP1cWfBswrqnwhAPj4Tt3XCV8GpQv7Dm71PX3F=rAw@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] gcc-4.6: Let G++ relocate gxx-include-dir when using --sysroot option
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
X-List-Received-Date: Thu, 15 Dec 2011 12:24:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-14 at 07:49 -0800, Khem Raj wrote:
> On Wed, Dec 14, 2011 at 2:02 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Hi Khem,
> >
> > What's puzzling me is that reading through this patch, we already do
> > what this patch is doing?
> >
> > Where is the difference which this patch is fixing?
> >
> 
> this does essentially what we were doing earlier but this one is going
> to go upstream

Yes, that is good and I'm fine with the patch for that reason.

> 
> > I appreciate that patch adds in the prefix to the --with-gxx-include-dir
> > option but it then removes it again during configure so this should be a
> > null op. Both versions of the patch set the "1" bit in gcc/cppdefault.c.
> >
> > So where is the change this patch makes which fixes things?
> 
> changing --with-gxx-include-dir to be within sysroot triggers the
> relocation code.

But we were already triggering the relocation code?

I can't see *any* functionality difference between these, they should
both just give the same result as far as I can tell...

Claiming it fixes things is therefore concerning me.

Cheers,

Richard



