Return-Path: <trini@konsulko.com>
Received: from mail-yw1-f43.google.com (mail-yw1-f43.google.com
	[209.85.161.43])
	by mail.openembedded.org (Postfix) with ESMTP id 42B7E795B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 13:53:27 +0000 (UTC)
Received: by mail-yw1-f43.google.com with SMTP id n21-v6so5062719ywh.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 06:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3iEsfC437kfrAFKgz6I3hy73fCbKHrV+YtyUIp3b078=;
	b=A1kRKw9vh8gtxbS/SZVq09pvK8QVQ+6QAtS2+xB40qdkr+71tSL8+PwosFYyUbF4pw
	RxwsOiQfwYOBju6fUB/EpTuMBgez2nsBTpqoTIRLS59WZ7cOnaKTlNpapKa4pvFUIRKK
	IY6V07ILFn3OuOxaoiIXQ//ZQDKijltkHALwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3iEsfC437kfrAFKgz6I3hy73fCbKHrV+YtyUIp3b078=;
	b=UsWXsNYPC5WsndKI899aO98uZARSKPKGX93/wH+4EkbiuU0gZDsnCvBfVIs5SXcRjo
	TUVojK5a/7hO6+mpH6qzYhXAwJ8DM0r+HgFlnMw4yEJzQZdCzp7tc0G0XuRgqrB2da4f
	FybbaTa9zI5bHnO7UjxUvQwud25n+O6+GP2beZjs/xSBwqhFJa0KXeu3QkgmM7CZe8Zg
	S08oCbK8UJ3gslaLsqDM/yn1DMcQqV8PqmxDCvgJ2Xsnau1/GZNUzwUrMyBbrHeYGT95
	6FL2VDbLIPqcNFOMB4aP+GnGIQwBs7YVgitPJk4mT37IX9lVhVVVH3TXXXALQSKwuXaZ
	YqvQ==
X-Gm-Message-State: APzg51B0ioH778V8Pxk4CSa98o1Bb20cwEwtuOWdiwYXrGx4aUedBE6U
	q/G39yN+wZ8Xs6myYHhWOeaXx38aKo4=
X-Google-Smtp-Source: ANB0Vda9YINIgVs8Rhk3whEbQGfDhyvTFnurMwgoZTawqRluSpm0P4Q9K9lVoePm5XybmAguyobSrw==
X-Received: by 2002:a0d:fd45:: with SMTP id
	n66-v6mr8669280ywf.414.1535723608130; 
	Fri, 31 Aug 2018 06:53:28 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	d70-v6sm4301013ywe.97.2018.08.31.06.53.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Aug 2018 06:53:27 -0700 (PDT)
Date: Fri, 31 Aug 2018 09:53:24 -0400
From: Tom Rini <trini@konsulko.com>
To: Jiang Lu <lu.jiang@windriver.com>
Message-ID: <20180831135324.GO26633@bill-the-cat>
References: <1535681710-29461-1-git-send-email-lu.jiang@windriver.com>
	<1535681710-29461-3-git-send-email-lu.jiang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1535681710-29461-3-git-send-email-lu.jiang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/7] wic:move wic src into meta/receipt-support/wic
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
X-List-Received-Date: Fri, 31 Aug 2018 13:53:27 -0000
X-Groupsio-MsgNum: 115695
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dSlz+W6f9RhvPS0G"
Content-Disposition: inline

--dSlz+W6f9RhvPS0G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 31, 2018 at 10:15:05AM +0800, Jiang Lu wrote:

> Move wic src into package directory.
>=20
> Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
> ---
>  meta/recipes-support/wic/files/wic.py              |  542 ++++++++++
>  meta/recipes-support/wic/files/wic/__init__.py     |   20 +
>  meta/recipes-support/wic/files/wic/engine.py       |  578 +++++++++++
>  meta/recipes-support/wic/files/wic/filemap.py      |  600 +++++++++++
>  meta/recipes-support/wic/files/wic/help.py         | 1055 ++++++++++++++=
++++++
>  meta/recipes-support/wic/files/wic/ksparser.py     |  235 +++++
>  meta/recipes-support/wic/files/wic/misc.py         |  263 +++++
>  meta/recipes-support/wic/files/wic/partition.py    |  424 ++++++++
>  meta/recipes-support/wic/files/wic/pluginbase.py   |  149 +++
>  .../wic/files/wic/plugins/imager/direct.py         |  611 ++++++++++++
>  .../wic/files/wic/plugins/source/bootimg-efi.py    |  274 +++++
>  .../files/wic/plugins/source/bootimg-partition.py  |  207 ++++
>  .../wic/files/wic/plugins/source/bootimg-pcbios.py |  207 ++++
>  .../files/wic/plugins/source/isoimage-isohybrid.py |  443 ++++++++
>  .../wic/files/wic/plugins/source/rawcopy.py        |   91 ++
>  .../wic/files/wic/plugins/source/rootfs.py         |  126 +++
>  scripts/lib/wic/__init__.py                        |   20 -
>  scripts/lib/wic/engine.py                          |  578 -----------
>  scripts/lib/wic/filemap.py                         |  600 -----------
>  scripts/lib/wic/help.py                            | 1055 --------------=
------
>  scripts/lib/wic/ksparser.py                        |  235 -----
>  scripts/lib/wic/misc.py                            |  263 -----
>  scripts/lib/wic/partition.py                       |  424 --------
>  scripts/lib/wic/pluginbase.py                      |  149 ---
>  scripts/lib/wic/plugins/imager/direct.py           |  611 ------------
>  scripts/lib/wic/plugins/source/bootimg-efi.py      |  274 -----
>  .../lib/wic/plugins/source/bootimg-partition.py    |  207 ----
>  scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  207 ----
>  .../lib/wic/plugins/source/isoimage-isohybrid.py   |  443 --------
>  scripts/lib/wic/plugins/source/rawcopy.py          |   91 --
>  scripts/lib/wic/plugins/source/rootfs.py           |  126 ---
>  scripts/wic                                        |  542 ----------
>  32 files changed, 5825 insertions(+), 5825 deletions(-)

Please re-format this with -M so that git determines the renames and
this becomes reviewable, thanks!

--=20
Tom

--dSlz+W6f9RhvPS0G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbiUhUAAoJEIf59jXTHXZSnM8QAKBXFnJ2ZpJyML0wvn6/mOIP
FdQG8u9skvwnRE7r1NA2px44FtzTDxjcPP9fyM7fmmok6sPDONcNy+WwAo5MvzqF
515bSRd4f/z9hB7pERt6eJ14iyxybBP5eZ2013eSJuKw609Aa2pyoLXzOrrp0fMp
RTVNgRNdOjug7CqX9WI/TeDFatS7wibzQkKo7nPlzl3gJH8eHznEmI6lyYEurBmq
awy5k98ML2LabszoBu8Wv6Cwik2QncV3k33t7qkCTkhVClu2ckvlFuXLtWsi89Sp
xbLR5JdcNI5IiIOfaVrmDRvqSl481q6s1I/LHsc9LCuA2VH3q5dJHQdmdyWIborf
SefcKOVcaZhIw1mbeVa85N8eIy3OWNf/wKjpAMfN9lxFYvGEwNuKPuZRnBy+LGIS
egfMrrz1DnKmZuvBs6s41FqThHg/avayHKvvU16Gn+dhfWh6otIf/yv03NIN+wuY
O3E3zeYDeEc7FuRJkm3pDdG+j7CYQjoPUYf7QvMyR3zzgCNncgqHJrux+6GeVbbJ
9GLORdDWwOkosG/oE52DdZgTUIoDyRvPBnxoOvMKK555xHs//zYgZb2OysDPQN4F
aOO8bZrMgrxSBHIV2jByDlJjktgrx2RlWxjyq9RTSM2zHEsVndI01VCVEmauBT7h
IkCIVmQENmHAY/gvIRLI
=+1ao
-----END PGP SIGNATURE-----

--dSlz+W6f9RhvPS0G--
