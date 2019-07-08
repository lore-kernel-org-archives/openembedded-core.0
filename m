Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6E2147D1E9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 02:51:29 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id m4so6891299pgk.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Jul 2019 19:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=oGWEp301Wd4e0OAUWVxtoFHZDsdXyU3221gjDwqjD8s=;
	b=ewlvsUmij6NOt5YVSwTc2EK41xDH//uacmNx8QZ05zCicPT6MJgjTGu8Ik4OHisYhO
	5oebRCh4NzODUgtvjreYYPXVarS6JqLUCapEnOAsg1sAuaUdtLJrwf4araZmNP5n60iP
	3RpEzHLnb7cxEPza6e+II5YqBvOFIL0RP+QpN2fQAwRkjCyln/CDPJli2HRJXf+c/Pov
	YGBoYy7i/drRZ44vMnmfy16loTge9w+yfHT5GkpCZePPgQsUB+WRokaHbCdbuWC9Xi+0
	NSVX6CAeQNxz9cnfPKP/CCRjpUyNlmU4YhnJv1OWqIgwNnjJmQPW0RaWgVHQq515P2bs
	Zhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=oGWEp301Wd4e0OAUWVxtoFHZDsdXyU3221gjDwqjD8s=;
	b=VO0fq1FzOhZ+34sOi/tCuZvtlGc0qd3/5ypXilGgCRiFJ7ZgVSFds0o3D0oK9JhPf2
	vUxGyEhmwL2ryp7FoFPkVr5L7HTeUI1HgG9xjjUco+1gk+AVeMqe8MEYGj0o/P8TzuGd
	yuw18oQyCo9EylCryIHJc+vTUeVDHuNrb5Eqzzv8T9sgkBtp+cCpammCCW38F9HC0+KO
	+Mke5PK5VESSUJLy1pN0st7rv1PUAJGsMkbnjl65PrO85Ydhy3cVjweX+xJ4C6WJJ6zl
	mmJOXB6vzRwDx/uJX47LE+lA5uo/mgOkffQg837QwA4LdOL3dmJ/FNygTfmJ636qg3N+
	UN0g==
X-Gm-Message-State: APjAAAWiovoko/M9dTKi4rSK7doqWwWH3Z4z1SYAy5GEina7ecLD3hsE
	afai2veVEWfK5FwgWVKVnf6lev82PEg=
X-Google-Smtp-Source: APXvYqwhlYkCj2myugKg8sOKFFpSaGaynnmvu69XEaULZERbE75YxXynAmJFuw0a2g+Z477UleBJcQ==
X-Received: by 2002:a17:90a:7787:: with SMTP id
	v7mr21976325pjk.143.1562554290223; 
	Sun, 07 Jul 2019 19:51:30 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:c2e:f46a:e59c:dae7?
	([2601:202:4180:c33:c2e:f46a:e59c:dae7])
	by smtp.gmail.com with ESMTPSA id
	e63sm15645438pgc.62.2019.07.07.19.51.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Jul 2019 19:51:29 -0700 (PDT)
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
	openembedded-core@lists.openembedded.org
References: <20190707015714.16009-1-open.source@oleksandr-kravchuk.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <78eb840b-bc06-e80a-d71b-4aa96f90fcdd@gmail.com>
Date: Sun, 7 Jul 2019 19:51:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190707015714.16009-1-open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH] python3-pbr: update to 5.4.0
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
X-List-Received-Date: Mon, 08 Jul 2019 02:51:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 7/6/19 6:57 PM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  meta/recipes-devtools/python/python3-pbr_5.3.1.bb | 5 -----
>  meta/recipes-devtools/python/python3-pbr_5.4.0.bb | 5 +++++
Can we pull in the python-pbr.inc since there is no python2?

- Armin
>  2 files changed, 5 insertions(+), 5 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python3-pbr_5.3.1.bb
>  create mode 100644 meta/recipes-devtools/python/python3-pbr_5.4.0.bb
>
> diff --git a/meta/recipes-devtools/python/python3-pbr_5.3.1.bb b/meta/r=
ecipes-devtools/python/python3-pbr_5.3.1.bb
> deleted file mode 100644
> index 12892b60cf..0000000000
> --- a/meta/recipes-devtools/python/python3-pbr_5.3.1.bb
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -inherit setuptools3
> -require python-pbr.inc
> -
> -SRC_URI[md5sum] =3D "bdaec663a75d10e9e0f2224afa3a1318"
> -SRC_URI[sha256sum] =3D "9181e2a34d80f07a359ff1d0504fad3a47e00e1cf2c475=
b0aa7dcb030af54c40"
> diff --git a/meta/recipes-devtools/python/python3-pbr_5.4.0.bb b/meta/r=
ecipes-devtools/python/python3-pbr_5.4.0.bb
> new file mode 100644
> index 0000000000..1f1ec3a420
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pbr_5.4.0.bb
> @@ -0,0 +1,5 @@
> +inherit setuptools3
> +require python-pbr.inc
> +
> +SRC_URI[md5sum] =3D "fcf120102d3e4859d41425638122058c"
> +SRC_URI[sha256sum] =3D "36ebd78196e8c9588c972f5571230a059ff83783fabbbb=
edecc07be263ccd7e6"



