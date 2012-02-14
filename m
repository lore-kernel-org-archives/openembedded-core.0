Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RxHR2-0002Sa-CH
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 13:24:40 +0100
Received: by ggeq1 with SMTP id q1so2790270gge.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2012 04:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=NB787QI/6Qq9cYP3wxtmA0NuaTi3wq7SVX3g87pauqY=;
	b=FtH6e/mp3aEj9StqbNsFDypOF1JWwe3+sLKlG2owMvAy+M/BaikYubL0pY6dlYaBBE
	8DSd/pcPYNwQT4n3YSADc6Mf1r/X8lBfU7ZtGPFdAJ56jiyVk7f88qsN3Klirub/hERD
	fiicmSY05QBz9OQO635GTEaXW4x5zPTBIWk7w=
MIME-Version: 1.0
Received: by 10.236.116.195 with SMTP id g43mr9380459yhh.26.1329221789341;
	Tue, 14 Feb 2012 04:16:29 -0800 (PST)
Received: by 10.236.67.81 with HTTP; Tue, 14 Feb 2012 04:16:29 -0800 (PST)
In-Reply-To: <1328977465.26671.0.camel@ted>
References: <1328832372.10451.47.camel@ted>
	<CAMKF1soksEad4TP5upRjW2vG6_OjeQjyYTAL88PH_qgy9yyiug@mail.gmail.com>
	<1328881254.13434.10.camel@ted>
	<20120211015834.GB2095@sakrah.homelinux.org>
	<1328977465.26671.0.camel@ted>
Date: Tue, 14 Feb 2012 13:16:29 +0100
Message-ID: <CA+chaQeSjRw_OTPauSx5YBbiLGdgfkMYGYi_0E3Me-QCPS+Q8Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.6: Some small performance tweaks
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
X-List-Received-Date: Tue, 14 Feb 2012 12:24:40 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Feb 11, 2012 at 5:24 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2012-02-10 at 17:58 -0800, Khem Raj wrote:
>> On (10/02/12 13:40), Richard Purdie wrote:
>> > On Thu, 2012-02-09 at 16:39 -0800, Khem Raj wrote:
>> > > On Thu, Feb 9, 2012 at 4:06 PM, Richard Purdie
>> > > <richard.purdie@linuxfoundation.org> wrote:
>> > > >
>> > > > +NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
>> > >
>> > >
>> > > note that we will need to ship zlib-nativesdk as well if we do this
>> > > so hopefully that case is covered by this.
>> >
>> > Yes, zlib has a BBCLASSEXTEND on zlib-nativesdk so this should be fine.
>>
>> OK and this is bundled with meta-toolchain too right ?
>
> By anything that depends on it by the shlibs code in the usual way, yes.

But zlib is build time dependency, isn't it?

Now it fails to build target gcc because it depends only on
zlib-native not target zlib and zlib.h is not found.

Regards,


