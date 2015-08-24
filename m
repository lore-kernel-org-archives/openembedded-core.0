Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id D073776BEA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:36:38 +0000 (UTC)
Received: by iods203 with SMTP id s203so153036668iod.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 08:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=GogeFIa84TIbjkrippQW6mkaw2Qc9+KY32M8R3meZr0=;
	b=RSRuKMlnGIuJOr/v4fKd5qJ/7vKxwMGP9J9wLxN/RlazHDmusoQ1cyQ7TSUmd8oDXF
	Icf+3Xo2UB0ZPCmAOG0IapgVdLWTZm5eqTLREyYoR8JGLrwzIVx2pXGhSyruMSD+VefJ
	eMQiRFO0MdYuRNT14/DdBptnvzhtKCvl+b3yySBlE2C5T1tbZhStISlEfaom64Eg+9yg
	sv9rd0iZ3uB7+sMO8XI0y+LCkrlyZncm57B27Y4LpYA7ws5NDKEcMTwXrTQ4SS2n0qH6
	YhYsINI5kVMTMsSjM+y+JxLwYmWG8db18UzEmi+3OKSyjVUWHzoXkdN9/2bWTdHeHi1p
	pBgw==
X-Received: by 10.107.40.200 with SMTP id o191mr392009ioo.83.1440430598484;
	Mon, 24 Aug 2015 08:36:38 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.71 with HTTP; Mon, 24 Aug 2015 08:36:19 -0700 (PDT)
In-Reply-To: <1440417912.3543.20.camel@intel.com>
References: <1440417012.3543.16.camel@intel.com>
	<1440417912.3543.20.camel@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 24 Aug 2015 08:36:19 -0700
X-Google-Sender-Auth: 8lReZGlUWHqL73Lg8kPEqh3GAb0
Message-ID: <CABcZAN=TNxDav=KcF+dgzOw8Npgn+=4wbKg919uT+o7zfoFj_g@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu + initramfs
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
X-List-Received-Date: Mon, 24 Aug 2015 15:36:38 -0000
Content-Type: multipart/alternative; boundary=001a1141cf8c257a75051e1062d1

--001a1141cf8c257a75051e1062d1
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 24, 2015 at 5:05 AM, Patrick Ohly <patrick.ohly@intel.com>
wrote:

> On Mon, 2015-08-24 at 13:50 +0200, Patrick Ohly wrote:
> > Hello!
> >
> > I just tried to boot a custom image under qemu with
> > core-image-minimal-initramfs included in the kernel. For that, I added
> > to my local.conf:
> >
> >         INITRAMFS_IMAGE = "core-image-minimal-initramfs"
> >         INITRAMFS_IMAGE_BUNDLE = "1"
> >
> > The extended kernel now gets built fine with the normal "bitbake
> > <image>".
>
> Speaking of qemu and core-image-minimal-initramfs, that initramfs isn't
> really suitable as it stands. It uses init-live-boot, which expects to
> boot from removable media instead of the fixed disk provided by qemu.
>
> Is there anything more suitable or do I have to roll my own init script
> entirely, perhaps based on initramfs-framework?


Just a note, in meta-mentor we removed initramfs-live-install and
initramfs-live-install-efi from core-image-minimal-initramfs and split that
off into core-image-minimal-install-initramfs, and set INITRD_IMAGE =
"core-image-minimal-install-initramfs" (that's what image-live.bbclass
obeys). Not sure if that's ideal, and admittedly haven't done much testing
with those images, but I think it makes more sense, name wise, for
core-image-minimal-initramfs to be a general image, not something which
handles installation.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1141cf8c257a75051e1062d1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Aug 24, 2015 at 5:05 AM, Patrick Ohly <span dir=3D"ltr">&lt;<a href=
=3D"mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204)=
;border-left-style:solid;padding-left:1ex"><span class=3D"">On Mon, 2015-08=
-24 at 13:50 +0200, Patrick Ohly wrote:<br>
&gt; Hello!<br>
&gt;<br>
&gt; I just tried to boot a custom image under qemu with<br>
&gt; core-image-minimal-initramfs included in the kernel. For that, I added=
<br>
&gt; to my local.conf:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INITRAMFS_IMAGE =3D &quot;core-image-=
minimal-initramfs&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INITRAMFS_IMAGE_BUNDLE =3D &quot;1&qu=
ot;<br>
&gt;<br>
&gt; The extended kernel now gets built fine with the normal &quot;bitbake<=
br>
&gt; &lt;image&gt;&quot;.<br>
<br>
</span>Speaking of qemu and core-image-minimal-initramfs, that initramfs is=
n&#39;t<br>
really suitable as it stands. It uses init-live-boot, which expects to<br>
boot from removable media instead of the fixed disk provided by qemu.<br>
<br>
Is there anything more suitable or do I have to roll my own init script<br>
entirely, perhaps based on initramfs-framework?</blockquote></div><br>Just =
a note, in meta-mentor we removed=C2=A0initramfs-live-install and initramfs=
-live-install-efi from core-image-minimal-initramfs and split that off into=
 core-image-minimal-install-initramfs, and set INITRD_IMAGE =3D &quot;core-=
image-minimal-install-initramfs&quot; (that&#39;s what image-live.bbclass o=
beys). Not sure if that&#39;s ideal, and admittedly haven&#39;t done much t=
esting with those images, but I think it makes more sense, name wise, for c=
ore-image-minimal-initramfs to be a general image, not something which hand=
les installation.<br>-- <br><div class=3D"gmail_signature">Christopher Lars=
on<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZa=
urus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</di=
v>
</div></div>

--001a1141cf8c257a75051e1062d1--
