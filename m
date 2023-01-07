Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8642C54EBE
	for <webhook@archiver.kernel.org>; Sat,  7 Jan 2023 07:24:32 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.16027.1673076266430978305
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 23:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CQ+diHmD;
 spf=pass (domain: linaro.org, ip: 209.85.128.175, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-482363a1232so50599697b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 23:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pi2hS810EWRvCCJMGjQybwrraXEwtd3MfwM4KcnafUI=;
        b=CQ+diHmDJIKM0LW3hJ+yHzS34clW1JGYlsMf2CrRAFJWoWLLC/RfqOwRMNZAZvuY56
         qJlMUBXIquVlL4nGx0B3d568nTcRySa7ht9O68cPxX63EUQBTECNBpaQ1/IG+6q5Z5ak
         njxWR0VDQHAPfC8ndhJ5iQZXjD6d8RFsAUz6R4P7lqes0HpvsU+R+UtcWjDbx8v+UEML
         9br5A51D6xs2yBxBI4tSqkPTQYnwXxYhAkvGsB1d31wZqmb0IXUACnJIiErnVGW6pk5r
         DMMffmGhU7/AOBfSVsVqECZR2ox9TBTYkiQkfwGM8np/TJnU70+jp0JHFxEDMNrJAApH
         3mJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pi2hS810EWRvCCJMGjQybwrraXEwtd3MfwM4KcnafUI=;
        b=f4XTySg3JTM5IO0cweZ23Lw1BUBi9r3GTDmQPycSPSW2NihdhetkAdtLJKlhOo4ifV
         08Jq+wSiPfOEwttw1U1qynf5TIkuMvcSvsl/f9NlkTCRDoLkVmYklPycv+rcP/XUvf9G
         2bqCHwuCT94SrId13Lm0wgWFP63aa2ix6Eqlr7OlJJDQEwDBRbz7upkZZ2OOpKPGlPjG
         nz1KKIxsloQ/RzKzk0hDc6gqYrJ4ABWXE7SfUYcTIJG+FlJcJlVoJVKW7kMAi/aCUFJw
         /0fTcirTK3hkgto2101BANg4PaCuRLnPeAVqPgpRTDYHJs4ltIysLjScIuoCsWntIrd4
         C97w==
X-Gm-Message-State: AFqh2krSfEhrfBnwNMUS0Ow0TpsIC2Az0nuJXfbl82DmY/a0oFC+rcJB
	+Dp8kTQ2ewtsve0ChDCT61BzLiwEwZSLTkcQvi0hyQ==
X-Google-Smtp-Source: AMrXdXsc0k6BfBE3L7BBrCPLSu6P6ThjUU+jad9oZvHgLO7s9WsquF7sHof6TvIPGztefcmeJk7ey8HyXg16agBQvwA=
X-Received: by 2002:a0d:d4d3:0:b0:4bc:f544:1034 with SMTP id
 w202-20020a0dd4d3000000b004bcf5441034mr1381023ywd.30.1673076265392; Fri, 06
 Jan 2023 23:24:25 -0800 (PST)
MIME-Version: 1.0
References: <20230107000831.1253334-1-raj.khem@gmail.com>
In-Reply-To: <20230107000831.1253334-1-raj.khem@gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Sat, 7 Jan 2023 08:24:13 +0100
Message-ID: <CAP71WjzfmnWf-Fiwe+m-avbs1=Z68L-7cUsW+ovgnMr06tqxdA@mail.gmail.com>
Subject: Re: [PATCH] site/common-musl: Set ac_cv_sys_file_offset_bits default
 to 64
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007b300f05f1a76cd0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Jan 2023 07:24:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175616

--0000000000007b300f05f1a76cd0
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 7, 2023 at 1:08 AM Khem Raj <raj.khem@gmail.com> wrote:

> off_t is always 64bit on musl regardless of 32bit or 64bit
> architectures. autoconf has AC_SYS_LARGEFILE to detect correct off_t
> size but it only work with glibc since it defines feature macros
> _FILE_OFFSET_BITS=64 and _LARGEFILE_SOURCE but these macros are
> not used on musl headers.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
>

Thanks. It fixes the build issue in e2fsprog I reported earlier.


> ---
>  meta/site/common-musl | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/site/common-musl b/meta/site/common-musl
> index 86aed4a38c..23e50ef749 100644
> --- a/meta/site/common-musl
> +++ b/meta/site/common-musl
> @@ -15,6 +15,8 @@
> ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
>  ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
>  ac_cv_func_mmap_fixed_mapped=${ac_cv_func_mmap_fixed_mapped=yes}
>  ac_cv_func_strtod=${ac_cv_func_strtod=yes}
> +# off_t is always 64bit on musl systems
> +ac_cv_sys_file_offset_bits=${ac_cv_sys_file_offset_bits=64}
>
>  # glib
>  glib_cv_strlcpy=${glib_cv_strlcpy=no}
> --
> 2.39.0
>
>

--0000000000007b300f05f1a76cd0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 7, 2023 at 1:08 AM Khem R=
aj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">off_t is alw=
ays 64bit on musl regardless of 32bit or 64bit<br>
architectures. autoconf has AC_SYS_LARGEFILE to detect correct off_t<br>
size but it only work with glibc since it defines feature macros<br>
_FILE_OFFSET_BITS=3D64 and _LARGEFILE_SOURCE but these macros are<br>
not used on musl headers.<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Nicolas Dechesne &lt;<a href=3D"mailto:nicolas.dechesne@linaro.org" tar=
get=3D"_blank">nicolas.dechesne@linaro.org</a>&gt;<br></blockquote><div><br=
></div><div>Thanks. It fixes the build issue in e2fsprog I reported earlier=
.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0meta/site/common-musl | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/site/common-musl b/meta/site/common-musl<br>
index 86aed4a38c..23e50ef749 100644<br>
--- a/meta/site/common-musl<br>
+++ b/meta/site/common-musl<br>
@@ -15,6 +15,8 @@ ac_cv_func_posix_getgrgid_r=3D${ac_cv_func_posix_getgrgid=
_r=3Dyes}<br>
=C2=A0ac_cv_func_getaddrinfo=3D${ac_cv_func_getaddrinfo=3Dyes}<br>
=C2=A0ac_cv_func_mmap_fixed_mapped=3D${ac_cv_func_mmap_fixed_mapped=3Dyes}<=
br>
=C2=A0ac_cv_func_strtod=3D${ac_cv_func_strtod=3Dyes}<br>
+# off_t is always 64bit on musl systems<br>
+ac_cv_sys_file_offset_bits=3D${ac_cv_sys_file_offset_bits=3D64}<br>
<br>
=C2=A0# glib<br>
=C2=A0glib_cv_strlcpy=3D${glib_cv_strlcpy=3Dno}<br>
-- <br>
2.39.0<br>
<br>
</blockquote></div></div>

--0000000000007b300f05f1a76cd0--

