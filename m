Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id E87FA6C4DA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 21:53:26 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id t28so9180573qte.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 14:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hNDzAPIZnWbzkUe6g+UZ14NR849t97CfgLTNK/cVU8Q=;
	b=Xyov5Edj+SfImLDgoV3pvY2CKeZfnAoVnyhDyegj63GiyMN9kr/TY7fNzdfkGTgVua
	V2pxsSDpENZCIPFaQZj6wn+MdbfboQ9oZDzvUiEAEBT3lRcYstl+k4ekBYTnKgbUvjCm
	jJDOKevjhuEU68MHQbFW/GTwxKPDcyE+6Nx9YtDUNb4GvWF5HLYX85ZVL5S1zpcinIgc
	0VD3qfEfzoOGwJ2H4DNQA5TCGqvAzSYxLLxfW309rTmiiB4hlONBPhCpiF4oE1sRV+yF
	pDoZ9g4N0ba6GccJRRwW5QM89WW1gnBek/i0d+/RpFf5cydJh68XKQG60+NERhy8kwzj
	8CEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hNDzAPIZnWbzkUe6g+UZ14NR849t97CfgLTNK/cVU8Q=;
	b=p58LdEKRNTnGmTxrAUtvo6IduvDYxbozoiUZ9NqndwZbknV9xhSBG427M8xmzGDgzl
	MV35WXaEffiBdoV6OpANW9eSifj7u5jsNtBQ/ZZuC9MsgUnxZ9ICHtIgDDSpyOWmiXNm
	GpvMZ6ca4baprRp86KPZWflgsSzKliy9yBJad51xuYv5VBsxWGzqwZrnifBOckt6r8PG
	VgC+D6rKsTN2iM3qfatFhLk20QNweFt57YlYeMoV+YMTddq4Q5e4eriw3C97otL9s6gy
	+Eq2j7JnF2d2OhPS/2rYGUUzcULf+C387au+K5poAM6xf/durqMm5wbW4Ot/b9LTmqPK
	D78g==
X-Gm-Message-State: APjAAAVbfZYmMLfjELIUAxuMM2WNolty8qPmI9aW3DW0ulvb8R2TLFSK
	Opl4JYXdENiCSOzxv9pTXv9vl8HvdTpEqSuqzGU=
X-Google-Smtp-Source: APXvYqy8iEbQe+/o54KtYqgpYuzqkBUVayQR9Bet/rZE/he9LhHRphiHkAM4mwgUTV9t5Tdt9WHmJFA2O9HnN4pFBQo=
X-Received: by 2002:ac8:1833:: with SMTP id q48mr13215395qtj.133.1554501207614;
	Fri, 05 Apr 2019 14:53:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190404221644.20496-1-ross.burton@intel.com>
	<20190404221644.20496-6-ross.burton@intel.com>
In-Reply-To: <20190404221644.20496-6-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Apr 2019 14:53:01 -0700
Message-ID: <CAMKF1sqaBpsboaAkCxY53B69yakjagm+R_YyFJVo2awsca1naQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 6/9] asciidoc: use correct XML catalog path
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
X-List-Received-Date: Fri, 05 Apr 2019 21:53:27 -0000
Content-Type: text/plain; charset="UTF-8"

thanks for this patchset and it fixed my builders failing to build asciidoc

On Thu, Apr 4, 2019 at 3:17 PM Ross Burton <ross.burton@intel.com> wrote:
>
> Now that docbook-xml and docbook-xsl are writing catalog files, tell
> xmllint/xsltproc where the catalog is.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> index f684f12dc72..751bf0f19f7 100644
> --- a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> +++ b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> @@ -19,7 +19,7 @@ S = "${WORKDIR}/git"
>
>  # Tell xmllint where to find the DocBook XML catalogue, because right now it
>  # opens /etc/xml/catalog on the host. Depends on auto-catalogs.patch
> -export SGML_CATALOG_FILES="file://${STAGING_ETCDIR_NATIVE}/xml/docbook-xml.xml file://${STAGING_ETCDIR_NATIVE}/xml/docbook-xsl.xml"
> +export SGML_CATALOG_FILES="file://${STAGING_ETCDIR_NATIVE}/xml/catalog"
>
>  # Not using automake
>  inherit autotools-brokensep
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

