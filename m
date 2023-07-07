Return-Path: <philmd@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6200EB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 08:56:48 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.8441.1688720198676946535
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jul 2023 01:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=JHQNEAAb;
 spf=pass (domain: linaro.org, ip: 209.85.218.51, mailfrom: philmd@linaro.org)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-991fe70f21bso201658866b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 01:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688720197; x=1691312197;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QaePV5au+rpUbuy0nhvC3cBLmk3eaCGQ2Ox8pyvVR1g=;
        b=JHQNEAAbesQcxmEf5b6Ch2lS9DJ56VzCv0RPBLlBWbVGMbHlyJ9lvWLSVQn2v1kKOK
         envWvTUIaA8qbGLFaJtkV22qdpfkt9o3xtz4o50G+7BpNJdX6QDlBCIm0jwJeNLQCNoQ
         d0QnYE7yQlvGpcbnZlTw/m6xzBVYu40OrKACbMi3HUQgSxj7u5Hyy7VYuCVXwPuedAI2
         IGBcFvfhKwV6yUECo3XcUi5Xmj/YazwBLBdifh3cXISUDwB2s3XpiboXdlkjNQCF+xoO
         hqyCj8RlGTwbQ4I1ET4KzoWrSlfw6sNsPMx2xBWPlox/hzhfiZ/6qMWU38cnHEEjzw4z
         fyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688720197; x=1691312197;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QaePV5au+rpUbuy0nhvC3cBLmk3eaCGQ2Ox8pyvVR1g=;
        b=IvLpaIr8E44TeH5V8aLcZgSgruq/vKgY9zhzHlW1BKj/gEUxXoCOglzv+PqjYActlt
         eyfvtlod+8PSGLE7NJJIdRU0Xv4CHF9qeKrapWKxj7B+QnmhkBsfdbCTVhWTf3Pa9yRg
         DpYAXcBBYzrm9avIgnSNiN6oAnfvKV7cSy8Pmckh99OCblvBvKkMY/E+L/rZiCiT1yxn
         +7lHM3fwTkVnU6JE5odJ6Uvo1wLg4FsTvPItT/7gwFBatwmsxnqX0EqWuOvavsx+kgGq
         ubODUYzppw4ipc7U/jlqn46+GPYc1GsRtPRdHLXlo0yS9boOKk/z2wHCQyOvd7JMIRqt
         nHiw==
X-Gm-Message-State: ABy/qLb2ucaS/DGHfUqVvqRuz8i6Zad5lQUfWDc18gNEoEvYIxTKdZ8D
	GM8g6js7w7ltx6rK+1TdIyiB9g==
X-Google-Smtp-Source: APBJJlFxF4zunJVJ6txBxmaf2Wje/ekHd//Wgz576No/jIQwfos2fNiPc/u7e0x02HWCvrQe774bEg==
X-Received: by 2002:a17:906:7395:b0:98e:419b:4cc2 with SMTP id f21-20020a170906739500b0098e419b4cc2mr3705660ejl.3.1688720197085;
        Fri, 07 Jul 2023 01:56:37 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.215.192])
        by smtp.gmail.com with ESMTPSA id y20-20020a170906471400b00991dfb5dfbbsm1894186ejq.67.2023.07.07.01.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 01:56:36 -0700 (PDT)
Message-ID: <a361ea60-afe2-ebdd-cd69-26f1e4f46fe3@linaro.org>
Date: Fri, 7 Jul 2023 10:56:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [OE-core] [PATCH] qemu: fix typo
Content-Language: en-US
To: ecordonnier@snap.com, openembedded-core@lists.openembedded.org
References: <20230706090057.388192-1-ecordonnier@snap.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230706090057.388192-1-ecordonnier@snap.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 08:56:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184002

On 6/7/23 11:00, Etienne Cordonnier via lists.openembedded.org wrote:
> From: Etienne Cordonnier <ecordonnier@snap.com>
> 
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>   meta/recipes-devtools/qemu/qemu.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



