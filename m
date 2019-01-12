Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 49E4D7C161
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 15:40:06 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id e5so22083734qtr.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 07:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QTb7hqjhEjdC6VaOI/p9Obnu/zPEdwHy1UNOLpxTfEg=;
	b=TRKDkmEp1J5ZcSLHZ7ogrNSiXZC7FWmYlgKig9p7CHrxyZxgvDQwXwrat4KjscxtBr
	6q2rgsGpq4wlFPwsmhxISOW0hoGe0XELmXNL2RgckrX7+o8GUfHgPeMPOz51c+vfo9Jb
	yTi+TlJA9pLgqs7YAR8iM7Mu5/7yO3vo6b4yM8FxSMx2YkhYMH0Lp9QpmULASKaih6PH
	klURFSBbxK/kRAhIH/25v1/HDMyy1lpPywAtJuuKJMuX456dGzy/aphLEmRIqGrPil4Z
	TENM2VuWWXIc3nU/ZGVQXkpv6Oc5+NO/In0Sc3/7MtgHjA0/4Arv6jWwOnQ3Xi0Syjwz
	xzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QTb7hqjhEjdC6VaOI/p9Obnu/zPEdwHy1UNOLpxTfEg=;
	b=eXTV/lCdWXByLbhX0rKgwV/4NgUjyWFQav+/oPvP/WbgcQ93hLePh7o4uAFLrsRaJd
	O3+H3nsr5GCESYdtb2Hs79CqJff4F8SwDMfplGyDSPxQdCidSdWWNrCvCfzw+IfuWdYy
	+EaBSRSTcMpZqfJ8aEcN4unr56R1DyYzOlIwYwdHr5wBUSJSl+zXWH6YdaNHeNYNUn+6
	EX/EGdFxYZi5cmEzykLPHR5RPGax6DhzL22xGxjSG1yFfyDS5KX3+5JjqapQttupHtE1
	t+KUx2/Eq90viYb1vWxu7KJe+qUqg4vSCKl9JLSLiq8Dr7BqgsTsqPcJfT82Dn0Gs3bw
	CbWw==
X-Gm-Message-State: AJcUukfD3nmOObyowKWAnLUq8qJHb0GEsCAj1X6aooFwVhlvFotpPP4m
	XdoEQ5NuDkTAkWvyk6AaQ6N0huXnST2XW6KBymqP2G8v5vQ=
X-Google-Smtp-Source: ALg8bN4hSmiB6ah4zSAmth6xrmCISdq225B4Gu7V3SME8MtCUfNgi9IFMmBoHKUZsGcbgYSmM9H/RfnqmPulG140R2s=
X-Received: by 2002:a0c:d80f:: with SMTP id h15mr18214308qvj.228.1547307606883;
	Sat, 12 Jan 2019 07:40:06 -0800 (PST)
MIME-Version: 1.0
References: <20190109015224.14076-1-hongl.fnst@cn.fujitsu.com>
	<20190109015224.14076-2-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20190109015224.14076-2-hongl.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Jan 2019 07:39:41 -0800
Message-ID: <CAMKF1spFQ8yUS2HLdu68_Nq7x2sFXSMDUKPX7V8GzvZAWwk7wg@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] python3-pbr:Upgrade to 5.1.1
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
X-List-Received-Date: Sat, 12 Jan 2019 15:40:06 -0000
Content-Type: text/plain; charset="UTF-8"

i am getting http://errors.yoctoproject.org/Errors/Details/216093/

On Tue, Jan 8, 2019 at 5:52 PM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> Upgrade python3-pbr from 4.2.0 to 5.1.1.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/python/python-pbr.inc                   | 4 ++--
>  .../python/{python3-pbr_4.2.0.bb => python3-pbr_5.1.1.bb}     | 0
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-pbr_4.2.0.bb => python3-pbr_5.1.1.bb} (100%)
>
> diff --git a/meta/recipes-devtools/python/python-pbr.inc b/meta/recipes-devtools/python/python-pbr.inc
> index 5a295c5f33..bfe3030b07 100644
> --- a/meta/recipes-devtools/python/python-pbr.inc
> +++ b/meta/recipes-devtools/python/python-pbr.inc
> @@ -5,8 +5,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
>
> -SRC_URI[md5sum] = "6619780896ca81c7cd19c6e2f439b6c9"
> -SRC_URI[sha256sum] = "1b8be50d938c9bb75d0eaf7eda111eec1bf6dc88a62a6412e33bf077457e0f45"
> +SRC_URI[md5sum] = "dbc94417a8ff0432d6244501a7f1bd49"
> +SRC_URI[sha256sum] = "f59d71442f9ece3dffc17bc36575768e1ee9967756e6b6535f0ee1f0054c3d68"
>
>  inherit pypi
>
> diff --git a/meta/recipes-devtools/python/python3-pbr_4.2.0.bb b/meta/recipes-devtools/python/python3-pbr_5.1.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/python/python3-pbr_4.2.0.bb
> rename to meta/recipes-devtools/python/python3-pbr_5.1.1.bb
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

