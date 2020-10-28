Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.11075.1603900460600231746
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 08:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rDyY+36p;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id f93so3861052qtb.10
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 08:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bJFzXoExnqml6kVvCezauAmLsFwalvlDR/XcGqOYAmk=;
        b=rDyY+36piZ6Q2TUSvdNpYDe7vT/PczXv/L1oeQZzf0YXSfzKGCMfewUQW4HEXPcnnP
         YQUJCnf/V9U7qZmV8T/xMpXLCizTr6Ofcq+NBHHqYLbpern1JgVdFE2M0NoA9CnfoCPZ
         8OqyCpXZBi/BTwP3JSXXV7tWCI5EXoaCRFjOKWiM0S+u+Kr7bETnbTTXVbiOpRtLYAOc
         2E8JAYJmzD6dDeJgjuGREG+mIOTvcoueipq34cSJQWXnF13WOboZlLTXrkzChBBv4yqi
         j5F4o3rMJ4zzXqJDjmQLlLud71IX0R+elQxFHP3XwKz6W9tHdcBNxbwRmcJZ9EdmXLyr
         LsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bJFzXoExnqml6kVvCezauAmLsFwalvlDR/XcGqOYAmk=;
        b=Y04pS6Gsuw8Ku2++elFj2jTsAFjsUEbQFnJYLHBBlipFF1CRuPYUKL1pNyAXBOpalb
         gw11A/dgOnRli8i31GsXg6gSPsKye6EVbe6vGM1VhUwtZvYVwIBP9tYpTZ29y/8UTddy
         1JIr3jFNtSSXiTqxegVTWKYWO9HE5brE5hyZ5OMCNfnxUGT0uOuiR4E5w65lchrCMXKP
         5HtOOc0pGIrT/eoRCfccRrCq7OASC/G+8yT2bwXuwS0fccESdSFbfC/YWjTP9hYNFCRZ
         oShZbKU6cB8EZMoYB8B9x70zCATtEYX6605hJmcvEirnw2Pd9uaiIT7o08R2TIsqo7mX
         fY4g==
X-Gm-Message-State: AOAM5301euqrHKwey3m7wg0r0btSLK0y8ebYNKNqzT7HIYvajBtPhROp
	X7v9NN9g3KG2CZqPnpana6nc8Se6QQrVh2h38yQ=
X-Google-Smtp-Source: ABdhPJwcb6v35w8Afp3OYy0IWGX+ifzOdB1SFrNCoyqs5cYX/yJ4bwPhxTRTtCOSuYpGbh4xdZFgrYUyWD4nHEchgT4=
X-Received: by 2002:ac8:5985:: with SMTP id e5mr7708895qte.88.1603900459390;
 Wed, 28 Oct 2020 08:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <1603898660-15302-1-git-send-email-Saloni.Jain@kpit.com>
In-Reply-To: <1603898660-15302-1-git-send-email-Saloni.Jain@kpit.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 28 Oct 2020 08:53:53 -0700
Message-ID: <CAMKF1sr2NZyQzTaGK4mi2nntcnPq_DNrUE2aYavrgkWUfK29LA@mail.gmail.com>
Subject: Re: [poky][master][PATCH] glibc: Added and whitelisted CVE patches
To: "Saloni.Jain" <Saloni.Jain@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, Anuj Chougule <anuj.chougule@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2020 at 8:24 AM Saloni.Jain <Saloni.Jain@kpit.com> wrote:
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
>
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
> Link: https://sourceware.org/git/?p=3Dglibc.git;a=3Dpatch;h=3Deb04c21373e=
2a2885f3d52ff192b0499afe3c672
> 5. CVE-2016-10739
> Link: https://security-tracker.debian.org/tracker/CVE-2016-10739
> Link: https://sourceware.org/git/?p=3Dglibc.git;a=3Dpatch;h=3D108bc4049f8=
ae82710aec26a92ffdb4b439c83fd
> 6. CVE-2020-10029
> Link: https://security-tracker.debian.org/tracker/CVE-2020-10029
> Link: https://sourceware.org/git/?p=3Dglibc.git;a=3Dpatch;h=3D9333498794c=
de1d5cca518badf79533a24114b6f
> 7. CVE-2009-5155
> Link: https://security-tracker.debian.org/tracker/CVE-2009-5155
> Link: https://sourceware.org/git/gitweb.cgi?p=3Dglibc.git;h=3Deb04c21373e=
2a2885f3d52ff192b0499afe3c672
>

Thanks for doing this. Looks ok to me.

> Upstream-Status: Pending

we do not need upstream status to metadata patches but to actual
components which needs to be tracked for upstream submission etc.
so please remove it here.

> Signed-off-by: Saloni.Jain <Saloni.Jain@kpit.com>
> ---
>  meta/recipes-core/glibc/glibc_2.32.bb | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc_2.32.bb b/meta/recipes-core/gl=
ibc/glibc_2.32.bb
> index 2a0e464..7c56f6b 100644
> --- a/meta/recipes-core/glibc/glibc_2.32.bb
> +++ b/meta/recipes-core/glibc/glibc_2.32.bb
> @@ -1,7 +1,24 @@
>  require glibc.inc
>  require glibc-version.inc
>
> -CVE_CHECK_WHITELIST +=3D "CVE-2020-10029"
> +#As confirmed by Upstream Community below patches are not considered sec=
urity threats, hence whitelisted.
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
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
