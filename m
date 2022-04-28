Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F44EC433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 17:35:47 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web09.588.1651167343057750908
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 10:35:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=OGTk7Ham;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: sakoman@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id g21so7207960iom.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 10:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NPSt7C3erognewOdhkH5itypKEBx2Py2PO8P5YfotUw=;
        b=OGTk7HamLa6DTEiPqRkNDJmH7IgK2Y5qBuAjIWZXUVpR+KeLkF0GYYAFKvlXTRNnCn
         32M6lla3QBbw2E2H1J+m2xl4ZTr9BXBU5rNXjDt/MnW15TL1qfy/ARXNFMIMBPZFEBHP
         Iff21/FaQ8ASJDIJ1yeYlTOuryUI7hAgvrGgFZ+ZZrxGlyIZVNDF8FoAvqP4T41i0Jio
         olrM0i9gWOZNjtsXWNewjM5jn5LxHb67XFD2JsziYwc7Q2NlofykT/RFaEhMszsECcbv
         nnJm24ib2q8zpz0tNT2v3K8q+tznekEoYHXKYNT9OKUgODkyklI5Dk+cG6My+QV9lLs9
         ZCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NPSt7C3erognewOdhkH5itypKEBx2Py2PO8P5YfotUw=;
        b=ZnFeAngTjfQ/Og74FQ+4Va+5Q7K0Y1pF04PeQnxixKIbKXtJZnwekzVDhVEzhYSKLB
         KeOebkQdEsBKVpxxIOm2S2NcQ7YDm4DRlDJMbejTXboXZ6mkfuSzuxfTaAZ97Otg3yma
         n9Sz2RWZAIOP5+gkmdzMm3gYhdGaKzAfoWGWxhuW7j9ZoQPsx7Oppi5jrdRleATBk9Uh
         IVMPj2pdrhYpdND38hjw9OOgnYuWW1veMK/sLqe2yDvExIbC8RDQW2aWfNxbecxwFA7X
         1yyrW459OoMk5KMBS2zhlyzAGwdkWBRw4Yd3MyuRV/YUNlxAd0l161puzx+0rZmUnXeW
         rxBw==
X-Gm-Message-State: AOAM532IWpON4MX/UKjqNWKBXC9jxvpaFVjVtKNOQ1OGf/OVWVesHAlf
	cwdBkmcUZhAhSEMbP0ptLDxDbPzT83AiyBfxIsY=
X-Google-Smtp-Source: 
 ABdhPJzym4vGTwryVCDcAaxPoUSPnJgnB7trKp4g8Dyd5CC9eUUIOMstNzCdeSLaHODE9305TL1+Ujba5uE+TOH3u2I=
X-Received: by 2002:a05:6638:12d0:b0:32b:3b37:4712 with SMTP id
 v16-20020a05663812d000b0032b3b374712mr116282jas.54.1651167342340; Thu, 28 Apr
 2022 10:35:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220421211146.19368-1-pkj@axis.com>
In-Reply-To: <20220421211146.19368-1-pkj@axis.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 28 Apr 2022 07:35:31 -1000
Message-ID: 
 <CAGDS+nke8qEOh8XX5x9Jej7x57DjDuW5s=hyd8U099-Ez6A3Yg@mail.gmail.com>
Subject: Re: [OE-core] [master][kirkstone][PATCH] license_image.bbclass: Make
 QA errors fail the build
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 17:35:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164972

I haven't seen this patch hit master or master-next yet.  Were there
issues with it?

Just want to make sure I don't miss anything requested for kirkstone.

Steve

On Thu, Apr 21, 2022 at 11:11 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> If, e.g., license-file-missing is added to ERROR_QA, then the build
> should fail if any licenses are missing.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/classes/license_image.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_image.bbclass
> index 7e1d0e08a9..3213ea758e 100644
> --- a/meta/classes/license_image.bbclass
> +++ b/meta/classes/license_image.bbclass
> @@ -104,6 +104,8 @@ def write_license_files(d, license_manifest, pkg_dic, rootfs=True):
>                                         "The license listed %s was not in the "\
>                                         "licenses collected for recipe %s"
>                                         % (lic, pkg_dic[pkg]["PN"]), d)
> +    oe.qa.exit_if_errors(d)
> +
>      # Two options here:
>      # - Just copy the manifest
>      # - Copy the manifest and the license directories
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164766): https://lists.openembedded.org/g/openembedded-core/message/164766
> Mute This Topic: https://lists.openembedded.org/mt/90615582/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

