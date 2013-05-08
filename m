Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1Ua7Nb-0003rv-1Y
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 18:38:11 +0200
Received: from [192.168.0.2] (host86-137-102-112.range86-137.btcentralplus.com
	[86.137.102.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 8A3E8952B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2013 17:20:09 +0100 (BST)
Message-ID: <518A7B37.8050308@r-finger.com>
Date: Wed, 08 May 2013 17:20:07 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <518A6B25.5000108@r-finger.com> <1368026618.27116.52.camel@ted>
In-Reply-To: <1368026618.27116.52.camel@ted>
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
X-List-Received-Date: Wed, 08 May 2013 16:38:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/05/13 16:23, Richard Purdie wrote:
> On Wed, 2013-05-08 at 16:11 +0100, Tomas Frydrych wrote:
>> I think it would makes sense to move clutter related packages from
>> oe-core into a dedicated layer:
>>
>> * AFAIK nothing in oe-core requires cogl/clutter/mx,
>>
>> * The packages in oe-core are effectively unmaintained, several upstream
>> releases behind, and pretty much unusable,
>>
>> * The somewhat random nature of clutter and cogl releases makes it hard
>> to sensibly manage these packages within the oe-core release cycle, but
>> a dedicated layer could follow the upstream developments.
>>
>>
>> I have started work on new clutter and related packages for use by
>> meta-guacamayo at https://github.com/Guacamayo/meta-clutter, but I'd be
>> more than happy for the layer to live somewhere else and become the
>> canonical location for clutter-related bits and pieces.
> 
> I have no idea why you've always felt the need to maintain the clutter
> pieces in your own layer rather than interacting with the ones in
> OE-Core instead which I'd love to see better maintained. I'm not aware
> of any barrier that has prevented that.

It's mostly a matter of timing. Clutter does not provide LTS releases,
it pretty much deprecates the previous stable branch as soon as new
stable branch is started, so tracking the upstream reasonably quickly
matters. The timing for the danny oe-core release and the arrival of
clutter 1.12 was such that it simply could not have made it into
oe-core. Needing 1.12 I had no option than to package it elsewhere.

Yes, I could have submitted clutter 1.12 recipes to oe-core in some form
and shape in the last 6 months, and we would have had a less outdated
package in oe-core; but nevertheless outdated, since again the clutter
1.14 release came too late to make it into dylan. I can see this
happening again and again.

If there is a good reason to maintain clutter, cogl and mx in oe-core,
then I'll make patches for 1.14, but I am not convinced there is a good
reason, and that everyone would be better served by a dedicated layer.

Tomas


