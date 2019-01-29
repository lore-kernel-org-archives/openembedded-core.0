Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5FF857C28C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 18:20:27 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id p17so23341588qtl.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 10:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kizlx/qOP5KgRjf9UbYl+LrFqXuYr9FyJ6BFgq+/WW0=;
	b=Th1cSWBCykqz3Bgo8GIj9s2OTTjKZS8VNxUbhPOEWjewjWXzqgMyrfS9ECdf/TMwY8
	WsGrTpQb8613wN/gZJCqa2UrU7Y2w0WjqNf7Swk2qi50pwerZY3GUr9NKmL8pdrTMwkh
	mxZOTwix/we6xuefL/2hyDAEphRe8dkHg7EGxgKaJf8fnLPFN7nFCA9hBU4ZF2XkuXII
	KjZwLws67XWXYqeT0tlnuoPlFxa8JOy1uPFuzrqkqSC4pYCDf2vn5EAwQ9j9fo/2mTe+
	4j19QL8i0EtKWpS8bsKuEETWNHIfM+MAKZPvsuZCXOMb/DNlV7fy9FjI5+6sTqp7npZj
	L8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kizlx/qOP5KgRjf9UbYl+LrFqXuYr9FyJ6BFgq+/WW0=;
	b=lQNUavvozjEPWnHqM2lDYCurIHyQZO4U3EGbu55D7intOfXF0YpAlIaB4fBaTew7Zk
	hX1fvudE/81qhzvOCkwJFMBnDm6tu761leUnYys6ulHZgmRtgiMhbRsToCL+ESd7ZJUK
	UloGCbZOAAC0TpGA5GQWF1tH1fAMgZzFtN/MEhZxphl35qjgkg5LBVaiwNKDcDtWpsZo
	QgHoutV2VQQDsFTFC7foTJMf0ssV1ulsNcUqED9bYkdOU0aIJRJRCsTugpz13i7gYm+/
	VbTlmFqVpu/V7+bVLXan3dvPWjk9WdV5ZH4mpDhtXggf5jkiiSggtf80o8PyEW1vScyn
	8S1w==
X-Gm-Message-State: AJcUukfKaeLYr/EWqYT9MTtHPdkddcnKRi3WQJ2b1Ub1adv4lYB7xIIW
	S6A3hIp7QiK1o0UmA39OePGHEvBpHaxM7Xicd9iAwkPfJ0U=
X-Google-Smtp-Source: ALg8bN5BRnwr3IpX0UPDI5BH7dAl5fBsp/zg00YyyjufAvLx0g2jsyAY1wJpLFfIcL+iPVnNYXddNPvCtdlftwFXeo0=
X-Received: by 2002:a0c:a144:: with SMTP id d62mr25802149qva.50.1548786027778; 
	Tue, 29 Jan 2019 10:20:27 -0800 (PST)
MIME-Version: 1.0
References: <20190128124739.9175-1-samuli.piippo@qt.io>
In-Reply-To: <20190128124739.9175-1-samuli.piippo@qt.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Jan 2019 10:20:01 -0800
Message-ID: <CAMKF1soJ1obqx9GyjAHJkdMq3HZdWjiAKRRqea5=HohEj+cUGQ@mail.gmail.com>
To: Samuli Piippo <samuli.piippo@qt.io>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-cross-canadian: Do not create symlink to real-ld
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
X-List-Received-Date: Tue, 29 Jan 2019 18:20:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 28, 2019 at 11:19 PM Samuli Piippo <samuli.piippo@qt.io> wrote:
>
> real-ld is always used if that is found, which means you cannot
> switch between bfd and gold linkers using -fuse-ld=gold.
>
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> ---
>  meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> index e7c08d3a61..ececec4965 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -137,8 +137,6 @@ do_install () {
>
>                 ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t$suffix $dest$t$suffix
>         done
> -       t=real-ld
> -       ln -sf ${BINRELPATH}/${TARGET_PREFIX}ld$suffix $dest$t$suffix
>

this patch is essentially, reverting
https://git.openembedded.org/openembedded-core/commit/?id=cdd86896c8d29135f937968e9aa07f919cf543d3

so lets do a revert instead to keep the context clear

secondly, please test with the mips/mips64 as those were primary drivers for
the patch in first place.  Richard might add more context if he remembers.


>         # libquadmath headers need to  be available in the gcc libexec dir
>         install -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

