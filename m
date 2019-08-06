Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id ACCC57ED64
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 21:54:28 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id u14so42251999pfn.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 14:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=OFwuXuhifBY0wkLGaCUXwsrzg2p0VR7tk7M0cAFalpU=;
	b=hOsNhYHg0oOfk11I453jdlOKYU08DIUmBe4xAN/hnbSp1PNTip8kCePK7CMMNn5Msg
	WY4mmcxE5rFZbuQE7wsCaxsP7ciKFA4P/75aFSRJum2gUTT4YB/xfhTZH4n52k2xQrml
	qDjrKOJ24zDuk0NBRirtsx4pTRpJvz69cKszDNyXL2sP1uwDlaKw1g7H2Qmr5GmwdZtU
	v8hUIc0fvVjaUnLtO4joviaZsRbpWoIz4qA9KksyULnzhkmC9+uIJRG3KpN4wDZmSSpl
	r3471eJj6v0xae5C/J9TrnnpvBZ/GELTxVv+J62HVp4j0F7g+1Oo87lD0ldYQace+ae9
	tUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=OFwuXuhifBY0wkLGaCUXwsrzg2p0VR7tk7M0cAFalpU=;
	b=Ov6XCxSPAR+3NAo3g9b/UlF+1vnbFlHGkyzwYye+ryrLI7LmJSElP8cK4GADoRslBb
	rJhCXCM6rHg/XqbG73DM2XZ59PeXBwnPm+o8TP4YHdfrEudIxmGS38dKfB8soJlkAs1u
	vi+sZxHpFduP+oHNJbyvZaPhltGO9+VLKPo6IZGA80y4csS6GSmk2K/fw1gdZ8KpLDTN
	9J8dAc7ybqS0bY6QrqXidayhCmo5Z2m9MB2N9hp8QCOz0wKPsKBpXY/ZxUYT2dGoPYLy
	maEPNaHXFUOLxgdnAf8D5UZb4bhTjNJCymAXW04Kg0V+oR68HO5kglcnnwTSnvMD0lui
	aNJA==
X-Gm-Message-State: APjAAAVFpqdnnFxk/6hJE2XKUI4uuEFR9JMQ5lghbz1LabjYI2d6FkVO
	aS8s/iOOuT6aN8EAU6p+PdqdJhaoj74=
X-Google-Smtp-Source: APXvYqwfZalU+efsiBbUpjTIBHnMSOjLwug/7nNbE/nyh9Pt6GKijRwkBwqfysswjQJJlof1r+OqPA==
X-Received: by 2002:a17:90a:c20e:: with SMTP id
	e14mr5505103pjt.0.1565128469287; 
	Tue, 06 Aug 2019 14:54:29 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6::baaf? ([2601:646:8500:6bc6::baaf])
	by smtp.gmail.com with ESMTPSA id
	r1sm98852128pfq.100.2019.08.06.14.54.27
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Aug 2019 14:54:28 -0700 (PDT)
To: Jason Wessel <jason.wessel@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20190806211608.5801-1-jason.wessel@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS
Message-ID: <9b977851-9d1e-82a9-7909-dde176c0aaa0@gmail.com>
Date: Tue, 6 Aug 2019 14:54:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806211608.5801-1-jason.wessel@windriver.com>
Subject: Re: [PATCH v3] sqlite3: Fix zlib determinism problem
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
X-List-Received-Date: Tue, 06 Aug 2019 21:54:28 -0000
X-Groupsio-MsgNum: 127608
Content-Type: multipart/mixed; boundary="------------4DC435338F1045EA7EEFAF95"
Content-Language: en-US

--------------4DC435338F1045EA7EEFAF95
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On 8/6/19 2:16 PM, Jason Wessel wrote:
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


thanks for doing it this way, can't ask for more.

>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/recipes-support/sqlite/sqlite3.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-sup=
port/sqlite/sqlite3.inc
> index daf3db5e9f..7cf23d0447 100644
> --- a/meta/recipes-support/sqlite/sqlite3.inc
> +++ b/meta/recipes-support/sqlite/sqlite3.inc
> @@ -34,6 +34,9 @@ PACKAGECONFIG[json1] =3D "--enable-json1,--disable-js=
on1"
>  PACKAGECONFIG[rtree] =3D "--enable-rtree,--disable-rtree"
>  PACKAGECONFIG[session] =3D "--enable-session,--disable-session"
>  PACKAGECONFIG[dyn_ext] =3D "--enable-dynamic-extensions,--disable-dyna=
mic-extensions"
> +PACKAGECONFIG[zlib] =3D ",,zlib"
> +
> +CACHED_CONFIGUREVARS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'zlib=
', '', 'ac_cv_search_deflate=3Dno',d)}"
> =20
>  EXTRA_OECONF =3D " \
>      --enable-shared \

--------------4DC435338F1045EA7EEFAF95
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

mQGiBEqXaJERBACUvFofpD3FsxD9675wcPv+rzguIfsRWilrrpSZ61JHjLHwkUnm
DLpLSdfvZw2ZDXeaQbGU2thctxXTyYf6N1fY6P5Tww6mWKInuGU3yAv8Mg5p+Xd8
itwOoVR41DOBkftVmiO2G7FtXsnqonB6F43a2yvc+h9OwPRVxAFss5mSmwCglSXP
WndN1Ka4M/hzt7g+FmeyEssD/1V/G8lLeAS9gQCNjS7jch+uHMFJuWgHzMXdw99e
1ywlIkvXN77NPkW+FLVxKxNAHyWZZ3wO4BQ9/GVR2y0s/rrF1lQSIcfnUmzZrh/B
h0b1wVOSLhl0Vx4MI0/MbdL3xx17JAWy+s67evuKER4Y8ycTq3gbIGJtVrIJjWPC
zWF8BACAA2u52uDmJ2pS8SIhEW0jMK/zYQ5Od9l9fM6BmS6QjnIlzzcuMvRdZn2I
rnuE/YoC8yyzBK3mN+MVc2jWN9rfSg6ml7r14Zjem9Ee0O5Ca7Jg3ZvN6g3vSlrR
JqKgsnq3vdatDF+5rd0NJ7ZKUy6x2i1Pavgtv3qaAgPGa1qQdLQdS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT6IYAQTEQIAIAUCSpdokQIbAwYLCQgHAwIEFQII
AwQWAgMBAh4BAheAAAoJELsFM1WRnTMUhOMAoJJleT2hdT7uw9Fyn26+w+/K4i0g
AJ9wRt36PqfjNe904evWolFf5cMmp7kEDQRKl2iREBAAjjbVQ55RAouAe0l0nPsK
kWdtMuUHwBdLBkpF3rGM/f0uDlPaQzYGLjKT7xDoyRh8x2tFwWvOfiqrZFArxX8e
4fsACmJdL0kahTbxC/8SmSWVHXi10JUX2fmZ5ufzlXAnl0ivXkWnrUfLX9DdNwL6
DR4DeFK9qBFqtHmK5TQXMu87G+MJwgNJIwCKQX4iI9YJILMuqInVwaxg5/ALdKfE
3QPmtadnKb/cuUm4gICdaJeyQfI6qdYLcSuyBWCbAEMM1wmhRAhw5RgzMRRIquZl
xPt7lZkXXjals7M6juh87VGRoIJwYoQi97Q1ZHzPBo3AlMPe3haNihkd6D3lwvdB
4pmjYG4I6bHCgtEhEss3hHvsBaqV9jV1dMUSs95ZxQtT9qtkOxydHgOlwRX3CG+r
584J/s4vWm+iPQtLvDY1u4UFwOLjCOFe709BcLJdPR2GQiOPoyZF7lVY8nu/dtTr
AEuiZFk4HD7afUlcr/IKwPWID1V9kRLoDlzdbNuoUy/XfVErK8wcoiGowerEMed4
ajNoKxCxBweIkjxqKMt8CKgp30n9UxljglEcgf+/UumwSHxqZcCPVbWXtdhy/hwM
k27shOdUvaiynep8OsVGqAzSseL4qZIJ5XzCcyV4KJCmwmdQzt5+ZylcVmeq6R4o
b+d8JIDU0ELqdwxwIDiTj0cAAwUP/inN3/r8IFDms4g5xafPrCw31o2jIYahkIfN
0WVPWI5K/hFCo2PczPStzDcTsZx7mN2qwpGOe3Lz9/0krZeksrz1ZIHNi5LTasuz
XyFJbO05Y+eiHgV1rV7VVEipOrpV1496w112Y/0SZ/FhOfEmEA1TeDejy2sZiTOU
W4gyzewbHMpE07d27F2qM2NfMMhKQCcvzr+N0VJmAOeATEivxPUHn+DpX/NniBWO
cWv++wHlxv0Xr63gsRKSt62eFKGjgF50hHD5lM31ziqycc42sbgcqAZ+rYFlb9k0
3JcKyq1XdVUSm+xcC2DMSstTI6iqFMGo6FnEO+gyE5VdceajbuZ1GOmJXJUCyYId
GuvCyIoKjTE9lcIYSEEDZQej5xdiGk9eUz0MPmZEUwSR/nLmmwjHDJi0prVvs9xq
e5bvS3ddPAqepvZ5UrisgtWD+TDI8ktkt5VLh3XsG9FuXUVAaahOvFMGiZtsioDX
TorL4AfMeuA9f+yLwrCVQO3xmH/WA0Tgf/5gYB3t9KoHPjLBNruVOuQbAjubi0pv
RAOUcMdBfmPofksK4uWS1zGtPWS7Uu1csuq7Hnb7vszlFYdbzeqjY81LSyxA0kcp
gJxdLv9o7UuCEnHDZLPbHdQ83PmyyBKSI31AKe7RXlQNlB5grwH9o6uNtPbV7q/u
RqmKq5EiiEkEGBECAAkFAkqXaJECGwwACgkQuwUzVZGdMxR1VACcCkdaO3rb8/gR
prldmAH6eR49eo4AnjD3h3aTwv/1bl+BAz1twmZmz8ul
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------4DC435338F1045EA7EEFAF95--
