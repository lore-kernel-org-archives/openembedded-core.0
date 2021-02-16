Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.13134.1613502550797310030
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 11:09:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VZizkEkF;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id p12so5154938qvv.5
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 11:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xorxv12q60T7tiEuYylT6pRL+bvPGiqdVW8l0E26df0=;
        b=VZizkEkFxsCCeT6rPOToYBjTUIygM7Sp8JPiN+LWfkak2VCWiA4bgIo95tZSNHgbgq
         bI/faenIRv435QKuhnjGIpgdDAbpuu2BB31Efyn1Eeh6HzWitUG+X0j+QWo5OT1V4cMl
         EAzwi6a+7CwFWqStNARrXg3akoBI2+e7kAg7hRJB0Fv/Ox+FAtduO+LIORGZG9iELPLk
         eRwQVTqQQxJ2nmJx2bWR82oWTKDNB82pTlwuTQ1hNd0UQspM493ks3r4+XV+VoOhTZRB
         jKhrtkCb00XJJyhWuNbt9g+ofG5c6FtshwUM95Xt980Y8lDaRdl1A8SirqZ/ajbfLwoR
         vB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xorxv12q60T7tiEuYylT6pRL+bvPGiqdVW8l0E26df0=;
        b=hGtZQr5F6fK0w5HQNKg3n5G6M7m93wOO8cWH08hiJloC1T7lAJ5Ivz0vAlin4c+ti9
         64KG+35ZbEc9YgDBfhsWGx8L+B7/vrUuU/1w3OQbdGDievCHthbqre7EQ/udlNNat3qK
         1XlhWSmZQ0Ubau3j7cqkonClMm5UCDt0YcD0iKLq/GxaUhmyOX/3z15qiTprfWo7rx2n
         Pu+ycD+0a4+rnATKHbxMSWZUHNVdk8AINgo2bWkAPLpjzICbCQpys9OgRHISvJ6R+h9o
         6MhYTnVyke0pcjq1P7kRqxJ35n5t2xhTjennbYdHqyRcIKFlL3bEdsZpaYFxbb+dLqBF
         z8oA==
X-Gm-Message-State: AOAM530jd2/L+AJj8GUTfhiRroOgrY/EQ+E12Xc4YUQaY03jOdpkKYXi
	Hm0gCJ6QXHeVHwbFE1SK53/Pb0ZoFg1AzhnEeUU=
X-Google-Smtp-Source: ABdhPJwMu49wN7YRVzxmHKG758eq5cRHnKcQZWZDMqk7CEk8pl0HII5roEyA/OtRUA3IwDJWKh/e74To4lsACGvGZOI=
X-Received: by 2002:a0c:c790:: with SMTP id k16mr21151391qvj.31.1613502549973;
 Tue, 16 Feb 2021 11:09:09 -0800 (PST)
MIME-Version: 1.0
References: <20210216135745.2584034-1-patrick@stwcx.xyz>
In-Reply-To: <20210216135745.2584034-1-patrick@stwcx.xyz>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 16 Feb 2021 11:08:44 -0800
Message-ID: <CAMKF1srM1Xnvv+Dgs-D+cavqOxYwDPNsDR=KLy3HbmeY=wNfiw@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] boost-url: update to latest
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	James Feist <james.feist@linux.intel.com>, Ed Tanous <edtanous@google.com>
Content-Type: text/plain; charset="UTF-8"

Please send it to oe-devel ml since this recipe belongs to
meta-openmbedded repo and not openembedded-core

On Tue, Feb 16, 2021 at 5:58 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> Cc: James Feist <james.feist@linux.intel.com>
> Cc: Ed Tanous <edtanous@google.com>
> ---
>  meta-oe/recipes-devtools/boost-url/boost-url_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/boost-url/boost-url_git.bb b/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
> index 6d4635b666..107a4a8331 100644
> --- a/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
> +++ b/meta-oe/recipes-devtools/boost-url/boost-url_git.bb
> @@ -4,9 +4,9 @@ SECTION = "libs"
>  LICENSE = "BSL-1.0"
>  LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
>
> -SRC_URI = "git://github.com/CPPAlliance/url.git"
> +SRC_URI = "git://github.com/CPPAlliance/url.git;branch=develop"
>
> -SRCREV = "a56ae0df6d3078319755fbaa67822b4fa7fd352b"
> +SRCREV = "2c867fbe284ae532f1329b87a86ad3f8cd382867"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.26.2
>
>
> 
>
