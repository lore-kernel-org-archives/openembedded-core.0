Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RxuyK-0006k3-2W
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Feb 2012 07:37:40 +0100
Received: by lahc1 with SMTP id c1so2083192lah.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2012 22:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Bb8Jj6uDCQocY2QHaTqItj1iT7vNd48yCEY9oRG/QZ8=;
	b=XY4sqYtsNuu27M5zkX4ZWgkm75TWcRtprivqJmWbeOT76B+YFouMZTheCnW8C5xV1b
	il1DWmxWLpfVkPpX/1R9MSrDmW1Nxx9YJ8WKkLKsfqy0ElISFxdp9ydsaPk+TqwXNqBK
	UGorm9N/BYr2sd+4AaKlhbm9+2W0fpN7xCO+g=
Received: by 10.112.25.8 with SMTP id y8mr423134lbf.15.1329373767262; Wed, 15
	Feb 2012 22:29:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.111.225 with HTTP; Wed, 15 Feb 2012 22:28:57 -0800 (PST)
In-Reply-To: <CAGiJk9cmQXWdBnntMNEngCyoYGxjVQ+z-uHfwPuivHA_66wBHg@mail.gmail.com>
References: <CAGiJk9fHCXEeFkRBi4OWL-0fbGtxPpHyGu5Qky+yJ_Ab-yVZ7A@mail.gmail.com>
	<20120214190537.GC11340@sakrah.homelinux.org>
	<CAGiJk9cmQXWdBnntMNEngCyoYGxjVQ+z-uHfwPuivHA_66wBHg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Feb 2012 22:28:57 -0800
Message-ID: <CAMKF1sptXsmZ2jhmympP8KZJMfc2ibunr8-Gc-oxggxC=J6BMA@mail.gmail.com>
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
X-List-Received-Date: Thu, 16 Feb 2012 06:37:40 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 14, 2012 at 11:09 PM, Samuel Stirtzel
<s.stirtzel@googlemail.com> wrote:
> 2012/2/14 Khem Raj <raj.khem@gmail.com>:
>> On (14/02/12 16:21), Samuel Stirtzel wrote:
>>> Hi,
>>> currently building dependency depencies of Plasma Active dependency
>>> dependencies (this sentence may contain slight ironic content).
>>>
>>> One of the libraries wants the maths.h library libm.
>>> Libm existent in my rootfs under /lib/libm-2.12.2.so, /lib/libm.so.6
>>> that points to it and the other link at /usr/lib/libm.so.
>>> But for some reason configure can't find it and quits with this error:
>>>
>>> ac_cv_header_math_h=yes
>>> ...
>>> configure:14858: checking for ceil, floor and round in default libs
>>> configure:14900: checking for ceil, floor and round with -lm
>>> configure:14943: error: Could not find ceil, floor, round in default
>>> libs or with -lm
>>>
>>>
>>> Anyone knows what causes this, or how it could be resolved?
>>
>> post the config.log which should be in the top of build tree.
>> there it must list why the test failed.
>>
>> --
>> -Khem
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> Hi,
> here is the full configure.log: http://pastebin.com/wAERBH5G
>
> The part pointed out in my previous mail was also from configure.log

yeah i see. there is not whole lot of detail in there on how its
trying to determine the test result. I was looking for commandline
I guess looking at configure script might reveal something

>
> --
> Regards
> Samuel
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


