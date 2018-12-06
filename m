Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 255516BBEE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 16:05:08 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id n21so1071369qtl.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2018 08:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=74a4udwDt3fB9Y6Dt9FZUBVKO+wtccS3XHWCOWfAhvo=;
	b=J2O9cfFbg87t/bnoxvxBOafQMAl9oLoTFu/p36GJ+oHAH1Fb9aBXZplJ/SaalXSERa
	RC2TS0LJKgHrn55/GY3e6gSJ6AQNUpTZW/eZNA+9ukeW8+2sKfkU/tVdZEjv4CaeccTi
	y7fuwpIzZRtCgXMiQfnfuOspr9Ru+GRnWx/rMOcbA37P6vc2hOsKuTnPm44CfXP/b8AX
	etdUCemmd4Fi2UJd/8QEnERVd+nSV+5RWz/bZ6C4G602oYeoBFYs6v1LFhVsUQuU4XEn
	Zt0tT9gx2nQFmOc3IYIeNIdD2ICkdoNQ/NnrJcX7VCB4b9/8tC/Gnba8ljkyOjicOW4W
	RtZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=74a4udwDt3fB9Y6Dt9FZUBVKO+wtccS3XHWCOWfAhvo=;
	b=RDQ5VC4RywQEqg1Rva8BUb5D7wxKwYqkCiu4Gc5+Pp0f7B2IcoNTomE5uAHlDoVGap
	u67ZrBGPB8kNv6vd92PjPApOL4gcgOMVS89fK8Id+HuJQNzPzi2Lr84pG5a4n/5Xj9s4
	f8FsIv4XYyLQzL9rSfgxu6iAGqo6dfneWmtaqaTGSlrZO8R2j5LutBjElsRX95iJ8883
	8J7Ykn1cwm4tN/01jqhrGUUYirtXft9utgxE78CqM58uaN+Ae8gb7S40P/zCBtlFtv7R
	HCTfQbMEEnOvGdmhQgqSWkymZXE3kGgURIrkuA2rEMA6wrr77X9tyMre1K31G5EYFyt9
	eYjA==
X-Gm-Message-State: AA+aEWYoJ+KKgXoebYjp1N2E4CPdPIboZHBTJuU9p0wiaQuJVvhnUjHk
	xe8tFI7B3uQlsXkZhgeLjwc+JcKr5RetnQsLOqg=
X-Google-Smtp-Source: AFSGD/XcKFPO35mUH3rxinnVuhVpgLZlztzvPPWChi6EsuQBAMpRn/EwG6HeQcHFgOaspSN+06S3fDZpc7ZBHxbROCQ=
X-Received: by 2002:aed:3eac:: with SMTP id n41mr27821588qtf.196.1544112308828;
	Thu, 06 Dec 2018 08:05:08 -0800 (PST)
MIME-Version: 1.0
References: <1544086575-9621-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1544086575-9621-1-git-send-email-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Dec 2018 08:04:42 -0800
Message-ID: <CAMKF1sronBzCtpppkc2-x02d5yS77=zS5yiTRL4Dihaqob6x=w@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] glibc: improve reproducibility with multilib
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
X-List-Received-Date: Thu, 06 Dec 2018 16:05:08 -0000
Content-Type: text/plain; charset="UTF-8"

looks ok
On Thu, Dec 6, 2018 at 12:57 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> Multilib builds specify several loaders which will end up embedded in
> some binaries or script files. To support reproducible builds, we must
> ensure the loaders are always in deterministic order.
>
> [YOCTO #2655]
> [YOCTO #12478]
> [YOCTO #12480]
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>
> Improve the fix and rebase it to 2.28
>
> Here is the log of lib32-glibc
> [log.do_compile]
> |Adjust ldd script
> |ldd "/lib64/ld-linux-x86-64.so.2 /lib/ld-linux.so.2 /lib/ld-linux.so.2
> /lib64/ld-linux-x86-64.so.2" -> "/lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2"
> [log.do_compile]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-ld.inc  | 4 ++--
>  meta/recipes-core/glibc/glibc_2.28.bb | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-ld.inc b/meta/recipes-core/glibc/glibc-ld.inc
> index bb167b3..041ffbb 100644
> --- a/meta/recipes-core/glibc/glibc-ld.inc
> +++ b/meta/recipes-core/glibc/glibc-ld.inc
> @@ -10,8 +10,8 @@ def glibc_dl_info(d):
>          infos['ldconfig'].add('{"' + loader + '",' + "FLAG_ELF_LIBC6" + ' }')
>          infos['lddrewrite'].add(loader)
>
> -    infos['ldconfig'] = ','.join(infos['ldconfig'])
> -    infos['lddrewrite'] = ' '.join(infos['lddrewrite'])
> +    infos['ldconfig'] = ','.join(sorted(infos['ldconfig']))
> +    infos['lddrewrite'] = ' '.join(sorted(infos['lddrewrite']))
>      return infos
>
>  EGLIBC_KNOWN_INTERPRETER_NAMES = "${@glibc_dl_info(d)['ldconfig']}"
> diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.28.bb
> index d072939..a107c58 100644
> --- a/meta/recipes-core/glibc/glibc_2.28.bb
> +++ b/meta/recipes-core/glibc/glibc_2.28.bb
> @@ -122,10 +122,10 @@ do_compile () {
>         if [ -n "${RTLDLIST}" ]
>         then
>                 prevrtld=`cat ${B}/elf/ldd | grep "^RTLDLIST=" | sed 's#^RTLDLIST="\?\([^"]*\)"\?$#\1#'`
> -               if [ "${prevrtld}" != "${RTLDLIST}" ]
> -               then
> -                       sed -i ${B}/elf/ldd -e "s#^RTLDLIST=.*\$#RTLDLIST=\"${prevrtld} ${RTLDLIST}\"#"
> -               fi
> +               # remove duplicate entries
> +               newrtld=`echo $(printf '%s\n' ${prevrtld} ${RTLDLIST} | LC_ALL=C sort -u)`
> +               echo "ldd \"${prevrtld} ${RTLDLIST}\" -> \"${newrtld}\""
> +               sed -i ${B}/elf/ldd -e "s#^RTLDLIST=.*\$#RTLDLIST=\"${newrtld}\"#"
>         fi
>
>  }
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

