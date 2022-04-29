Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9ECC433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 15:40:09 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web10.11838.1651246803107386384
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 08:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=B5c8nYaK;
 spf=pass (domain: linaro.org, ip: 209.85.217.48,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-vs1-f48.google.com with SMTP id z144so7892965vsz.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 08:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lHuZ1Ha9mTFmlPMkVwvG4UdxsxXa5HpCm0gsJmqHkhU=;
        b=B5c8nYaKYiBkqvWobqvjm5hnB1TRInB2yBARie/eG3I31rca9oZiUXPnn9QJxZVOF6
         T5k7ZrOE7224e/9NSKJ4nAFH4LsSyLAqVKLSPQ5fi3hnX2/i/eHTZrNXt7RgLiWKV6ck
         eQRwSJM6j78waKS9pNiTntM8QXqSHW1JUuoE4+JI9S4DvGceddZx/wxleJOaBH3eAAsC
         Tr3SCF9yCq6zbK8jMPqmG5T+bv236jqxbvfUKQiLoab0lUzBkqb81bdkx+KEGSn+ATo4
         nxTu55coMQ5X3/vVJPBZ8tgKyXuC6mRt+Nr7EkJWzZ1z0C39PZX6/URCpnUMwcHpP7Bs
         lkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lHuZ1Ha9mTFmlPMkVwvG4UdxsxXa5HpCm0gsJmqHkhU=;
        b=PnV90HI9BqTt5Z1ksJA7lUbq1NCqb2+nPEuMf4ohiotDu/Dgfidrzw7Mwrxu6NsUCa
         y6NZz6hNTZHIiXIqEDmBuYAdvFhrsBZ43CXvELIHqZVqhFgRjxeLssFFIHPxr82chUI/
         CfZWirkAuusJSgpwDFyotaRj4SeSkMZP/two/uXdGooXUTszYai1Sc9zZ3GXmSLfJaY8
         8OgvXUwQad1nDCKroJGy0Tiphh1BC1rrmvdElBjBhPXIbWj0N8g7h90HHscMGRqGWlSg
         dP+9AGEV+6rMuAGw/Bdy6Sf4b6iw80cnvAZFDbbA860fgWvKglcE/owi7o9r8RY8n+YH
         mMeQ==
X-Gm-Message-State: AOAM531KDvEsZBBGAku69hI+wiqR2WhTdNVTJwvA339VWDbiqf5d34Rt
	yTJFjM3Bvr61Ad8vEYSL0GgvtyDlOakZzrqBk+UV7A==
X-Google-Smtp-Source: 
 ABdhPJyBh/0fDdbYJsNT82k+GYsEHT0pISETBiHdDp/YOOEiV8lUT4rmVYr0KgSwfRA6YQjlsrv8XPi/fwXy4H2VXFQ=
X-Received: by 2002:a05:6102:242e:b0:32c:ec29:43c0 with SMTP id
 l14-20020a056102242e00b0032cec2943c0mr6004296vsi.23.1651246802131; Fri, 29
 Apr 2022 08:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <7kxD.1651220560041636184.iS66@lists.openembedded.org>
In-Reply-To: <7kxD.1651220560041636184.iS66@lists.openembedded.org>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Fri, 29 Apr 2022 11:39:51 -0400
Message-ID: 
 <CANp-EDZ9Qc0B8wqwDBWMdPy=dMz0ZrV1VEm=LDGBvA7eLBJcmw@mail.gmail.com>
Subject: Re: [OE-core] cve-check: building world doesn't create the manifest
To: Davide Gardenal <davidegarde2000@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 15:40:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165017

Hi Davide,

On Fri, Apr 29, 2022 at 4:22 AM Davide Gardenal
<davidegarde2000@gmail.com> wrote:
>
> My idea was to convert cve_check_write_rootfs_manifest to a handler listening for BuildCompleted but then if someone builds more than one image the output is broken.

Actually that is already the case, if one builds multiple images, the
cve manifests tend to include "extra" packages, from recipes built as
part of another image. This tripped me up when I was trying to see
what CVE changed between builds. Another complication is that ordering
of the manifest is not entirely deterministic.

At one point, worked around this by using 'bitbake -g' to generate
pn-buildlist, and then manually assemble the cve manifest using the
recipe names from pn-buildlist, and the files in tmp/deploy/cve. While
this worked, it was not particular elegant, and I eventually abandoned
it. Now I just run bitbake several times, once per image, and I
collect the cve manifest between runs. Then some additional
post-processing to sort and compare between runs.

It would be nice to fix the tool if possible. But I have not really
looked into it.

Ralph

