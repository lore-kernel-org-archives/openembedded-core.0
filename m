Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E26ADC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 15:07:53 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.14280.1672844865922077542
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 07:07:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Kiou0PK+;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.46, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f46.google.com with SMTP id vm8so76377952ejc.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 07:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mdWYJUq94mblCdkyUlfaVauq7iMMjnnvr0Q5qfEM9us=;
        b=Kiou0PK+yuXuMrNeiP01xAmflOr/efvFLRNDXkJwzASdEV2uMYpmHTClONg+hlJgL9
         BD4y/0JWEpAlPtIgy1RZaljZ9EBW+bkFOFgGGEoRx3BhHMdLWVdGaOD2gVC+s4hrXCxe
         aA/Ej5pW+7ntljzwPwpWjSjLuJbQJvTVMJGic2++ZQyQlmMfPtxa30klj17IZ3v+oJzX
         JSbAPmGjEREJBGZ99Ln6RuyIR2yrtA9o+rSdKVKfzMGFlUHKO4xPrqMeAZgpECxMLYMW
         O0ikQDNlnQB4TNAzHxRBq34+/AGqV83rzOUV00+WjKgIzzC6bwPFbx/rGVYRX5i4rhpx
         GY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdWYJUq94mblCdkyUlfaVauq7iMMjnnvr0Q5qfEM9us=;
        b=rTzUG9ybgHeKGaaU69L7WkMYIW0/QyfQD2JwK3S2iYLAzPIJPx6CR5ef7NBGS548ab
         yCJ1A7imEWuKt7gG8D4GtJ/1w5cNsZZAA/aHxuntorV0u9jC2QfGZvGlmkeEFdBviSSH
         tD3b3b6iuPFsPtVkjsGPX5OkzaL6YpGwwaMCRODbcKbbdRROUzcqjWZn8bbF55Dwcgdr
         jA5fTvx69wySUqWXZd1cSHg/nwlFTQUrLzya/eiajc4oVaPaN8Mc7baWOJfWHYMJeLpC
         PlZJC0007Emj1Y2oN/O2MyMY5rXCSxJ2YYBHlnN2LJZ/It2dm8pvKr2y85TZ8BBZwj4h
         up0Q==
X-Gm-Message-State: AFqh2kodseRITxAXahagAIhhk1LY4XEvqSqU+QFp3FntYAZBPm5oOzT/
	po1AUMsFF3hAiEiaOBzF4FPawsCSi5Sye+8GANihCw==
X-Google-Smtp-Source: AMrXdXtE15WbPvF2xqLPQCfcxP87qipNzUcDr7YM6SWsafjezTV087bDNTfne0vVNCTnkJ7KPUFdj+mIaXPSiHoTfuU=
X-Received: by 2002:a17:906:a2cf:b0:7ba:85a7:2ec3 with SMTP id
 by15-20020a170906a2cf00b007ba85a72ec3mr4006722ejb.36.1672844864180; Wed, 04
 Jan 2023 07:07:44 -0800 (PST)
MIME-Version: 1.0
References: <cover.1672842927.git.steve@sakoman.com> <CA+chaQck-1UxfytM2r0PGzYeJfK5rqZrt_fke_RPaLRiGXsGwA@mail.gmail.com>
In-Reply-To: <CA+chaQck-1UxfytM2r0PGzYeJfK5rqZrt_fke_RPaLRiGXsGwA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 4 Jan 2023 05:07:33 -1000
Message-ID: <CAOSpxdaBzC4c=yzrWF7Vkw0Wrsej7Pximn4eWpwURXJtHXYyrg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 00/29] Pull request (cover letter only)
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 15:07:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175483

On Wed, Jan 4, 2023 at 4:55 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Wed, Jan 4, 2023 at 3:36 PM Steve Sakoman <steve@sakoman.com> wrote:
>>
>> The following changes since commit ada5e64a97d5f269886772540e0bb0c324088b21:
>>
>>   efibootmgr: update compilation with musl (2022-12-17 04:10:41 -1000)
>>
>> are available in the Git repository at:
>>
>>   https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
>>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next
>>
>> Alejandro Hernandez Samaniego (1):
>>   baremetal-image: Avoid overriding qemu variables from IMAGE_CLASSES
>>
>> Alexander Kanavin (5):
>>   libnewt: update 0.52.21 -> 0.52.23
>>   ruby: merge .inc into .bb
>>   ruby: update 3.1.2 -> 3.1.3
>>   tzdata: update 2022d -> 2022g
>>   devtool/upgrade: correctly handle recipes where S is a subdir of
>>     upstream tree
>>
>> Bruce Ashfield (3):
>>   linux-yocto/5.10: update to v5.10.152
>>   linux-yocto/5.10: update to v5.10.154
>>   linux-yocto/5.10: update to v5.10.160
>>
>> Hitendra Prajapati (2):
>>   systemd: CVE-2022-45873 deadlock in systemd-coredump via a crash with
>>     a long backtrace
>
>
> I'm a bit late, but this change seems to cause:
>
> | ../git/src/shared/elf-util.c: In function 'parse_elf_object':
> | ../git/src/shared/elf-util.c:792:27: error: void value not ignored as it ought to be
> |   792 |                         r = json_variant_dump(package_metadata, JSON_FORMAT_FLUSH, json_out, NULL);
> |       |                           ^
>
> I'm trying to find out why this isn't failing for you, it might be triggered with just some PACKAGECONFIG combination we have (we enable coredump, elfutils, oomd, cgroupv2).

Just to be safe I will remove this from the pull request in
stable/kirkstone-next but keep it in stable/kirkstone nut until you
finish your investigation.

Thanks for the review!

Steve

