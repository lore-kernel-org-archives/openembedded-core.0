Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ShVSL-0002rt-FC
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 02:41:05 +0200
Received: by wibhi8 with SMTP id hi8so2094607wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 17:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Z3hbPWixmgJm2oQIi3vWkPa8eD3v02BD0H3nOVAWMyE=;
	b=Dg5p2nIhh/LjAsfJp388sr9JLfi0r4I9pu+V+sv1g7m6LIxYAC8QG44zUECVeDqDJV
	xmaP9RKCcrSSc36pe5mvdBj3Half+bE4t9oLoix6OH3NEiBUhMXowIMAQMFl62RozJR7
	pAsPSP91P0ZHgqVxp1BzpegYOJDRz8IjYnefwdaOqXVKROPbWFSI1jpTEbtaYtolgu5w
	kRlrVPCoQNk8BCTBUxvMXlap7f9JIKkpK6XCP+0gtU0tEtssgmplnC5kZzeQUn2wQajn
	ZJXaXCshxKU1xlkrZQ5tKjPljQdvvTm7lm9u0v5nCvAsmSTShBF3SvXsuohFb6ZbySQ3
	SiLA==
Received: by 10.180.92.65 with SMTP id ck1mr15601062wib.14.1340238620304; Wed,
	20 Jun 2012 17:30:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.19.6 with HTTP; Wed, 20 Jun 2012 17:29:50 -0700 (PDT)
In-Reply-To: <20120620185551.GU3178@jama.jama.net>
References: <CALbNGRR1j33mDcTD-q2FD+g2uL1VNZNdDwRX7_MNeUTKtN=ozQ@mail.gmail.com>
	<20120620185551.GU3178@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Jun 2012 17:29:50 -0700
Message-ID: <CAMKF1soNF3pdCnn41Ob0zWb8JaR0J4eL8tcc8MK3FKXeXnihVg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: latest updates make kernel menuconfig unusable
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
X-List-Received-Date: Thu, 21 Jun 2012 00:41:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2012 at 11:55 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Wed, Jun 20, 2012 at 04:20:03PM +0200, Andreas M=C3=BCller wrote:
>> Hi,
>>
>> since
>>
>> commit fe417e8a4d625c6933de72163d2fee52ac47f571
>> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Date: =C2=A0 Thu May 31 13:22:34 2012 +0000
>>
>> =C2=A0 =C2=A0 cmd1.bbclass: Ensure ncurses is built and used for menucon=
fig tasks
>>
>> =C2=A0 =C2=A0 Currently, the task just exits if something goes wrong. Th=
is adds the
>> =C2=A0 =C2=A0 ncurses-native dependency. It also adds a small delay befo=
re closing the
>> =C2=A0 =C2=A0 window so any messages displayed there can be seen.
>>
>> =C2=A0 =C2=A0 Trying to get the kernel build system to correctly find an=
d link with
>> =C2=A0 =C2=A0 our copy of ncurses is some kind of nightmare. I ended up =
having to add
>> =C2=A0 =C2=A0 it to HOST_LOADLIBES globally for this task which is rathe=
r nasty but I
>> =C2=A0 =C2=A0 couldn't find any other way.
>>
>> =C2=A0 =C2=A0 [YOCTO #2513]
>>
>> =C2=A0 =C2=A0 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundat=
ion.org>
>>
>> my menuconfig is unusable (see screenshot attached). I reverted it and
>> can work as before.
>>
>> I am working on Fedora 15 and set in my local.conf
>>
>> TERMCMD =3D "${GNOME_TERMCMD}"
>> TERMCMDRUN =3D "${GNOME_TERMCMDRUN}"
>
> I can confirm the same look&feel with
> TERMCMD =3D "${SCREEN_TERMCMD}"
> TERMCMDRUN =3D "${SCREEN_TERMCMDRUN}"
>

seems like a locale issue.


