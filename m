Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 718DC7D08F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 11:41:53 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id x7so7313367ioh.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 04:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8+CGgBX4AlKx3ayWE/8tTN5tTp/5EZvqrDv+AcYHpr0=;
	b=HHHEdk13yPXZM5WR2ZRUP1KHf7eM5Qo8uHXqSzBf4YTFIw1VXOAIGqcni6WC9aQype
	hmaFHpv3o/aQVec/sQST5f/9Tb4Uy4D+vRfY4KpZGgWAVDqQJMoKTUrCwnpEoNsFS6n8
	tTjOpVny1Fmuly7BD28CWFGcHsT0CZcyzbH2ADjPvJZFOYKo4XoupnS6kQwGl1E8Dggd
	0WVJR36vPjen8mijlHB4dO3etKkQyzIQIKXxZuhJ44atu6wNf5KNM3lzeOAJqgS+wAqJ
	U6e33qkq5RvcsWQ9YukJHpQIpOPfaOJFiwLcVQvY0qS0wWpXV+lJnZfn4eRqoHjgNhvC
	Ga3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8+CGgBX4AlKx3ayWE/8tTN5tTp/5EZvqrDv+AcYHpr0=;
	b=PMM76XpZmsuJ5+WTgzreprimNAGeRq11mGrIWWjJ6c/fmc9nsycLK0KkaqbM136HtW
	C5TilGpNhbD1j01UW7bTinuyfRtSed7uDA+G4CWF9/WelTwWWUouV2ACNytWw2h9JOHu
	V2QqZHPsIW0FsVaoqhZsp4mUaCcbzd59vn2qx41gg/4UbLFwM8k8UBdKfS5tNuBGvFGS
	1Bmaf27nDktDSV5zwYvpTuRhFF+J7sucZ3gUHagCJHz0ZFaBmrPmxGywk99K9K96MvOg
	g9CbkuyrJbk9P0QSM4ahbJ9ZbqOuHJqctWi8E3ZLF00Uz0iC/DPtP6uC+3oA0nM/37OZ
	PuPQ==
X-Gm-Message-State: APjAAAWGd04H2EnEIeKZUO4tYfqFxev6DW+xiKDzigGi1OF4DGUwWPTr
	8Y1TEE5hW7q+3l6yRe2SWxPz1sY6M+CN1omLE7ISxg==
X-Google-Smtp-Source: APXvYqyvTr6xfhqyFxJnVZJ+ByCfAAxntcsYRkMKuJcXpjpmmIkNjREJrI87imqzurJDys0Z45stzVVA01J8bVF2O4o=
X-Received: by 2002:a5d:859a:: with SMTP id f26mr3926198ioj.270.1553514114494; 
	Mon, 25 Mar 2019 04:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <1553506675-11519-1-git-send-email-alex.kiernan@gmail.com>
	<1553506675-11519-2-git-send-email-alex.kiernan@gmail.com>
In-Reply-To: <1553506675-11519-2-git-send-email-alex.kiernan@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Mar 2019 11:41:43 +0000
Message-ID: <CAJTo0LaJju+ngUWCCgQpGotpBt4TdDUU8eXQ6fmR+8ppx1S4TA@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] wget: Convert EXTRA_OECONF to PACKAGECONFIG, extend PACKAGECONFIG
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
X-List-Received-Date: Mon, 25 Mar 2019 11:41:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Mar 2019 at 09:38, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> +PACKAGECONFIG[ares] = "--with-cares,,c-ares"
> +PACKAGECONFIG[gnutls] = "--with-ssl=gnutls,,gnutls"
>  PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
> +PACKAGECONFIG[iri] = ",--disable-iri,libidn2"
> +PACKAGECONFIG[libpsl] = ",--without-libpsl,libpsl"
> +PACKAGECONFIG[libuuid] = "--with-libuuid,--without-libuuid,util-linux"
> +PACKAGECONFIG[openssl] = "--with-ssl=openssl,,openssl"
> +PACKAGECONFIG[pcre] = ",--disable-pcre,libpcre"
> +PACKAGECONFIG[zlib] = ",--without-zlib,zlib"

Defaults can and do change, so please be explicit here: always pass
---with-foo and --without-foo.

Ross

