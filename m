Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
	[209.85.222.67])
	by mail.openembedded.org (Postfix) with ESMTP id 75C037CEFE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 18:51:33 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id j7so10543132uak.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 10:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8zM3JbYt3+EvxkuwuHZ3MeuI3FlVinopkf0SmHlCsCM=;
	b=QJ31PoTRMn44g8c+1Pj5eZ2iEi7z/mulTZgYyxbadF03deBIqP2hMP8ESpvoafZgTa
	ZL2dMOgEDVEQtb1SdJ+FhdlEFveHuqlzeHvSTm2vhd+nD4KbPax7vb09a1hqjsBLofHh
	vytBZfA2TK7xDurGHzZxWFA7PxijZNmYMUIaEnpe3X8GaAVy60hz8J0SAJkLq2Vvb1n0
	+K6kHxt7DZD7k+KfIpVTPCqI4f4O2fzn8npl1ajVmauKyujcsOFLD5oUCU3M8jYCyJ+K
	twRbrSDnt3F1N/V3PfbA5Rp/ugz9rUBfRyc9PbDskksf0n/GETNptNgfGM8GlX4Hr45+
	iqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8zM3JbYt3+EvxkuwuHZ3MeuI3FlVinopkf0SmHlCsCM=;
	b=LMAvxNeqg+533ExJH+QGiqenqCvSFjCFpN11zFxXW3zJJ9TtzwXAc6Xg142r1BPVkK
	q2BGnX28TWfw1qx6MRqvV7ww0UYgKWCriNGsm2pYrhuW9ZHb4wQjXvB+bhRWOW1OVe4z
	keI0rhiCi52Jaiv6gttKmf9cysq463/qcDJbShyn+jE6vaLklb4pBstB9/GQXRiyUIh1
	FLrKVVFPstKP5Ve7rGbJekSojngBr9zhXu/YD7v+GwkOCqhhJ/DIb6llDxQO1oJ/iZSy
	MUfBXrQBplV0DT7LPHyiCcH//drRR4AtyKoltdarnY4NEyMaxs8uIuHgdeeTLGPcVXBX
	lK4g==
X-Gm-Message-State: APjAAAWOYpeZiJyKYz4ljKalBElwGiVwpVth1rslctrlbis01zxiTKL5
	G610TqTHblFy04zkYoVPYFd25ZGh4jcfWa4I25g=
X-Google-Smtp-Source: APXvYqzMgxavROinPG5OuCVmfg8SW0jrcH1HEyfTKUb+OZEgKYmVzqoOKZ+u0/qF1w6G/MeuVptXk6DPqgvDg64W3xY=
X-Received: by 2002:ab0:4a1:: with SMTP id 30mr7629023uaw.86.1551984694230;
	Thu, 07 Mar 2019 10:51:34 -0800 (PST)
MIME-Version: 1.0
References: <20190306161348.24575-1-ross.burton@intel.com>
In-Reply-To: <20190306161348.24575-1-ross.burton@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 7 Mar 2019 10:51:22 -0800
Message-ID: <CAJ86T=UHWFbP4-=LzkXkRu3jew9OL5EdGCL5Qp2SYJD_aawuDw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake: add readlink to HOSTTOOLS
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
X-List-Received-Date: Thu, 07 Mar 2019 18:51:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 6, 2019 at 8:14 AM Ross Burton <ross.burton@intel.com> wrote:
>
> If systemd has EFI enabled it uses readlink.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index f1540a0acf7..3d1434931d1 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -485,7 +485,7 @@ HOSTTOOLS += " \
>      fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
>      head hostname id install ld ldd ln ls make makeinfo md5sum mkdir mknod \
>      mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd python2 \
> -    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed seq sh sha256sum \
> +    python2.7 python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh sha256sum \

Comments mention "readlink" but patch adds "realpath" ?

>      sleep sort split stat strings strip tail tar tee test touch tr true uname \
>      uniq wc wget which xargs \
>  "
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

