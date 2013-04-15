Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1URYNQ-0004Ie-Uv
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 03:38:37 +0200
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id A5F8721245;
	Mon, 15 Apr 2013 03:21:10 +0200 (CEST)
Message-ID: <516B560D.8010500@pseudoterminal.org>
Date: Mon, 15 Apr 2013 03:21:17 +0200
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130403 Thunderbird/17.0.5
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <5162038C.2020706@pseudoterminal.org>
	<9E7EB4C7-5A2C-4754-B37E-A0F048F22BBF@dominion.thruhere.net>
In-Reply-To: <9E7EB4C7-5A2C-4754-B37E-A0F048F22BBF@dominion.thruhere.net>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: gstreamer 1.0 recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 01:38:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

>
> I've been meaning to ask the same questions, since I need both orc and external libav to make gstreamer  (0.10, but still) useable on my platforms. I came up with the following ideas:
>
> 1) Make every external dep a PACKAGECONFIG option in OE-core gstreamer
> 2) Add bbappends with extra PACKAGECONFIG options for gstreamer in the layer that has the external dep
> 3) add bbappens in the DISTRO layer that enables extra external dependencies.
>
> Angstrom is currently using 3) and I absolutely hate it. 2) is scales a lot better, but apparently is verboten judging from the patches sent that remove the qt bbappends that do the same.
> Which leaves 1), which will cause problems for most users, since they will spot the PACKAGECONFIG options but not bother to read the comments saying they need to enable extra layers.
>
> I favour 1) since that has all the knowledge in a single place, looked after by the OE gst maintainer (which we don't have yet, but still).
>
> regards,
>
> Koen

I have implemented option 1) now. It could be better in the -bad recipe, 
which contains a lot of --disable-XYZ switches. I am thinking of a patch 
to make external dependencies opt-in instead of opt-out.
But, all the external dependencies with known existing recipes have a 
packageconfig now. This includes orc and yasm.

cheers,
Carlos


