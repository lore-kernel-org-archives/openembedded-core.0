Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1TBnLf-0004yz-1i
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 15:51:23 +0200
Received: by lban1 with SMTP id n1so1044052lba.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 06:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=pbGCr7UME01Pcl+ornPGN+yTr1Nhhogq/Z6uLzgLtCs=;
	b=aUFxR9pjKKnDG4flm30D8YC8HdcVMIPgxE8pSVxedTCCmRMLBXt3m+rCkI4/tSc0TK
	SybRIXP20EK8DRbWEmysmnT9o5pV1QN0BhskuFkVOYl2X4TRjqHNqbJXmWKueKu+4HwC
	QYqj0RaxMGHmXEV1oFG3D1zTF/K4dkCfmCzCzlq91Bkropf8A4A9SBsNfOR/1vHVMZt7
	u0ygPxfUI0xBmHMbt1EChJBxM5fovhBlSNQINFIZOGC7XROjR+BiZP5WWH+ueZ6yQ1SB
	k6KZC4HRGb+Xb6gSI2xdD58O9RSgcYIkCI2UubGAHJGlc6GKjuZ3pmaMSYUqBI6egrDE
	XB1g==
MIME-Version: 1.0
Received: by 10.152.144.168 with SMTP id sn8mr18912234lab.1.1347457130911;
	Wed, 12 Sep 2012 06:38:50 -0700 (PDT)
Received: by 10.114.68.20 with HTTP; Wed, 12 Sep 2012 06:38:50 -0700 (PDT)
In-Reply-To: <1347456710.11710.11.camel@ted>
References: <1347455995-24565-1-git-send-email-schnitzeltony@googlemail.com>
	<1347456710.11710.11.camel@ted>
Date: Wed, 12 Sep 2012 09:38:50 -0400
Message-ID: <CADkTA4P-THBeYwVkRvnyy3TxH6OTs9qcYUE-cBwXLWjJou7zrA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, paul.eggleton@linux.intel.com
Subject: Re: [PATCH] cml1.bbclass: fix kernel menuconfig
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
X-List-Received-Date: Wed, 12 Sep 2012 13:51:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 12, 2012 at 9:31 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-09-12 at 15:19 +0200, Andreas M=FCller wrote:
>> At some host environments the menuconfig displayed wrong characters ang =
turned
>> unusable.
>>
>> Similar suggested in [1]
>>
>> [1] http://lists.linuxtogo.org/pipermail/openembedded-core/2012-August/0=
27130.html
>>
>> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>> ---
>>  meta/classes/cml1.bbclass |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
>> index 67f17ad..c773684 100644
>> --- a/meta/classes/cml1.bbclass
>> +++ b/meta/classes/cml1.bbclass
>> @@ -9,7 +9,7 @@ addtask configure after do_unpack do_patch before do_com=
pile
>>
>>  inherit terminal
>>
>> -OE_TERMINAL_EXPORTS +=3D "HOST_EXTRACFLAGS HOSTLDFLAGS HOST_LOADLIBES"
>> +OE_TERMINAL_EXPORTS +=3D "HOST_EXTRACFLAGS HOST_LOADLIBES"
>>  HOST_EXTRACFLAGS =3D "${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
>>  HOSTLDFLAGS =3D "${BUILD_LDFLAGS}"
>>  HOST_LOADLIBES =3D "-lncurses"
>
> This effectively just reverts the previous change. The real problem is
> that ncurses-native is broken. Could we figure out how/why
> ncurses-native is broken and fix the real problem rather than hacking
> around it please?
>
> FWIW I've been unable to reproduce this locally :(.

I've also tried to reproduce this periodically and have never seen it where
I can debug it properly.

I'm also not disputing that this is an issue .. just one I can't get at yet
either.

Cheers,

Bruce

>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


