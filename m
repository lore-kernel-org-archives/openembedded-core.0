Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RBX0b-0006rM-QR
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 21:20:01 +0200
Received: by qyk10 with SMTP id 10so5261572qyk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2011 12:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=buAMbPGWYa4/jR6MGTAV8ZLqSOcZyf+3dC7zVE7fzM8=;
	b=tq37IGrPji4yL13cmPI8fIS9SVTmK6Yp7oYqGkq0VyL0IhgyNfon2YNJCuy1W2AGZy
	4VADU/VfaJEQCsOv5R7F5omH6mF2m8FVDwTXgXQmn54Lnvq0p1X3WXMihGVk2EBm8LiZ
	1kWmri5/SWjn3+i1Y7u8gzfO4ZWMeHM7fkIVA=
Received: by 10.68.32.73 with SMTP id g9mr21039229pbi.56.1317842066112; Wed,
	05 Oct 2011 12:14:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.49.129 with HTTP; Wed, 5 Oct 2011 12:13:56 -0700 (PDT)
In-Reply-To: <1317839445.2979.0.camel@lenovo.internal.reciva.com>
References: <1317765787-19127-1-git-send-email-msm@freescale.com>
	<1317765787-19127-5-git-send-email-msm@freescale.com>
	<4E8B9F2C.5030706@gmail.com> <1317814555.14671.137.camel@ted>
	<1317839445.2979.0.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Oct 2011 12:13:56 -0700
Message-ID: <CAMKF1so-npfO_L9namDF5xgO3gxP1E1MyrjtfFdQTY-1WZy2dg@mail.gmail.com>
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
X-List-Received-Date: Wed, 05 Oct 2011 19:20:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 5, 2011 at 11:30 AM, Phil Blundell <philb@gnu.org> wrote:
> On Wed, 2011-10-05 at 12:35 +0100, Richard Purdie wrote:
>> On Tue, 2011-10-04 at 17:05 -0700, Khem Raj wrote:
>> > On 10/4/2011 3:03 PM, Matthew McClintock wrote:
>> > > sysprof will not build properly without this defined
>> > >
>> > > Signed-off-by: Matthew McClintock<msm@freescale.com>
>> > > ---
>> > > No comments on original patch sent
>> > >
>> > > =C2=A0 meta/recipes-kernel/sysprof/sysprof_git.bb | =C2=A0 =C2=A02 +=
+
>> > > =C2=A0 1 files changed, 2 insertions(+), 0 deletions(-)
>> > >
>> > > diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recip=
es-kernel/sysprof/sysprof_git.bb
>> > > index 10bde04..271b5d8 100644
>> > > --- a/meta/recipes-kernel/sysprof/sysprof_git.bb
>> > > +++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
>> > > @@ -16,6 +16,8 @@ SRC_URI_append_arm =C2=A0=3D " file://rmb-arm.patc=
h"
>> > > =C2=A0 SRC_URI_append_mips =3D " file://rmb-mips.patch"
>> > > =C2=A0 SRC_URI_append_powerpc =3D " file://ppc-macro-fix.patch"
>> > >
>> > > +export CFLAGS_append_powerpc64 =3D " -D__ppc64__"
>> > > +
>> >
>> > this is a gcc built-in define I wonder why you need to add it explicit=
ly
>>
>> Are you sure? Is the built-in define not __powerpc64__ ?
>
> Yes, __powerpc64__ is the generic one. =C2=A0I think __ppc64__ is only a
> predefine on Darwin.

__powerpc64__ is not generic. Its Linux specific.

>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


