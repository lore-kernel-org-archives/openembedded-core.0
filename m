Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UbpNl-0000c3-JD
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 11:49:25 +0200
Received: from [192.168.0.2] (host86-137-102-112.range86-137.btcentralplus.com
	[86.137.102.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 48116952B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 10:31:18 +0100 (BST)
Message-ID: <5190B2E5.8010502@r-finger.com>
Date: Mon, 13 May 2013 10:31:17 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <518A6B25.5000108@r-finger.com> <1368026618.27116.52.camel@ted>
	<518A7B37.8050308@r-finger.com> <1368176725.11129.9.camel@ted>
	<518CD26F.3090901@r-finger.com> <1368185566.11129.28.camel@ted>
	<518D22CC.1040002@r-finger.com> <1368206371.11129.46.camel@ted>
	<CAP9ODKqGThBAjFkc1ViF9TJhW6z-xuVwwmDOa9mXg+h=TALJpw@mail.gmail.com>
	<1368224314.11129.65.camel@ted>
In-Reply-To: <1368224314.11129.65.camel@ted>
Subject: Re: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
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
X-List-Received-Date: Mon, 13 May 2013 09:49:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Richard,

On 10/05/13 23:18, Richard Purdie wrote:
>> I am sure we all want a solid release so I am also sure Tomas wouldn't
>> put experimental version of clutter near of release.
> 
>>From what I read of Tomas' emails, I actually think his plans differ
> from that as he finds that aspect of OE-Core frustrating.

I am no sure what 'aspect' of OE-Core you mean. If you mean the
six-monthly releases, then you are reading my emails all wrong -- I am a
firm believer.

Regarding experimental releases -- I am not interested in them much
myself, but with meta-clutter, we could, of course, have negative
priority recipes for any interim developer snapshots, if that is what
people need. But what I am looking for most are uptodate recipes for
*stable* releases of clutter more or less as they happen.


> I don't touch layers I don't maintain. If I did that, I would get hung,
> drawn and quartered. Please at least think through things like this
> before saying them :(. Can you imagine what you'd say to me if I pushed
> commits to meta-fsl-arm? 

Just so we are clear, I am not trying to wrench clutter out of your
control. For all I care, set up meta-clutter on g.yp.o, and put the
current official maintainer of the clutter packages in oe-core in
charge, but I don't think we can get a usable clutter support without a
dedicated layer in the long run.

Tomas

-- 
http://sleepfive.com


