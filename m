Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QTXNS-0007Sj-OV for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 12:49:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p56AkUmH003617
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jun 2011 11:46:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03389-03 for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2011 11:46:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p56AkM67003609
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jun 2011 11:46:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307347216.3131.5.camel@lenovo.internal.reciva.com>
References: <cover.1307331820.git.scott.a.garman@intel.com>
	<300cfa12d67e37c81fbbcdaba5c7d7686a191cfe.1307331820.git.scott.a.garman@intel.com>
	<1307347216.3131.5.camel@lenovo.internal.reciva.com>
Date: Mon, 06 Jun 2011 11:46:21 +0100
Message-ID: <1307357181.7672.3.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/4] tar: upgrade to v1.26
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
X-List-Received-Date: Mon, 06 Jun 2011 10:49:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-06 at 09:00 +0100, Phil Blundell wrote:
> On Sun, 2011-06-05 at 21:49 -0700, Scott Garman wrote:
> >  SECTION = "base"
> > +PRIORITY = "optional"
> 
> Seeing this sort of thing makes me wonder whether SECTION and PRIORITY
> actually belong in the core metadata at all.  It seems as though the
> determination of what exactly is "standard" vs "optional" is a matter of
> distro policy and this would be better done in the distro config files.
> 
> Also, just on a pragmatic issue, the two values above are actually what
> bitbake.conf sets as default anyway so there isn't much to be gained by
> specifying them in the recipe as well.

I have to admit I keep wondering about these.

PRIORITY does seem a bit of a pointless variable in the default metadata
and I'm borderline in favour of dropping it and leaving it to any
distros who want to use it, maybe sharing an include file.

SECTION does at least start to become useful in an image generation UI
as a way to group packages roughly by type which makes me think it has a
good default usecase (and OE-Core did clean up the values of it to at
least be consistent).

Cheers,

Richard



