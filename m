Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RBUiA-0002w5-74
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 18:52:51 +0200
Received: by pzd13 with SMTP id 13so4808508pzd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2011 09:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Pb2i997to5GIys/8/Pc1F0gLd5FoUZSQIFtckZyv6r8=;
	b=OcSoaS4P5hFT/pWlkGfn8XDZF/yzqns10JHBSzTf904dAiforPbw6Gp7GcrAnrqGN1
	02E4PQfVvN9MROOIZIDYZROvTOt34l90BFoBBE8kNErAdWLtVb4uHrZ7mwHR/8hgcCwe
	07YHf0D1ZCe8MYXZ6s4XpyfzhSOw3LFiZCRwI=
Received: by 10.68.7.202 with SMTP id l10mr20210474pba.22.1317833234094; Wed,
	05 Oct 2011 09:47:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.49.129 with HTTP; Wed, 5 Oct 2011 09:46:44 -0700 (PDT)
In-Reply-To: <1317814555.14671.137.camel@ted>
References: <1317765787-19127-1-git-send-email-msm@freescale.com>
	<1317765787-19127-5-git-send-email-msm@freescale.com>
	<4E8B9F2C.5030706@gmail.com> <1317814555.14671.137.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Oct 2011 09:46:44 -0700
Message-ID: <CAMKF1soS8zAXx23ctCDC6spfvtr2J2xyjuDp4e+xsTyE_SaG2g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/6] Fix sysprof for powerpc64
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
X-List-Received-Date: Wed, 05 Oct 2011 16:52:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 5, 2011 at 4:35 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2011-10-04 at 17:05 -0700, Khem Raj wrote:
>> On 10/4/2011 3:03 PM, Matthew McClintock wrote:
>> > sysprof will not build properly without this defined
>> >
>> > Signed-off-by: Matthew McClintock<msm@freescale.com>
>> > ---
>> > No comments on original patch sent
>> >
>> > =C2=A0 meta/recipes-kernel/sysprof/sysprof_git.bb | =C2=A0 =C2=A02 ++
>> > =C2=A0 1 files changed, 2 insertions(+), 0 deletions(-)
>> >
>> > diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes=
-kernel/sysprof/sysprof_git.bb
>> > index 10bde04..271b5d8 100644
>> > --- a/meta/recipes-kernel/sysprof/sysprof_git.bb
>> > +++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
>> > @@ -16,6 +16,8 @@ SRC_URI_append_arm =C2=A0=3D " file://rmb-arm.patch"
>> > =C2=A0 SRC_URI_append_mips =3D " file://rmb-mips.patch"
>> > =C2=A0 SRC_URI_append_powerpc =3D " file://ppc-macro-fix.patch"
>> >
>> > +export CFLAGS_append_powerpc64 =3D " -D__ppc64__"
>> > +
>>
>> this is a gcc built-in define I wonder why you need to add it explicitly
>
> Are you sure? Is the built-in define not __powerpc64__ ?

yes that one too is a builtin define. I don't have the OE/ppc64 build
around to explore more

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
>


