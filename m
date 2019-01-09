Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 02E0174813
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 11:07:44 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id g76so11097641itg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2019 03:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8WXK7QYgO8rAg/+G0iqyOSAWbkilBV53A3ezvJjKLYw=;
	b=nsFGULenii/oafisc9LGbCZ/4xDXFgCbBkjFm5Hxnk1AbeagqsOaKD25Uq9nLwrqvD
	mSm5ttKsI52pdbnGJ25/St1loU5D4WvXV1C92ePATGqwrSfEc2oVD8dRaI89Y/lfw++U
	v0R+WWtnpPH4yhoecjdZXJnx17d7bLu66ih0S/2sjMxiaTvxfLAZ1KQb4/2QIttSLMT0
	rzhz+5w2y0fyX8LUaRkgYVJA3efCw7U+m3BPibaVNIcA1RynMIEhfq0/ym9c9KwUKEbi
	04M5FLBWccZVXpc7rrTuDvcMc+WfBJa/lDA3UEbc94ItASHkdIJKNBkocr67/nT8wqOa
	MoXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8WXK7QYgO8rAg/+G0iqyOSAWbkilBV53A3ezvJjKLYw=;
	b=We2jsvOmERGUICDmHmccCCWRMD20f/XA3B5kfV8yaAeM7JOWIJLkKFuypvX6UyUal/
	j4VcVj19u8fyO1KslrT+bTZFNHt6wbqaK5jXae41CJJQqvSBKVgImx4sAXJSW2Ho4xtu
	cdyI3AmJ5tE4M3sS5RhqehDxcejsXpnkyAZhLugZwDA5JgsyPQNwwSjFPvqWXtKp6G7Z
	bUK2ApSKptjSskaS9nV7F1b+rq1IcPjWWz1zHbQT4DPUzHnHAmw+lAgWTzr9an77uQL7
	Sju4E0IgqkCU4E8DogCap73BveGG/cGfujVSdNhdR+hGN8fgvHNn1aIfm47ymbrjn5gg
	wLYg==
X-Gm-Message-State: AJcUukdUXhLt940QJmVX3jORUUydc7mJOJA2CHF1RT1P9aD1h+mrTvRf
	yBzDR4UlNucuNaXB93EAtBaNB5kJg5NCIFYhLqY6lw==
X-Google-Smtp-Source: ALg8bN6qtBqpaRksM/HFAbAxDUfQTLhvJIomiCZrh3l+riBgGH1lWw6zemhc4vlE5AgFRgVPUBBeT9A6ZaB1+3oxsJk=
X-Received: by 2002:a24:1d4a:: with SMTP id 71mr3477673itj.62.1547032066061;
	Wed, 09 Jan 2019 03:07:46 -0800 (PST)
MIME-Version: 1.0
References: <20190109015224.14076-1-hongl.fnst@cn.fujitsu.com>
	<20190109015224.14076-3-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20190109015224.14076-3-hongl.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Jan 2019 11:07:35 +0000
Message-ID: <CAJTo0LZ_7SKdgyUUdEZzX0P7HLzLgPZKBj=-be_G0xVFefV2Hw@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] python-setuptools:upgrade to 40.6.2
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
X-List-Received-Date: Wed, 09 Jan 2019 11:07:45 -0000
Content-Type: text/plain; charset="UTF-8"

This will break the python3-setuptools recipe.

Ross

On Wed, 9 Jan 2019 at 01:52, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> 1.Upgrade python-setuptools from 40.0.0 to 40.6.2
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/python/python-setuptools.inc            | 4 ++--
>  ...ython-setuptools_40.0.0.bb => python-setuptools_40.6.2.bb} | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python-setuptools_40.0.0.bb => python-setuptools_40.6.2.bb} (100%)
>
> diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
> index 315ba31396..fc89eefffd 100644
> --- a/meta/recipes-devtools/python/python-setuptools.inc
> +++ b/meta/recipes-devtools/python/python-setuptools.inc
> @@ -10,8 +10,8 @@ inherit pypi
>
>  SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
>
> -SRC_URI[md5sum] = "260630ae1a64bafa39dcc53404d63829"
> -SRC_URI[sha256sum] = "012adb8e25fbfd64c652e99e7bab58799a3aaf05d39ab38561f69190a909015f"
> +SRC_URI[md5sum] = "1c45c7d66dc84ae4ee36581dc9e5359b"
> +SRC_URI[sha256sum] = "86bb4d8e1b0fabad1f4642b64c335b673e53e7a381de03c9a89fe678152c4c64"
>
>  DEPENDS += "${PYTHON_PN}"
>
> diff --git a/meta/recipes-devtools/python/python-setuptools_40.0.0.bb b/meta/recipes-devtools/python/python-setuptools_40.6.2.bb
> similarity index 100%
> rename from meta/recipes-devtools/python/python-setuptools_40.0.0.bb
> rename to meta/recipes-devtools/python/python-setuptools_40.6.2.bb
> --
> 2.17.2
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

