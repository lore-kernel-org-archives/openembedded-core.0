Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web09.1168.1603908914840195525
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 11:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bdvh0n24;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.67, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f67.google.com with SMTP id k9so443854edo.5
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 11:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xXoycXA1O3tfoD6bk0V4JrWA6eQoFO+ElDRMuqlPfZc=;
        b=bdvh0n24vch44MWZz6br9VZGrmor/oFVINj6A3w7rXhtRTDZZ8zcbwULBKU7W74o6z
         6euw2D7uRme2CGaxRMxBHGiJZjEkP0YiyJqY0aEL56iDZ9BsedkBprplQwGdTXCAbQ0R
         SIWrgrfxbR5x2SnhQ7gjNhLjshHp8JzVndY8z/yTjTx+O8Z/TLLX2cBw/sdstODTT+5y
         2fRt+mVkGh7mxksthQhkynRQoj9/nqlTumr5Q4P4Mxl8CSzjudWhcx5ylVNY9dnKMhVo
         lwFbF2nj2Q3LEivZR4lb8lLIiDxMjfJBO6lumu5uB+yO014IiW7+xAqD+M8j9wdppOP0
         43iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xXoycXA1O3tfoD6bk0V4JrWA6eQoFO+ElDRMuqlPfZc=;
        b=Pdd+d813u4OlLRKapE1NTz0vmWgWGpVKEVfHrGcVZUQVCPvLitWx8UpHBNDyK3EVgQ
         gQLemDFdPl9uPfQ7oaGeTKcMO4O6MLSvo1hpdRjOWUyouclI5eEkjZqEmPbJ/5nbjKUS
         w9PvEH1Utc5Y7y60/KHIXQx/mkngFZfyMjCJ/O58eBTR0BnotuKtm3Dm7+ivP24SKfuZ
         qfdkti8DgoMcGrfq2hVKLIsDYooXIuuSyeytoVD6/+9CQiPvJvHmYhHSdMNPVkgOdcjA
         yA0fIDxQ53cAESrFEKNG3ViwnEfB/WJv3FEe7WjtIH1uU2St12onJkEufSXzVO6VcboL
         cZvQ==
X-Gm-Message-State: AOAM532g0HCIAL7m4wpITgzx1OeOk1ZLmKoyAUmyLVXfj/r0Mr4a8Dn6
	aCtVgtVB4GSKMD5C15F/rxrpXuGXhmGM3A7RVtQKdA==
X-Google-Smtp-Source: ABdhPJxjSSCKIDR3xRFtPNDQ+BYiXHuSjYwV6lEXwUafVxGCGgGSNTsIPoCC2MqMSe5RRrIh3wJP+laNb+cjEpEVe/Q=
X-Received: by 2002:a50:950e:: with SMTP id u14mr147914eda.260.1603908913213;
 Wed, 28 Oct 2020 11:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <1603898660-15302-1-git-send-email-Saloni.Jain@kpit.com>
In-Reply-To: <1603898660-15302-1-git-send-email-Saloni.Jain@kpit.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 28 Oct 2020 08:15:02 -1000
Message-ID: <CAOSpxdZw9BQGGfSWvZO+KKSBQmbD7zGB9um6jnxhN3inyFUmeA@mail.gmail.com>
Subject: Re: [OE-core] [poky][master][PATCH] glibc: Added and whitelisted CVE patches
To: saloni <saloni.jain@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	nisha.parrakat@kpit.com, anuj.chougule@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2020 at 5:24 AM saloni <saloni.jain@kpit.com> wrote:
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

The above looks good to me.

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

There is no need for this second category, these CVE's do not show up
in a CVE check for master:

https://lists.yoctoproject.org/g/yocto-security/topic/oe_core_cve_metrics_=
for/76221269?p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,76221269

Please send a v2 with the above CVE's removed.

> Upstream-Status: Pending

You can remove the above in v2 also

Thanks for helping with CVE's!

Steve

> Signed-off-by: Saloni.Jain <Saloni.Jain@kpit.com>
> ---
>  meta/recipes-core/glibc/glibc_2.32.bb | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc_2.32.bb b/meta/recipes-core/g=
libc/glibc_2.32.bb
> index 2a0e464..7c56f6b 100644
> --- a/meta/recipes-core/glibc/glibc_2.32.bb
> +++ b/meta/recipes-core/glibc/glibc_2.32.bb
> @@ -1,7 +1,24 @@
>  require glibc.inc
>  require glibc-version.inc
>
> -CVE_CHECK_WHITELIST +=3D "CVE-2020-10029"
> +#As confirmed by Upstream Community below patches are not considered se=
curity threats, hence whitelisted.
> +CVE_CHECK_WHITELIST +=3D "\
> +    CVE-2019-1010022 \
> +    CVE-2019-1010023 \
> +    CVE-2019-1010024 \
> +    CVE-2019-1010025 \
> +"
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
