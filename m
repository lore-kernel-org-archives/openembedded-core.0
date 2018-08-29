Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 678677914C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 14:30:27 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id g44-v6so5906467qtb.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 07:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IusHwIbjCY8ITDtOlXPZSHMtX0DREJrC7h+zDFR/q48=;
	b=YNqtRLeibSh7vjbvJC5NhfbPaY675cw0Y0jlqacm9uqXCQZWbD0s9+EHES287jpmzv
	qAqln5HINZwpkFUTFL8vldVQiD0TVc2OOLVokPQrhy8Q/Pb0psqv7vcFTTBh0IV8aIUW
	RF634ArZx8D2dRFR+2xE6Pmlx1l/xSnyB8zdd2yRuG6A4j2YKdBLNidQ4hzorTFeHrRa
	tSVrRscNoTO+c9bLu0dsErBY/AR5SlgLwYENEzLNtgn3DjXuAt5pCaLcyL17Ze7RZow1
	7bmf9FSCzzjrMJijzEggkUK/ajSrW+HJxoRW/Sdv6CXmYWVGFhOnskucQSwQxJ6qdgPS
	plTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IusHwIbjCY8ITDtOlXPZSHMtX0DREJrC7h+zDFR/q48=;
	b=gzNwfe7KnyNyC+yfBqoaJs62xPCWm5noVYT7GhuX5M6KByy1Cc4bKlbqChpaXMbqiq
	xjEW5CQwNgKIrFj0P613vBdNxlXQQY55h16t8AsFdYKz4teW3XzJYUlcnRWLAn9WjJ9y
	3cWaTqg48S9ukJ9WcjtanPK8imbHesc6R9ufd+l+wM/N8ah7Jd9ZBLaHARiJkhDgeV1d
	4PP0p9suncbO0iJ6UGx2j3LI+kxaI6CFCn5Zm7DuIfuAeH4mAynJsSVQRXCC/gjZFG7c
	LxbQeycsWB9Hk4atiHPKxLbq+GDp2AyCbb+49qIDDGZ63fLoguXsStCE1usn06OqnLBW
	g+5A==
X-Gm-Message-State: APzg51B1dd5lNX78/fNONDwy7ihTII7/+AP5Pku4punetpucKs3TJ7OD
	IKthlirYYPh19ruFY7hBWbvKRWHiKrqu5G+B/to=
X-Google-Smtp-Source: ANB0VdbfFJBrUq+YZVfi91lNxR8CXuM9gtgOADy7SNXRuwW5I2oUvi+ZMzKYcfFl0Fne821JDZc/c5cshBVunlDD6hs=
X-Received: by 2002:a0c:e205:: with SMTP id
	q5-v6mr6519808qvl.224.1535553028085; 
	Wed, 29 Aug 2018 07:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<c971e5fd32f999781ff4174c7c1ca6d0e54dea65.1535451643.git.alex.kanavin@gmail.com>
In-Reply-To: <c971e5fd32f999781ff4174c7c1ca6d0e54dea65.1535451643.git.alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Aug 2018 07:30:00 -0700
Message-ID: <CAMKF1spm5a-Zsv5ygjAwf5omk4ekK=ek=awe6Q1RdG_bVntuGw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 6/6] ca-certificates: update to 20180409
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
X-List-Received-Date: Wed, 29 Aug 2018 14:30:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 28, 2018 at 3:24 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>
> License-Update: URI fix
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../{ca-certificates_20170717.bb => ca-certificates_20180409.bb}      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/ca-certificates/{ca-certificates_20170717.bb => ca-certificates_20180409.bb} (95%)
>
> diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb b/meta/recipes-support/ca-certificates/ca-certificates_20180409.bb
> similarity index 95%
> rename from meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
> rename to meta/recipes-support/ca-certificates/ca-certificates_20180409.bb
> index 24d3a6e..0d57083 100644
> --- a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
> +++ b/meta/recipes-support/ca-certificates/ca-certificates_20180409.bb
> @@ -5,7 +5,7 @@ This derived from Debian's CA Certificates."
>  HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
>  SECTION = "misc"
>  LICENSE = "GPL-2.0+ & MPL-2.0"
> -LIC_FILES_CHKSUM = "file://debian/copyright;md5=e7358b9541ccf3029e9705ed8de57968"
> +LIC_FILES_CHKSUM = "file://debian/copyright;md5=aeb420429b1659507e0a5a1b123e8308"
>
>  # This is needed to ensure we can run the postinst at image creation time
>  DEPENDS = ""
> @@ -14,7 +14,7 @@ DEPENDS_class-nativesdk = "openssl-native"
>  # Need c_rehash from openssl and run-parts from debianutils
>  PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
>
> -SRCREV = "34b8e19e541b8af4076616b2e170c7a70cdaded0"
> +SRCREV = "dbbd11e56af93bb79f21d0ee6059a901f83f70a5"

It fails in do_patch for me.
Patch 0002-update-ca-certificates-use-SYSROOT.patch does not apply
(enforce with -f)

