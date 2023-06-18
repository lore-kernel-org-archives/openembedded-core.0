Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C642EB64D7
	for <webhook@archiver.kernel.org>; Sun, 18 Jun 2023 17:10:41 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.9532.1687108232670665754
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 10:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cwxcC1ap;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-558b70c715cso1139267eaf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 10:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687108232; x=1689700232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ezwh+kOWZqgXVNM9RK8FM3vODcMSakjVhLSVBMFtIQ=;
        b=cwxcC1ap3j7LrOvTlPKZhFV9US/A5+oxE98gST2LsiMaUDGfUP3HTxCR+oB+qKMyHm
         An4+WxWu4W60w3Rkyurk9+7Vtn/R7cVZIeyvMvOhY3+JX1syZK76rEIAkLPKjqk4psry
         Ziub9sscmeGaFv1DmDQv/qs2ObW4w8Xr28AXKaMgfb2k7Xn5WZ03/M1BC4/ZFQYN9Hfo
         raulAkKxVU+pn/eC6MwCPX0MPbbALqsCxlt+KKAqWYLnwlE1eAWeARzklvdRXGqVqLa/
         MiOblkzll0qNWbVnkSlu6JIpZ2i6eeqysrL8p0UsNn1YSNJGK/71IlLqNIWULOILInqg
         AO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687108232; x=1689700232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ezwh+kOWZqgXVNM9RK8FM3vODcMSakjVhLSVBMFtIQ=;
        b=jjXUqTTZtbCYJNz+A9VD2juohhzaNvpnXtYf6E4XHQ6W0cI/1zskpyId4M6Bmp23y2
         bVDr098Cyri5IfGdDFAfArMggz22Th9TvNhamONBZNs2lTYQi95UN6BUot+59GWDVisc
         S3ZNpJV3OC5AqdwwA/aStCfiZ3imDXgY/fTjKP4DDGAkhWbfUn68Bof2i7w5oNOC87HM
         IuQaSzXVaSSEyjqMd78jkxch5xwxSmmc7Qd73TfEYL8dZqXvde4bAEHQDVdrS7lkJ01W
         aFgXgc/0dhu+SMgH/Ej1v5xYoQ9PUcPWEej43G7RIZoHelWEwvOP6yCj3V+01cbFUDN/
         CC5w==
X-Gm-Message-State: AC+VfDzUL+QRk2u2PgJdVmQlj0mMiVFm96OwCGhoW/S9RtUmP92CMKSi
	6XPP7iNFjWPUJgu/SAj1UnvFUZoLZ53GU+VyB5M=
X-Google-Smtp-Source: ACHHUZ5OFguai6acafB7hsi2Npv/8huMdfUFTaWZQbol4mS8qgsOhaRf6+GhVe6cWuNJDj4dH43FUbXicvFbNHtYWq0=
X-Received: by 2002:a4a:cb97:0:b0:558:a32c:41f6 with SMTP id
 y23-20020a4acb97000000b00558a32c41f6mr2699060ooq.4.1687108231662; Sun, 18 Jun
 2023 10:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230615105447.29690-1-aplanas@suse.com>
In-Reply-To: <20230615105447.29690-1-aplanas@suse.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 Jun 2023 10:10:05 -0700
Message-ID: <CAMKF1sr7RqtX9uiWoVrL+6RHE2hx8_nEHQ9qYdTkTNhN0m0jWw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] rpm2cpio.sh: update to the last 4.x version
To: aplanas@suse.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 17:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183063

I am seeing some race condition see

https://errors.yoctoproject.org/Errors/Details/708923/

On Thu, Jun 15, 2023 at 3:55=E2=80=AFAM Alberto Planas via
lists.openembedded.org <aplanas=3Dsuse.com@lists.openembedded.org>
wrote:
>
> From: Alberto Planas <aplanas@suse.com>
>
> openSUSE RPMs are compressing the RPM payload using zstd, that
> correspond to the magic ID 0x28, 0xb5, 0x2f.
>
> This patch update the script to the last version from the rpm project,
> and add support to this compression format, and extract the cpio payload
> using the "unzstd" binary.
>
> Signed-off-by: Alberto Planas <aplanas@suse.com>
> ---
>  scripts/rpm2cpio.sh | 30 ++++++++++++++++++++----------
>  1 file changed, 20 insertions(+), 10 deletions(-)
>  mode change 100755 =3D> 100644 scripts/rpm2cpio.sh
>
> diff --git a/scripts/rpm2cpio.sh b/scripts/rpm2cpio.sh
> old mode 100755
> new mode 100644
> index 2034373fe4..8199b43784
> --- a/scripts/rpm2cpio.sh
> +++ b/scripts/rpm2cpio.sh
> @@ -7,7 +7,7 @@ fatal() {
>  }
>
>  pkg=3D"$1"
> -[ -n "$pkg" -a -e "$pkg" ] ||
> +[ -n "$pkg" ] && [ -e "$pkg" ] ||
>         fatal "No package supplied"
>
>  _dd() {
> @@ -16,14 +16,23 @@ _dd() {
>  }
>
>  calcsize() {
> +
> +       case "$(_dd $1 bs=3D4 count=3D1 | tr -d '\0')" in
> +               "$(printf '\216\255\350')"*) ;; # '\x8e\xad\xe8'
> +               *) fatal "File doesn't look like rpm: $pkg" ;;
> +       esac
> +
>         offset=3D$(($1 + 8))
>
>         local i b b0 b1 b2 b3 b4 b5 b6 b7
>
>         i=3D0
>         while [ $i -lt 8 ]; do
> -               b=3D$(_dd $(($offset + $i)) bs=3D1 count=3D1; echo X)
> -               b=3D${b%X}
> +               # add . to not loose \n
> +               # strip \0 as it gets dropped with warning otherwise
> +               b=3D"$(_dd $(($offset + $i)) bs=3D1 count=3D1 | tr -d '\0=
' ; echo .)"
> +               b=3D${b%.}    # strip . again
> +
>                 [ -z "$b" ] &&
>                         b=3D"0" ||
>                         b=3D"$(exec printf '%u\n' "'$b")"
> @@ -35,7 +44,7 @@ calcsize() {
>         offset=3D$(($offset + $rsize))
>  }
>
> -case "$(_dd 0 bs=3D8 count=3D1)" in
> +case "$(_dd 0 bs=3D4 count=3D1 | tr -d '\0')" in
>         "$(printf '\355\253\356\333')"*) ;; # '\xed\xab\xee\xdb'
>         *) fatal "File doesn't look like rpm: $pkg" ;;
>  esac
> @@ -46,10 +55,11 @@ sigsize=3D$rsize
>  calcsize $(($offset + (8 - ($sigsize % 8)) % 8))
>  hdrsize=3D$rsize
>
> -case "$(_dd $offset bs=3D3 count=3D1)" in
> -       "$(printf '\102\132')"*) _dd $offset | bzip2 -d ;; # '\x42\x5a'
> -       "$(printf '\037\213')"*) _dd $offset | gunzip  ;; # '\x1f\x8b'
> -       "$(printf '\375\067')"*) _dd $offset | xzcat   ;; # '\xfd\x37'
> -       "$(printf '\135\000')"*) _dd $offset | unlzma  ;; # '\x5d\x00'
> -       *) fatal "Unrecognized rpm file: $pkg" ;;
> +case "$(_dd $offset bs=3D2 count=3D1 | tr -d '\0')" in
> +       "$(printf '\102\132')") _dd $offset | bunzip2 ;; # '\x42\x5a'
> +       "$(printf '\037\213')") _dd $offset | gunzip  ;; # '\x1f\x8b'
> +       "$(printf '\375\067')") _dd $offset | xzcat   ;; # '\xfd\x37'
> +       "$(printf '\135')") _dd $offset | unlzma      ;; # '\x5d\x00'
> +       "$(printf '\050\265')") _dd $offset | unzstd  ;; # '\x28\xb5'
> +       *) fatal "Unrecognized payload compression format in rpm file: $p=
kg" ;;
>  esac
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182844): https://lists.openembedded.org/g/openembedde=
d-core/message/182844
> Mute This Topic: https://lists.openembedded.org/mt/99546092/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

