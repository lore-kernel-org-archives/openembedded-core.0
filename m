Received: from mail-ie0-f173.google.com ([209.85.223.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TtJnQ-0001kF-8I
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 16:11:57 +0100
Received: by mail-ie0-f173.google.com with SMTP id e13so855759iej.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 06:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=rZUf8JSc8oaVjK0O/dm4Bm/5j42g6X+KHsVmLzwwAPQ=;
	b=Ktceq979oJCJrOQAfhF8RC3G9MG1RthRY5pVU14jnsKJIlEOaC3djf4jYI2CvrnB/E
	ATgh0AUQX1eut1fR711VlnmcZyNn1pYY60IkN2J2TQv8lPWywyriezN7nIvLtFeHeWnN
	OKxPgYPYmiGwjILj7u9JFI1Uujpa5hDo3dZfRdcKKlXfIftipr3izMWU67bOzIp4mJLK
	GUKKAGm8z5E+HJifaduVPSR8XJwdBD9aedzmy1RNVsS+RB0zhGpCYVd6bzPlh4dBst92
	P4HhojrZTV/3lhSgA8bnIqLqL20i7LIRYHctYazXXQIH+Ci1m1/FC1Bd7YlKZQYhWcEs
	7qTg==
MIME-Version: 1.0
X-Received: by 10.50.179.100 with SMTP id df4mr6009507igc.60.1357829802328;
	Thu, 10 Jan 2013 06:56:42 -0800 (PST)
Received: by 10.64.98.163 with HTTP; Thu, 10 Jan 2013 06:56:42 -0800 (PST)
In-Reply-To: <1357751835.13022.103.camel@ted>
References: <CACW_hTbcpzGuQw3HfNc1bL+a7L6oGcJWfhE5=YKyXR6fwQeVfg@mail.gmail.com>
	<1357751835.13022.103.camel@ted>
Date: Thu, 10 Jan 2013 15:56:42 +0100
Message-ID: <CAAQYJAsygkKtJiu7QFSM2o+5iNx7GSmwvOZ6E+LBkoAh4ChQzA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Subject: Re: split mtd-utils
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
X-List-Received-Date: Thu, 10 Jan 2013 15:12:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jan 9, 2013 at 6:17 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2013-01-09 at 17:12 +0100, Frans Meulenbroeks wrote:
>> As I am involved in embedded systems where flash is somewhat sparse
>> I'm always eager to save a few bytes where possible.
>>
>> Today I noticed that mtd-utils (1.5.0 from danny) generates for my
>> architecture (powerpc) roughly 780k of binaries in usr/sbin. 423k of
>> it is due to ubifs related files.
>>
>> Would it be desired to put this in a separate package?
>>
>> e.g. mtd-utils-ubi and mtd-utils-nonubi with mtd-utils itself being
>> empty but rdepend on those two?
>> that way mtd-utils will still give all packages but those only wanting
>> the non ubi stuff can limit themselves to that.
>>
>> If desired I can give this a stab.
>
> Sounds like a sensible split to me...
>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

OE-Classic already has one packaging split:
PACKAGES =+ "mkfs-jffs2 mkfs-ubifs

Recently I faced this same issue: for ubiattach we have to install
full mtd-utils (>700KiB)
FYI there is a recipe for ubi-utils-klibc for more extreme size optimization.

http://cgit.openembedded.org/meta-openembedded/tree/meta-initramfs/recipes-devtools/mtd

Cheers

Andrea


