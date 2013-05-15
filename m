Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Uce8X-0001IQ-3Q
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 18:01:45 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 4FDA3F811DA; Wed, 15 May 2013 09:42:53 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id ECB56F81199;
	Wed, 15 May 2013 09:42:51 -0600 (MDT)
Message-ID: <5193ACFC.5070509@mlbassoc.com>
Date: Wed, 15 May 2013 09:42:52 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <51939E73.8070605@mlbassoc.com>
	<1368629183.6920.101.camel@phil-desktop.brightsign>
	<1368629601.18324.1.camel@ted>
In-Reply-To: <1368629601.18324.1.camel@ted>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Image dependency broken
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
X-List-Received-Date: Wed, 15 May 2013 16:01:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-05-15 08:53, Richard Purdie wrote:
> On Wed, 2013-05-15 at 15:46 +0100, Phil Blundell wrote:
>> On Wed, 2013-05-15 at 08:40 -0600, Gary Thomas wrote:
>>> * Build an image, e.g. core-image-sato
>>>     $ bitbake core-image-sato
>>> * Cause some dependency to be rebuilt
>>>     $ bitbake xserver-xorg -c cleansstate
>>> * Rebuild the image
>>>     $ bitbake core-image-sato
>>
>> That's probably to be expected.  You haven't done anything to actually
>> change the xserver-xorg package, just regenerated the same bits as you
>> had before, so there's no reason why the image would need rebuilding.
>>
>> Does it rebuild the image correctly if you do make a change to the
>> xserver-xorg package?
>
> Agreed, this is expected since the xserver-xorg output is unchanged and
> therefore the system is deciding it doesn't need to rebuild the image.
> If you change xserver-xorg somehow the checksum will change and the
> image will rebuild.

Understood.  I'm sure that I had a recipe which did have such a change
that failed to cause my image to be rebuilt (not this contrived example
that I thought was the same).  However, I can't make it happen now.

If it happens again, I'll get back to you.

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


