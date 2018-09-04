Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
	[209.85.222.52])
	by mail.openembedded.org (Postfix) with ESMTP id E7C2B74E47
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 20:19:27 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id r15-v6so3994190uao.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 13:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aEAjhAY2LzjCAIP/3Y3RrgLmIjC3ka+XrlUnBZq6bZk=;
	b=dE6pOD0X3qPhucls80f/Qz4HiSAcygD+WEBUt26w5Ty+X7jN2xNqvIe6YDJ9mr5Mdy
	hegHLnvdytIKhZeRIjjK9c7xSdBPozqhKWiK/KS7Pfdh7ajE6BKS5u6Ajui11xn9A2gd
	H8vju5R7qU/FhoTJFk3g7108n3ngYJXJ1vupMDoInVc/EpmfCmdFHJWrobgt3PjzMbCh
	KqbASiUtadoRVEq22Y95PhUsPXRV8QzxUg7aTPJW7Qd934HzW5iwn4ZISsVsP3OkoKCq
	92Eh4Vks84ZGWLIKY7NsV35E9gRAUPP/cc8kQSzpjitp87DOh2rsz03s6L7uFvX5Jn47
	lCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aEAjhAY2LzjCAIP/3Y3RrgLmIjC3ka+XrlUnBZq6bZk=;
	b=aM/xvWlLWLs2uVjvoYfFDlIDE71nHWO9Ckxyq2Wzs9DVYHRskx/DWdNopQeC7/HSVf
	7Wy+g9IwmBkZVhyBk68w1G0ZXx5C9lb26oibzP473bDnJZmLlVH3taBx5sq5yIlQFSce
	xy3UsVhByhZ9h5NNW+c9yIrNf6ac7hlzMHDV/XzDmN+BwwSmlFexDE4Gdv64KDm/ihC7
	Gc8gDrpH1XyzRr0A04zaYe0wNwleA5bqVOG/Q0Z3F9ph21jD1GM32Q8ICgjQhMOHMJUi
	WBKo9Ln2ysgzwSkBdkBlRs3r+NvU2arX16Q8uHpJjN1d15f2mQHKDhFHdwtYk5Adl8Gt
	SVoQ==
X-Gm-Message-State: APzg51DpCtxuibTVTqpAg8VP5HNbr7H1pimwCEL1mZkR9kGl1Mz7ouc0
	PJ0RofXAPhECM08soPKs2uvgVTOYGzIvw0LT9Iw=
X-Google-Smtp-Source: ANB0VdYy8Xxd1CQmHSGiHpFweLcw+0H2ZSwMnIAEECF4sGewsbZeslA2k8UXCsIAlaFOO9W1eTzqdN6KCXvNKiKSk18=
X-Received: by 2002:ab0:1950:: with SMTP id
	u16-v6mr18655019uag.179.1536092368746; 
	Tue, 04 Sep 2018 13:19:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9f:2b46:0:0:0:0:0 with HTTP;
	Tue, 4 Sep 2018 13:19:28 -0700 (PDT)
In-Reply-To: <20180904155000.3715-1-ross.burton@intel.com>
References: <20180904155000.3715-1-ross.burton@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 4 Sep 2018 13:19:28 -0700
Message-ID: <CAJ86T=VeOq1i0Vg7EnWfP=4hJmXFDvnzdO1ADkk5U081_g2LxA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 04 Sep 2018 20:19:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 4, 2018 at 8:50 AM, Ross Burton <ross.burton@intel.com> wrote:
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

This probably needs an "rm -f ${D}${sysconfdir}/os-release" too to
prevent problems if install is run twice as lnr doesn't handle the
case where the target already exists.

>  }
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

