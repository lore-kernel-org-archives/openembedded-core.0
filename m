Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UP8lX-0000qx-Hy
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 11:53:33 +0200
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 3D38A200E0;
	Mon,  8 Apr 2013 11:36:15 +0200 (CEST)
Message-ID: <51628F92.2070600@pseudoterminal.org>
Date: Mon, 08 Apr 2013 11:36:18 +0200
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
X-List-Received-Date: Mon, 08 Apr 2013 09:53:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-04-08 09:57, Koen Kooi wrote:
> Op 8 apr. 2013, om 01:38 heeft Carlos Rafael Giani <dv@pseudoterminal.org> het volgende geschreven:
>
>>
>> I am also considering some kind of autodetection for when yasm and liborc are available (for example, because meta-oe was added to bblayers.conf), and then switches on Orc and enables yasm in gst-libav. Or better yet, if libav is available as a recipe, it lets gst-libav use it instead of its internal copy. These autodetections would improve performance significantly.
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

So, the problems of these option are:
1) People might not make proper use of it
2) Seems to be disallowed
3) Is indeed quite inconvenient, since many people require different 
plugins, and there is always the chance that the ones enabled in the 
distro are not enough or not configured in the desired way

Option 1) sounds like the way to go for me too. Is it allowed to stick a 
file like "readme-extra-plugins.txt" in the 
recipes-multimedia/gstreamer/ directory? Because then, questions about 
performance,orc,yasm can be answered by pointing to that file. At least 
there would be a documentation.. In addition, regarding orc and yasm, it 
would help to print out a warning about the performance, briefly 
describing the situation (yasm and orc missing), and a link to the 
documentation with details.

carlos


