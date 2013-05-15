Received: from mail-ob0-f174.google.com ([209.85.214.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UcaYo-000448-3H
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 14:12:21 +0200
Received: by mail-ob0-f174.google.com with SMTP id un3so1846084obb.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 04:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=zjjnmq8amb8QZDxTtkcztkPfcW1E3ZI2YU8iGfAaq1Y=;
	b=r5nsm0hcB/w01f9CALcNqV9ZkCx6HXiTZfmcbmC5Cpxc2dA8WgCao7zIBj/tdxMnnJ
	ldFzPU3Blx3bMwfpdiKU9Br0PeO4yvIJLdW9WiiRZbt7EWYorAYyfGYx/2cVixRh8KpC
	2IrqHk3cUcnivPOESbkNjjVEpT45adB0sDWzOZ2rr9KgBXbJ7gb3KcFBbgpXq5r2d8uY
	4a5dpafinOkJ1+Mx489CXoia0xa8iNjSMx1RE16eZyVI4GxVWcPP8rzqYMUYCnd1D7i4
	qGIrzw6Tq9uuJhKCtc1+sDRmAFLzgUGDyMHGp1Vqcu6hkvxhmwH7MwlvDx9fg1Y26Jj3
	1XUQ==
MIME-Version: 1.0
X-Received: by 10.60.35.100 with SMTP id g4mr7747638oej.53.1368618824694; Wed,
	15 May 2013 04:53:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Wed, 15 May 2013 04:53:44 -0700 (PDT)
In-Reply-To: <519372F1.6050902@r-finger.com>
References: <518A6B25.5000108@r-finger.com> <1824887.iAjz2He6PC@helios>
	<5193533D.70503@r-finger.com> <3057509.dy5Cs7AUqs@helios>
	<519372F1.6050902@r-finger.com>
Date: Wed, 15 May 2013 08:53:44 -0300
X-Google-Sender-Auth: WBtKajVClQIdliKNnyUTFIK8_AE
Message-ID: <CAP9ODKqiTzMNpeMq_L7X40_omoNTXjAt3w8N8ykgPwjuEYr9Lg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 15 May 2013 12:12:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 15, 2013 at 8:35 AM, Tomas Frydrych
<tf+lists.yocto@r-finger.com> wrote:
> Hi Paul,
>
> On 15/05/13 10:49, Paul Eggleton wrote:
>>> It prevents efficiently supporting clutter on any real machine that does
>>> not use mesa's GL, which means all machines not in meta-intel, and some
>>> machines in meta-intel. This is the main issue, real HW support.
>>
>> How does it prevent that? Surely if machine-specific changes are required then
>> they will be required on top of a separate layer as much as they are if the
>> recipes remain in OE-Core.
>
> It could be all pulled together into the meta-clutter layer, the
> supported BSPs and machines documented, etc, so that common machines
> just work out of the box. We could have a dedicated mailing list, a bug
> tracker, build a community around it, pull resources.

+1

>> The layer mechanism exists to allow specific
>> recipes to be extended if needed. Having the recipes in OE-Core does not
>> preclude their extension or replacement with newer versions elsewhere for
>> those that need it.
>
> I have followed the model you advocate for over a year with clutter, and
> it is a PITA, so I am thinking that perhaps there are others who are
> doing the same and we could do it in one well known place.

+1

>> You may well be right about the need to test on other GL implementations.
>> That does not explain how moving them to a separate layer directly helps to address
>> that need. You must also expect to make some changes to the recipes
>> themselves, so what changes would you be making?
>
> It's not just about testing, you have to build it first: I would like to
> see a set of recipes that can support a whole bunch of machines in the
> public OE BSP layers out of the box: configs that work and make sense,
> patches where needed, documentation, including documentation of BSP
> specific issues.
>
> In the absence of a community-owned meta-clutter layer, if anyone is
> stuck maintaining their own clutter recipes, I have a set at
> https://github.com/Guacamayo/meta-clutter which can perhaps be of some use.

+1

I share same feeling of Tomas and I agree that a new layer is the way
to go. Having it in a specific layer will allow for more shared work
and easy a community creation around it.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


