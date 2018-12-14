Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1489E6B463
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 23:38:29 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id n32so8088814qte.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 15:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tucEa6mOqy8ZME8i80O0H+4rvPKUS8udrPeENMPKXP8=;
	b=rqMj46gCjjBp78Y/Y0pgtiedLdGOKrGsBpG8x4B7VtxYw9hc1Swe9AJo5Z62dEDu4F
	bRBZ9CSb6QReOYViBO2xz21AS5ltioDphnqV3WRI1la8xtQLCSFB31t9Hm/YlBzPc+CB
	q4l1SuPn+u4btLdCpkZY7w92dDrVvk4D9YBcVDEN/XxKYIexl0LoulC6v1wVO2VfspEz
	R78AoKU6q+XNoipLp9kuRSNp+U6oVwdl3FZ1Px6OewflNb9ctp5DG372j0Qr+NFUsIRx
	R4ZPxjDZfHIayjh8ICEh2ChVJy/ZfTxIsgq/1YDumHhBv4lpGjf/Duq4w/TPszwji2N8
	bkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tucEa6mOqy8ZME8i80O0H+4rvPKUS8udrPeENMPKXP8=;
	b=I/5QH084c2kyIA5R3begfowlI+/rJq3iNtqCxh1Dzi1WteXs0+vq69IHQoKHUO4nyo
	ZjHy4ApSNZJBxOsLzMpTdJGTQqXlVhN5Iu6xrCDmySwdKCtiEmt76ZeHbYJ89HG4oTI+
	GD7yibG2pIUBJqBfyUrOXEd0ilcrbh9bKPmYA5Cn/q3bcB0mIwzrYg+63gMcSLdmVawD
	cs27QJpxN60yO1v59KVC+OSkGeF4YgL7gGUR/o9D22mIr9aNXOXa5l7eur6o7Qkmt7gr
	uwc2/6jgmzNZW4OL+jYyS9W+Wbuplmql7gRDxDboGKoxsMELX/ipEcuZ93YCLUaj5WuN
	gvqQ==
X-Gm-Message-State: AA+aEWYg+to0qaRRKyGODfAPzd0ofukN+sceWXX9MuAtWIuDIShbX1/B
	cUBs40o0rx6iIUn17iKJlx0k9Gk6IiabgHgmH7/RldzS
X-Google-Smtp-Source: AFSGD/WWB51LHfqIGNf8ypImYL7cwsLtFPBQ8zDRt2mYtmIeSH+VtUBDIkwAf3crhFZam54pErD/KjK2LwuFa3gwyXM=
X-Received: by 2002:ad4:41d0:: with SMTP id a16mr4803889qvq.55.1544830710818; 
	Fri, 14 Dec 2018 15:38:30 -0800 (PST)
MIME-Version: 1.0
References: <20181214170859.1737-1-ross.burton@intel.com>
In-Reply-To: <20181214170859.1737-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Dec 2018 15:38:04 -0800
Message-ID: <CAMKF1soyF4xOFmsGeWjj6DYtQhAvFdems5KMsNx9CRJPrYB+HQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "popt: update SRC_URI"
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
X-List-Received-Date: Fri, 14 Dec 2018 23:38:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 14, 2018 at 9:09 AM Ross Burton <ross.burton@intel.com> wrote:
>
> Go back to use rpm5.org, as it's the canonical host for popt.  The host is back up now.
>

is there any disadvantage of keep using fossies.org ?
after all it kept us afloat in bad times :)

> This reverts commit 347ee336dcc94e6fa4e4788117013615b90abd70.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-support/popt/popt_1.16.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/popt/popt_1.16.bb b/meta/recipes-support/popt/popt_1.16.bb
> index 377d1084495..478288f9bf2 100644
> --- a/meta/recipes-support/popt/popt_1.16.bb
> +++ b/meta/recipes-support/popt/popt_1.16.bb
> @@ -8,7 +8,7 @@ PR = "r3"
>
>  DEPENDS = "virtual/libiconv"
>
> -SRC_URI = "https://fossies.org/linux/misc/popt-${PV}.tar.gz \
> +SRC_URI = "http://rpm5.org/files/popt/popt-${PV}.tar.gz \
>             file://pkgconfig_fix.patch \
>             file://popt_fix_for_automake-1.12.patch \
>             file://disable_tests.patch \
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

