Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 656AA7F3A8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 21:53:37 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id i189so42233370pfg.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 14:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=Q/dc3XbSKRbC9mXCpN+qvtINWaDTwCCGrn+L3swfSAQ=;
	b=sUDwM4u5LRINF5grwGwJj4vbbHlACEBiq8a6HJ+C/rZ4wYk+dMnaaReX7jPtontOb9
	1QyIrAjWatMtOMbEFNvNzo3msV0PVbMXG7M7I7zMePKWOdiV+s14E6MgzPjYlArGGDw6
	O3AxvM4FvGU41bhgHHDxDL3wwbzW516TR8csnDPGyww6dCPVGLc5xP4diuxEWr/5Uqk3
	fOTIXOBR+Xfj6nzxdowWdqdz+aEgUqTNfx6QBZvh38Jujn6YtD6hOfgnHspEllI+WKI6
	fWXRDe9Azq4fiTiLXhl9A+huzf6N9YoSgFQvSQMMwPS4SAPwsBgbid4sqYtNKc1X4IyS
	hzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=Q/dc3XbSKRbC9mXCpN+qvtINWaDTwCCGrn+L3swfSAQ=;
	b=HK6gO9TL/r8qPyX6PgNQk6qVbMLh/Lkudfutad7tNbMqF6fhOtbnHNgFPHDQnoONal
	4UwH+MFnHYl8WP1PE6nbTYpXG50fqIYNrJiaq39erOCeDhzRLFneRcTy9h6oeuBYkuoJ
	USnWGlNbtU+Jd8hmSTEFODtcs65BSw+8/SDZ9+7A+w5WNeMsmy0oAArjqq4bmCaGt4OC
	F2sHiNOTH7pTtdmPv3MPMExdJ8ePvuWJc7xbrbmQjZfMQ4vrjpxQWrUDE7MENr9gXtnR
	r0Ot+USCFfYf+AIQYEYFOtLAKE6m8dpAus6LrOIJjVw4m0sgRrLS/uZgYUPl1XlxHcFz
	nNfQ==
X-Gm-Message-State: APjAAAWGcMc07lyUzWdWv+TmPS5v033SGLv9IC5donpquoTx3SIkjvcX
	bT2x2ITReC8fi31hKr6H68UVBBcelic=
X-Google-Smtp-Source: APXvYqyqg4Qb7TnlSJ1ta6ISDJAmPiLS/tvv7dauWBu4LudNUd9kUDJV/tyJ4243wh8bPFn38uhyNQ==
X-Received: by 2002:aa7:8d98:: with SMTP id i24mr5921800pfr.199.1565128417916; 
	Tue, 06 Aug 2019 14:53:37 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::baaf? ([2601:646:8500:6bc6::baaf])
	by smtp.gmail.com with ESMTPSA id
	m9sm137148906pgr.24.2019.08.06.14.53.36
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Aug 2019 14:53:37 -0700 (PDT)
To: Jason Wessel <jason.wessel@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20190806211411.5571-1-jason.wessel@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
Message-ID: <414f52ec-4fd3-6b42-2ee9-df5e83291743@gmail.com>
Date: Tue, 6 Aug 2019 14:53:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806211411.5571-1-jason.wessel@windriver.com>
Subject: Re: [PATCH v2] sqlite3: Fix zlib determinism problem
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
X-List-Received-Date: Tue, 06 Aug 2019 21:53:37 -0000
X-Groupsio-MsgNum: 127607
Content-Type: multipart/mixed; boundary="------------1DBA44D41EFBE5ABD8F21C33"
Content-Language: en-US

--------------1DBA44D41EFBE5ABD8F21C33
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 8/6/19 2:14 PM, Jason Wessel wrote:
> sqlite3-native in particular was finding zlib from the host if zlib-dev=
el
> was installed. This could lead to races where pseudo-native may or may =
not
> fail to build.
>
> We don't need/use compressed page support with sqlite so disable the de=
pendency
> (it doesn't have a configure option so use a autoconf cache variable).
>
> The target binaries were not previously building with zlib, so we will
> leave the default being zlib turned off, while the host binaries were
> building with it "occasionally", but not for anything at runtime.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/recipes-support/sqlite/sqlite3.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-sup=
port/sqlite/sqlite3.inc
> index daf3db5e9f..2e48f303ee 100644
> --- a/meta/recipes-support/sqlite/sqlite3.inc
> +++ b/meta/recipes-support/sqlite/sqlite3.inc
> @@ -2,6 +2,8 @@ SUMMARY =3D "Embeddable SQL database engine"
>  HOMEPAGE =3D "http://www.sqlite.org"
>  SECTION =3D "libs"
> =20
> +DEPENDS =3D "zlib-native"

this seems good, maybe make a packageconfig for target piece while here ?=


otherwise it gets lost

> +
>  PE =3D "3"
> =20
>  def sqlite_download_version(d):

--------------1DBA44D41EFBE5ABD8F21C33
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------1DBA44D41EFBE5ABD8F21C33--
