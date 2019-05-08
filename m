Return-Path: <ptsneves@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id DFC2D7DE52
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 13:35:33 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 198so3324639wme.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 06:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YzyRxNVSfJLROCm4NrVKvn3mHSxyxPxKZ/cf+k0XPP8=;
	b=AwyOTcZNigGbUL8j5hGAuzVYBq4o8aeN+hIbc4llJ3kaBeYNTkK3GuZjCmQn3lc6jK
	mR0lj6Sd5AjQHVmeYeYoyOIw6AjtMqroT8bHirZMGLAz8q/70FsGnfpDr3YUat0xhw/W
	p/Wm18a71QfQj36+AwRHdyvHV5IUto/ve+hgSoyJqFf4oqTJhlXDd5tXSuJFaFO3+Yq2
	Mif7pvN7i03GgPmTfzC38kbgI77OcyIuAiLkAhGja/mm4bfKEAmkRYGJEkks39gbp/L1
	BWZHDbhXaHSpQ4A2nEfYa2ZXwyAqKB2w2oOc6DP6ln3AzKjf7akMocIL0wImxhvMWkcN
	u2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YzyRxNVSfJLROCm4NrVKvn3mHSxyxPxKZ/cf+k0XPP8=;
	b=FEYa1uOmzKSQilONC2S+adhzpxiwteTOgDqJXzAFtz/ImBTrb3rzm/fcioDRlpiHza
	nfaiHHe4gfa1L8Tphgc650UIcfqtbCOSPMKz0RW7svD/5NR3Q0mrpTZMEFq5SZ6jASez
	YVEXK1e52M1MT7Xtgb99I4VE6g3m6x85SypctA+XQdU9xm3HN9mBBy8dkyw2dE5lKgPY
	Iy7TJWX2MNelqvz5vrlq0LZtGQet3E1VFb5wCAcA7IQDAHm8fkekTd/B9m99NUXnujV2
	58fu7YaF45Xjy1nEeqync9GKmpdA32KCGA5iYxxaz+2akcTvRlCWnPAfp7575WQ2jzhT
	ANjw==
X-Gm-Message-State: APjAAAV9oR4nJ9HMBVwXo1Bo3675gUSIDlt3Ec2gsXEns6sfl1GoMviE
	zGbd9RdJbnr9vJ7walqhP0j/JEqblFmsZWf3ErIwcwVI3Q==
X-Google-Smtp-Source: APXvYqx6anUfDARsR7lUJTW2tsNcE14txIq/v2uxM8Xi/TowT0N/Z+dmX7E2+re3wMhknS5bZabIPPHbx8OT/+l2px8=
X-Received: by 2002:a1c:ef18:: with SMTP id n24mr2987267wmh.94.1557322534480; 
	Wed, 08 May 2019 06:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190424065603.20591-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190424065603.20591-1-open.source@oleksandr-kravchuk.com>
From: Paulo Neves <ptsneves@gmail.com>
Date: Wed, 8 May 2019 15:32:50 +0200
Message-ID: <CAJO0J4jEMBF8nHWazEE08LhNF2y1xgKvnvNPxPCreYPKadQvwA@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wget: update to 1.20.3
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
X-List-Received-Date: Wed, 08 May 2019 13:35:34 -0000
Content-Type: text/plain; charset="UTF-8"

This patch is useful to go around CVE-2019-5953 but other versions of
poky, like the thud do not have the correction.

Should this version bump be backported or the patch
http://git.savannah.gnu.org/cgit/wget.git/commit/?id=692d5c5215de0db482c252492a92fc424cc6a97c
be applied in older versions?

On Wed, Apr 24, 2019 at 8:56 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  meta/recipes-extended/wget/wget_1.20.2.bb | 8 --------
>  meta/recipes-extended/wget/wget_1.20.3.bb | 8 ++++++++
>  2 files changed, 8 insertions(+), 8 deletions(-)
>  delete mode 100644 meta/recipes-extended/wget/wget_1.20.2.bb
>  create mode 100644 meta/recipes-extended/wget/wget_1.20.3.bb
>
> diff --git a/meta/recipes-extended/wget/wget_1.20.2.bb b/meta/recipes-extended/wget/wget_1.20.2.bb
> deleted file mode 100644
> index cd20785259..0000000000
> --- a/meta/recipes-extended/wget/wget_1.20.2.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
> -           file://0002-improve-reproducibility.patch \
> -          "
> -
> -SRC_URI[md5sum] = "2692f6678e93601441306b5c1fc6a77a"
> -SRC_URI[sha256sum] = "7e43b98cb5e10234836ebef6faf24c4d96c0ae7a480e49ff658117cc4793d166"
> -
> -require wget.inc
> diff --git a/meta/recipes-extended/wget/wget_1.20.3.bb b/meta/recipes-extended/wget/wget_1.20.3.bb
> new file mode 100644
> index 0000000000..4fa273d093
> --- /dev/null
> +++ b/meta/recipes-extended/wget/wget_1.20.3.bb
> @@ -0,0 +1,8 @@
> +SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
> +           file://0002-improve-reproducibility.patch \
> +          "
> +
> +SRC_URI[md5sum] = "db4e6dc7977cbddcd543b240079a4899"
> +SRC_URI[sha256sum] = "31cccfc6630528db1c8e3a06f6decf2a370060b982841cfab2b8677400a5092e"
> +
> +require wget.inc
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

