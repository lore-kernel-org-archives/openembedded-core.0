Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QuUJ6-0005ZH-1s
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 21:00:40 +0200
Received: by yxl11 with SMTP id 11so341193yxl.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 11:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=S7ZrWOtwhIOKKaCt3VLyU4UY1pTfXQ+mzEeSPxHuJ+A=;
	b=Lab35o0PgqhVjGC+8Z4aXE6QZO14U+PMoXf4n9axXH9Q7gDNw4QyyQVIDUEa3wwpTb
	rwAA6Z/oYUCfFtHqFmdAgGDVjlItyYLm4qPfj+q61/0Y8Vne5u7GipRJ3GjtoPhBtnEV
	nzKtpGV5pwtmqaIPgd0a0/Tq6PNtLQRUuI8pA=
Received: by 10.142.127.1 with SMTP id z1mr44619wfc.62.1313780158150; Fri, 19
	Aug 2011 11:55:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.40.168 with HTTP; Fri, 19 Aug 2011 11:55:28 -0700 (PDT)
In-Reply-To: <CAMKF1spxnsBL9WTKPz-RDsD4Z3-m0j-sznBi6YKFamgadoQk1A@mail.gmail.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
	<788258d226dc94004ce8284a62cf8524bcf4b010.1313700595.git.sgw@linux.intel.com>
	<1313771035.6733.304.camel@phil-desktop>
	<CAMKF1spxnsBL9WTKPz-RDsD4Z3-m0j-sznBi6YKFamgadoQk1A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Aug 2011 11:55:28 -0700
Message-ID: <CAMKF1sr2r5HkXWrh=V_2qkHwKEdjDY0uQ+nr1TedO+RhAro7gw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 16/32] gcc-4.6: Use --with-linker-hash-style configure option
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
X-List-Received-Date: Fri, 19 Aug 2011 19:00:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2011 at 11:29 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Aug 19, 2011 at 9:23 AM, Phil Blundell <philb@gnu.org> wrote:
>> On Thu, 2011-08-18 at 13:55 -0700, Saul Wold wrote:
>>> =C2=A0# Third digit in PV should be incremented after a minor release
>>> =C2=A0# happens from this branch on gcc e.g. currently its 4.6.0
>>> @@ -90,6 +90,7 @@ EXTRA_OECONF_BASE =3D " --enable-lto \
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --disable-bootstrap \
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --disable-libgomp \
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --disable-libmudflap \
>>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 --with-linker-hash-style=3D${LINKER_HASH_STYLE} \
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 --enable-cheaders=3Dc_global "
>>>
>>> =C2=A0EXTRA_OECONF_INITIAL =3D "--disable-libmudflap \
>>
>> Which gcc did you test this against? =C2=A0As far as I can tell this pat=
ch
>> was only applied to the trunk (as of May this year) and not the 4.6
>> branch. =C2=A0The corresponding configury certainly doesn't seem to exis=
t in
>> the oe-core build tree that I happen to have lying around in front of
>> me, so it isn't apparent that this patch will have any useful effect.
>>
>
> Yes that patch is missing
> I noted it in mail to other thread. the patch was being applied
> in meta-oe. I will redo these 2 patches and resend

I have pushed what I am testing again right now its here

http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Dkra=
j/linker-hash-choice


>
>> p.
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>


