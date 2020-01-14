Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id D1F757F94F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 19:39:12 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c14so13417234wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 11:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=m7QLYnWnJWzOMvXLOdkZgQF5GsVCEDqU7v8EE0YZ/qI=;
	b=IO5sAYyHjgETQe5wWGDJoL6pGycS1ARcQwTk+istz2l/NlCPO7MkVqH4qPeio1+G/7
	jSKWeHL5UyVx0KIHmgFGtYJVySw0AiKKpoEYdsTpk3gEpfnl/O1QxMrrtxI+7O2ZhAbw
	lXxP+PuA1U1D1b0e3crg/FJpGEplsG+5jiPFMc2XfbcBwO40jN96lRYt7ZUX3WqTlImc
	nOLKNyuH93ujTHWwKe94C8UzgmVE33OHiSeiOj6ULoG88AwE/7T1cTEr3IQdq7eeTUBG
	RgWaWzIIUkPFpgj3yMDmTkISfqmCrMCfW9tY0Pk1lyxphqGq14pQY9E4kVs5l8SXUhQZ
	JRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=m7QLYnWnJWzOMvXLOdkZgQF5GsVCEDqU7v8EE0YZ/qI=;
	b=ohmvoQ32oiRHRH8yX1lokcPpK23fMWfC64Yy9DqvW615/l7F/QFJFw/qWTvWR9Rpke
	eU83+DsTYBaUy7K3xu5CAxJX1GXdU1T4/o3v5/qv4baVzBIBXJTgQANPKhjv288tkuK+
	mdfrjuVhr4NmBiM57yTYVQm0OoKanT+Mw6lGwrO4OBkkST3PYKPS7LdWs0gpFlPxDhYj
	4lgXlAn4JXJ8ZKkNePROmhprkrh8PcqY9Bdxv2WUoTiOts/7nD008I051ei+JuQ5CCnE
	4mKO/ufqa8M17KXC8F4oIApIWbZsDL1jcDXi3/9/spXjel4s8BYx6MgvcqxyRhb8VOCq
	WX7Q==
X-Gm-Message-State: APjAAAWKaoE5UupijwiUyJqAAISd13cy3G1GzPugjOHv+sL1XQ0UMf/E
	borXSHtA6Trtlrirq4hEkfE=
X-Google-Smtp-Source: APXvYqwAtU6o8OG+cvZdAz4o2WloIeFtcew4Uc77T+11oSJpnX6VLDMaoPskRGUMuCK2SyHOxObTCg==
X-Received: by 2002:a5d:4692:: with SMTP id u18mr27640267wrq.206.1579030753444;
	Tue, 14 Jan 2020 11:39:13 -0800 (PST)
Received: from ?IPv6:2a02:2450:1011:56f:e803:9706:9fc4:13a2?
	([2a02:2450:1011:56f:e803:9706:9fc4:13a2])
	by smtp.gmail.com with ESMTPSA id
	i8sm21561388wro.47.2020.01.14.11.39.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jan 2020 11:39:13 -0800 (PST)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16G102)
In-Reply-To: <20200114193010.92629-1-Oleg.Polyakov@windriver.com>
Date: Tue, 14 Jan 2020 20:39:12 +0100
Message-Id: <13AD08C4-930D-479F-81E7-3B6405C3BD94@gmail.com>
References: <20200114193010.92629-1-Oleg.Polyakov@windriver.com>
To: Oleg Polyakov <Oleg.Polyakov@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] vim: update from 8.1.1518 to 8.2.0110
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
X-List-Received-Date: Tue, 14 Jan 2020 19:39:13 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Can you update to just 8.2 please? 0110 is an arbitrary commit as vimupstrea=
m adds a version tag for each of the commits.

Alex

> On 14 Jan 2020, at 20.30, Oleg Polyakov <Oleg.Polyakov@windriver.com> wrot=
e:
>=20
> vim-tiny: update from 8.1.1518 to 8.2.0110
> The date in the license was updated to 2020 and
> a trailing space was removed from one line.
>=20
> Signed-off-by: Oleg Polyakov <Oleg.Polyakov@windriver.com>
> ---
> .../vim/{vim-tiny_8.1.1518.bb =3D> vim-tiny_8.2.0110.bb}        | 0
> meta/recipes-support/vim/vim.inc                              | 4 ++--
> meta/recipes-support/vim/{vim_8.1.1518.bb =3D> vim_8.2.0110.bb} | 0
> 3 files changed, 2 insertions(+), 2 deletions(-)
> rename meta/recipes-support/vim/{vim-tiny_8.1.1518.bb =3D> vim-tiny_8.2.01=
10.bb} (100%)
> rename meta/recipes-support/vim/{vim_8.1.1518.bb =3D> vim_8.2.0110.bb} (10=
0%)
>=20
> diff --git a/meta/recipes-support/vim/vim-tiny_8.1.1518.bb b/meta/recipes-=
support/vim/vim-tiny_8.2.0110.bb
> similarity index 100%
> rename from meta/recipes-support/vim/vim-tiny_8.1.1518.bb
> rename to meta/recipes-support/vim/vim-tiny_8.2.0110.bb
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/v=
im.inc
> index 5a1bea6985..ec7ad443a4 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -5,14 +5,14 @@ DEPENDS =3D "ncurses gettext-native"
> # vimdiff doesn't like busybox diff
> RSUGGESTS_${PN} =3D "diffutils"
> LICENSE =3D "vim"
> -LIC_FILES_CHKSUM =3D "file://runtime/doc/uganda.txt;endline=3D287;md5=3Df=
1f82b42360005c70b8c19b0ef493f72"
> +LIC_FILES_CHKSUM =3D "file://runtime/doc/uganda.txt;endline=3D287;md5=3D9=
09f1394892b7e0f9c2a95306c0c552b"
>=20
> SRC_URI =3D "git://github.com/vim/vim.git \
>            file://disable_acl_header_check.patch \
>            file://vim-add-knob-whether-elf.h-are-checked.patch \
>            file://0001-src-Makefile-improve-reproducibility.patch \
> "
> -SRCREV =3D "202d982b36d87cf91d992bd7e30d3223bdc72cd9"
> +SRCREV =3D "e05a89ac6399a8c7d164c99fdab6841d999a9128"
>=20
> # Do not consider .z in x.y.z, as that is updated with every commit
> UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+)\.0"
> diff --git a/meta/recipes-support/vim/vim_8.1.1518.bb b/meta/recipes-suppo=
rt/vim/vim_8.2.0110.bb
> similarity index 100%
> rename from meta/recipes-support/vim/vim_8.1.1518.bb
> rename to meta/recipes-support/vim/vim_8.2.0110.bb
> --=20
> 2.23.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

