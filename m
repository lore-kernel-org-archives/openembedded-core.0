Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R24x1-0005aF-NH
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Sep 2011 19:33:16 +0200
Received: by yia28 with SMTP id 28so1021769yia.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Sep 2011 10:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=bhyvM4O6mG89nekE7LKe3V2yHhn1mchQsxFpt5/TL0c=;
	b=dp+Xuyt/dCvgsIEMWCcMKqWg2vI8PbQblCDu90KX3ZeMOYH6ZQs3R8JUxxM5Ve+22/
	wdA2/1NEKmRvEiSUHUyYKQQWBKkvE1ICHo+OHzy7JMkXQRyKbtJperH3dbmyCOLGiuh+
	8XPDAcrKvD0p+5y/CF6WXReXy2WXyvAe9jWgo=
MIME-Version: 1.0
Received: by 10.68.7.170 with SMTP id k10mr331425pba.176.1315589289861; Fri,
	09 Sep 2011 10:28:09 -0700 (PDT)
Received: by 10.142.223.1 with HTTP; Fri, 9 Sep 2011 10:28:09 -0700 (PDT)
In-Reply-To: <1315346049-8611-4-git-send-email-joelagnel@ti.com>
References: <1315346049-8611-1-git-send-email-joelagnel@ti.com>
	<1315346049-8611-4-git-send-email-joelagnel@ti.com>
Date: Fri, 9 Sep 2011 19:28:09 +0200
Message-ID: <CA+chaQfD1Wp3tX4fF0vhdosF_mGi=6ajU3d3oNboA=Ntf_-JFw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: jdk@ti.com, k-kooi@ti.com
Subject: Re: [PATCH v2 meta-oe 3/8] libdvdread: Imported from OE classic
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
X-List-Received-Date: Fri, 09 Sep 2011 17:33:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 6, 2011 at 11:54 PM, Joel A Fernandes <joelagnel@ti.com> wrote:
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> ---
> =C2=A0.../libdvdread/libdvdread_4.1.3-10.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 16 ++++++++++++++++
> =C2=A01 files changed, 16 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 meta-oe/recipes-multimedia/libdvdread/libdvdread=
_4.1.3-10.bb
>
> diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.1.3-10.bb=
 b/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.1.3-10.bb
> new file mode 100644
> index 0000000..f17043b
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.1.3-10.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "DVD access multimeda library"
> +SECTION =3D "libs/multimedia"
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> +SRC_URI =3D "git://git.debian-maintainers.org/git/daniel/${PN}.git;proto=
col=3Dgit;branch=3Ddebian"
> +
> +SRCREV =3D "e465b500c12be5b4c0b6918a9b98038611f66c57"


http://git.debian-maintainers.org/?p=3Ddaniel/libdvdread.git
says
404 - No such project
even with
http://packages.qa.debian.org/libd/libdvdread.html
still pointing there

Can you change it to
http://ftp.de.debian.org/debian/pool/main/libd/libdvdread/libdvdread_4.1.3.=
orig.tar.gz
+
http://ftp.de.debian.org/debian/pool/main/libd/libdvdread/libdvdread_4.1.3-=
10.diff.gz
or find some fetchable repo for that?

Thanks,


> +S =3D "${WORKDIR}/git"
> +
> +inherit autotools lib_package binconfig pkgconfig
> +
> +do_unpackpost() {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0QUILT_PATCHES=3Ddebian/patches quilt push -a
> +}
> +
> +addtask unpackpost after do_unpack before do_patch
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


