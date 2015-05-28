Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id E0A157568E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 04:19:55 +0000 (UTC)
Received: by pdfh10 with SMTP id h10so32365821pdf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 21:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=PsNQOxR8uuoJC93z5QwQxjjfO8JSQ49RQ8Y+tFS5oq4=;
	b=JldQO4CKmhTjD+NNnlUpP0BQxBu6dy+leQdB68WglFWroMaQCEDgX5EV+s0zr1UwVC
	V2d7kjpmvobuJFP4OOd9jxaEhtzXNKw/IsLfrn4woMKUijz5fFgfrQAuXUU6TxB0R8A8
	b2L+bKOgd5O4MzCfwRY8Wwz1i6AtKkE4p3evxbjI7hACRPG6eX3jlK7i2s33u1SrRJnr
	k9+vCqM2y9Tb+1t0GNc7K5x6cjAv1cGpkD9amB0StZYLc+5ClpXahsPigblZaDfeKZp2
	X6/QAGB6yr4CuGhhBl0caYSqC+JfHihrPhENBvyS7vLlvVXybcD6x71MzCJF47exvCpX
	l1rw==
X-Received: by 10.70.35.230 with SMTP id l6mr1780274pdj.26.1432786797023;
	Wed, 27 May 2015 21:19:57 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:90eb:a06b:3186:ca08?
	([2601:9:3580:84c:90eb:a06b:3186:ca08])
	by mx.google.com with ESMTPSA id nz2sm721052pbb.40.2015.05.27.21.19.55
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 May 2015 21:19:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1432448758.12832.67.camel@linuxfoundation.org>
Date: Wed, 27 May 2015 21:19:50 -0700
Message-Id: <3ABA6702-FFD6-448B-99B2-5DD5723A3AD3@gmail.com>
References: <cover.1432320274.git.tanu.kaskinen@linux.intel.com>
	<e5260dbf168f3c51d9114e4c4cb1fca49abc83b1.1432320274.git.tanu.kaskinen@linux.intel.com>
	<1432448758.12832.67.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2098)
Cc: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 1/5] alsa-plugins: initial recipe
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
X-List-Received-Date: Thu, 28 May 2015 04:19:56 -0000
X-Groupsio-MsgNum: 66071
Content-Type: multipart/signed;
	boundary="Apple-Mail=_21A5EE15-3FFF-4C5C-8B58-D395B7583A76";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_21A5EE15-3FFF-4C5C-8B58-D395B7583A76
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 23, 2015, at 11:25 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Fri, 2015-05-22 at 21:51 +0300, Tanu Kaskinen wrote:
>> When PulseAudio is installed, alsa-plugins is needed to provide
>> compatibility for ALSA applications.
>>=20
>> The dependencies are set up so that pulseaudio-server depends on
>> alsa-plugins-pulseaudio-conf, and alsa-plugins-pulseaudio-conf =
depends
>> on the PulseAudio plugins. This should make the ALSA->PulseAudio
>> compatibility configuration work out of the box, while leaving the
>> PulseAudio specific configuration out on systems that don't have
>> pulseaudio-server installed.
>>=20
>> The alsa-plugins recipes in meta-guacamayo and meta-webos were used =
as
>> references, but this recipe is not a straight copy of either.
>>=20
>> Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
>=20
> FWIW this new recipe failed on the autobuilder when it was tested in a
> multilib build:
>=20
> ERROR: QA Issue: lib32-alsa-plugins: Files/directories were installed
> but not shipped in any package:
>  /usr/lib32/alsa-lib/libasound_module_rate_speexrate_medium.so
>  /usr/lib32/alsa-lib/libasound_module_rate_samplerate_order.so
>  /usr/lib32/alsa-lib/libasound_module_rate_samplerate_medium.so
>  /usr/lib32/alsa-lib/libasound_module_rate_samplerate_best.so
>  /usr/lib32/alsa-lib/libasound_module_rate_samplerate_linear.so
>  /usr/lib32/alsa-lib/libasound_module_rate_speexrate_best.so
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within
> do_install. [installed-vs-shipped]
>=20
> I created a follow up patch:
>=20
> =
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Drpurdie/t222=
&id=3Dbd4f5e346550f961f7a1056661f9b9fefdc8fff6
>=20
> which fixed this and meant to merge it immediately after your commit
> however it looks like I squashed the patches accidentally. In comes =
down
> to the class extension code not being able to rewrite entries from
> PACKAGES_DYNAMIC.


There are more errors I am seeing, I wonder if they are parallel install =
issues

| mv: cannot stat =
'/home/kraj/work/rdk/build-b2120-h412-a9/tmp/work/cortexa9hf-vfp-neon-rdk-=
linux-gnueabi/alsa-plugins/1.0.29-r0/image/usr/share/alsa/alsa.conf.d/99-p=
ulseaudio-default.conf.example': No such file or directory
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_install (log file is located at =
/home/kraj/work/rdk/build-b2120-h412-a9/tmp/work/cortexa9hf-vfp-neon-rdk-l=
inux-gnueabi/alsa-plugins/1.0.29-r0/temp/log.do_install.30933)
ERROR: Task 4117 =
(/home/kraj/work/rdk/openembedded-core/meta/recipes-multimedia/alsa/alsa-p=
lugins_1.0.29.bb, do_install) failed with exit code '1'


>=20
> Cheers,
>=20
> Richard
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_21A5EE15-3FFF-4C5C-8B58-D395B7583A76
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVml2oACgkQuwUzVZGdMxShwwCeMfJXFiYTXadlQH47JUMMxpjr
dcgAn3tFzKUI/VG/au8qHKxvLqknYh+I
=wgyh
-----END PGP SIGNATURE-----

--Apple-Mail=_21A5EE15-3FFF-4C5C-8B58-D395B7583A76--
