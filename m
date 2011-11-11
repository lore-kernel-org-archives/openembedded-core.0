Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1ROfgK-00075L-HC
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 02:13:24 +0100
Received: by wyh5 with SMTP id 5so3662754wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 17:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=CyHpxTFvGs5Ujc1mgo2ilHupanjUke52/GaBJYQFZ7s=;
	b=rZ6tek8IbxTOeiV8OJktnNqCu2hXWhYbpoY8ALj1EksBY811i6eTirrOuOD8srYzPT
	bIoJ3DTtPJzqxEwgPZmS4/Nv9Syb7X3xuifoSPK1SUPTmkxC2Ch66TpD+qodPZ59OiX2
	WiJJvo30/pA3Dshumy4eGZe/W2/vtnVQT732Q=
Received: by 10.216.54.83 with SMTP id h61mr1384wec.6.1320973627079; Thu, 10
	Nov 2011 17:07:07 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.28.138 with HTTP; Thu, 10 Nov 2011 17:06:45 -0800 (PST)
In-Reply-To: <CAEsOVNfyeYRkEhL1LD1GYBrxqdvNEkjbG5fWgwpTRH_UEyxedA@mail.gmail.com>
References: <1320441301.3137.1.camel@lenovo.internal.reciva.com>
	<1320441941-30850-1-git-send-email-msm@freescale.com>
	<1320442499.3296.4.camel@lenovo.internal.reciva.com>
	<CAEsOVNdRnM_TachXg=WD4g6iYFGxSgGfx2bWx+PdArfhvuFseA@mail.gmail.com>
	<CAEsOVNdLNUO+nDVjyU8DeoYzRDb0drGT3J2osopX_qGTZ4Swrg@mail.gmail.com>
	<1320785264.3080.1.camel@lenovo.internal.reciva.com>
	<CAEsOVNfyeYRkEhL1LD1GYBrxqdvNEkjbG5fWgwpTRH_UEyxedA@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 10 Nov 2011 18:06:45 -0700
X-Google-Sender-Auth: vW8cOTDulMeGumfqTAJfQACnQso
Message-ID: <CABcZANk4sW1sNQ_18MdP_JSAPnAdCeUOci-gk-Zrj3=p78Lsxg@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] Introduce new SERIAL_CONSOLES to add multiple consoles for your MACHINE
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
X-List-Received-Date: Fri, 11 Nov 2011 01:13:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 8, 2011 at 1:50 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Tue, Nov 8, 2011 at 2:47 PM, Phil Blundell <philb@gnu.org> wrote:
>> On Tue, 2011-11-08 at 19:36 +0000, McClintock Matthew-B29882 wrote:
>>> On Mon, Nov 7, 2011 at 5:03 PM, Matthew McClintock <msm@freescale.com> =
wrote:
>>> > I don't get it. I think the first version was still OK. The first
>>> > version is pasted below.
>>> >
>>> >> + =C2=A0 =C2=A0idx=3D0
>>> >> + =C2=A0 =C2=A0tmp=3D"${SERIAL_CONSOLES}" <- If it's not defined thi=
s will catch it.
>>> >> + =C2=A0 =C2=A0for i in $tmp
>>> >> + =C2=A0 =C2=A0do
>>> >> + =C2=A0 =C2=A0 j=3D`echo ${i} | sed s/\;/\ /g`
>>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0echo "${idx}:2345:respawn:${base_sbindi=
r}/getty ${j}" >> ${D}${sysconfdir}/inittab
>>> >> + =C2=A0 =C2=A0 idx=3D`expr $idx + 1`
>>> >> + =C2=A0 =C2=A0done
>>> >
>>> > See my inline comment above, but if SERIAL_CONSOLES is not defined
>>> > tmp=3D"" and the for loop won't execute. Not sure if there is a more
>>> > standard way to do this though.
>>>
>>> ping..
>>
>> Yeah, now I look at this again I think it is probably OK. =C2=A0Bitbake =
won't
>> expand ${SERIAL_CONSOLES} if it's unset, but the shell will and I think
>> you probably will get the right results. =C2=A0Assuming you've actually
>> tested that case and it does work, I think I'm happy with what you have
>> above.
>
> Thanks Phil, I wanted to make sure I was not missing something obvious ;)=
.
>

Note that one could always define SERIAL_CONSOLES ?=3D "" somewhere
appropriate. Wouldn't hurt anything to define defaults for things we
use. Maybe someday we can make referencing undefined variables raise
an error rather than this whole 'if bitbake doesn't expand it, let the
shell do it' behavior which is unintuitive. Not easily knowing when
something will be evaluated is problematic.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


