Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2981DC6FD19
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 08:35:26 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.7601.1678955716885721435
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 01:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KwyS97hx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id p23-20020a05600c1d9700b003ead4835046so3089621wms.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 01:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678955715;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ivi9vDEZIKssn29eK7g8hgWJECQ7PVEbu8aMRp/Plyg=;
        b=KwyS97hxkzU/KjG3YWUUFGfU5q9tn9l7c4M+ZbElpnl/LwDyk3D8YJjgUsIOTr5yHp
         efVIahTAxqcTmqjO0E8YVYKIqBFpXQ0V9i0xLZCCqNNpxMZ6GiptVQmBZLmTNTpH0w5d
         rq+vvCTG9kuuDJtknCtKV63YqNzaFRE09MWMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678955715;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ivi9vDEZIKssn29eK7g8hgWJECQ7PVEbu8aMRp/Plyg=;
        b=gkxRqbMLMjKpI/hhHi6i80GuvrpitJOrLgSWZcjLyP9xVbJ2wOYTdjyxf7UeZsOQqc
         Iqtgc73sBuQvvI1wQeaHlPnX18fPgBLMghQpQDYHoq+vuCd/ow4CGPrT5weUaeCUSADZ
         nJn08reWndN8N4XlGu0P/t2vIeHBdYBaCAm4pCBXigGj862VEHWPik4IAEJyTR8yNLIR
         R67pEV9y9fox5BYlnzk8YJhDKEpOvAyGuSe6xg+f08AXYlCglmZJaekEbz5TgtmvKWgR
         7M4uPw+Wl84MRdiEf1LbdyTBt8cBSndkwX4ScOgcQ+8p+Er/2Ll0libzuR6nWI+Debgi
         7DmA==
X-Gm-Message-State: AO0yUKVURTB1/QGZxv+nX2e6T/jwEkWbTTP7fqJ/fjz6pbaZTiNkCUDn
	mJX3+waviMsJ4QACKpumdh02Iw==
X-Google-Smtp-Source: AK7set8TtY7XcIr09OqJwS5ncwKJZnigIxmPe5IyCpD8KbBfABqX7OMfGwXliHlcd4LV69gsPDRA5A==
X-Received: by 2002:a05:600c:468e:b0:3ea:f73e:9d8c with SMTP id p14-20020a05600c468e00b003eaf73e9d8cmr20509993wmo.16.1678955715346;
        Thu, 16 Mar 2023 01:35:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4181:67:6e43:6a9? ([2001:8b0:aba:5f3c:4181:67:6e43:6a9])
        by smtp.gmail.com with ESMTPSA id t8-20020a05600c450800b003daf6e3bc2fsm8802058wmo.1.2023.03.16.01.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 01:35:15 -0700 (PDT)
Message-ID: <f9580c9e0e77e0c529d89bbff242e991dfb3f4d8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] grep: upgrade 3.8 -> 3.9
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: Upgrade Helper <uh@not.set>
Date: Thu, 16 Mar 2023 08:35:14 +0000
In-Reply-To: <OSBPR01MB1845B9DA645AC75EA2021CC8DCBC9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
References: <1678878683-19486-1-git-send-email-wangmy@fujitsu.com>
	 <4909d0d1ebf1cb85ee289d31a301f70df3a5ec0d.camel@linuxfoundation.org>
	 <OSBPR01MB1845B9DA645AC75EA2021CC8DCBC9@OSBPR01MB1845.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 08:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178683

On Thu, 2023-03-16 at 08:32 +0000, wangmy@fujitsu.com wrote:
> Yes, so I received an error message when I sent it. I will revise and res=
ubmit

I did fix the ones I'd put through testing since I didn't really want
to repeat it so only anything unmerged needs to be resent.

Cheers,

Richard



