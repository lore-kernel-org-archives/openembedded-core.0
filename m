Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C049CC00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:54:29 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.13705.1660546462069186141
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cATnh/cV;
 spf=pass (domain: gmail.com, ip: 209.85.208.171,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id x10so6796804ljq.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=bQpA3juMrHgkIKwO5Err3WJ1H21LskLJbgRJe12doBI=;
        b=cATnh/cVm3kkX6KijMfTHTN+H8OKu6eMr6aLhoQIf6KOjNg9ueR72hQbCQjAuIN29w
         eZsqRwJBWW2iozhgqHgECidm4k+cN73WaXW8wH1cXQYjuHbr6vZtIj89e1z+ZyYNeGr+
         WzHcQo4cXvDKxveSSjrjC4XAZZs11Cweik83HrA4b37FZYkvz2hq724Ofu0SRhPXjzQ0
         sLCTW+TVgbkNFW4h4WIC8SCl+66QZZNvJBn86uV5cGxfpb/GYXSVC6KtWPMAzDoR5Piy
         3eVodicKzIBfxAC73M5QYuCGE6lAQoBt3jyLJBcWB71k/0ytRsoNQonpXK2LOJJIP2rh
         6O/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=bQpA3juMrHgkIKwO5Err3WJ1H21LskLJbgRJe12doBI=;
        b=Q6EdqWUYcOLpV1xtIsx+8o2kpe+vM6D6thGQBh2iKbAocAHF1K06lVqdSIPDz8R6nV
         bPO7G6uhD4pMKRHGB5wPv6ghQmNZ2b2QuA5/VJpmXwbam2ghexNsQKY1fLJMBE9jOQcB
         727YuqUduQR0grdbV6nusdu5fDKxwYtoqCWdpqkKGJkWMX8dKYx8FKagIjiHZFSMnbs0
         thOMReZxpG5IJIfmqH0+DDoTR/Os9H04suGb5sVw8t0SdE13oZPrabWHWbUmzRwd/etS
         XTDeU96IsyfMCA9Rv3UyB8ixBZZhJWpRHJMHzKGdIAl/65xF+Z+R0MsNXZvDxIRq3aYy
         IrdA==
X-Gm-Message-State: ACgBeo27FTNnrLa2SG5NhVLfQ0HsA58tfaWFB5brFkc+rcEtG4FnXcx2
	81AfapXg9dLnhQz37VnZplWeBkfJezpAJgSNnG4=
X-Google-Smtp-Source: 
 AA6agR5lSeAVItDqhpi22m3Ql6d7jEijjfliPK4nsabzQpYmNkGUsPpKV3lnLeWRVpwr+tFEfDZE18zYnszgA4owZOw=
X-Received: by 2002:a2e:804e:0:b0:25e:7231:c304 with SMTP id
 p14-20020a2e804e000000b0025e7231c304mr4437664ljg.257.1660546459976; Sun, 14
 Aug 2022 23:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220814222037.283943-1-raj.khem@gmail.com>
 <20220814222037.283943-2-raj.khem@gmail.com>
In-Reply-To: <20220814222037.283943-2-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Aug 2022 08:54:08 +0200
Message-ID: 
 <CANNYZj_3MCUBThoNC4uodRvoDscg5R=LaQAWTHLNbEaAqbA4+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/10] xmlto: Update to use upstream tip of
 trunk
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 06:54:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169351

On Mon, 15 Aug 2022 at 00:20, Khem Raj <raj.khem@gmail.com> wrote:
> +Avoids network access
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>

Please submit this upstream, there's no reason to make this pending.

> -SRC_URI = "https://releases.pagure.org/xmlto/xmlto-${PV}.tar.gz \
> +SRCREV = "6fa6a0e07644f20abf2596f78a60112713e11cbe"
> +
> +SRC_URI = "git://pagure.io/xmlto.git;protocol=https;branch=master \
>             file://configure.in-drop-the-test-of-xmllint-and-xsltproc.patch \
> +           file://0001-Skip-validating-xmlto-output.patch \
>  "
> -SRC_URI[md5sum] = "a1fefad9d83499a15576768f60f847c6"
> -SRC_URI[sha256sum] = "2f986b7c9a0e9ac6728147668e776d405465284e13c74d4146c9cbc51fd8aad3"
> +S = "${WORKDIR}/git"
> +
> +PV .= "+0.0.29+git${SRCPV}"

Does the upstream version check still work with these changes? We
might want to switch to checking new commits rather than new tags.

Alex

