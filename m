Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id EAE737F457
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 20:24:41 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id v9so4190025wrq.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 13:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5WzVeeDZmEIE6NOE74w45VgR32RmaOe+HKGwS4HgKtM=;
	b=tzf9lAqmYvp7sqd4Rtd3w7ln6N+sQWg0vHq/QhgcjPlEtJEB/WbKRtRa1Sa7XnCLzk
	j/G1DVFoUIkhDYSJSzseaPmjmtqzkgvk5ckYVBYbHcnfCgqXUQonQsJ3cjRW9aE8I7ir
	6+WAeOhTkDGh1/RKlFR88EsDzhT3WpmuLLuWvo3suocoVWlQASvvsk+yjnNpTNnQV6Ym
	dwCpzpJYme7p81BmFowcHMqRsFR+Dyfb+e0vg+E3JON7XmlmricYAnHTUGVCuDTwIsPv
	jkYq+2OtzzNNzqwVdjQFhvTu9x1nO4k12QrH0aAQE+fqyub5b4adICfjXgoCHvSYcCOx
	BbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5WzVeeDZmEIE6NOE74w45VgR32RmaOe+HKGwS4HgKtM=;
	b=D/s13+SGjKYVrENxA58ExVjPn0YSrU9/T3Z9W+rv5JR1HoaAAw/smi4pmWv+g0jg7h
	anCUQCK8xxn2OwdzL1OifNlUq3K4ZvDb3wyuSiwJmGEMl0XB5pDuP6O/ipcee/7LnMO+
	4rUc2YgDgbwdbSXIO4vUvs2bBoq/pSyNO7oWVBZE/2ce+M8m6NXci0+mYDdub5b3SHVb
	GkzENsdok0iL+yQE7htIkbWRFnA9lPVnf6Mnrw5yzXxgIiWKr23oShxAka08b06OAlAH
	yLNfF6clHMQuq+SCWJ7vpYpVR0etgWydckKx8UdPdMjA+a0+CYFgfEpBxox5PxHo6oET
	i2Rw==
X-Gm-Message-State: APjAAAVjNh8Z+rxvNq9J7aDZqieiYlFbgRq6qT7sn6AuDZLR+TuLiRpf
	OZw3/1nm6Hi3iGcnd1Vu6Ww=
X-Google-Smtp-Source: APXvYqyAo7I83BNBlR0DwyYkEG6T6yXtdLW2QTyN2VgB7xRYQjobo6wSth/opB/DJ4SPCOGMdG+1YQ==
X-Received: by 2002:adf:a547:: with SMTP id j7mr119682wrb.154.1571689482440;
	Mon, 21 Oct 2019 13:24:42 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id p12sm2956844wrt.7.2019.10.21.13.24.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 21 Oct 2019 13:24:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 21 Oct 2019 22:24:44 +0200
To: bruce.ashfield@gmail.com
Message-ID: <20191021202444.GB1500@jama>
References: <cover.1571688520.git.bruce.ashfield@gmail.com>
	<eb27cbf9e4e86187a79967546674a0156d722c16.1571688520.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
In-Reply-To: <eb27cbf9e4e86187a79967546674a0156d722c16.1571688520.git.bruce.ashfield@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6] perf: drop 'include' copy
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
X-List-Received-Date: Mon, 21 Oct 2019 20:24:42 -0000
X-Groupsio-MsgNum: 130303
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Content-Disposition: inline

--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2019 at 04:16:18PM -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> The copy of the kernel's top level include directory is not
> required to build perf. We have both the linux-libc-headers and
> perf's captured/copied headers for what it requires.
>=20
> The copy of the kernel's headers is leading us to multiple smaller
> fixes to ensure that the various .h files are in sync. We can
> remove the copy and all of the sync checks, and perf still builds
> and executes correctly.

Maybe reorder this before "[OE-core] [PATCH 3/6] perf: fix v5.4+ builds"
as it removes most of what was possibly incorrectly added there (see 2nd
review)

> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 9 ---------
>  1 file changed, 9 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
> index 191305969c..5f0ba7c180 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -106,7 +106,6 @@ EXTRA_OEMAKE +=3D "\
>  EXTRA_OEMAKE_append_task-configure =3D " JOBS=3D1"
> =20
>  PERF_SRC ?=3D "Makefile \
> -             include \
>               tools/arch \
>               tools/build \
>               tools/include \
> @@ -248,14 +247,6 @@ do_configure_prepend () {
>      # so we copy it from the sysroot unistd.h to the perf unistd.h
>      install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/=
include/uapi/asm-generic/unistd.h
>      install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/includ=
e/uapi/asm-generic/unistd.h
> -
> -    # bits.h can have the same issue as unistd.h, so we make the tools v=
ariant take precedence
> -    [ -e ${S}/tools/include/linux/bits.h ] && install -D -m0644 ${S}/too=
ls/include/linux/bits.h ${S}/include/linux/bits.h
> -
> -    [ -e ${S}/tools/perf/util/include/linux/ctype.h ] && install -D -m06=
44 ${S}/include/linux/ctype.h ${S}/tools/perf/util/include/linux/ctype.h
> -
> -    [ -e ${S}/include/uapi/linux/kvm.h ] && install -D -m0644 ${S}/inclu=
de/uapi/linux/kvm.h  ${S}/tools/include/uapi/linux/kvm.h
> -    [ -e ${S}/include/uapi/linux/sched.h ] && install -D -m0644 ${S}/inc=
lude/uapi/linux/sched.h  ${S}/tools/include/uapi/linux/sched.h
>  }
> =20
>  python do_package_prepend() {
> --=20
> 2.19.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXa4UCwAKCRA3VSO3ZXaA
HKllAKC7Oy5aVrTRytBFq8ZoAMahbgVDmwCcCdOqs5jDSBStJjouOTG5jHB5DxM=
=162x
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--
