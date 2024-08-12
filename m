Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7B1C3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 07:54:12 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.41429.1723449245511752775
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 00:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gAR064de;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52f01613acbso5634092e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 00:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723449244; x=1724054044; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/grzxzBi/bytca3AdJJ133a3ayZ4M1flBNqZ4aBQhKk=;
        b=gAR064de7fzCCB3doquP8CHI1oB9CP5PuU+86E7CFqYYddbDYrC4jm08Qr04AXww0b
         HGcbX7JZywTijnf5ZwyEZGG6N0mz2iycSKK9GxKKHxIkqiMHozw7p5g+Q6kvhDr/2Qvm
         DcISMnBBvf788RNr5atfpSIY1R9+u8OIY+VVchqf/HpqwXlm3h11cHMnAXyVJagSkoEd
         5yEptp6SVDQZ1/kIpnX+aZs98oDEs4tYietyo3RHQRlWdTk4u9rXBnacUwPJJuAZhJ6c
         fCus1x7HxniFPJAnzrZ5KbA80phl4T/8gUFI/oT2+fqRfLozfrFXnV7UNsBPJGrQTNez
         QGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723449244; x=1724054044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/grzxzBi/bytca3AdJJ133a3ayZ4M1flBNqZ4aBQhKk=;
        b=AEoRg6F2Fzcz1XIO4giVtoekq0DlTpEV+2KJrn7/4jWdR/UiMiCSusIQyUxJLeJtU2
         HIhuOx3U4klUN0HqoTcaepSp9lbX0sX6khmfGlQRVw2fLE6izZm6iqT0YT32KWLD1LBn
         H1YPaEjuz9Uklxa1K503HSytIo2VBakOcthvrig9OBKcCeUq7+WT+6A0ihbp3zF3VfHO
         Q5IPCBGIJmrDVgVtvqutBIxhyb0+jn5421oCePC/vHPz873H2JHHugzH3Ea3lyIMrlXZ
         AW/4ewRPEVQoTjuBb/+RXezoVh2OPHVHaNhtILCZVcM+w9lNyjvLaS2FAduc3Hr/yaqK
         FAXQ==
X-Gm-Message-State: AOJu0YwX8+2iyepN/80VVqjU1WRq1t+Blf3ybFhKVHkKtSnENv625KW2
	yyBPWBUuDxzieL40T+bsqQV9c9lHoUMkFM3qPwS6lv+SnfKUMAfQKo32RkvV4nNXjjAALp5ulUj
	9vhVnzwhdrmQDvi2trV3Ipon2524maw==
X-Google-Smtp-Source: AGHT+IEw2l4woHEYF1J96VyDaAmTrdxrZjQKYZOlUgykuJ/omzKPT6oC+/CTFxZjzpEF8Fn7V5/4EzpcuUvC6E0Zark=
X-Received: by 2002:a05:6512:b0a:b0:52e:8161:4ce6 with SMTP id
 2adb3069b0e04-530ef596ea9mr2470963e87.25.1723449243465; Mon, 12 Aug 2024
 00:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240812070054.93602-1-Qi.Chen@windriver.com>
In-Reply-To: <20240812070054.93602-1-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 Aug 2024 09:53:52 +0200
Message-ID: <CANNYZj8q8nff3nU39jjH9jY3XdtuE73_nzZHUedkRjc31f1U-g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] json-c: change SUMMARY and DESCRIPTION
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 07:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203204

A better commit header would be:
'json-c: use upstream texts for SUMMARY and DESCRIPTION'

'Change' is vague.

Alex

On Mon, 12 Aug 2024 at 09:01, Chen Qi via lists.openembedded.org
<Qi.Chen=windriver.com@lists.openembedded.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Change SUMMARY and DESCRIPTION according to json-c's homepage
> https://github.com/json-c/json-c/wiki.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-devtools/json-c/json-c_0.17.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/json-c/json-c_0.17.bb b/meta/recipes-devtools/json-c/json-c_0.17.bb
> index 20bcece768..92ab612175 100644
> --- a/meta/recipes-devtools/json-c/json-c_0.17.bb
> +++ b/meta/recipes-devtools/json-c/json-c_0.17.bb
> @@ -1,5 +1,7 @@
> -SUMMARY = "C bindings for apps which will manipulate JSON data"
> -DESCRIPTION = "JSON-C implements a reference counting object model that allows you to easily construct JSON objects in C."
> +SUMMARY = "A JSON implementation in C"
> +DESCRIPTION = "JSON-C implements a reference counting object model that allows \
> +you to easily construct JSON objects in C, output them as JSON formatted strings \
> +and parse JSON formatted strings back into the C representation of JSON objects."
>  HOMEPAGE = "https://github.com/json-c/json-c/wiki"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203201): https://lists.openembedded.org/g/openembedded-core/message/203201
> Mute This Topic: https://lists.openembedded.org/mt/107852568/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

