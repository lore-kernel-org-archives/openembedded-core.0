Return-Path: <vomegaz@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4238A71B31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 09:55:00 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id h70so5404947ioi.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 02:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BdP/iWnboN8QnmqIHpaoTBhwhR9Fo16PbXk5qZ18oXU=;
	b=GT6gnTDSh05j14hEdcr6Efr3M2VDMfbiLbmSGXAAMwEn7upVLFBPtKU3oZkGaOhx1L
	v96xmXa2DVh/Lk01/XUxmPBY9ljRGgWghxu9gowEB9si5x1GWJ4bUX/hoM51IxuWrjvf
	0Q9WF8jAyhXz8IyNkq57QqhfxNA4SgC6NAkDS0PxcPRhOBEeO22L9PQlaDuuTg6n71+f
	JX+6jQ6pcxQn3YMTC7saiYakcVf77fUcPjhZgF/7Uz0k+ZIY/KFn8PtwoyOlZr1cprQp
	WDrR8YhjPHaVPpWVQHfLi5TO94ugBIji/XCxuz5uMbOM+vahwjWTJGSjrFSRWSHndUIV
	fMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=BdP/iWnboN8QnmqIHpaoTBhwhR9Fo16PbXk5qZ18oXU=;
	b=bAj3W25b76TxEZVtLnlmsdyJU3clu4q9Hk42g6eLhR3B7+81dPD+y24jWBX7giNPbI
	9YciJo5lv5R1RhsYn9RSpgnWqW3litypTA88AkWqeaArH3uc9BQX/3Yur1x1Tp4LsycT
	8fz/UAoYifUK6izwip7StdvW901HvlOuGRGY1twOYEYL3QO4Tv4zigEa2u8wEqTSL7kS
	uomigBTYHG3iB3queFK/PskZmBBDEIVcfCPTiaB4M8MWWWJ0J6iL85P2wYQ5mXlRuKpy
	viIOCEuZkVx8ZyIOMTxGNAmjC7TEz/FAqu1C8LE3A0v2w8PRh75o70kqNXXnSZe+eZkr
	lcoQ==
X-Gm-Message-State: AMCzsaWsYa/iAcPa5Z72Nw2i8qBQ96hW9XNZ9yWxkT0oFnfL0hIGoNBT
	596XSwtY6+tMJyFDjLRZzpfbmONi6spudIPMRAlD1q7T
X-Google-Smtp-Source: ABhQp+TaSp00LfSdm4Yz3I73A0BChZN5dM4Q55PwuH9XArUhG9RNULlihlOwug5tOFZaHougdEStUCZ/732yA8RJUmQ=
X-Received: by 10.107.46.143 with SMTP id u15mr1082026iou.251.1508320502062;
	Wed, 18 Oct 2017 02:55:02 -0700 (PDT)
MIME-Version: 1.0
Reply-To: thomas.perrot@tupi.fr
Sender: vomegaz@gmail.com
Received: by 10.107.167.211 with HTTP; Wed, 18 Oct 2017 02:54:21 -0700 (PDT)
In-Reply-To: <1508310160.20275.8.camel@andred.net>
References: <20171017165424.22887-1-thomas.perrot@tupi.fr>
	<1508310160.20275.8.camel@andred.net>
From: Thomas PERROT <thomas.perrot@tupi.fr>
Date: Wed, 18 Oct 2017 11:54:21 +0200
X-Google-Sender-Auth: y22c19VEgB2kU5lnG0j4-34AW3s
Message-ID: <CAGXeWgmAoRhF0g564hQdC-R1708kSiKTuoj_8L-p8PX5jfQF8A@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta][pyro][PATCH] Fix some issues in the fitImage generation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Oct 2017 09:55:01 -0000
Content-Type: multipart/alternative; boundary="001a113aa89cbba0fb055bcf3b76"

--001a113aa89cbba0fb055bcf3b76
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I updated the commit message with the reason for the third change.

When INITRAMFS_IMAGE_BUNDLE is set to 1 and the kernel image type is a
fitimage the task do_bundle_initramfs should be only substitute the
initramfs of KERNEL_IMAGETYPE_FOR_MAKE (e.g Image for aarch64, zImage for
arm...).

Best regards,
Thomas P.




On Wed, Oct 18, 2017 at 9:02 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:

> On Tue, 2017-10-17 at 18:54 +0200, Thomas Perrot wrote:
> > - Bad image type replacement for aarch64
> > - Fix DTB path in fitimage.its
> > - Ignore fitImage type during the packaging of the initramfs
> >
> > Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
> > ---
> >  meta/classes/kernel-fitimage.bbclass | 6 +++++-
> >  meta/classes/kernel.bbclass          | 4 +++-
> >  2 files changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel=
-
> > fitimage.bbclass
> > index 2630b47316..abbc309b09 100644
> > --- a/meta/classes/kernel-fitimage.bbclass
> > +++ b/meta/classes/kernel-fitimage.bbclass
> > @@ -7,8 +7,11 @@ python __anonymous () {
> >          depends =3D "%s u-boot-mkimage-native dtc-native" % depends
> >          d.setVar("DEPENDS", depends)
> >
> > -        if d.getVar("UBOOT_ARCH") =3D=3D "x86":
> > +        uarch =3D d.getVar("UBOOT_ARCH")
> > +        if uarch =3D=3D "x86":
> >              replacementtype =3D "bzImage"
> > +        elif uarch =3D=3D "arm64":
> > +            replacementtype =3D "Image"
>
> I can't see this in master - it should go there first.
>
> Cheers,
> Andre'
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113aa89cbba0fb055bcf3b76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi, <br><br></div><span id=3D"gmail-result_=
box" class=3D"gmail-" tabindex=3D"-1" lang=3D"en"><span>I updated the commi=
t message with the reason for the third change.<br><br></span></span></div>=
<span id=3D"gmail-result_box" class=3D"gmail-" tabindex=3D"-1" lang=3D"en">=
<span>When </span></span>INITRAMFS_IMAGE_BUNDLE is set to 1 and the kernel =
image type is a fitimage the task do_bundle_initramfs should be only substi=
tute the initramfs of KERNEL_IMAGETYPE_FOR_MAKE (e.g Image for aarch64, zIm=
age for arm...).<br></div><div><br></div><div>Best regards,</div><div>Thoma=
s P.<br></div><div><br><span id=3D"gmail-result_box" class=3D"gmail-" tabin=
dex=3D"-1" lang=3D"en"><span></span></span></div><div class=3D"gmail_extra"=
><br clear=3D"all"><div><div class=3D"gmail_signature" data-smartmail=3D"gm=
ail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"=
><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><table style=3D"color:rgb=
(88,88,90);font-family:Verdana,Arial;font-size:10px"><tbody><tr><td valign=
=3D"top"><br></td><td style=3D"padding-left:10px;border-left-width:1px;bord=
er-left-style:solid;border-left-color:rgb(0,153,153)" valign=3D"top"></td><=
/tr></tbody></table></div></div></div></div></div></div></div></div></div><=
/div></div></div>
<br><div class=3D"gmail_quote">On Wed, Oct 18, 2017 at 9:02 AM, Andr=C3=A9 =
Draszik <span dir=3D"ltr">&lt;<a href=3D"mailto:git@andred.net" target=3D"_=
blank">git@andred.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x"><span class=3D"">On Tue, 2017-10-17 at 18:54 +0200, Thomas Perrot wrote:=
<br>
&gt; - Bad image type replacement for aarch64<br>
&gt; - Fix DTB path in fitimage.its<br>
&gt; - Ignore fitImage type during the packaging of the initramfs<br>
&gt;<br>
&gt; Signed-off-by: Thomas Perrot &lt;<a href=3D"mailto:thomas.perrot@tupi.=
fr">thomas.perrot@tupi.fr</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/kernel-fitimage.<wbr>bbclass | 6 +++++-<br>
&gt;=C2=A0 meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
4 +++-<br>
&gt;=C2=A0 2 files changed, 8 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/kernel-<wbr>fitimage.bbclass b/meta/classes/=
kernel-<br>
&gt; fitimage.bbclass<br>
&gt; index 2630b47316..abbc309b09 100644<br>
&gt; --- a/meta/classes/kernel-<wbr>fitimage.bbclass<br>
&gt; +++ b/meta/classes/kernel-<wbr>fitimage.bbclass<br>
&gt; @@ -7,8 +7,11 @@ python __anonymous () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depends =3D &quot;%s u-boot-mkimage-=
native dtc-native&quot; % depends<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;DEPENDS&quot;, depend=
s)<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&quot;UBOOT_ARCH&quot;) =3D=
=3D &quot;x86&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uarch =3D d.getVar(&quot;UBOOT_ARCH&quot;=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if uarch =3D=3D &quot;x86&quot;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 replacementtype =3D &q=
uot;bzImage&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif uarch =3D=3D &quot;arm64&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 replacementtype =3D &quot;I=
mage&quot;<br>
<br>
</span>I can&#39;t see this in master - it should go there first.<br>
<br>
Cheers,<br>
Andre&#39;<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div></div>

--001a113aa89cbba0fb055bcf3b76--
