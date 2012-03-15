Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S8Hnn-0005GA-CY for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 22:01:39 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2FKqq0Y026792
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 20:52:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25404-08 for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 20:52:48 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2FKqiac026776
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 20:52:46 GMT
Message-ID: <1331844764.18586.135.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 15 Mar 2012 20:52:44 +0000
In-Reply-To: <CAGDS+nmdJNhd4X2=vSFNsexnXZvE_pOy2vjD-k+6DoLGefFpCA@mail.gmail.com>
References: <CAGDS+n=KnzzUvUfv_T5X9yHPtOzQ7cgORh-ZbOJZDbFis9F69Q@mail.gmail.com>
	<1331818796.18586.85.camel@ted> <4F62171B.4060203@windriver.com>
	<CAGDS+nmdJNhd4X2=vSFNsexnXZvE_pOy2vjD-k+6DoLGefFpCA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: boost breaks on rebuild
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
X-List-Received-Date: Thu, 15 Mar 2012 21:01:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-15 at 12:14 -0700, Steve Sakoman wrote:
> On Thu, Mar 15, 2012 at 9:21 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> > On 3/15/12 8:39 AM, Richard Purdie wrote:
> >>
> >> On Wed, 2012-03-14 at 15:28 -0700, Steve Sakoman wrote:
> >>>
> >>> NOTE: package boost-1.49.0-r2.0: task do_compile: Failed
> >>>
> >>> I don't have a fix for this but wanted to document the failure.
> >>>
> >>> As with all the other failures of this type, a -c cleansstate and
> >>> rebuild is the workaround.
> >>>
> >>> It feels to me like there are quite a few recipes that don't handle
> >>> rebuilds -- I seem to run into a few after every pull.
> >
> >
> > I've observed the same thing.  There seem to be a lot of packages that once
> > they've been configured, compiled and installed, won't rebuild without being
> > cleaned in someway.
> 
> This is the one that really pisses me off, happens after every pull on
> my Ubuntu 64 bit build machine:
> 
> Summary: 1 task failed:
>   virtual:native:/home/steve/source/yocto/poky/meta/recipes-devtools/pseudo/pseudo_1.2.bb,
> do_compile
> Summary: There were 8 WARNING messages shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> 
> No simple fix since any bitbake command complains about needing to
> rebuild psuedo:
> 
> Pseudo is not present but is required, building this first before the main build
> 
> And of course the psuedo rebuild instantly fails!

Sounds like we need to teach the wrapper script to allow a pseudo-native
to be passed -c options directly (and fix pseudo's makefile if needed).

Cheers,

Richard



