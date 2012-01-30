Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RrtGv-0003yy-Gl
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 16:35:57 +0100
Received: by lahc1 with SMTP id c1so2189390lah.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 07:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=8DsCF9VZi3+/taNqHuKHtr8KL8MSm2NAYNTxGBY/4e8=;
	b=xPYnIM/ehM5iqrN+9B+hI0NQ7aGvgwg15nLSfRNWvRvi9edgGdNBdZmVwMKkKPBAOz
	Bem4iAXifYDdFOwDcucDNZzGe0h7nij3AR8jZJvDjHoVO3pATCiR5G8hno+tFED6paCw
	LZMtNIUhFtWQuwQDua/z7JjH8lVNlSwuoKzdc=
Received: by 10.112.86.67 with SMTP id n3mr4601657lbz.29.1327937283988; Mon,
	30 Jan 2012 07:28:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Mon, 30 Jan 2012 07:27:33 -0800 (PST)
In-Reply-To: <CAGiJk9exB3QzUXxqoid0M14fVoSm5pPWMgsYACDuqyg894UGjA@mail.gmail.com>
References: <4F24F822.1010102@emagii.com>
	<CAMKF1spQSH0kS6LKTOBP2wqtsL_NBLRhPNqejqwhQCy=K0cjMg@mail.gmail.com>
	<4F253A25.7010601@emagii.com>
	<CAGiJk9exB3QzUXxqoid0M14fVoSm5pPWMgsYACDuqyg894UGjA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Jan 2012 07:27:33 -0800
Message-ID: <CAMKF1sp8F4+X=Oq=r57ab0NH0R5USBpdYYcTGmAWqN=_N506rg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: ulf@emagii.com
Subject: Re: module.init-tools-3.16.tar.bz2 no longer available at kernel.org
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
X-List-Received-Date: Mon, 30 Jan 2012 15:35:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 29, 2012 at 11:52 PM, Samuel Stirtzel
<s.stirtzel@googlemail.com> wrote:
> 2012/1/29 Ulf Samuelsson <openembedded-core@emagii.com>:
>> 2012-01-29 11:21, Khem Raj skrev:
>>
>>> On Sat, Jan 28, 2012 at 11:41 PM, Ulf Samuelsson
>>> <openembedded-core@emagii.com> =C2=A0wrote:
>>>>
>>>> Don't know why, but it is no longer available (used to be).
>>>>
>>>>
>>>> "openembedded-core/meta/recipes-kernel/module-init-tools/module-init-t=
ools-cross_3.16.bb"
>>>> is thus broken.
>>>>
>>>> Found it on a mirror.
>>>>
>>>>
>>>> "http://ftp.tlk-l.net/pub/mirrors/kernel.org/linux/utils/kernel/module=
-init-tools/"
>>>>
>>>> but it would be nice if it was cached somewhere.
>>>
>>> autobuilder.yoctoproject.org should have it
>>>
>> But not in a form that can be used to "unbreak" the build
>>
>>
>> openembedded-core/meta/classes/mirros.bbclass contains:
>>
>> ${KERNELORG_MIRROR} =C2=A0 =C2=A0http://www.kernel.org/pub \n \
>> ${KERNELORG_MIRROR} =C2=A0 =C2=A0ftp://ftp.us.kernel.org/pub \n \
>> ${KERNELORG_MIRROR} =C2=A0 =C2=A0ftp://ftp.uk.kernel.org/pub \n \
>> ${KERNELORG_MIRROR} =C2=A0 =C2=A0ftp://ftp.hk.kernel.org/pub \n \
>> ${KERNELORG_MIRROR} =C2=A0 =C2=A0ftp://ftp.au.kernel.org/pub \n \
>> ${KERNELORG_MIRROR} =C2=A0 =C2=A0ftp://ftp.jp.kernel.org/pub \n \
>>
>> I assume that bitbake will try this list of servers, when the recipe
>> is referring to ${KERNELORG_MIRROR}
>>
>> Only the first mirror is online. (At least today) so there is really
>> no backup, if the main server is down.
>>
>> Any objections to adding
>> ${KERNELORG_MIRROR} =C2=A0 =C2=A0ftp://ftp.sunet.se/pub/Linux/kernel.org=
 \n \
>> to mirrors.bbclass as the second entry ?
>>
>>
>>
>>>> openembedded-core@lists.openembedded.org
>>>>
>>>> --
>>>> Best Regards
>>>> Ulf Samuelsson
>>>> eMagii
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>>
>> --
>> Best Regards
>> Ulf Samuelsson
>> eMagii
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> You could try to fetch it from the Poky sources, to do so put the
> following lines in your config file (it was very helpful while
> kernel.org was down).
>
> PREMIRRORS_append =3D "\
> bzr://.*/.* =C2=A0 http://pokylinux.org/sources/ \n \
> cvs://.*/.* =C2=A0 http://pokylinux.org/sources/ \n \
> git://.*/.* =C2=A0 http://pokylinux.org/sources/ \n \
> hg://.*/.* =C2=A0 =C2=A0http://pokylinux.org/sources/ \n \
> osc://.*/.* =C2=A0 http://pokylinux.org/sources/ \n \
> p4://.*/.* =C2=A0 =C2=A0http://pokylinux.org/sources/ \n \
> svk://.*/.* =C2=A0 http://pokylinux.org/sources/ \n \
> svn://.*/.* =C2=A0 http://pokylinux.org/sources/ \n \
> bzr://.*/.* =C2=A0 http://autobuilder.pokylinux.org/sources/ \n \
> cvs://.*/.* =C2=A0 http://autobuilder.pokylinux.org/sources/ \n \
> git://.*/.* =C2=A0 http://autobuilder.pokylinux.org/sources/ \n \
> hg://.*/.* =C2=A0 =C2=A0http://autobuilder.pokylinux.org/sources/ \n \
> osc://.*/.* =C2=A0 http://autobuilder.pokylinux.org/sources/ \n \
> p4://.*/.* =C2=A0 =C2=A0http://autobuilder.pokylinux.org/sources/ \n \
> svk://.*/.* =C2=A0 http://autobuilder.pokylinux.org/sources/ \n \
> svn://.*/.* =C2=A0 http://autobuilder.pokylinux.org/sources/ \n"
>
> MIRRORS_append =3D "\
> ftp://.*/.* =C2=A0 =C2=A0 http://pokylinux.org/sources/ \n \
> http://.*/.* =C2=A0 =C2=A0http://pokylinux.org/sources/ \n \
> https://.*/.* =C2=A0 http://pokylinux.org/sources/ \n \
> ftp://.*/.* =C2=A0 =C2=A0 =C2=A0http://autobuilder.pokylinux.org/sources/=
 \n \
> http://.*/.* =C2=A0 =C2=A0 http://autobuilder.pokylinux.org/sources/ \n \
> https://.*/.* =C2=A0 =C2=A0http://autobuilder.pokylinux.org/sources/ \n"
>


there is own-mirrors.bblcass doing this just inherit and tell it where to l=
ook

> --
> Regards
> Samuel
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


