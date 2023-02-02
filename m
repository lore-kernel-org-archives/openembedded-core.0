Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F11C05027
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 12:09:25 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.12977.1675339761063262319
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 04:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I3NVFCU5;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id v17so2650771lfd.7
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 04:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RLzACCLEXxXoqdvzZsUbI5IGu/8bXNARA61H6LUUkro=;
        b=I3NVFCU5nsTYpzkCmaL22s+F2a5lBse/HmmxRUg5R47IkizZwAFSOk1Sqyzt0AC5hJ
         kD/f1cXK4vgMue3vmghTx6gjur/iQpcedyWXr8rx/KJgbDItY5e79IAjhgJhSmBCaT3b
         b9P9CJNPtnS9ssLIDRLthDwXQpv/K3fZplRXynVy4iDc/392Rr89ZB2ctMB/GgpSoHXF
         Hw9jNcxshUNSFNK846sXc0a8/B7I40Q3bm5F3EQVWR4TZKpH64zQxw1Ky6AFCn2ZMb59
         tHlggXXsK2PoUOckG0ObsC5QYgigW0t5qYWEGwXnRVvXQi68uXLoisai0kytnfzBlgQu
         f+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLzACCLEXxXoqdvzZsUbI5IGu/8bXNARA61H6LUUkro=;
        b=RrDiO7jjBzZALcSc7nVXsDqY3sv1UEdf/zX3tzkVBp/5Mcu3jFl1kL0MkLKy68AMJ8
         IrmYA6taOHs6gpoDpaMKBy2THcq+ztf9TbpFR1bf2bmctiE8cOZI7TtR4QvCCTnS7/st
         0XLJ63XBbi4lxejvssF9hmTNC0cJu7AB21TP2ItcMDgi3Mm74VMEUnUflknjaSEfaRRW
         LomhcZj8gNUkrEFzUSTYWrTbLQAHo7VeDHhQjkPp3I+nz+Ad5XHZfq62wXOHA3j2Sh+U
         NUTnWe2u3QhsOKBtb/rmI93kBE94FqcXTLngFcxP6VPRIsZakA48jlC3AAUtAA2OFHfM
         /t2g==
X-Gm-Message-State: AO0yUKXUvgPER3u4rbVAsIF57bLm+s+mp8S3xmLmQTNMlWoWUcxD0Gw+
	/XAJjmBUm6p1fFRn2tpKJGyf/wvHE9RU0dhVPJM=
X-Google-Smtp-Source: AK7set/RMYiwwlNmwL5REeFGFbJOvgxDsJ02OqNdUyb4ku/JsIygYHW+Ckg60j7gY0n5W0n9PgtQsVzPMrjP8hUo2XU=
X-Received: by 2002:ac2:4903:0:b0:4cc:7571:8b1d with SMTP id
 n3-20020ac24903000000b004cc75718b1dmr1452185lfi.58.1675339759111; Thu, 02 Feb
 2023 04:09:19 -0800 (PST)
MIME-Version: 1.0
References: <20230202080219.3465767-1-wuxiaotian@loongson.cn> <20230202080219.3465767-2-wuxiaotian@loongson.cn>
In-Reply-To: <20230202080219.3465767-2-wuxiaotian@loongson.cn>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 2 Feb 2023 13:09:06 +0100
Message-ID: <CANNYZj_uEYoNA9no=wG+CDxApOVsxE7doT0G2zJymGJCSNDVUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v1 1/5] base: add support for loongarch64
To: Xiaotian Wu <wuxiaotian@loongson.cn>
Cc: openembedded-core@lists.openembedded.org, chenjiping@loongson.cn, 
	zhuqizheng@loongson.cn
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 12:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176691

On Thu, 2 Feb 2023 at 09:02, Xiaotian Wu <wuxiaotian@loongson.cn> wrote:
> --- a/meta/conf/templates/default/local.conf.sample
> +++ b/meta/conf/templates/default/local.conf.sample
> @@ -21,6 +21,7 @@
>  #
>  #MACHINE ?= "qemuarm"
>  #MACHINE ?= "qemuarm64"
> +#MACHINE ?= "qemuloongarch64"
>  #MACHINE ?= "qemumips"
>  #MACHINE ?= "qemumips64"
>  #MACHINE ?= "qemuppc"

Thank you for the contribution. This list, however, only contains
items that are explicitly tested on the Yocto autobuilder, as that's
the only way to guarantee that anyone setting up a project on their
local machine will get a working build out of the box. Until
loongarch64 joins the tested set, it should not be listed. (how to
join that set is a separate question that you are welcome to ask)

Alex

