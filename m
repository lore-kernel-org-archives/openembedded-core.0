Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id B60BD6BBAB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 00:49:48 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id at20so5683430iec.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 17:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VdKzLHI+V0AJVBHTwwK2fnUvau7/0bLsb/fpwC384MI=;
	b=qqTP1t1OeYeQUM2xswBqRODIaGdiqNJ5Z3tGU2gPDuaEzkjgWScTwk9rTEEMjaDgg0
	3jFf/DYKRvg1NM7vPMlHjnlA52OThyFDrPrufKigYgn7NjhF7lt3P1C+37Ahturgxq1g
	TMnkYIcc5i9RUrNj4c2ga+ycNUnymkR/cBMikhv5chq6OTQuKnrVCWou8Fj/KFw1G7Rt
	+jFwO3igkSFJel4YYWvR3od1t1nbr/86WZdDL3Uc3So0YDzEzOXORkpmH1jvOV+BW/nB
	TCm3Wsqr+ZrtbYG7nS5+e19KadjgfJl2itqG0LiZkK6rnIU7HljDqphW2P5RBSas5DEK
	Dkhg==
X-Received: by 10.50.153.83 with SMTP id ve19mr26971849igb.4.1410828590082;
	Mon, 15 Sep 2014 17:49:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Mon, 15 Sep 2014 17:49:19 -0700 (PDT)
In-Reply-To: <1410825250-3067-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
References: <1410825250-3067-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Sep 2014 17:49:19 -0700
Message-ID: <CAMKF1sqUa3E6uzV0oOt9-8A6-gqgbXWimA=VGtDdGU1RruV1wQ@mail.gmail.com>
To: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] packagegroup-core-standalone-sdk-target: Add libgcov-dev to target sysroot
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
X-List-Received-Date: Tue, 16 Sep 2014 00:49:59 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 15, 2014 at 4:54 PM, Nobuhiro Iwamatsu
<nobuhiro.iwamatsu.yj@renesas.com> wrote:
> When a user takes coverage in gcc of SDK, it becomes the link error in SDK
> because there is not libgcov.

Looks good. The commit message could be improved so to simply say ..
"Add libgcov to on device SDK"

>
> ----
> ld: cannot find -lgcov
> collect2: error: ld returned 1 exit status
> ----
>
> This adds libgcov-dev to target sysroot.
>
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
> ---
>  .../packagegroup-core-standalone-sdk-target.bb     |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
> index 5d1ce97..154a55c 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
> @@ -7,6 +7,7 @@ inherit packagegroup
>  RDEPENDS_${PN} = "\
>      libgcc \
>      libgcc-dev \
> +    libgcov-dev \
>      libstdc++ \
>      libstdc++-dev \
>      ${LIBC_DEPENDENCIES} \
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

