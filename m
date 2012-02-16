Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RxvgY-0008BP-75
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Feb 2012 08:23:22 +0100
Received: by wgbdr13 with SMTP id dr13so1462025wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2012 23:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=cjIjHJhjSL3cZZ2URT+uyNEHxpL63Fg5dN+TYyc+ja0=;
	b=czLWSXUJ26wvhTKjzQjJFAslJvXcn1rGCRrKFt7UF4me191mjN+BVXCgJX3U/pUeGb
	cHIin+DdCGHPKK/LICqmWULX6pQIKlCoXerS8uvxjOAYTss1kZfVwmbQzmvxB/x3oXN8
	3mGxOm5ma+17jKNIgdq0nYnkmxIBylriR+h/4=
MIME-Version: 1.0
Received: by 10.180.96.8 with SMTP id do8mr13142212wib.21.1329376509417; Wed,
	15 Feb 2012 23:15:09 -0800 (PST)
Received: by 10.223.89.135 with HTTP; Wed, 15 Feb 2012 23:15:09 -0800 (PST)
In-Reply-To: <CAMKF1sptXsmZ2jhmympP8KZJMfc2ibunr8-Gc-oxggxC=J6BMA@mail.gmail.com>
References: <CAGiJk9fHCXEeFkRBi4OWL-0fbGtxPpHyGu5Qky+yJ_Ab-yVZ7A@mail.gmail.com>
	<20120214190537.GC11340@sakrah.homelinux.org>
	<CAGiJk9cmQXWdBnntMNEngCyoYGxjVQ+z-uHfwPuivHA_66wBHg@mail.gmail.com>
	<CAMKF1sptXsmZ2jhmympP8KZJMfc2ibunr8-Gc-oxggxC=J6BMA@mail.gmail.com>
Date: Thu, 16 Feb 2012 08:15:09 +0100
Message-ID: <CAGiJk9cYirUNaPmyt94JHf95VKDQQxvj652AZ7GW96cow4_gdw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Eglibc related / libm issue
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
X-List-Received-Date: Thu, 16 Feb 2012 07:23:22 -0000
Content-Type: text/plain; charset=UTF-8

2012/2/16 Khem Raj <raj.khem@gmail.com>:
> On Tue, Feb 14, 2012 at 11:09 PM, Samuel Stirtzel
> <s.stirtzel@googlemail.com> wrote:
>> 2012/2/14 Khem Raj <raj.khem@gmail.com>:
>>> On (14/02/12 16:21), Samuel Stirtzel wrote:
>>>> Hi,
>>>> currently building dependency depencies of Plasma Active dependency
>>>> dependencies (this sentence may contain slight ironic content).
>>>>
>>>> One of the libraries wants the maths.h library libm.
>>>> Libm existent in my rootfs under /lib/libm-2.12.2.so, /lib/libm.so.6
>>>> that points to it and the other link at /usr/lib/libm.so.
>>>> But for some reason configure can't find it and quits with this error:
>>>>
>>>> ac_cv_header_math_h=yes
>>>> ...
>>>> configure:14858: checking for ceil, floor and round in default libs
>>>> configure:14900: checking for ceil, floor and round with -lm
>>>> configure:14943: error: Could not find ceil, floor, round in default
>>>> libs or with -lm
>>>>
>>>>
>>>> Anyone knows what causes this, or how it could be resolved?
>>>
>>> post the config.log which should be in the top of build tree.
>>> there it must list why the test failed.
>>>
>>> --
>>> -Khem
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>> Hi,
>> here is the full configure.log: http://pastebin.com/wAERBH5G
>>
>> The part pointed out in my previous mail was also from configure.log
>
> yeah i see. there is not whole lot of detail in there on how its
> trying to determine the test result. I was looking for commandline
> I guess looking at configure script might reveal something
>

The code in the configure.ac looks like a condition of cross
compilation error where the code is run tested.

It was worked around with a patch to configure.ac, but shouldn't
autoconf be able to handle this sort cross compilation mistake since
version 2.58?
Thanks for your effort.


-- 
Regards
Samuel


