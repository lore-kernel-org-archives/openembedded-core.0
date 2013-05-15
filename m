Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UcbuY-0004xt-89
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 15:38:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 900EA31406F9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 15:20:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ck4ByI5UemyU
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 15:20:10 +0200 (CEST)
Received: from [172.22.22.61] (unknown [212.255.230.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id A0A9C31414D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 15:20:10 +0200 (CEST)
Message-ID: <51938B89.1060701@opendreambox.org>
Date: Wed, 15 May 2013 13:20:09 +0000
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <518A6B25.5000108@r-finger.com> <1824887.iAjz2He6PC@helios>
	<5193533D.70503@r-finger.com> <3057509.dy5Cs7AUqs@helios>
	<519372F1.6050902@r-finger.com>
	<CAP9ODKqiTzMNpeMq_L7X40_omoNTXjAt3w8N8ykgPwjuEYr9Lg@mail.gmail.com>
In-Reply-To: <CAP9ODKqiTzMNpeMq_L7X40_omoNTXjAt3w8N8ykgPwjuEYr9Lg@mail.gmail.com>
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
X-List-Received-Date: Wed, 15 May 2013 13:38:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 15.05.2013 11:53, Otavio Salvador wrote:
> On Wed, May 15, 2013 at 8:35 AM, Tomas Frydrych
> <tf+lists.yocto@r-finger.com> wrote:
>> Hi Paul,
>>
>> On 15/05/13 10:49, Paul Eggleton wrote:
>>>> It prevents efficiently supporting clutter on any real machine that does
>>>> not use mesa's GL, which means all machines not in meta-intel, and some
>>>> machines in meta-intel. This is the main issue, real HW support.
>>>
>>> How does it prevent that? Surely if machine-specific changes are required then
>>> they will be required on top of a separate layer as much as they are if the
>>> recipes remain in OE-Core.
>>
>> It could be all pulled together into the meta-clutter layer, the
>> supported BSPs and machines documented, etc, so that common machines
>> just work out of the box. We could have a dedicated mailing list, a bug
>> tracker, build a community around it, pull resources.
> 
> +1
> 
>>> The layer mechanism exists to allow specific
>>> recipes to be extended if needed. Having the recipes in OE-Core does not
>>> preclude their extension or replacement with newer versions elsewhere for
>>> those that need it.
>>
>> I have followed the model you advocate for over a year with clutter, and
>> it is a PITA, so I am thinking that perhaps there are others who are
>> doing the same and we could do it in one well known place.
> 
> +1
> 
>>> You may well be right about the need to test on other GL implementations.
>>> That does not explain how moving them to a separate layer directly helps to address
>>> that need. You must also expect to make some changes to the recipes
>>> themselves, so what changes would you be making?
>>
>> It's not just about testing, you have to build it first: I would like to
>> see a set of recipes that can support a whole bunch of machines in the
>> public OE BSP layers out of the box: configs that work and make sense,
>> patches where needed, documentation, including documentation of BSP
>> specific issues.
>>
>> In the absence of a community-owned meta-clutter layer, if anyone is
>> stuck maintaining their own clutter recipes, I have a set at
>> https://github.com/Guacamayo/meta-clutter which can perhaps be of some use.
> 
> +1
> 
> I share same feeling of Tomas and I agree that a new layer is the way
> to go. Having it in a specific layer will allow for more shared work
> and easy a community creation around it.

I fail to see why the presence of meta-clutter contradicts keeping
clutter and related recipes in oe-core. If you add meta-clutter to your
layers, then its recipes will override those in oe-core anyway.

Of course, clutter recipes in oe-core could see some maintenance, but
that's IMO a different topic.

Regards,
Andreas


