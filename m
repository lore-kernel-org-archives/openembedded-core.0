Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6E3526C226
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 23:13:08 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id x1so29853862iop.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2020 15:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=O17ZOgwEgHAAhfGHRc4I9krJVH7cCael0MIz6cr/zVo=;
	b=qSTA0eVSChSU/+fIyk/yvRmIsUEZfz5C33C5ZEfb1VqrVbFZWYzT3LcjcnVpkrHVHR
	/mgglKSXbATKNIYRR4mzuzBidgeKYWtUYvTbT0EinCN76J8MG3v8FBzp0x4lKES4Ggnm
	wpkXLEzmKyJe2wClWeRcd/DljKJ+f0hbEEB6HN5Ot63OyE692mvVzeAFeuGalC25LklW
	wI731Oj4yf0QfVqtGyTp60EJ2FC/zxA944tsVT4tTEmelAx26JV+gPOCCJGd0pFvP8lC
	/ziiy5wx+1v3Rj9Qg1Jom/q/ijI3Zox1kw3rrSKV6tWKj9sIR2JKq8rflAoqhMKnUecM
	Xbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=O17ZOgwEgHAAhfGHRc4I9krJVH7cCael0MIz6cr/zVo=;
	b=ZzTEraKrES8jczwLfIm9nKHg0bYqrKgnuihUBDSj7cPmel5TzARdSu+6VW5qyPmFT/
	/ebUXwjEM6YZm6y76HuT0Z5r0xAxT0fMd3G2ts8TTe/qnzBjy55AXXHhCezPN/c2CC9u
	Mcu1EGXidHe1ssluDZa5sQtq9jttcnVfMqAjb0oN4NbL953hh1oCox523TXvltPruQvW
	yT52KkhKjwJOl5A47hnDeMj1oZDemO1BaHUxKNJ8MNB9bYIGP06WxG0EHaoRqGXz9sSK
	qd/wQvjoldKNUvXhhOARbrPqpYOlG2ogUtgcEj2+oKJdbS/6jei3N7J8OTBjkh12FBcn
	xq4Q==
X-Gm-Message-State: APjAAAV8Pw1ke55Qd+oSPZRvzE0G+C4yPVWHxCFx2KIyFuzjapShqgNK
	Ss289DZQTNq/tCHYSNjzbFrKLwGXYBKhzBfraL8XnWwY
X-Google-Smtp-Source: APXvYqwPZv3CQUfU3UZe+hDECEOJp/aDlLNFp2z+ob1fduM5bjABOvVGMUxFrzjq6La56MekGEpyTD9VC3shaCcpwgs=
X-Received: by 2002:a05:6638:41d:: with SMTP id
	q29mr38602499jap.128.1579389189196; 
	Sat, 18 Jan 2020 15:13:09 -0800 (PST)
MIME-Version: 1.0
References: <20200118174803.28619-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200118174803.28619-1-richard.purdie@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sun, 19 Jan 2020 00:12:57 +0100
Message-ID: <CALbNGRRt+-yjEQtk1oFCfSOHSAQctsftNoPHpzt_DLn3fy15jw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libfm: Add mime and mime-xdg classes
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
X-List-Received-Date: Sat, 18 Jan 2020 23:13:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 18, 2020 at 6:48 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> libfm installs mime types we want in our mime-database and it also uses desktop files
> containing MimeType.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-support/libfm/libfm_1.3.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/libfm/libfm_1.3.1.bb b/meta/recipes-support/libfm/libfm_1.3.1.bb
> index 918fe3ece70..63ae7874b95 100644
> --- a/meta/recipes-support/libfm/libfm_1.3.1.bb
> +++ b/meta/recipes-support/libfm/libfm_1.3.1.bb
> @@ -19,7 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz \
>  SRC_URI[md5sum] = "c15ecd2c9317e2c385cd3f046d0b61ba"
>  SRC_URI[sha256sum] = "96b1244bde41ca0eef0332cfb5c67bb16725dfd102128f3e6f74fadc13a1cfe4"
>
> -inherit autotools pkgconfig gtk-doc gettext features_check
> +inherit autotools pkgconfig gtk-doc gettext features_check mime mime-xdg
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>  EXTRA_OECONF = "--with-gtk=3"
> --
> 2.20.1
Thanks

