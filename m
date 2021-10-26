Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50085C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 12:55:52 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.11758.1635252951108286773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 05:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E6a86rZe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id y78so8752565wmc.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 05:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=zUZe4N7GcZINCP+BT2TWpgojrsSKEADans/MSpvwcNo=;
        b=E6a86rZeKDzXYUzMv9mfFHioqxj5ADIoF5lfQiKNwbikuS81/8uBff2PdWBN5O0TyL
         xE1JlIZ4+e/TfymzWHux0hhQjew7aoQZYAmltgMuzt8t1cP3YqmzBGKuAgr2PWwRGBC0
         PYkReGKaLriAz8aTp9RiU9lU8KZT8XHNUXiMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zUZe4N7GcZINCP+BT2TWpgojrsSKEADans/MSpvwcNo=;
        b=d5zChGQgUBZxLpYxhWKNBc8nXik2wLzC5Dfz4Z6ig8Y1jTvJvDU2JTnkgA+QyyKdtP
         D1ZMRTWhcJDSKont2X1AuKOtaqdvSgJESVIkB98BjRurlw3N3pW4LdjYXrQ5aMr24nMJ
         ywa2o6fVEJexycULap39iK2pL58ybrd84xbFuo/xCVvbQmBCr1TJ2EuNXpe4beNpxz8r
         jCfeaoCdwBFGQ/cCTWbS6AWQhC1AXpmBPQHyfaKYI1Kvq4bpHjKdLEOzxXGeR9XAiPgs
         jzTrq8uSNQElt883XlCxOeC0qmM3DF1Zs2v/JlnifHnqM4VbUAgBJW1V0q4ndDPIIEp4
         QRjQ==
X-Gm-Message-State: AOAM530oRu0sh83PW7uDJVkbr9acRASinbsp9Rz1hZw7jF8wvZzqRIxV
	hL725TTPCqBC2aWQH6y+UCmmRQ==
X-Google-Smtp-Source: 
 ABdhPJzd1jlelkQLbe7OdR6DA9T4RY8A+u8+jFqRhWa+v/VetEijBetXGyAEv79Z5vZnluau8al2qQ==
X-Received: by 2002:a05:600c:2314:: with SMTP id
 20mr19724016wmo.76.1635252949509;
        Tue, 26 Oct 2021 05:55:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6b9e:385e:1583:4f40?
 ([2001:8b0:aba:5f3c:6b9e:385e:1583:4f40])
        by smtp.gmail.com with ESMTPSA id j9sm597439wms.39.2021.10.26.05.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 05:55:49 -0700 (PDT)
Message-ID: 
 <e72e9ae071bc25c6d14749c1604fb9b4b890a0ae.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] license_image: Prevent do_populate_lic_deploy
 from using image recipes' recipeinfo
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Jan Brzezanski <jan.brzezanski@gmail.com>, Ricardo Rodrigues
 <rrodrigues80@gmail.com>, Szymon Czarnuch <szymek125.14@gmail.com>, Kamil
 Kwiek <kamil.kwiek@gmail.com>
Date: Tue, 26 Oct 2021 13:55:48 +0100
In-Reply-To: <20211026073249.3424-1-tomasz.dziendzielski@gmail.com>
References: <20211026073249.3424-1-tomasz.dziendzielski@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 12:55:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157392

On Tue, 2021-10-26 at 09:32 +0200, Tomasz Dziendzielski wrote:
> If image recipe depends on another image recipe it will try to use
> license recipeinfo that is not deployed. It will result in:
> > Exception: FileNotFoundError: [Errno 2] No such file or directory:
> > 'TMPDIR/deploy/licenses/foo-image/recipeinfo'
> 
> In such case check for image_license.manifest file (which means dep is
> an image recipe) and skip if true.
> 
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> Signed-off-by: Jan Brzezanski <jan.brzezanski@gmail.com>
> Signed-off-by: Ricardo Rodrigues <rrodrigues80@gmail.com>
> Signed-off-by: Szymon Czarnuch <szymek125.14@gmail.com>
> Signed-off-by: Kamil Kwiek <kamil.kwiek@gmail.com>
> ---
>  meta/classes/license_image.bbclass | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
> index bf70bee99b..cc1d9ea651 100644
> --- a/meta/classes/license_image.bbclass
> +++ b/meta/classes/license_image.bbclass
> @@ -201,10 +201,17 @@ def license_deployed_manifest(d):
>          man_dic[dep]["PN"] = dep
>          man_dic[dep]["FILES"] = \
>              " ".join(get_deployed_files(dep_dic[dep]))
> -        with open(os.path.join(lic_dir, dep, "recipeinfo"), "r") as f:
> -            for line in f.readlines():
> -                key,val = line.split(": ", 1)
> -                man_dic[dep][key] = val[:-1]
> +        try:
> +            with open(os.path.join(lic_dir, dep, "recipeinfo"), "r") as f:
> +                for line in f.readlines():
> +                    key,val = line.split(": ", 1)
> +                    man_dic[dep][key] = val[:-1]
> +        except FileNotFoundError:
> +            if os.path.exists(os.path.join(
> +                    lic_dir, "%s-%s" % (dep, d.getVar("MACHINE")), "image_license.manifest")):
> +                del man_dic[dep]
> +            else:
> +                raise
>  
>      lic_manifest_dir = os.path.join(d.getVar('LICENSE_DIRECTORY'),
>                                      d.getVar('IMAGE_NAME'))

We've seen this issue before. I don't like the fixes I've seen for two reasons:

a) we can't tell the difference between a broken recipe which failed to generate
recipeinfo for some reason and an image target

b) The license info is effectively lost/ignored for the second image

I think we need to do something better than this.

Cheers,

Richard




