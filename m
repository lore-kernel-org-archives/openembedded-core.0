Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFE8C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 04:53:21 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web09.5451.1634273600086300765
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 21:53:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jGZPIkvj;
 spf=pass (domain: gmail.com, ip: 209.85.166.49,
 mailfrom: alistair23@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id p68so6373320iof.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 21:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7k0Sid0YxB9ZoIbS0MRENezBSuHwvsi5Ohazz7h01hk=;
        b=jGZPIkvjEqcST9Rhx7no9vrCrylwql3MAdzmXhPgKoQdzRcR4fOTQhQHkncpoqpPWY
         RFQLNFS/Cpaxuoa1oC22v2sWRBYXwxWpyGXIBJA0aF9WzAjfGuu4wHuzT8sDe7uCm0Sh
         q7xtuG+sIeREvNW5eJ9eNX22QnnpCEphbH+j4CMvGbt13q1/nWSO5OH3RRT3z5cA404G
         DDFscgH08iVbzjYFB2IsYAtUwi6z4rEF8hAwyZ4BK1oK5SQ6+NjMTO5w7/SaNdOBbxlk
         A+Exo4bVhj4aekXwibWlFOXVOo/8zUWmDa5nRNdi6Lygp94Dc199UCoihVEo8jgX3uzy
         qSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7k0Sid0YxB9ZoIbS0MRENezBSuHwvsi5Ohazz7h01hk=;
        b=gV78FsVkgpC9WzFXZaC8e9h5M76JhEfwFoI7pBy+hjvPvRstHtZpRxFGXFYNC5AI4M
         /I/NHCV2CAFhGabcwho0URInAdNQHNr/8R2l3LE6MWs9ur5p+3Pu1IYXykyiGpfnWwYl
         +JbiUBQCL3nHyrbnRjJXXY+WuGCXFXZ3Mh0xVMC59rBIcjjRbKHTFD2M3cbLjQKiVFGJ
         d9l7/lF6bwobME6dunM8prBSFa52Vq/jAiIuv/CgVj6OitzgCoXltSLcM5KBlL2sWg2y
         P3pmQG7cMhjp9ByCTeQqFWtQbVaYaQ60PLdcNrHI21OaY9NBdaMB4Jd/dKMz6VvUUgb5
         2tJw==
X-Gm-Message-State: AOAM530/9iLemn1UNJbD44dHXYdqRoPW19b88xveok3IfppQDU/+Jo98
	5eVNOoE4IbQAysS1tvIsw6f6TjbS8/f9mK767vs=
X-Google-Smtp-Source: 
 ABdhPJzk+TYn6PTMwWhKn9qh2jq1ffdhu2woH09q6qyquSh37P1M8m4tPj0OsZ60tv/CErdqqz7U8YM0zQiJF13UcFY=
X-Received: by 2002:a02:a786:: with SMTP id e6mr6603805jaj.117.1634273599461;
 Thu, 14 Oct 2021 21:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211015031716.1049584-1-raj.khem@gmail.com>
In-Reply-To: <20211015031716.1049584-1-raj.khem@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Oct 2021 14:52:53 +1000
Message-ID: 
 <CAKmqyKPfJGBqJoytregiK3K-AN=ST=DRAkYDZZ9QtYQt-YQ8+A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] opensbi-payloads.inc: Use strings for fallback
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 04:53:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156986

On Fri, Oct 15, 2021 at 1:17 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> This function is evaluated during parse and some machines maynot use
> external payload, on such machines this fails to parse
>
> Fixes
> bb.data_smart.ExpansionError: Failure expanding variable do_compile[depends], expression was  ${@riscv_get_do_compile_depends(d)} which triggered exception TypeError: argument of type 'NoneType' is not iterab
> le
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  meta/recipes-bsp/opensbi/opensbi-payloads.inc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-bsp/opensbi/opensbi-payloads.inc b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
> index cc31ab3b1d..ce537c0587 100644
> --- a/meta/recipes-bsp/opensbi/opensbi-payloads.inc
> +++ b/meta/recipes-bsp/opensbi/opensbi-payloads.inc
> @@ -17,13 +17,13 @@ def riscv_get_extra_oemake_fdt(d):
>      return "FW_FDT_PATH=" + deploy_dir + "/" + sbi_fdt
>
>  def riscv_get_do_compile_depends(d):
> -    sbi_payload = d.getVar('RISCV_SBI_PAYLOAD')
> -    sbi_fdt = d.getVar('RISCV_SBI_FDT')
> +    sbi_payload = d.getVar('RISCV_SBI_PAYLOAD') or ""
> +    sbi_fdt = d.getVar('RISCV_SBI_FDT') or ""
>
> -    if sbi_payload is None and sbi_fdt is None:
> +    if sbi_payload == "" and sbi_fdt == "":
>          return ""
>
> -    if sbi_fdt is not None and 'u-boot.bin' in sbi_payload:
> +    if sbi_fdt != "" and 'u-boot.bin' in sbi_payload:
>          return "virtual/kernel:do_deploy virtual/bootloader:do_deploy"
>
>      if 'linux' in sbi_payload or 'Image' in sbi_payload:
> --
> 2.33.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156982): https://lists.openembedded.org/g/openembedded-core/message/156982
> Mute This Topic: https://lists.openembedded.org/mt/86331377/3619028
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alistair23@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

