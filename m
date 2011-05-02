Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QGkIX-0007gM-4K
	for openembedded-core@lists.openembedded.org;
	Mon, 02 May 2011 05:59:49 +0200
Received: by eye27 with SMTP id 27so1629726eye.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 May 2011 20:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=qSVkKv7uupMqAuwr8lzu9owRpyHlltQ2H2zZ8dsMqPg=;
	b=nx0ZlzXVGvmoaVE7HS64/E1azjhjp2FTHmJy8OAOCwoXr5fHIQJS22IFlQt+7007ue
	+osPbvSckiNUcL+op/13yJzG/Jb2rBaG2jUZI/RdxSAC4jQbBWYU7mNjzxisv/nzmyFa
	JYyyvSKOxQ/fQyliLHg6iVt3F4AgoLJycn0cY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=vyx0W5SxCKFgY53d+C6m8JylJNMi6iGwADEqono1XHqtrWl2qdhTLyV4HRfUcC9Smn
	xftTsTXx3JDgnVGEvd7nPKcWKY8i+8tRnkQ7PPDUg/tqjlOUDsERPU3KcEN55POPiKVF
	TJKbg5hSHg7XW7x4px2i61GDXTN1K98eVIDCs=
Received: by 10.14.52.132 with SMTP id e4mr3268915eec.173.1304308631280; Sun,
	01 May 2011 20:57:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Sun, 1 May 2011 20:56:41 -0700 (PDT)
In-Reply-To: <BANLkTikw8npv5q-gbhHWiOpxtVAwMo-XGA@mail.gmail.com>
References: <BANLkTi=9fddo=qaHhom4cw9mBLrNP1rs8w@mail.gmail.com>
	<BANLkTikw8npv5q-gbhHWiOpxtVAwMo-XGA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 May 2011 20:56:41 -0700
Message-ID: <BANLkTimvDmHUpEHEVJ4oS4N9RUX0n8ndLA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to patch yocto kernel
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
X-List-Received-Date: Mon, 02 May 2011 03:59:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, May 1, 2011 at 7:40 PM, Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
> On Sun, May 1, 2011 at 9:14 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> Hi
>>
>> I am trying to test this patch
>>
>> http://uclibc.org/~kraj/perf-tool-Fix-gcc-4.6.0-issues.patch
>>
>> to fix the build using gcc 4.6.0 but the kernel patching for yocto is
>> not as usual as other recipes
>> since it uses entire set of tooling around it.
>>
>> I tried to look around for documentation and few references I found
>>
>> https://wiki.pokylinux.org/wiki/Wind_River_Kernel
>>
>> discourages putting patches in metadata. and in another document it
>> says it uses git to do patching but does not explain how.
>>
>> So if someone can explain in simple terms how to patch a linux-yocto
>> would be really helpful from a
>> developer POV or any documentation will be helpful.
>>
>> How do people develop/test patches on linux-yocto I understand
>> eventually they are desired to be part
>> of linux-yocto git but that comes after they are tried and tested locall=
y
>>
>> I would have preferred to have the usual SRC_URI patching atleast for
>> local testing. As of now
>> it seems not to use normal OE recipe procedures.
>
> Are you actually not =C2=A0seeing this work ? I put in place compatibilit=
y
> with existing patching via the SRC_URI for just this reason. A patch
> specified in the SRC_URI will be picked up by the tools and applied
> to the end of the BSP branch during the patching phase.
>

if it worked. I would not be writing this email :)

> It has definitely worked during all the development cycles, so if you
> are seeing it not work, it's a bug and I'll fix it.
>
> Cheers,
>
> Bruce
>
>>
>> Thanks
>> -Khem
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


