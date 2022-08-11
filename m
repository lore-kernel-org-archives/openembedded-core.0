Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CE7C19F2D
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 08:23:18 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web09.4163.1660206197055792555
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 01:23:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iFCCj8lz;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id v10so15080346ljh.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 01:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=zs1fDh6XoGGqdxs1+vP9OkWQUh4jwFzJSPsfqupShuA=;
        b=iFCCj8lzQv0kLzsuAkGF8TXeFWdohAFXSvb5QhPE4ihYMa4bqJBwc3K53It9NiUKGz
         Yc3CWpuAI/K9XrUYzY2weZMszaeQkvz7HeKlZ2ZjsUt0fvi1SxkffPAZKkXuj4/4t64J
         3Yk0qk8fS/vmwPqEuSWO1CIZmfLvJi/n8PWHWO1b2j3WtxOo0CAtS7PKMKQmY2rs2rEg
         SDHo/wNiHzlJ9iN/vZFaqj0gKsCur7aJW1Fry5E9wfVHFk0nrlAD1P61/Td1/YYSWFnN
         VczGL9xw9aKfDzSFdtM+6oNaEDVAtvyLaub8XhAOt9TXgv4pAiceilt8PQiq0N0CCEYQ
         4AuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=zs1fDh6XoGGqdxs1+vP9OkWQUh4jwFzJSPsfqupShuA=;
        b=Q3qBlUYph/F/RxR6GGLDNST5Ly+qi9D3u9jFAUkvXg+MkOYB+r3bqTpYJYDcihCEP1
         jRIWJQvGsdmrxzWyLUVZRNMt6OXD3KSd2KJBT9SWMQQCwTCgBai4ywh5xD6EdVxcAjCr
         scA1/g65S2e2OSZBK9JD2WCfqs4dF37iwWEBcP84YY6tqnsmE3ThuiwnRYz5X4iub+V3
         p4gqG2iQngKUwJpcFpZhQCvywGFByzsRZjUenOM/+bt9h7AuitfUtJ1njTcA2plgOxVg
         kQ6ChY8EzOMKNDtzowrKAcbsFFSMtJZfKgFtFJla3vkDxTpt4K34puzb3a2eafTp+f62
         jizg==
X-Gm-Message-State: ACgBeo2DvR//4HynZ/mQBTv4BnbUSNadS1Cy0TzPHDGjEit3u8QdpkWY
	j/SI6o8p4iiW84cmk1tLrCht+D9woT3R4S8cWT0=
X-Google-Smtp-Source: 
 AA6agR4+jn0A+bbHjKwOdghengNhrl16WPN5cRP0MODhB/pce1//AaW95kIk41/1VlCMkOPABajDm7XLddFe6xfGxNw=
X-Received: by 2002:a2e:9415:0:b0:25e:477b:adc9 with SMTP id
 i21-20020a2e9415000000b0025e477badc9mr9185880ljh.109.1660206194929; Thu, 11
 Aug 2022 01:23:14 -0700 (PDT)
MIME-Version: 1.0
References: 
 <5c34f311-8120-42a8-bfe7-18c90a5fabd6@denue6es010.ebgroup.elektrobit.com>
In-Reply-To: 
 <5c34f311-8120-42a8-bfe7-18c90a5fabd6@denue6es010.ebgroup.elektrobit.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Aug 2022 10:23:03 +0200
Message-ID: 
 <CANNYZj_6O9M+VC+1Z3YLFwqppQR3Ns8d9P523JuAjiM-mh33RA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] json-c: Add ptest for json-c
To: Simone Weiss <simone.weiss@elektrobit.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Kai Tomerius <kai.tomerius@elektrobit.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 08:23:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169236

On Wed, 10 Aug 2022 at 21:40, Simone Weiss <simone.weiss@elektrobit.com> wrote:
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -87,6 +87,7 @@ PTESTS_SLOW = "\
>      findutils-ptest \
>      glib-2.0-ptest \
>      gstreamer1.0-ptest \
> +    json-c-ptest \
>      libevent-ptest \
>      libgcrypt-ptest \
>      lttng-tools-ptest \

How long do the tests take to execute? Do they have to be added to the
slow list?

Alex

