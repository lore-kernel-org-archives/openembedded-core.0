Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RYKhF-00033O-FR for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 17:50:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB7GhSRZ016881;
	Wed, 7 Dec 2011 16:43:28 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16347-06; Wed,  7 Dec 2011 16:43:24 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB7GhHk4016874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 7 Dec 2011 16:43:19 GMT
Message-ID: <1323276208.30601.45.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 07 Dec 2011 16:43:28 +0000
In-Reply-To: <4EDF87F2.4000908@emagii.com>
References: <4EDF7A02.1070000@emagii.com> <4EDF87F2.4000908@emagii.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: connman-gnome_0.5.bb fails: connman-gnome.git is empty
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
X-List-Received-Date: Wed, 07 Dec 2011 16:50:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-07 at 16:36 +0100, Ulf Samuelsson wrote:
> On 2011-12-07 15:36, Ulf Samuelsson wrote:
> > git://git.kernel.org/pub/scm/network/connman/connman-gnome.git;protocol=git 
> >
> >     is empty.    The repo exists, but no content.
> >
> > Building "connman-gnome_0.5.bb" thus fails.
> > Needed by "core-image-sato"
> >
> > There is a "connman-gnome-m" project on gitorious.
> > This seems to be based on the above source package.
> >
> > Will try it out, but if anyone already tried this?
> >
> > Any other recommended sources for connman-gnome?
> >
> Found:
> http://autobuilder.yoctoproject.org/pub/sources/git2_git.kernel.org.pub.scm.network.connman.connman-gnome.git.tar.gz 
> 
> in an old email to the list from Richard Purdie (before I started 
> subscribing).
> 
> so I think I am going to download this and set up a git on github so the 
> build does
> not require a manual download.

This is a real source of frustration to me. The TSC voted against having
any mirror sources in its out the box configuration for OE-Core itself.
If you use angstrom or Poky you wouldn't see this since they configure
source mirrors out the box.

I stated at the time I thought this was crazy and making life
unnecessarily hard for users. I was outvoted. I still think having more
default mirrors in OE-Core might be a good idea but its going to take
representation to the TSC to change that.

Cheers,

Richard



