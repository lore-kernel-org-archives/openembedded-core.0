Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id F0F986076F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Oct 2016 20:30:11 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id n24so7754421pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Oct 2016 13:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=0Vgggw9suq5EpYoFjsFrWcsI6UCxyGOIQaENPCHdk/c=;
	b=PuaGXeS+cb0VXDtnXkAYf9PQubf9ImHhhoZH5yuCjpRhQEvYsRl90EhFMpCw2v2iXR
	Sgv5eb3mtqK6jIsCDViEtCnjbIbeU4hZNoz3bm4Ad9IbOi+l6aRNeAW+pj9IbWUub17I
	zhA4TdHf6CPsbrYm2nHugAH/xAuPRA5nGhhfRU10qqagfu+Nv4HzqpWtKOywQX1SDU1Q
	Vnq9nhX/aHi2n/Up7ccEvOWhUbSXQUk+YnmCAvehYs8VNhGFKPRXSByXQ7fmdvupBNjk
	CmMKczoF/Wwx6576xAjIEW5jK8qzfYByWKh8oo63fzy16+PoYG6Y+RwLCiPqpxVtxvI4
	CU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=0Vgggw9suq5EpYoFjsFrWcsI6UCxyGOIQaENPCHdk/c=;
	b=FE9CRre/QIBav1qEO4qCmSpE97uIeB7I1OgBNQtaG0rEazNI/sulAlxAP2Np/DTmSy
	M69du/pR8ycohtOxt5rxIb1u82EA665f/No36wrirX1YcMr2Y12JKYtIQksJqlTlAY2O
	oAOGZqwjmBprOMbUqzWFISJ9khFpuEmHCA0GWYidu4qVZZDTWcTQeeV8lD/cYnhEpw0w
	ZPPKBeW1OXfyk0BP3mhr+seS3MY7XSxSl3CsRuU43LjUlxd70YKA0SPAeO0yTvpzmDUH
	AJwKhgwNtvG+V+4iuEV8Vo4TRPJyUfFu/Fbd8LlZ2f9FnIvl2BUkimGGJlXrV0LxTLcr
	4OWg==
X-Gm-Message-State: AA6/9Rmc/Y2m5/lLQC30RYX6I6zIOMHHDAiD+fKyAlxndDcVQFTcTgSFayYOyU+SKMi3gw==
X-Received: by 10.98.47.66 with SMTP id v63mr31078731pfv.152.1475440212920;
	Sun, 02 Oct 2016 13:30:12 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:40e4:d250:309a:ad0f?
	([2601:646:8882:b8c:40e4:d250:309a:ad0f])
	by smtp.gmail.com with ESMTPSA id
	b125sm41940680pfg.36.2016.10.02.13.30.11
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Oct 2016 13:30:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20160908112942.8459-1-ml@embed.me.uk>
Date: Sun, 2 Oct 2016 13:30:11 -0700
Message-Id: <73FEA525-C63D-42CF-9136-798F743DA2CC@gmail.com>
References: <20160908112942.8459-1-ml@embed.me.uk>
To: Jack Mitchell <ml@embed.me.uk>
X-Mailer: Apple Mail (2.3124)
Cc: Jack Mitchell <jack@embed.me.uk>, openembedded-core@lists.openembedded.org
Subject: Re: [RFC] iptables: add systemd helper unit to load/restore rules
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
X-List-Received-Date: Sun, 02 Oct 2016 20:30:12 -0000
X-Groupsio-MsgNum: 87770
Content-Type: multipart/signed;
	boundary="Apple-Mail=_636786EB-0E63-4DCD-B390-7874694BF959";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_636786EB-0E63-4DCD-B390-7874694BF959
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 8, 2016, at 4:29 AM, Jack Mitchell <ml@embed.me.uk> wrote:
>=20
> From: Jack Mitchell <jack@embed.me.uk>
>=20
> there is currently no way to automatically load iptable rules
> in OE. Add a systemd unit file to automatically load rules on
> network connection. This is cribbed from the way ArchLinux
> handles iptables with some minor modifications for OE. New rules
> can be generated using 'iptables-save > iptables.rules=E2=80=99

Patch is fine but
Can you add commentary on how one would go about doing this
offline during cross compiling ?

> ---
> .../iptables/iptables/iptables.rules                 |  0
> .../iptables/iptables/iptables.service               | 13 =
+++++++++++++
> meta/recipes-extended/iptables/iptables_1.6.0.bb     | 20 =
++++++++++++++++++--
> 3 files changed, 31 insertions(+), 2 deletions(-)
> create mode 100644 =
meta/recipes-extended/iptables/iptables/iptables.rules
> create mode 100644 =
meta/recipes-extended/iptables/iptables/iptables.service
>=20
> diff --git a/meta/recipes-extended/iptables/iptables/iptables.rules =
b/meta/recipes-extended/iptables/iptables/iptables.rules
> new file mode 100644
> index 0000000..e69de29
> diff --git a/meta/recipes-extended/iptables/iptables/iptables.service =
b/meta/recipes-extended/iptables/iptables/iptables.service
> new file mode 100644
> index 0000000..041316e
> --- /dev/null
> +++ b/meta/recipes-extended/iptables/iptables/iptables.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=3DPacket Filtering Framework
> +Before=3Dnetwork-pre.target
> +Wants=3Dnetwork-pre.target
> +
> +[Service]
> +Type=3Doneshot
> +ExecStart=3D@SBINDIR@/iptables-restore /etc/iptables/iptables.rules
> +ExecReload=3D@SBINDIR@/iptables-restore /etc/iptables/iptables.rules
> +RemainAfterExit=3Dyes
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta/recipes-extended/iptables/iptables_1.6.0.bb =
b/meta/recipes-extended/iptables/iptables_1.6.0.bb
> index fbbe418..65430a1 100644
> --- a/meta/recipes-extended/iptables/iptables_1.6.0.bb
> +++ b/meta/recipes-extended/iptables/iptables_1.6.0.bb
> @@ -22,13 +22,16 @@ SRC_URI =3D =
"http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
>            =
file://types.h-add-defines-that-are-required-for-if_packet.patch \
>            =
file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
>            =
file://0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.pa=
tch \
> -          "
> +           file://iptables.service \
> +           file://iptables.rules \
> +"
> +
> SRC_URI_append_libc-musl =3D " file://0001-fix-build-with-musl.patch"
>=20
> SRC_URI[md5sum] =3D "27ba3451cb622467fc9267a176f19a31"
> SRC_URI[sha256sum] =3D =
"4bb72a0a0b18b5a9e79e87631ddc4084528e5df236bc7624472dcaa8480f1c60"
>=20
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig systemd
>=20
> EXTRA_OECONF =3D "--with-kernel=3D${STAGING_INCDIR} \
>                "
> @@ -48,3 +51,16 @@ do_configure_prepend() {
> 	# Keep ax_check_linker_flags.m4 which belongs to =
autoconf-archive.
> 	rm -f libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 =
ltversion.m4
> }
> +
> +do_install_append() {
> +
> +        install -d ${D}${sysconfdir}/iptables
> +        install -m 0644 ${WORKDIR}/iptables.rules =
${D}${sysconfdir}/iptables
> +
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/iptables.service =
${D}${systemd_unitdir}/system
> +
> +	sed -i -e 's,@SBINDIR@,${sbindir},g' =
${D}${systemd_unitdir}/system/iptables.service
> +}
> +
> +SYSTEMD_SERVICE_${PN} =3D "iptables.service"
> --
> 2.9.3
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_636786EB-0E63-4DCD-B390-7874694BF959
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlfxblMACgkQuwUzVZGdMxQAIgCfdi7gjC5TQnJ3avEbmiUkSM5x
WywAn3mGHnqHWhcB3uS+AiDO4/gq8KOD
=P8Rr
-----END PGP SIGNATURE-----

--Apple-Mail=_636786EB-0E63-4DCD-B390-7874694BF959--
