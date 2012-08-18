Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T2moJ-0004O9-CY
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 19:27:43 +0200
Received: by eaad12 with SMTP id d12so1233161eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2012 10:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/sGXg/BJjjMx+G1TwIXtpZWd1/aOzoiwuCMnt2jyLQc=;
	b=B7W7GWDLQjnG2G8rRxeAd8r1gaHrn/wdL3fzVJow8mGtwqbxgj+joVIw+NIObCZLlH
	DMz8Aaa0utik+TCfYo17eXgm6TH0tjUKIxNfRhzDY4v8av09dgkbxfzgo5r49GZbGUdL
	dSmMYrc/YI5UH7Jj9wmFAyX3UU6U7nqAvzIci+TNyk6J1V/rYXgd1VcosqMtkyOWBiI4
	gjnawp+5kP/wv5WYJX87UHHPGQgHgR3cpNqiydSAUH9CfZmXXH/gepiVOJuqgbNVmnuu
	4WmhCbmeg4JyauQ2PgwxbZKnmJC4io1e+KpDh+gUXxc30+uPorAd6aXGecmXaJCiuWqw
	NZag==
Received: by 10.14.5.67 with SMTP id 43mr2002378eek.15.1345310143510; Sat, 18
	Aug 2012 10:15:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Sat, 18 Aug 2012 10:15:13 -0700 (PDT)
In-Reply-To: <1345285875.27428.27.camel@ted>
References: <CAMKF1srvBZzMTbN-iOqEjitgSjFOK_Cpd0B94HjWm1z7s-0-iQ@mail.gmail.com>
	<1345285875.27428.27.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Aug 2012 10:15:13 -0700
Message-ID: <CAMKF1srJ1w94g2rgu8FvZdmHLK-4t=GSj9OtSAncuquK6oNhjw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Replacing chrpath with patchelf
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
X-List-Received-Date: Sat, 18 Aug 2012 17:27:43 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 18, 2012 at 3:31 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2012-08-18 at 00:17 -0700, Khem Raj wrote:
>> Hi,
>>
>> I have a patchset that replaces use of chrpath with patchelf. Patchelf can
>> resize the ELF headers to accomodate larger RPATHs
>>
>> The branch is posted here
>>
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/patchelf
>>
>> Please test it out and let me know if you see any issues
>
> chrpath is something we require users to install on the system they're
> building on. The reason is that we need to relocate the native recipes
> and you can't do that without chrpath. You can't build chrpath without
> building a native recipe you need to stage to change its own RPATH.
>

so I figured. which now means you need to have patchelf on build host
preinstalled instead of chrpath.

> Now there are a variety of ways we can deal with this but we need to
> think it through.
>
> At the very least such a change would need to adjust all the
> documentation about the prerequisites.

Yes. I tried to document it through an elaborate message
from sanity.bbclass about prerequisites and needs documentation
adjustments yes.

>
> I'm not actually sure we need to deal with larger RPATHs in the real
> world either. There are some bugs we're finding now the call is failing
> but they're not turning out to be due to that.

you never know. It just lifts this limitation. We ship
chrpath-nativesdk as well and people can use it in different ways

>
> Cheers,
>
> Richard
>


