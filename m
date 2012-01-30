Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RrmAO-0007Ky-1T
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 09:00:44 +0100
Received: by werc1 with SMTP id c1so3132542wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2012 23:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=fGzqtQtZRwVVI3RhbLVEsTDl472Y8uf0EJ5zX32TxAk=;
	b=L+j2pNEr8bPdRPgKAoId7GxSl3GVfGlRUhHvbarX9ha5HZ0Z2HZmUGfW240KgNdR1J
	1gR7zVJBUKNKwSp0RmMZHwejY9Tpg4hy88nN9Kr8qwA2tF8FmPhE9d/Od8kc+wFibF4d
	AjCDeDoBig5LueEt91iR9dr1T8rmlqeqbUCLY=
MIME-Version: 1.0
Received: by 10.216.138.220 with SMTP id a70mr8427263wej.24.1327909971747;
	Sun, 29 Jan 2012 23:52:51 -0800 (PST)
Received: by 10.223.117.72 with HTTP; Sun, 29 Jan 2012 23:52:51 -0800 (PST)
In-Reply-To: <4F253A25.7010601@emagii.com>
References: <4F24F822.1010102@emagii.com>
	<CAMKF1spQSH0kS6LKTOBP2wqtsL_NBLRhPNqejqwhQCy=K0cjMg@mail.gmail.com>
	<4F253A25.7010601@emagii.com>
Date: Mon, 30 Jan 2012 08:52:51 +0100
Message-ID: <CAGiJk9exB3QzUXxqoid0M14fVoSm5pPWMgsYACDuqyg894UGjA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 30 Jan 2012 08:00:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/1/29 Ulf Samuelsson <openembedded-core@emagii.com>:
> 2012-01-29 11:21, Khem Raj skrev:
>
>> On Sat, Jan 28, 2012 at 11:41 PM, Ulf Samuelsson
>> <openembedded-core@emagii.com> =C2=A0wrote:
>>>
>>> Don't know why, but it is no longer available (used to be).
>>>
>>>
>>> "openembedded-core/meta/recipes-kernel/module-init-tools/module-init-to=
ols-cross_3.16.bb"
>>> is thus broken.
>>>
>>> Found it on a mirror.
>>>
>>>
>>> "http://ftp.tlk-l.net/pub/mirrors/kernel.org/linux/utils/kernel/module-=
init-tools/"
>>>
>>> but it would be nice if it was cached somewhere.
>>
>> autobuilder.yoctoproject.org should have it
>>
> But not in a form that can be used to "unbreak" the build
>
>
> openembedded-core/meta/classes/mirros.bbclass contains:
>
> ${KERNELORG_MIRROR} =C2=A0 =C2=A0http://www.kernel.org/pub \n \
> ${KERNELORG_MIRROR} =C2=A0 =C2=A0ftp://ftp.us.kernel.org/pub \n \
> ${KERNELORG_MIRROR} =C2=A0 =C2=A0ftp://ftp.uk.kernel.org/pub \n \
> ${KERNELORG_MIRROR} =C2=A0 =C2=A0ftp://ftp.hk.kernel.org/pub \n \
> ${KERNELORG_MIRROR} =C2=A0 =C2=A0ftp://ftp.au.kernel.org/pub \n \
> ${KERNELORG_MIRROR} =C2=A0 =C2=A0ftp://ftp.jp.kernel.org/pub \n \
>
> I assume that bitbake will try this list of servers, when the recipe
> is referring to ${KERNELORG_MIRROR}
>
> Only the first mirror is online. (At least today) so there is really
> no backup, if the main server is down.
>
> Any objections to adding
> ${KERNELORG_MIRROR} =C2=A0 =C2=A0ftp://ftp.sunet.se/pub/Linux/kernel.org =
\n \
> to mirrors.bbclass as the second entry ?
>
>
>
>>> openembedded-core@lists.openembedded.org
>>>
>>> --
>>> Best Regards
>>> Ulf Samuelsson
>>> eMagii
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> --
> Best Regards
> Ulf Samuelsson
> eMagii
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

You could try to fetch it from the Poky sources, to do so put the
following lines in your config file (it was very helpful while
kernel.org was down).

PREMIRRORS_append =3D "\
bzr://.*/.*   http://pokylinux.org/sources/ \n \
cvs://.*/.*   http://pokylinux.org/sources/ \n \
git://.*/.*   http://pokylinux.org/sources/ \n \
hg://.*/.*    http://pokylinux.org/sources/ \n \
osc://.*/.*   http://pokylinux.org/sources/ \n \
p4://.*/.*    http://pokylinux.org/sources/ \n \
svk://.*/.*   http://pokylinux.org/sources/ \n \
svn://.*/.*   http://pokylinux.org/sources/ \n \
bzr://.*/.*   http://autobuilder.pokylinux.org/sources/ \n \
cvs://.*/.*   http://autobuilder.pokylinux.org/sources/ \n \
git://.*/.*   http://autobuilder.pokylinux.org/sources/ \n \
hg://.*/.*    http://autobuilder.pokylinux.org/sources/ \n \
osc://.*/.*   http://autobuilder.pokylinux.org/sources/ \n \
p4://.*/.*    http://autobuilder.pokylinux.org/sources/ \n \
svk://.*/.*   http://autobuilder.pokylinux.org/sources/ \n \
svn://.*/.*   http://autobuilder.pokylinux.org/sources/ \n"

MIRRORS_append =3D "\
ftp://.*/.*     http://pokylinux.org/sources/ \n \
http://.*/.*    http://pokylinux.org/sources/ \n \
https://.*/.*   http://pokylinux.org/sources/ \n \
ftp://.*/.*      http://autobuilder.pokylinux.org/sources/ \n \
http://.*/.*     http://autobuilder.pokylinux.org/sources/ \n \
https://.*/.*    http://autobuilder.pokylinux.org/sources/ \n"

--=20
Regards
Samuel


