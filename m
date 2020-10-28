Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web08.1291.1603909126645921939
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 11:18:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=IXHGBxgh;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.67, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f67.google.com with SMTP id za3so227984ejb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 11:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HgfUyp4qzr3i/a+MoYDFeEb/hu0r+gibM8YWYdski8c=;
        b=IXHGBxghowuChxEnvUMytF8fn3h3VafGYhsvM6PH+8t9dh03oEZ+CQ3jaOWe1Oyhiq
         ZmrnuFHRsVpwks+lrw3SDlqmh6+atj1hGjCH+XLi9rxln+kinxaXhsDHcJ4ca5uWinql
         IsKVe25XqkrllTVHtyDt1nwFjoXmbZ9aZzHQjwfTXa4tCB8mhq9657s3Rx0NtOlMRisa
         05fTw9pdvWv6aG3+JOlhuzN1zsGPAO9Y9UZfKHPh60utkgnJumJUG0v+ZoncY25PCub2
         mLihbmxTTUzbVQdkRGWkelirZRViVtnl7LJEO1Hj1ba5NVqd7OJsQIw/Lv+8dOdC8pOm
         ERjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HgfUyp4qzr3i/a+MoYDFeEb/hu0r+gibM8YWYdski8c=;
        b=X34x6dyb9QBj8IxxkItFBy13hgKUpqyie/2uoCCm4XUziyLacEGEDVG5vbyJ4FdehT
         3Rxha6GlrDNmdEUCUbXQVeaI9SpDgDeQcXG2yfoVKhFDwiNNJuLdP91Dfu9gF+rM+5DA
         EscATBIzHMd5eu05X2BlXab4PvLhcsrQ1azOMQDrEMKB2HkVzePVm4YxaXx/UWsP9xA/
         9vLx5EEhecs4v5A9iEtwb8S+H0eRVis5lV0dnyLzaRT89qXjRpM7Z9l65iyMrRU4ONa/
         JcOieEyY4STVvqwg3Yfa4swSG+N73AqL/zOn6eREb0SD1HkTpozWnoN0xPfF41MsVJe0
         13cQ==
X-Gm-Message-State: AOAM5318LYWq7XXb094i2yr0k9y7pLUdWnUFyX2SJ3Uc2l0yO9BDnhyx
	ekujVGZzKbiRPysYGIFgu6e2b15fU2AR2L7y0O9FjA==
X-Google-Smtp-Source: ABdhPJzDFXoBGrbsZHa2mW224YVZZNQYn+vLnQDI8ZtOYfwrk8q+VA/XgrficZT5PADPW5B8JrIoG5vc7EA01e6uiak=
X-Received: by 2002:a17:906:2ad3:: with SMTP id m19mr338000eje.81.1603909124966;
 Wed, 28 Oct 2020 11:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <1603899021-16081-1-git-send-email-Saloni.Jain@kpit.com>
In-Reply-To: <1603899021-16081-1-git-send-email-Saloni.Jain@kpit.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 28 Oct 2020 08:18:33 -1000
Message-ID: <CAOSpxdaeSs6DF2GA1=K8Nm8VV0=p5C6+xvcVZpF80Nics153wQ@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] glibc: Added and whitelisted CVE patches
To: saloni <saloni.jain@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	nisha.parrakat@kpit.com, anuj.chougule@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2020 at 5:30 AM saloni <saloni.jain@kpit.com> wrote:
>
> From: Saloni Jain <Saloni.Jain@kpit.com>
>
> Below CVE patches are whitelisted as not considered
> as security threats by Upstream Community:
> 1. CVE-2019-1010022
> Link: https://security-tracker.debian.org/tracker/CVE-2019-1010022
> 2. CVE-2019-1010023
> Link: https://security-tracker.debian.org/tracker/CVE-2019-1010023
> 3. CVE-2019-1010024
> Link: https://security-tracker.debian.org/tracker/CVE-2019-1010024
> 4. CVE-2019-1010025
> Link: https://security-tracker.debian.org/tracker/CVE-2019-1010025

As with the master version of the patch, these look fine to me.

> Below CVE patches are whitelisted as the changes are
> already present in the source-code:
> 1. CVE-2020-1751
> Link: https://security-tracker.debian.org/tracker/CVE-2020-1751
> 2. CVE-2020-1752
> Link: https://security-tracker.debian.org/tracker/CVE-2020-1752
> 3. CVE-2020-6096
> Link: https://security-tracker.debian.org/tracker/CVE-2020-6096
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1820331
> 4. CVE-2015-8985
> Link: https://security-tracker.debian.org/tracker/CVE-2015-8985
> Link: https://sourceware.org/git/?p=3Dglibc.git;a=3Dpatch;h=3Deb04c21373=
e2a2885f3d52ff192b0499afe3c672
> 5. CVE-2016-10739
> Link: https://security-tracker.debian.org/tracker/CVE-2016-10739
> Link: https://sourceware.org/git/?p=3Dglibc.git;a=3Dpatch;h=3D108bc4049f=
8ae82710aec26a92ffdb4b439c83fd
> 6. CVE-2020-10029
> Link: https://security-tracker.debian.org/tracker/CVE-2020-10029
> Link: https://sourceware.org/git/?p=3Dglibc.git;a=3Dpatch;h=3D9333498794=
cde1d5cca518badf79533a24114b6f
> 7. CVE-2009-5155
> Link: https://security-tracker.debian.org/tracker/CVE-2009-5155
> Link: https://sourceware.org/git/gitweb.cgi?p=3Dglibc.git;h=3Deb04c21373=
e2a2885f3d52ff192b0499afe3c672

Also like master, these CVE's do not show up in a CVE scan of dunfell,
so remove for v2:

https://lists.yoctoproject.org/g/yocto-security/topic/oe_core_cve_metrics_=
for/77796289?p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,77796289

> Upstream-Status: Pending

Please remove for v2

Thanks!

Steve

> Signed-off-by: Saloni.Jain <Saloni.Jain@kpit.com>
> ---
>  meta/recipes-core/glibc/glibc_2.31.bb | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/g=
libc/glibc_2.31.bb
> index 3d486fb..0233a06 100644
> --- a/meta/recipes-core/glibc/glibc_2.31.bb
> +++ b/meta/recipes-core/glibc/glibc_2.31.bb
> @@ -1,7 +1,25 @@
>  require glibc.inc
>  require glibc-version.inc
>
> -CVE_CHECK_WHITELIST +=3D "CVE-2020-10029 CVE-2020-6096 CVE-2016-10228 C=
VE-2020-1751 CVE-2020-1752"
> +#As confirmed by Upstream Community below patches are not considered se=
curity threats, hence whitelisted.
> +CVE_CHECK_WHITELIST +=3D "\
> +    CVE-2019-1010022 \
> +    CVE-2019-1010023 \
> +    CVE-2019-1010024 \
> +    CVE-2019-1010025 \
> +"
> +
> +#Changes are already present in source-code, hence whitelisted.
> +CVE_CHECK_WHITELIST +=3D "\
> +    CVE-2009-5155 \
> +    CVE-2016-10739 \
> +    CVE-2020-10029 \
> +    CVE-2015-8985 \
> +    CVE-2020-6096 \
> +    CVE-2016-10228 \
> +    CVE-2020-1751 \
> +    CVE-2020-1752 \
> +"
>
>  DEPENDS +=3D "gperf-native bison-native make-native"
>
> --
> 2.7.4
>
> This message contains information that may be privileged or confidential=
 and is the property of the KPIT Technologies Ltd. It is intended only for =
the person to whom it is addressed. If you are not the intended recipient, =
you are not authorized to read, print, retain copy, disseminate, distribute=
, or use this message or any part thereof. If you receive this message in e=
rror, please notify the sender immediately and delete all copies of this me=
ssage. KPIT Technologies Ltd. does not accept any liability for virus infec=
ted mails.
>
>=20
>
