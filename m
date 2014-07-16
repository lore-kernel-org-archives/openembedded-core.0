Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id F3A5670245
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 16:36:58 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id el20so833906lab.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 09:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=6T7KpvTjSy3zfKwRQ8ZRHcZeShXL1zHYjTtiRwnnOXY=;
	b=JVwU9mNr1goKIDRPoibPxUsRupeeykU/klwV/41L8k1pNFPp+GKPAneNAFdaz7GiGp
	7Tp9u8m40u+hcLRkoQrOJXo+LigqG+svs00L8SLz3wgGV2L1GYV95NQdSTOksp36OnAk
	vrbY8juuYNeawkkceYab7BLMQrQIQfetAaqyfW6HTyO/MDBWdfwcodrb6PdniuZMa2ip
	Csd8kL6jr9hlhy4gflJi1ZbqQ2XftetPB/gP0sYzTUEn80aI8FU5DH1UhcJAl0qeBfZ9
	H0ihEo9NhK7unwE376F4z+cya3IOxTAo7PHK2HZ6Ymlu7hp2nVjc/r+W1wet/4e+9PI5
	EB6A==
X-Received: by 10.112.160.105 with SMTP id xj9mr25014426lbb.2.1405528618999;
	Wed, 16 Jul 2014 09:36:58 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.63.72 with HTTP; Wed, 16 Jul 2014 09:36:38 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1407160719540.5398@localhost>
References: <alpine.LFD.2.11.1407160719540.5398@localhost>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 16 Jul 2014 09:36:38 -0700
X-Google-Sender-Auth: 2sU4M37eXugIRU-Af5zgaSu8xME
Message-ID: <CABcZANnfhoCkE_ttWfcGA4PMJQ3YH912XrTHP6AH=9QAf8z=0Q@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: two variations for distro-specific FILESEXTRAPATHS prepending
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
X-List-Received-Date: Wed, 16 Jul 2014 16:37:03 -0000
Content-Type: multipart/alternative; boundary=001a11c2ab5c0ea88304fe522220

--001a11c2ab5c0ea88304fe522220
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 16, 2014 at 4:26 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>   just ran across this in the meta-yocto layer but it's a general OE
> question -- the psplash_git.bbappend file contains the following
> distro-conditional line:
>
>   FILESEXTRAPATHS_prepend_poky := "${THISDIR}/files:"
>
> and the accompanying files/ directory has, unsurprisingly, a
> poky-specific splash image file, "psplash-poky-img.h".
>
>   but based on how FILESEXTRAPATHS is processed by incorporating all
> of the FILESOVERRIDES variations (one of which is the distro name),
> would it not have been entirely equivalent to have used simply
>
>     FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
>
> and placed that splash file in the accompanying directory files/poky/?
> would these two approaches do the same thing? is there a preferred
> way? that's the only example of that i've seen in all the layers i've
> played with.
>

Both would do the same thing, I'm personally of the opinion that the latter
would be more consistent with how such things are normally done.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c2ab5c0ea88304fe522220
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jul 16, 2014 at 4:26 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a =
href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.=
ca</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":9p" class=3D"a3s" style=3D"overf=
low:hidden">
=C2=A0 just ran across this in the meta-yocto layer but it&#39;s a general =
OE<br>
question -- the psplash_git.bbappend file contains the following<br>
distro-conditional line:<br>
<br>
=C2=A0 FILESEXTRAPATHS_prepend_poky :=3D &quot;${THISDIR}/files:&quot;<br>
<br>
and the accompanying files/ directory has, unsurprisingly, a<br>
poky-specific splash image file, &quot;psplash-poky-img.h&quot;.<br>
<br>
=C2=A0 but based on how FILESEXTRAPATHS is processed by incorporating all<b=
r>
of the FILESOVERRIDES variations (one of which is the distro name),<br>
would it not have been entirely equivalent to have used simply<br>
<br>
=C2=A0 =C2=A0 FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/files:&quot;<br=
>
<br>
and placed that splash file in the accompanying directory files/poky/?<br>
would these two approaches do the same thing? is there a preferred<br>
way? that&#39;s the only example of that i&#39;ve seen in all the layers i&=
#39;ve<br>
played with.</div></blockquote></div><br></div><div class=3D"gmail_extra">B=
oth would do the same thing, I&#39;m personally of the opinion that the lat=
ter would be more consistent with how such things are normally done.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a11c2ab5c0ea88304fe522220--
