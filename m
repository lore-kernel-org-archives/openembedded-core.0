Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RxZ7G-0007od-Cb
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Feb 2012 08:17:26 +0100
Received: by werc1 with SMTP id c1so447239wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2012 23:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=2WgEyfjNQU7FnK7xWdX8vZUKfGyJfm22Tt99fADGjJw=;
	b=bfQPkYBf4IHLdiaEQ7OaoPZwYuIB1oU12VaT4GxcT25ZQBP5tugrsdrAKQ2cPZ+gCx
	WlQj+oBphdkiWoDYvXt6y8zaQlcxm0HtkxAa9jKzF3kN1m/IAYhTUUqgqlhHH98suPdZ
	vkFNYYpHVMTsIJhbzqyyYno40W9vAYG+4dv70=
MIME-Version: 1.0
Received: by 10.181.11.227 with SMTP id el3mr33462954wid.18.1329289754874;
	Tue, 14 Feb 2012 23:09:14 -0800 (PST)
Received: by 10.223.89.135 with HTTP; Tue, 14 Feb 2012 23:09:14 -0800 (PST)
In-Reply-To: <20120214190537.GC11340@sakrah.homelinux.org>
References: <CAGiJk9fHCXEeFkRBi4OWL-0fbGtxPpHyGu5Qky+yJ_Ab-yVZ7A@mail.gmail.com>
	<20120214190537.GC11340@sakrah.homelinux.org>
Date: Wed, 15 Feb 2012 08:09:14 +0100
Message-ID: <CAGiJk9cmQXWdBnntMNEngCyoYGxjVQ+z-uHfwPuivHA_66wBHg@mail.gmail.com>
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
X-List-Received-Date: Wed, 15 Feb 2012 07:17:26 -0000
Content-Type: text/plain; charset=UTF-8

2012/2/14 Khem Raj <raj.khem@gmail.com>:
> On (14/02/12 16:21), Samuel Stirtzel wrote:
>> Hi,
>> currently building dependency depencies of Plasma Active dependency
>> dependencies (this sentence may contain slight ironic content).
>>
>> One of the libraries wants the maths.h library libm.
>> Libm existent in my rootfs under /lib/libm-2.12.2.so, /lib/libm.so.6
>> that points to it and the other link at /usr/lib/libm.so.
>> But for some reason configure can't find it and quits with this error:
>>
>> ac_cv_header_math_h=yes
>> ...
>> configure:14858: checking for ceil, floor and round in default libs
>> configure:14900: checking for ceil, floor and round with -lm
>> configure:14943: error: Could not find ceil, floor, round in default
>> libs or with -lm
>>
>>
>> Anyone knows what causes this, or how it could be resolved?
>
> post the config.log which should be in the top of build tree.
> there it must list why the test failed.
>
> --
> -Khem
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
Hi,
here is the full configure.log: http://pastebin.com/wAERBH5G

The part pointed out in my previous mail was also from configure.log

-- 
Regards
Samuel


