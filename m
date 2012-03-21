Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SAMHI-00086c-TB
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 15:12:41 +0100
Received: by qao25 with SMTP id 25so719184qao.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 07:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=c718X3PWpe5DNfrPI4wL+PBHPs15LeQ06ICflMaTElI=;
	b=OceL8jtm4zr6hgize1+DpV9hFpQg5nVBEJpryGP2gQA6PQGemjZ1F4H5YjVwA5tEdE
	8tssXIXP24cZusmyodzkZUKDy9cZnY/aSH/DszOpz/wea8rNVlV6TIvfavN/duJ32D5w
	bUaYaNGPZyDBJOlBdGagMFfTrftwTCWOs/02qLVnIDaBZFVZlyGsRuPUnd90Ewo4OhV6
	phhV6NR0NUAK+X1jRbaxRNPD9fMOWOGeX+UAv3WkOQF4qERbGy/2Dsbeqfgto/3yMbxx
	ESW+tsWj2LdUfZnVP3SPiN2oTz/2mdhBwhsppadWDoTRpPlFM2XrCJerSxuVhK9yOCS/
	AhvQ==
Received: by 10.224.210.129 with SMTP id gk1mr5790170qab.85.1332338626758;
	Wed, 21 Mar 2012 07:03:46 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.103.147 with HTTP; Wed, 21 Mar 2012 07:03:26 -0700 (PDT)
In-Reply-To: <4F69B2B5.1010607@slimlogic.co.uk>
References: <alpine.DEB.2.02.1203210615100.21394@oneiric>
	<alpine.DEB.2.02.1203210625530.16813@oneiric>
	<101A2F63-917B-40EA-809F-E42FF0C1DE14@dominion.thruhere.net>
	<4F69B2B5.1010607@slimlogic.co.uk>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 21 Mar 2012 07:03:26 -0700
X-Google-Sender-Auth: 15Kva0P-cnAnjDM4P2RNOjL0ZzE
Message-ID: <CABcZANmwUbGd2GMrNxaDRvvt9Mx=mKnY6pU2bmnO68SrWsmTWw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: what is meaning of "SRC_URI_append_whatever +=" ??
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
X-List-Received-Date: Wed, 21 Mar 2012 14:12:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 21, 2012 at 3:51 AM, Graeme Gregory <gg@slimlogic.co.uk> wrote:
> On 21/03/2012 10:46, Koen Kooi wrote:
>> Op 21 mrt. 2012, om 11:28 heeft Robert P. J. Day het volgende geschreven=
:
>>
>>> On Wed, 21 Mar 2012, Robert P. J. Day wrote:
>>>
>>>> =C2=A0still perusing the very basics of oe-core and grepping madly, ca=
me
>>>> across the following oddity:
>>>>
>>>> $ grep -r SRC_URI_append *
>>>> ... snip ...
>>>> bitbake/doc/manual/usermanual.xml:SRC_URI_append_1.0.7+ =3D "file://so=
me_patch_which_the_new_versions_need.patch;patch=3D1"</screen></para>
>>>> meta/recipes-support/gmp/gmp_5.0.4.bb:SRC_URI_append +=3D "file://use-=
includedir.patch \
>>>> meta/recipes-support/libcroco/libcroco_0.6.3.bb:SRC_URI_append =3D " f=
ile://croco.patch;apply=3Dyes "
>>>> ... snip ...
>>>>
>>>> =C2=A0AIUI, there are two (common) variations for extending SRC_URI. =
=C2=A0the
>>>> straightforward unconditional way:
>>>>
>>>> =C2=A0SRC_URI +=3D ... blah blah ...
>>>>
>>>> or if you need to make it conditional, then there's
>>>>
>>>> =C2=A0SRC_URI_append_thingy =3D "whatever"
>>>>
>>>> so what's with the latter two entries above?
>>>>
>>>> meta/recipes-support/gmp/gmp_5.0.4.bb:SRC_URI_append +=3D "file://use-=
includedir.patch \
>>>> meta/recipes-support/libcroco/libcroco_0.6.3.bb:SRC_URI_append =3D " f=
ile://croco.patch;apply=3Dyes "
>>>>
>>>> =C2=A0is there some subtlety i'm missing here? =C2=A0why would one eve=
r use
>>>> either of:
>>>>
>>>> =C2=A0SRC_URI_append +=3D "..." =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (looks redundant)
>>>> =C2=A0SRC_URI_append =3D "..." =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(why not just SRC_URI +=3D?)
>>>>
>>>> can i just assume those are typoes?
>>> =C2=A0following up on my own post, i decided to scan the entire oe-core
>>> tree:
>>>
>>> $ grep -r "_append +=3D" *
>>> meta/recipes-support/gmp/gmp_5.0.4.bb:SRC_URI_append +=3D "file://use-i=
ncludedir.patch \
>>> meta/recipes-core/eglibc/eglibc-package.inc:FILES_${PN}-dev_append +=3D=
 "${bindir}/rpcgen ${libdir}/*_nonshared.a \
>>> meta/recipes-core/eglibc/eglibc-package.inc:FILES_${PN}-staticdev_appen=
d +=3D "${libdir}/*.a ${base_libdir}/*.a"
>>> meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb:CFLAGS_append +=3D " -I $=
{S}/include/X11/XprintUtil -I ${S}/include/X11/extensions"
>>> $
>>>
>>> =C2=A0and i thought i'd look for another pattern as well:
>>>
>>> $ grep -r "_append_.*+=3D" *
>>> meta/recipes-graphics/tslib/tslib_1.0.bb:SRC_URI_append_qemumips +=3D "=
 file://32bitBE-support.patch"
>>> meta/recipes-graphics/tslib/tslib_1.0.bb:SRC_URI_append_qemuppc +=3D " =
file://32bitBE-support.patch"
>>> meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb:SRC_URI_append_poky +=3D =
" file://owl-menu.patch;apply=3Dyes "
>>> $
>>>
>>> =C2=A0of course, if all of the above is perfectly valid, i'm going to b=
e
>>> embarrassed.
>>
>> AFAICT '_append +=3D' is completely bogus.
>>
>
> I beleive its valid to do
>
> BLAH_append =3D "spanner"
> BLAH_append +=3D "toolbox"
>
> then final result is BLAH_append variable is "spanner toolbox" then the
> overrides happen.


No, sorry, it's still bogus. _append isn't part of the variable name,
it's an operation. _append is *always* cumulative, so +=3D is redundant,
only being used to add the " " separator which you could add yourself
just as easily.
--=20
Christopher Larson


