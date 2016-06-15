Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 41D0560589
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 19:14:26 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 66so2309894pfy.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 12:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=3mGDKHYh/WQk40tmhWzj088+Rszg71Uil3Mf/Ilr7uQ=;
	b=A1Q2k3XZkn+PvbLa1K+Y4PbdXXggSkgLrHWyW5BzMrRoVtEwHKbwNL4hMwdv3XGvSn
	7IKqCX4kieWEdBUEvrqFpTuP2yX89bj7vDmBcW/E7dqPh02qzx7NKMZcRS5U+P+6dwB+
	iH0VoZE/Fh0ys9IkOyLrOYKX2qBz5SDOQmc669fVTVstr0yl9hQ0/+YAJIKZY8vzHbQ0
	HpYO7WZT50y0tETmNaqBm2WGq2z6IFOQe8fdXQKjv+C7Gxzj/4Zfe+TY6MCHL+Vnlx1D
	U2lKerXugObEipf8fig9YmnkQBUxbhr+nnRi9hcG9weVMl0GHk8GlshJV60vPhSbbcio
	HROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=3mGDKHYh/WQk40tmhWzj088+Rszg71Uil3Mf/Ilr7uQ=;
	b=O/x8tRkHL+iykZIbMuQZsXzUd952bwHE2qrZSW+EDW2ZmHu4dZwax5HB/E+r002G5P
	uJfVnGn13ejWOayD+ZqxmH9Ls5Y/B47JVmAyLuZL+U0xYwksIJwV4mZsbNUyEXjZT4iI
	QmJHwPPSMCNSSQuZbzAW6Awd942XSaUCsDpLwBDpYNgXmdJAi+HtEx3CxmR7g9ip2kfg
	S0AwSweZmWigSB126Xn4MEVAdDlYOw7JDFOkNXplLq4QAaRpjPKQeenKR+YitZX5OP4B
	M3ZrAj32oIoQeX7Nndn7goDubUjM55k2BLPPeUBISXNrgXwvmQaz0YQ3z0PXG0q6qjfA
	falQ==
X-Gm-Message-State: ALyK8tL/n5JKowByYIpxMnQEePN46toJ/QPjnCHNUisHCsOgTDAmi5gB2w/xBXUGuRVHOw==
X-Received: by 10.98.43.7 with SMTP id r7mr310102pfr.65.1466018067671;
	Wed, 15 Jun 2016 12:14:27 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:115c:1c9f:7ed3:245b:56cd?
	([2601:647:4c00:115c:1c9f:7ed3:245b:56cd])
	by smtp.gmail.com with ESMTPSA id 7sm54840876pfn.30.2016.06.15.12.14.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Jun 2016 12:14:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1465997797-6613-1-git-send-email-j.remmet@phytec.de>
Date: Wed, 15 Jun 2016 12:14:17 -0700
Message-Id: <7E603C53-3E9F-488E-8AC2-AA8D4AB8DBC0@gmail.com>
References: <1465997797-6613-1-git-send-email-j.remmet@phytec.de>
To: Jan Remmet <J.Remmet@phytec.de>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rootfs-postcommands: generate /var/lib/systemd/clock
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
X-List-Received-Date: Wed, 15 Jun 2016 19:14:28 -0000
X-Groupsio-MsgNum: 83476
Content-Type: multipart/signed;
	boundary="Apple-Mail=_73DBE34F-1909-4259-BAB2-2AACC64BD67F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_73DBE34F-1909-4259-BAB2-2AACC64BD67F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 15, 2016, at 6:36 AM, Jan Remmet <J.Remmet@phytec.de> wrote:
>=20
> systemd timesyncd check /var/lib/systemd/clock instead of
> /etc/timestamp.
> If this file is missing it defaults to TIME_EPOCH. It's set while
> configuring systemd.
>=20
> Signed-off-by: Jan Remmet <j.remmet@phytec.de>
> ---
> meta/classes/rootfs-postcommands.bbclass | 6 ++++++
> 1 file changed, 6 insertions(+)
>=20
> diff --git a/meta/classes/rootfs-postcommands.bbclass =
b/meta/classes/rootfs-postcommands.bbclass
> index db8b551..0c7b764 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -234,6 +234,12 @@ python write_image_manifest () {
> # sane default time setting
> rootfs_update_timestamp () {
> 	date -u +%4Y%2m%2d%2H%2M%2S >${IMAGE_ROOTFS}/etc/timestamp
> +
> +	if ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true", =
"false", d)}; then
> +		# touch needs timestamp as [[CC]YY]MMDDhhmm[.ss]
> +		TS=3D$(sed 's/[.]*/&./13' ${IMAGE_ROOTFS}/etc/timestamp)
> +		touch -t $TS ${IMAGE_ROOTFS}/var/lib/systemd/clock
> +	fi
> }

i wonder if this will work with read only rootfs.

>=20
> # Prevent X from being started
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_73DBE34F-1909-4259-BAB2-2AACC64BD67F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldhqREACgkQuwUzVZGdMxRHEACfXVyn2gJ7yaA5P4KLvvaLwJ50
FYcAmwdKEmUPlfN4d+Tw9oJpBf8PRPS+
=puvc
-----END PGP SIGNATURE-----

--Apple-Mail=_73DBE34F-1909-4259-BAB2-2AACC64BD67F--
