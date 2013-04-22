Received: from mail-lb0-f169.google.com ([209.85.217.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1UUHEy-0007ci-RH
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 15:57:09 +0200
Received: by mail-lb0-f169.google.com with SMTP id p11so5645946lbi.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2013 06:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=ELMxobt3yZTjCU080ZMD/FCaEu4s3NXtXOuBr1CSLq4=;
	b=xg5/xH7KhloDixFAqfNeyT5C6EjHKTWXhmRU+TeJEj8xdYobis0rq8w4J7wrVCWXcG
	Ehz1+pRT2bV4JG/WbCmZNsajzcmB9OCPCzyEufuvYHKeZwZX6v0QkYTQj9I/VJYIPcvq
	c4ds8Yse24K+m7HZT9/1sWl3fcG1U9Yp1NZGT9Fv7mSFAgqsaPFfn42RCjY0/TU9Ra51
	3Lx+raw3fnBOjjcvClnvzTpEdcSouJYW/kkZ4qS3+xI1idqoZAWi6Ln5eD0rYghI0Un+
	a29JvM8CQgwdobgVKcc5P2YsOhfOkYK60R93ioNmaMN6cgtECqGOzuZ0vEXZdiSqyaBx
	YHsw==
MIME-Version: 1.0
X-Received: by 10.112.145.230 with SMTP id sx6mr5065271lbb.49.1366637969584;
	Mon, 22 Apr 2013 06:39:29 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Mon, 22 Apr 2013 06:39:29 -0700 (PDT)
In-Reply-To: <CADV-EXGNZgnsD6wXM2AFLANZ43G4hpP2BL0=Kys5JnbAh88Gzg@mail.gmail.com>
References: <CADV-EXGNZgnsD6wXM2AFLANZ43G4hpP2BL0=Kys5JnbAh88Gzg@mail.gmail.com>
Date: Mon, 22 Apr 2013 09:39:29 -0400
Message-ID: <CADkTA4PVBZEMERZaxqzPyb3WAS-XKxLE6_PCZZSto07-LO4R-g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Embed initramfs into kernel
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
X-List-Received-Date: Mon, 22 Apr 2013 13:57:14 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2013 at 9:14 AM, Yevhen Kyriukha <kirgene@gmail.com> wrote:
> Hi!
>
> I have a custom kernel recipe and initramfs image recipe.
> How can I embed initramfs into kernel?
> Is there any example available?

The support is in oe-core, so checking the yocto docs is a good starting po=
int:

http://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html

And in particular:

"core-image-minimal-initramfs: A core-image-minimal image that has the
Minimal RAM-based Initial Root Filesystem (initramfs) as part of the
kernel, which allows the system to find the first =93init=94 program more
efficiently."

There is also meta-initramfs:

https://github.com/openembedded/meta-oe/tree/master/meta-initramfs

Cheers,

Bruce

>
> Best regards,
> Yevhen
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


