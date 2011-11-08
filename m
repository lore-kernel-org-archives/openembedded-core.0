Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RNmbB-0006FQ-TX for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 15:24:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8EICLA000305
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 14:18:12 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32646-02 for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2011 14:18:08 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8EI2le032767
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 14:18:03 GMT
Message-ID: <1320761883.10843.40.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 08 Nov 2011 14:18:03 +0000
In-Reply-To: <cover.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/12] Recipe upgrades, fixes and additions
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
X-List-Received-Date: Tue, 08 Nov 2011 14:24:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-11-07 at 16:10 -0800, Joshua Lock wrote:
> All,
> 
> Here's a series of patches I developed whilst trying to play around with some
> Clutter based software.
> 
> The interesting pieces may be:
> Clutter 1.8 series recipes - do we want/need to keep clutter 1.6 around?
> Are we OK with continuing to namespace the clutter recipes by clutter
> version?

Yes, I think this makes sense.

> Gconf - I've pulled in GConf from upstream as the D-Bus backend is maintained
> there now. For this I pulled in the gnome-related classes from meta-oe as they
> simplified this recipe and I've been wanting to see them merged for some time.

I had to drop this patch as the gnome classes need a bit more work. I'd
like to get gconf resolved though.

> Pulseaudio - whilst adding a required build dependency I changed the recipe so
> that it doesn't require X unless the X11 distro feature is enabled.
> 

So I merged the series apart from the gnome class and gconf pieces.

Cheers,

Richard



