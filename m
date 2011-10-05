Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RBV1Z-0003xw-VJ
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 19:12:54 +0200
Received: by gyg8 with SMTP id 8so1810482gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2011 10:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=rLWgiYXd3AwSU8KVsNk9gLbcVOcu9ErnAxeQ6khVqkM=;
	b=eo3Qgy2TieNFUUc3kZDtjg9aOH/OAtdLZYyvYf6xwJimsocEo0evqW8QLkwkQReF03
	VC4yi/6lRKprC8IenMZGlOX4z3SE9YK/np/NcBbyxwdYsmBEdMNO7BLwiNqjdicWIlmI
	Su803iuhdaDDizAap50IPZ/5RsXf+3mrcmgMA=
Received: by 10.68.19.196 with SMTP id h4mr20201853pbe.39.1317834438339; Wed,
	05 Oct 2011 10:07:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.49.129 with HTTP; Wed, 5 Oct 2011 10:06:47 -0700 (PDT)
In-Reply-To: <CAEsOVNdOaSFzxMLo1MT-h9rKMQRwuOWTv+hzKCTV-qqub+q3qg@mail.gmail.com>
References: <1317765787-19127-1-git-send-email-msm@freescale.com>
	<1317765787-19127-5-git-send-email-msm@freescale.com>
	<4E8B9F2C.5030706@gmail.com> <1317814555.14671.137.camel@ted>
	<CAEsOVNdOaSFzxMLo1MT-h9rKMQRwuOWTv+hzKCTV-qqub+q3qg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Oct 2011 10:06:47 -0700
Message-ID: <CAMKF1spCqBxZE=TyhremxN5NEC5fa9BuqJWYrCuTf4rk+bw4-Q@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] Fix sysprof for powerpc64
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
X-List-Received-Date: Wed, 05 Oct 2011 17:12:54 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 5, 2011 at 9:48 AM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Wed, Oct 5, 2011 at 6:35 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>> this is a gcc built-in define I wonder why you need to add it explicitly
>>
>> Are you sure? Is the built-in define not __powerpc64__ ?
>
> Further investigation:
>
> [mattsm@right build_p5020ds-64b_release (testing $)]$
> ./tmp/sysroots/x86_64-linux/usr/bin/ppc64e5500-fsl-linux/powerpc64-fsl-linux-gcc
> -c -E -dM empty.c | grep __p
> #define __powerpc64__ 1
> #define __powerpc__ 1
> [mattsm@right build_p5020ds-64b_release (testing $)]$

yes I was trying it with a differently configured gcc. For linux gcc
defines __powerpc64__
and for darwin it has __ppc64__ as builtin define.

I think adding check for __powerpc64__ and __powerpc__
would be nice and can be submitted to sysprof upstream IMO

>
> -M
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


