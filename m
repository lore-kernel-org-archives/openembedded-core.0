Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034D7C433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 20:49:50 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.3312.1632948588998832335
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 13:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pEowm/jD;
 spf=pass (domain: linaro.org, ip: 209.85.208.48,
 mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-ed1-f48.google.com with SMTP id g7so13401416edv.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 13:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ojMZweYvTkhyunbPN86gJW4fW6HieCdLTOqRIqYB2jQ=;
        b=pEowm/jDw0YwhRUTxOOA2MHfO2hJwy9N58m6QhzqIf5Wc21Rd+HWlRYUBfaOPAqmq4
         kPxTZj4uftI75lr6SF5EukPtKRwb+PgbQy6R9AG8ibq9G03e9JCMBt2jHOG8SiUVhfGb
         cJpKDOQH+sQzpyEvuP+8DLAG5emPvtGScxuWNsWwNQPF2tgR6RO26GkmRzUmXn25hplC
         b1DZ/nOYL015DmYaAJtSQharGS2HRSsZr+fpd9PzgUCW0aFvOVJGSdruIjPs6viREKqf
         2hMUWdmrMx6WBcP43QwOJmdy8CwHKhZHMFWSLkYzUxtjU3cJtwY4bKw8AwmatRW4bIA4
         XmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ojMZweYvTkhyunbPN86gJW4fW6HieCdLTOqRIqYB2jQ=;
        b=J7VSX+Gq5sKlbY+Dbi1pyA6vP2G5MYKXGkzox1kBXWQM1l5G5aTbz2WjfbnolvkYbO
         /jjaw5l5VYHEFVrHfntau4S98wGVFkQJVddpkD+beR5R/5UC3ZUo6gSXR9ydBZP2RoZn
         2K7TVHCGGwqZV6gDxjQ5pIbJYcq1ZItei11cN99HilcGVQ80MMmqSwTuwNIVM1A7OiJ9
         gg+TGzbm/eatQQqG8BmqrWlMpEduOTvKlnTAzYMSv2flhr4p/Zmvh904X6YP7ZMavVtg
         FkDbonTvFm3Ky2NVtap8Q+lszbSlepM54I7LZg8Vj7vN3bUcoViIaCLspee8a4OhMrSP
         b9vw==
X-Gm-Message-State: AOAM530thYI/enn+/w07TU8Q725yxtOtvfUiEqqVKwKO5pEONvLcbljL
	2CAbJzD7hIQSgYpMEZujFXn9jVe8WGK9jJ7SkCSGfQ==
X-Google-Smtp-Source: 
 ABdhPJxJtIyYbkZlLyuRH4d3ixOgfjIF67uNnsRK22mJN4Ax7zMnpfvwXQmeBQso63l1eT768AsOiWmleryX/VTTOac=
X-Received: by 2002:a17:906:681:: with SMTP id
 u1mr2154429ejb.499.1632948587032;
 Wed, 29 Sep 2021 13:49:47 -0700 (PDT)
MIME-Version: 1.0
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 29 Sep 2021 22:49:36 +0200
Message-ID: 
 <CAP71WjzFqotxBKziGyeuFNmk9fzG4g4aeAvGo-6kD5=vL4U7DA@mail.gmail.com>
Subject: CFP is now open for the next Yocto Project Summit 2021.11
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: conferences@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 20:49:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156474

Dear all,

The next Yocto Project (virtual) Summit will take place on Nov 30 -
Dec 2, 2021. While we are finalizing the registration tools, we've
already opened the CFP, and we are, as always, looking for great talks
and speakers ;)

For more information about the event please check [1]. When you are
ready to submit your presentation, go to [2].

Please as much as possible, do not reply-all since I've cross posted
on several lists! If you have any questions about this event please
send emails to conferences@lists.yoctoproject.org.

cheers!

[1] https://yoctoproject.org/summit
[2] https://pretalx.com/yocto-project-summit-2021-11/cfp

