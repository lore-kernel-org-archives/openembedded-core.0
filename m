Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 29F7A78F6F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 15:22:49 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id 92-v6so28486203otw.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 08:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yPLTcNQdK5PDUDfZ2LjY5VazVI028P0JKOs/EeQHuPk=;
	b=gXhblCfv8sUQxwrr4DdUWnWAnXB3ofOkloABiA40X0KHH4blGDFex5rAzvFOA034fM
	nHuAoNakC7YG582KoHvNNb46/ZDCE5nzcxikRTMERnaNTxj3vOES8mu3/SKfPsDOW4oo
	PA1bVpT0y9SBvNHxekMcyP1YKKDgLAtwKJeztFFJ8KlHiYvWjOOuIPcnxIcyEUQKAO/F
	ySGc6GeBpnLs4ttPNiZEtYIs7pcPt9pOp3A+6L4jdZ7bXOo9OH9NUE8YXkNVretY9qsy
	Vj1NgNjkItQRIg5bJ2fQ214MhOrocIeYaZqR93dKbGVoj2N7dXQB8NFpz2aaOdBte7QJ
	TYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yPLTcNQdK5PDUDfZ2LjY5VazVI028P0JKOs/EeQHuPk=;
	b=CDdiwroUsZ8beDbJhirrqeo9McDWiCbD8TodFlOhuuF8mxodKp1h8OO6oZRue5wp6e
	W41daQUffuVBKe6I5diykM2TCDwpjD8hyrlV/red60AvLt50fLtghflkrnOPlq6rc9av
	pReuSJnsdWpEoyykoRuAPB1RsNO6NF2WWEycRzH2qvXtAlbVXMg2no0dxjruzjCeDwDf
	z9C9aHUlCydE2sWGHVBpu8/aTr4e3GuOJabnRq0SFadAQkmhepfy0Z2qpojngjY6oWQ7
	rGLJb1SMR8kQI9lhgW8RSd58oOrEAu1szuNUI3yWrtkG2oC+jL9RaWxT9H7NH5n2AQdb
	f4NQ==
X-Gm-Message-State: APt69E3TIQQMk84j1s8Mql7cUCE9V7P/ujiFcFc3OR3JkJOzfMkdMGHk
	L4ryiCipFk0TVu/P/i5hJJkcCjltHE8aZelPAylfLw==
X-Google-Smtp-Source: ADUXVKKXTGHcGF819JbUyDyP+fFZgpbPb/kat8QFy7IlVQHJsIswk+SsI3soS31YOBxRiwfpSvhJdmqwkZuVCORAKhs=
X-Received: by 2002:a9d:2989:: with SMTP id n9-v6mr633117otb.152.1528816970995;
	Tue, 12 Jun 2018 08:22:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Tue, 12 Jun 2018 08:22:30
	-0700 (PDT)
In-Reply-To: <1528802295-11278-10-git-send-email-maxin.john@intel.com>
References: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
	<1528802295-11278-10-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Jun 2018 16:22:30 +0100
Message-ID: <CAJTo0La2YZcarxHy8PCPV8s6BGvRNkWC80XOfovgz-Ag-YyLDQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/12] sqlite3: upgrade to 3.24.0
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
X-List-Received-Date: Tue, 12 Jun 2018 15:22:50 -0000
Content-Type: text/plain; charset="UTF-8"

Fails for me when building pseudo:

| /data/poky-tmp/master/work/x86_64-linux/pseudo-native/1.9.0+gitAUTOINC+fddbe854c9-r0/recipe-sysroot-native/usr/lib/libsqlite3.a(sqlite3.o):
In function `fts5Bm25Function':
| sqlite3.c:(.text+0x2a3b8): undefined reference to `log'

Ross

On 12 June 2018 at 12:18, Maxin B. John <maxin.john@intel.com> wrote:
> 3.23.1 -> 3.24.0
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-support/sqlite/{sqlite3_3.23.1.bb => sqlite3_3.24.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/sqlite/{sqlite3_3.23.1.bb => sqlite3_3.24.0.bb} (59%)
>
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb b/meta/recipes-support/sqlite/sqlite3_3.24.0.bb
> similarity index 59%
> rename from meta/recipes-support/sqlite/sqlite3_3.23.1.bb
> rename to meta/recipes-support/sqlite/sqlite3_3.24.0.bb
> index 3755761..ce18fec 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.24.0.bb
> @@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
>  SRC_URI = "\
>    http://www.sqlite.org/2018/sqlite-autoconf-${SQLITE_PV}.tar.gz \
>    "
> -SRC_URI[md5sum] = "99a51b40a66872872a91c92f6d0134fa"
> -SRC_URI[sha256sum] = "92842b283e5e744eff5da29ed3c69391de7368fccc4d0ee6bf62490ce555ef25"
> +SRC_URI[md5sum] = "dcd96fb9bbb603d29f6b0ad9554932ee"
> +SRC_URI[sha256sum] = "d9d14e88c6fb6d68de9ca0d1f9797477d82fc3aed613558f87ffbdbbc5ceb74a"
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

