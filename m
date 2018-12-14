Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
	[209.85.217.51])
	by mail.openembedded.org (Postfix) with ESMTP id 43A897BDAF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 19:10:04 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id v205so4031705vsc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 11:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nB2VNi829og1PpkQC8QpD0DwiaPt2FkeS8a4xBTMbRk=;
	b=c3dqhCsA9h26R1bfod/CUhtwsQj6mRsVWkfz1NCFCecZLuWBxKPknm7+B8AEAs5PFT
	S+PPxbw2dtsaXcq94vWij+1afiixXrq6P9vmxt62e6hDCW/1uY5DEBxjXx1XltRR9+JV
	H54fsX0cFVY2/tcGaNyhouAqBsR3opoRAwsxKS7GTArSN1S31bnjyLborV7NoueBGIz6
	+0PjvhGLD+HllpuLpt07tX0kxr6HKb89mbvH7YSGIFmgDe7yRv9mAnYODDkuTaLyQl/l
	F/FPtagFgdJvTdQRmG4n3MD5HMV4jTduGHiW/ppUm5H6KQSKPH8jftyPiBMpPKtXqCuw
	oxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nB2VNi829og1PpkQC8QpD0DwiaPt2FkeS8a4xBTMbRk=;
	b=uFYAEDQpDKurcwe5uAD3GKpANmysm5nG7w5yCCQGbK+kdT0RaBINu+MhugC53soVvN
	cvDzxsVQW21d6O9XEQ0bDkW02asNATtzkj88aSB0ihiKAiB6+2qK+F6kLngmcm8Dqskh
	RjqPqdaY1wHJ9qkmIxsgSSbobu60BnkFQ1ZkzK8CocKdQF4jd+od61rDCZmhYFdoD5ho
	ZpOA42a+fxVI/SaJMbbr6ZXqbIS0PGTnmvgb7jwDG1nJOZekmyHPZVivWIGCaHpmPyU4
	jr0Q99cXeG6nTZSGYX3oZAgsW7BSomQ2zoALOACuY3K9JwZf5dYKFgWFDh68IsDXctIf
	y0TQ==
X-Gm-Message-State: AA+aEWZZyLKkt5+8T5j1AFniSazRWRN+an4VZoaotF7yZxq04AKbhqAt
	fg/MHk+J4PDQjQbMP3DuLqaVLwtnfFeWfH7tCCk=
X-Google-Smtp-Source: AFSGD/UUf0ZAEb/2mT/9uzs4V3mTKJOg6Le9U/w5JDR5EHrAdYzSzHu8Ptz103RVG4OArccV1sgXblsq54xFFi18x3E=
X-Received: by 2002:a67:7c92:: with SMTP id x140mr1785710vsc.137.1544814604732;
	Fri, 14 Dec 2018 11:10:04 -0800 (PST)
MIME-Version: 1.0
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
	<1544810082-22164-8-git-send-email-serhe.popovych@gmail.com>
In-Reply-To: <1544810082-22164-8-git-send-email-serhe.popovych@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 14 Dec 2018 11:09:53 -0800
Message-ID: <CAJ86T=XQqr-3Jgg1xMPkHz0Qx_KwPxpv3d8xoeKuR5YcP-o00w@mail.gmail.com>
To: serhe.popovych@gmail.com
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/13] musl: Ensure GLIBC_LDSO symlink target does not exist on reinstall
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
X-List-Received-Date: Fri, 14 Dec 2018 19:10:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 14, 2018 at 9:57 AM Serhey Popovych
<serhe.popovych@gmail.com> wrote:
>
> Otherwise do_install task will fail on rebuild.
>
> Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index 9cc875c..4593cde 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -61,7 +61,7 @@ do_install() {
>         oe_runmake install DESTDIR='${D}'
>
>         install -d ${D}${bindir}
> -       rm -f ${D}${bindir}/ldd
> +       rm -f ${D}${bindir}/ldd ${D}${GLIBC_LDSO}

The correct fix here is actually to remove this line entirely. The
official ruling is that there should be no expectation that re-running
do_install should work and patches to make it work are not acceptable.

  http://lists.openembedded.org/pipermail/openembedded-core/2018-September/273723.html

>         lnr ${D}${libdir}/libc.so ${D}${bindir}/ldd
>         lnr ${D}${libdir}/libc.so ${D}${GLIBC_LDSO}
>         for l in crypt dl m pthread resolv rt util xnet
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

