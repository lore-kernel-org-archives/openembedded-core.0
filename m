Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web09.9033.1614931274038680367
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 00:01:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sVPoAESW;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 2so579200qvd.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 00:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cQt80aCtbtHEPMJK0F92vzcR8aTc38GdjE6KRf32Ee0=;
        b=sVPoAESWi/CL7DgAZZVB+R+TnZGIkI52NnUQPJ3VKnbUQeazy1tlLu/g00kU+Kob68
         /XvqW9y70eMzbkQ6dDWzsugwe1rWkVn92MinzlVsfoenUSuCrJpPYot4nph3eGXn5rpV
         ce5NDHIT7frly0l7JTrzu8Bxeb6axVX6NmQzesjjJ/g2AoieVIigcbv65dvGoQ5h2a0L
         rKlPw493h09xjUxiVO5yd1iPSgG/l9rW2FfxxG7SiZ01LfWZKl4qlU4KOtmDk0sxGbdM
         CKmkBGZKpVMOg6LXc7qavtq8K2Ovm18YuWiYemDuWn5cVN17pHxuMx7okcBAqsNxqPeQ
         sqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cQt80aCtbtHEPMJK0F92vzcR8aTc38GdjE6KRf32Ee0=;
        b=D9hWDDuweB7hNnq7wLWMgJ9XiTCVRHMcUXUlkBZfhEPv85jG+r5iGDOTU668ElFZqE
         lAh1h/cO3XXSB36GqydjhowyCGAIEFlnovHIgkXIGJjtxlyqzZEY5jsfSJljzqWxXdAH
         aIwWWd2WfQSIZAoATcAOqIztNSGfga5fq1JtIYtYyfaiXZNEeP6UVec+ch6ub5J+obet
         LPBqLjPIQ0Ea63LippjFNtjUqjhbmdiZSGtYoL3Kifsn+m46iD2YB6mq9y76gckaTnmY
         3Hvn0z0Rz6/lfWof8b72KpOjhfYf+eQj3qwEq9DffIR6CotJK/dVUWfELwUzqtyUWee1
         acXg==
X-Gm-Message-State: AOAM5337Yd/grpOl/JyeVmNl4iSUc6fELzm1f3QpbBp4ALPdNYg+RhlK
	rwAlpjT/s1vX0a8bBG/ILHlZYTtYzHUfJPczSxg=
X-Google-Smtp-Source: ABdhPJxNgsJI5PmzCKu1N0vf219rZBsGwSuwVfSBAh8Oure5Ade37A5b/f2KpRw5szLPHzGBtlB+zZ3ntrUNkyPbOFc=
X-Received: by 2002:a05:6214:1c47:: with SMTP id if7mr7690577qvb.50.1614931273077;
 Fri, 05 Mar 2021 00:01:13 -0800 (PST)
MIME-Version: 1.0
References: <20210304233526.3373832-1-andrei@gherzan.com> <20210304233526.3373832-2-andrei@gherzan.com>
In-Reply-To: <20210304233526.3373832-2-andrei@gherzan.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 5 Mar 2021 00:00:46 -0800
Message-ID: <CAMKF1spAuYuGXKxps1MzP3cEPZAFKSnnaRDbc1UPbtswEXh5uw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] epiphany: Add package configuration for building in developer mode
To: Andrei Gherzan <andrei@gherzan.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Andrei Gherzan <andrei.gherzan@huawei.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 4, 2021 at 3:36 PM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  meta/recipes-gnome/epiphany/epiphany_3.38.2.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb b/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
> index 7fedc43a99..8e697b4a44 100644
> --- a/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
> +++ b/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
> @@ -21,5 +21,8 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}
>             "
>  SRC_URI[archive.sha256sum] = "8b05f2bcc1e80ecf4a10f6f01b3285087eb4cbdf5741dffb8c0355715ef5116d"
>
> +# Developer mode enables debugging
> +PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true"

add else case to define it to false as well.

> +
>  FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
>  RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
> --
> 2.30.1
>
>
> 
>
