Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id B6B4474CAF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 23:00:27 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id 130-v6so3640158qkd.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 16:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JaejV7d68FWRR3jrPhDauqQM8dOwqSVyf3MR4HhjiEE=;
	b=DrBTTdQtOesdUx4wCO430ggR3vgqzHH5jjSVyYSqxOW86Lrn2A0yPljk5pSdKCHoWu
	cpAHTxk7M444bdOc8IDh/Uj0/MVfHIR5WaS9l9NyhhoyXdaOXREnEyD9ZwTrPYz1VhDN
	5MMWqelL/ancdBD3dWXzZjhJcZQ+2FrjVZKlMKA5UPv/ZhI9bwJ2pTwNfgKY95VvBV32
	O3Ki499lvVxnDtBuqFNWAh7bXkuqRoKCdIARnVudXmIMag5TSyllv+iU0JkTyz/Xnjv8
	ks0tSn6QOsTHLFb9MrJUBdSeBBlwpeoTfQrS5G0qQpjK8MLlfSc1tspzz+/3EH1WcgyT
	K1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JaejV7d68FWRR3jrPhDauqQM8dOwqSVyf3MR4HhjiEE=;
	b=KpH53e/EccPw8bOm9LEYkUUpEDcb5cGIrnhN//R+eZyCoF9TVk7Gj5aPDPua61peqD
	ahDyCkn1DP3v1HJghdJ+cahkJ815oLp1Hu06cf+0qZ3UEURsMEwZ9u/F43uTk1NGu8t9
	NjinSLc+NiXChc/vaKxHi3Q3IEhVEZZhADpBhFqnokGxFTZeoOZ7paW21qkLpCCzmNzj
	Iko4CVwUCbmJBI2fapClUmjpVa7D2H1IKcoCY4mjsI8Uf7k10Kl8OxwrAoSwG0/HwDwJ
	Xq4Xyh5JRNiQwYGJgaLodCWauNdQ8Of7zxMFwuLjARkyJan2+ud4fkPk8GybavT9Divb
	SvUg==
X-Gm-Message-State: APzg51Cty2JeYIHUz/9wK4t/6K+aOgmTos+YX/M04M1GxD3UX1A/3v1E
	nRehTnB+MNBDgYyjPufBL5xb9M2+bunYFvNR90c=
X-Google-Smtp-Source: ANB0VdZonzfG7CNn49OBVh98NBUh5v+tV5dHXkCUEsp7F9iO3dsPchIDC5YxQ2/BtXZ5FvjS0jDn0TFkz+hl/bCCBXg=
X-Received: by 2002:a37:e118:: with SMTP id
	c24-v6mr25470276qkm.68.1536102028472; 
	Tue, 04 Sep 2018 16:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <20180904155000.3715-1-ross.burton@intel.com>
In-Reply-To: <20180904155000.3715-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Sep 2018 16:00:01 -0700
Message-ID: <CAMKF1so7rCiavW+_mW3rHfvZrhBCaLvUkFeWKYwOP+A0wQhv_g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] os-release: fix to install in the expected location
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
X-List-Received-Date: Tue, 04 Sep 2018 23:00:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 4, 2018 at 8:50 AM Ross Burton <ross.burton@intel.com> wrote:
>
> From: Joshua Lock <joshua.g.lock@intel.com>
>
> os-release (5) recommends that the os-release file be installed in
> /usr/lib/os-release and that /etc/os-release be a relative symlink to it.
>
> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/os-release/os-release.bb | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
> index f9887047561..c6e36001dc5 100644
> --- a/meta/recipes-core/os-release/os-release.bb
> +++ b/meta/recipes-core/os-release/os-release.bb
> @@ -1,7 +1,7 @@
>  inherit allarch
>
>  SUMMARY = "Operating system identification"
> -DESCRIPTION = "The /etc/os-release file contains operating system identification data."
> +DESCRIPTION = "The /usr/lib/os-release file contains operating system identification data."
>  LICENSE = "MIT"
>  INHIBIT_DEFAULT_DEPS = "1"
>
> @@ -42,6 +42,7 @@ python do_compile () {
>  do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
>
>  do_install () {
> -    install -d ${D}${sysconfdir}
> -    install -m 0644 os-release ${D}${sysconfdir}/
> +    install -d ${D}${libdir}
> +    install -m 0644 os-release ${D}${libdir}/
> +    lnr ${D}${libdir}/os-release ${D}${sysconfdir}
>  }

I am also seeing packaging failures

ERROR: os-release-1.0-r0 do_package: QA Issue: os-release:
Files/directories were installed but not shipped in any package:
  /usr
  /usr/lib
  /usr/lib/os-release

