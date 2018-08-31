Return-Path: <trini@konsulko.com>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id 66FD479557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 13:54:37 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id d4-v6so886892ybl.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 06:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=zKl0y70vuQ2zXw0QNt8TUkwlfJAXRSpX60Z4sVzQ268=;
	b=fXr2mR1o+N8exFCUptvLZAfPMXBalD5rWjfggsLpF29K3ZpyFSU1Dw4/E/MoKtFlIx
	DW0enUrtkuCaHb+XrmZvtvdTQai3RgtlMtUQjApG4z/kQDeQo5aayR/KGAJJD0o934UC
	U6GKKLujIgyKgoKWpbYi3DhZo0sZGPMxdG5HQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=zKl0y70vuQ2zXw0QNt8TUkwlfJAXRSpX60Z4sVzQ268=;
	b=OX4hIfXX4S/eBdhpxAVTfozYphwZ5EuVmKaShJARXVBgmSzV2LkPClf48JMaYsNgqg
	m97vaQsjNlo5bZ0ClR4jFmCWVe22pXm8lGBqGwJbYc8ugriSql7sgBPp36v6rQRvcXeH
	G1i9Uu0600+kl0kLAMF6sJzM/kNKnpz8fG3Fp4BGyZzMypeyi8OvWWr7p4yYXdu6W/tc
	xgYS/KMeKEDyu4QHW5fgWFv26NonkD5i/sH3owab8SbD8hN8/JiWt8ZlWhIZIIDsYiK5
	/G/wF07RLP8BkbaVxrUAhYqLWPfXuscsw5ZuRb8nFnJ7jkyR6XYbfMKf5PbX4l18oUWT
	k9uA==
X-Gm-Message-State: APzg51B6zhHOUbxfeoAtWzWpYiG8usqX5GaOsscd8l+Z5Vh86cMZgXTf
	P72qp/Q9At5Dgnz00DTF16f62IyrYno=
X-Google-Smtp-Source: ANB0VdbzEiDmazjqFYF+k2tF9X+dvXfYdDvZsS2QzXrCTBNcoj0Jb30maGm04WrtCWpZfYVTVLSvNw==
X-Received: by 2002:a25:e6d6:: with SMTP id
	d205-v6mr8982829ybh.341.1535723678244; 
	Fri, 31 Aug 2018 06:54:38 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	w7-v6sm7246276ywc.82.2018.08.31.06.54.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Aug 2018 06:54:37 -0700 (PDT)
Date: Fri, 31 Aug 2018 09:54:34 -0400
From: Tom Rini <trini@konsulko.com>
To: Jiang Lu <lu.jiang@windriver.com>
Message-ID: <20180831135434.GP26633@bill-the-cat>
References: <1535681710-29461-1-git-send-email-lu.jiang@windriver.com>
	<1535681710-29461-6-git-send-email-lu.jiang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1535681710-29461-6-git-send-email-lu.jiang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/7] wic:direct:remove same entry when updating fstab
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
X-List-Received-Date: Fri, 31 Aug 2018 13:54:37 -0000
X-Groupsio-MsgNum: 115696
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PnGHCg0cFrjzWebJ"
Content-Disposition: inline

--PnGHCg0cFrjzWebJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 31, 2018 at 10:15:08AM +0800, Jiang Lu wrote:

> Remove same mountpoint entry when updating fstab.
>=20
> Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
> ---
>  meta/recipes-support/wic/files/wic/plugins/imager/direct.py | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-support/wic/files/wic/plugins/imager/direct.py =
b/meta/recipes-support/wic/files/wic/plugins/imager/direct.py
> index f648db4..d3ebc9c 100644
> --- a/meta/recipes-support/wic/files/wic/plugins/imager/direct.py
> +++ b/meta/recipes-support/wic/files/wic/plugins/imager/direct.py
> @@ -163,6 +163,9 @@ class DirectPlugin(ImagerPlugin):
>              opts =3D part.fsopts if part.fsopts else "defaults"
>              line =3D "\t".join([device_name, part.mountpoint, part.fstyp=
e,
>                                opts, "0", "0"]) + "\n"
> +            for tmpline in fstab_lines:
> +                if part.mountpoint in tmpline:
> +                    fstab_lines.remove(tmpline)
> =20
>              fstab_lines.append(line)
>              updated =3D True

Can you explain how this happens?

--=20
Tom

--PnGHCg0cFrjzWebJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbiUiaAAoJEIf59jXTHXZSVUAQALoZSMI2f8GH0Q2WZV8AGgJV
q/R33EwVFlPzRLdHCZWV93wgkS1FHRbA9qlfSru+5Q+u5EmbkLWobmwBB/E/jK4C
Yp1aM6067POgvhr3I6dwDp+5TW/NMa4iTMGBDkFxZWWPLH4qhNBPIrbANA2oxuZ6
Kvl5ghOHZPNFE3Zm/ny5YNlA9MPVjZbdI9YHVkQEwf1WjOa33b+lAhJkg7lJzGgA
y0W38U+AZ0WjbxyDKjTZOtxkw1LyBq0YsjVEgcnvi5JVoSEHh+NO6MJb98sZY6Pk
4gBGl53qtgVYIUx4zx0X7RY+jIh8rM7dLz0CeGlI/4mNEX7IQR/d02tMplaSfq1a
/4gACjwXh9fS8R4F2j9nutXjckOv273klG1Cd+Eszgast7W00s98DSO5qThBfQAD
K5rsrZ1Bqif+cOVo8Tu6dT51RNCOgRe4tOraGXKy9pyaPd0XSkPoJArqqyWEMTYX
s2dMsywtvwcEcMHhyk4DBA7PKsWffTxspQ6fk99ryCoLHwTvM5Lvy918wffj/jCK
+UdGC9La+Qu+iTIk9Yl5cwsy+pnsfoTxWvwyiny14mkeR6Nf0QmC4B7HRfHh0r+B
5ip7vgEUKiAsfRVJ8TgR7w0e5fo0H0Wf/dB1b29FJmmJa8uHvwyLElG5WE3cV5Oh
9qDGdjz0wwwYVlRJfRRL
=pPuT
-----END PGP SIGNATURE-----

--PnGHCg0cFrjzWebJ--
