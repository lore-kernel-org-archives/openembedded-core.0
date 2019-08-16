Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 08E437DD6C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 20:50:39 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id x4so7542549qts.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 13:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XN4qf+AG4USr2c6+ZoSXgmrLo7bbEh8Hr95p20HKm10=;
	b=Ka4fVpCtwCZXPLRkK+lCP9XvGHoD8PoBVd6DA/U6kko1qNVI0t1Pl1WRD1yfYDSl0a
	mpimcFG3pdmbi7dQzWBSG6vTPW8lv5DaMG4DKVqlhZSKp5DBPakXkZXbhKYY2MVv2Uvz
	XDzAFoj7kk5tVqT4ehqDoMuxavqKdK1yv1EToVYjUVPku5sqOPT9dEkzJ82fr7eWw9dM
	JZioetG2NW8en+JJyITwhPf4vhvz+ArvMxzfJi556YZXYPLIyqXp2LRvV106Ym+RvXjG
	7BRijfW3aqA3Hf9fcEJS/vVmK76RaD2ljnyUUpx689RrK2v9pJnZQ3gN9CuRebtUc2j7
	JQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XN4qf+AG4USr2c6+ZoSXgmrLo7bbEh8Hr95p20HKm10=;
	b=U6V260Q9nVfAwzvVSrHZwcs+IT/Sx/cO7AV9eumByn8AL0UXL1oNpvHptoQYQbrxJD
	5VSvdb2KfYBTS+BSGVam2mCUomdaLlLvptWTUbhmIFYr6ML/kOXf5YEKnkgSyxcpubuK
	p288zCcGYf0Y76t1xLoOL0OfZbI4zycXltMY1tLh24ZKIvSYy41blUuHtu0cOz4zi5FS
	1Cb8W4D2JmWX7KcruNIPfV7Bomo20rop7gQIWrtWe7ERi/OAbDtqRPpWy9mxJ/dV2XQm
	c5x7wO1P1Pk0ejUSnHXK0OU3IPB/BX2Dm+C2v6nXwE6WGIuMf2Cg2Vet4GobQ2mQCnoK
	z2Zg==
X-Gm-Message-State: APjAAAUlvriYYl4WZeGe04+msonzCvC1qV0U+raP+4ZBiyiM2PSBx9Yc
	NZvCNlveU1p9vZ1yUp6RSTwlMbqIhai9YPZ3no4=
X-Google-Smtp-Source: APXvYqzc/qpM+XAYBaAUmfZR2y1UAHShJakFiyFd4mSN5ecKODyqZMv5EprAO2kg52ewou9XJmGtatmmPLF260Y/FQI=
X-Received: by 2002:ac8:74d2:: with SMTP id j18mr2067063qtr.378.1565988640583; 
	Fri, 16 Aug 2019 13:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190816194405.12751-1-wesley.lindauer@gmail.com>
	<20190816194405.12751-6-wesley.lindauer@gmail.com>
In-Reply-To: <20190816194405.12751-6-wesley.lindauer@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Aug 2019 13:50:14 -0700
Message-ID: <CAMKF1sruqPBcwobNNErkdHKAnP7zT8zda81O2FUP88u=5ZnmVg@mail.gmail.com>
To: Wes Lindauer <wesley.lindauer@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] xz: Remove GPLv3 license checksum
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
X-List-Received-Date: Fri, 16 Aug 2019 20:50:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 16, 2019 at 12:46 PM Wes Lindauer <wesley.lindauer@gmail.com> wrote:
>
> Although xz has some files that are GPLv3 licensed, none of them get
> packaged up, and therefore none of it ends up in the final rootfs. Since
> there is no GPLv3 code in the final image, we don't want to include it
> when we collect licenses, as that would give the incorrect impression
> that the image contains GPLv3 code.

We will be distributing this in src packages though. Maybe these files
should be deleted before the build even starts.
>
> Also fixes the endline for getopt.c which had a couple of non-license
> text lines at the bottom.
> ---
>  meta/recipes-extended/xz/xz_5.2.4.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/xz/xz_5.2.4.bb b/meta/recipes-extended/xz/xz_5.2.4.bb
> index 791746e1cf..e6725e5f12 100644
> --- a/meta/recipes-extended/xz/xz_5.2.4.bb
> +++ b/meta/recipes-extended/xz/xz_5.2.4.bb
> @@ -17,9 +17,8 @@ LICENSE_liblzma = "PD"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a \
>                      file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> -                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
>                      file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
> -                    file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
> +                    file://lib/getopt.c;endline=21;md5=32575ca1a42c5fa04aac6f08566ddf48 \
>                      "
>
>  SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
> --
> 2.14.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

