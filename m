Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QlPWP-0003Bw-U6
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 20:04:54 +0200
Received: by pzk1 with SMTP id 1so8923594pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2011 11:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=kzcFw4nQxNTESylr/0oZ9eOI/0GtU0IiCu+zoCWgWQg=;
	b=Dtx9+P/qszyDIn+nQRfPAkp5XmYsgsxBc3Tf9fCLuNdHhkDovrFsdyQ7LgLwj0EmsN
	f9oaMY4VJUQY+SV2/DrI516LZCbwcIxyJqbV+dA6p0lwYwPc3F+HW3yJmiNpaMBKiqXn
	hdh1vzRFSXkdbQv7qE1jChPrEE9GgcZDZxMIc=
Received: by 10.68.64.200 with SMTP id q8mr4814281pbs.144.1311616840634; Mon,
	25 Jul 2011 11:00:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.65.130 with HTTP; Mon, 25 Jul 2011 11:00:10 -0700 (PDT)
In-Reply-To: <C1FA9199-EF24-48DF-BCCD-7A3D084A5F0F@dominion.thruhere.net>
References: <1311343068-942-1-git-send-email-galak@kernel.crashing.org>
	<C1FA9199-EF24-48DF-BCCD-7A3D084A5F0F@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Jul 2011 11:00:10 -0700
Message-ID: <CAMKF1sovKx1HU3jQnT6cHAF29pDy47TpsfAyy7s27J-YnybXBQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.6: Fix packaging of native toolchains
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
X-List-Received-Date: Mon, 25 Jul 2011 18:04:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2011 at 5:25 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 22 jul. 2011, om 15:57 heeft Kumar Gala het volgende geschreven:
>
>> The base gcc package is missing liblto_plugin.so. =C2=A0If we try a simp=
le
>> hello world compile we get something like:
>>
>> root@p5020-ds:~# gcc hello.c
>> gcc: fatal error: -fuse-linker-plugin, but liblto_plugin.so not found
>> compilation terminated.
>>
>> We need to include liblto_plugin.so in the base gcc package and not
>> gcc-dev.
>>
>> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
>> ---
>> meta/recipes-devtools/gcc/gcc-4.6.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| =C2=A0 =C2=A02 +-
>> meta/recipes-devtools/gcc/gcc-package-target.inc | =C2=A0 =C2=A01 +
>> 2 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtoo=
ls/gcc/gcc-4.6.inc
>> index a724594..4c1e1e1 100644
>> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
>> @@ -1,6 +1,6 @@
>> require gcc-common.inc
>>
>> -PR =3D "r1"
>> +PR =3D "r2"
>
> Doesn't this need a PR bump in gcc-4.5 as well?

yes indeed it does


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


