Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>)
	id 1QxmJt-000136-FT; Sun, 28 Aug 2011 22:51:05 +0200
Received: by vxj14 with SMTP id 14so3946895vxj.6
	for <multiple recipients>; Sun, 28 Aug 2011 13:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=SYfOUJI7OkIIDXrw7O1fN2WKIS6K2vtYavg74cM8wKg=;
	b=IyqmFFegdb9MhpwbokAhr94C1rfblDqm9peSogpekToevDxgHiEFKsAqmjMaT0z9mU
	2NJBkAywmLhD9hoz4fhYKiB8mIKqryDDJq38l+iHguT0+n8Ambz0H0uEKY/qHnwT+X4z
	4b1O9fFFlluAYKbEaCrQX6NQhVmgX2ROZ8JgI=
Received: by 10.220.108.137 with SMTP id f9mr1246553vcp.144.1314564373138;
	Sun, 28 Aug 2011 13:46:13 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.184.35 with HTTP; Sun, 28 Aug 2011 13:45:53 -0700 (PDT)
In-Reply-To: <CAD=GYpaZeb18B+wtGM5Wpv+8zNx+r=462K7Yx7+hK4z=dZrG5Q@mail.gmail.com>
References: <CAD=GYpaZeb18B+wtGM5Wpv+8zNx+r=462K7Yx7+hK4z=dZrG5Q@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sun, 28 Aug 2011 13:45:53 -0700
X-Google-Sender-Auth: F2M0Y-YB4b8-95FcdQAgnLHs_x0
Message-ID: <CABcZANm_0g3gSdxkE7-br1Ds2GMb0vENmGst7cdU--tOPDgw2A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "Kooi, Koen" <k-kooi@ti.com>, openembedded-devel@lists.openembedded.org,
	"Kridner, Jason" <jdk@ti.com>
Subject: Re: How do we get programs into sysroots?
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
X-List-Received-Date: Sun, 28 Aug 2011 20:51:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 28, 2011 at 1:07 PM, Joel A Fernandes <agnel.joel@gmail.com> wr=
ote:
> DESCRIPTION =3D "A tool to format SD Cards correctly"
> LICENSE =3D "GPLv2"
> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D393a5ca445f6965873eca0259a17f8=
33"
> SECTION =3D "base"
> SRC_URI =3D "file://mkcard.txt \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://COPYING.patch"
> PR =3D "r3"
>
> do_configure() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${WORKDIR}/mkcard.txt ${S}/
> }
>
> do_install() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${base_sbindir}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${S}/mkcard.txt ${D}${base_sbi=
ndir}/mkcard
> }
>
> BBCLASSEXTEND =3D "native"
> ---
>
> Everything works fine, but I don't see 'mkcard' in /sbin in sysroots
> directory. I'd like to install it there. I tried looking at other
> scripts to see the right way to do it but I'm not sure of a clean way
> to do so. I looked at the staging.bbclass and it seems to only pickup
> libs and headers.

When using a custom do_install, with BBCLASSEXTEND, afaik you need to
set NATIVE_INSTALL_WORKS =3D "1" to get its files into the sysroot for
the native version.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


