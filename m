Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfDyz-0003QY-RZ for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 18:32:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68GSuiF021846;
	Fri, 8 Jul 2011 17:28:56 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21561-05; Fri,  8 Jul 2011 17:28:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68GSq3a021840
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 8 Jul 2011 17:28:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAMKF1sqqYk60t5_CTOx8ueAWyZ5X0KmESLMqy+wjv_W7vr0WOg@mail.gmail.com>
References: <cover.1310044227.git.paul.eggleton@linux.intel.com>
	<201107071534.51372.paul.eggleton@linux.intel.com>
	<4E1693CC.8080403@gmail.com>
	<201107080938.37370.paul.eggleton@linux.intel.com>
	<CAMKF1sqqYk60t5_CTOx8ueAWyZ5X0KmESLMqy+wjv_W7vr0WOg@mail.gmail.com>
Date: Fri, 08 Jul 2011 17:28:13 +0100
Message-ID: <1310142493.20015.904.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/2] bitbake.conf: update OLDEST_KERNEL to 2.6.0
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
X-List-Received-Date: Fri, 08 Jul 2011 16:32:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 07:17 -0700, Khem Raj wrote:
> On Fri, Jul 8, 2011 at 1:38 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > On Friday 08 July 2011 06:21:16 Khem Raj wrote:
> >> If oe-core never supported older kernel than 2.6.37 then setting it to
> >> 2.6.37 would be better IMO
> >
> > It's not necessarily just about oe-core - it's about what layers get used on
> > top, and some of those will be using kernels older than 2.6.37.
> 
> Its similar to  a situation where some of the layers might be using
> gcc older than 4.6.0 but we still chose 4.6.0
> in default distro vars. There always is a possibility to override it
> if user has to.

For now, I've merged the 2.6.16 patch since there seem to be good
reasons for making things at least that recent. Its certainly better
than 2.4! :)

Cheers,

Richard




