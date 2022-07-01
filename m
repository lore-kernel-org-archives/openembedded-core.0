Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48626C43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 09:59:27 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.36075.1656669565835755054
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 02:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PzBuhKGW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id k7so2404649wrc.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 02:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=XIBLfNqxQpTmABl2sBZYrH3/dBm+PPA/aD1jwdTVV/k=;
        b=PzBuhKGWI+f5pWNSw/PXEDW+VFIr5Ib8CYW8qfLIcZ1CIDBZrxEmGhqxZPL78INzbe
         U0Ad8Vx0n8wtUpdUKIiK8vMHI+yYMFboJ3S5JI5W+8vV2WxXfaBWrumb2kBn1fVjcbFf
         lGVcLY2X8964baeCw5OlAgExf6Uzn0dT6T10E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=XIBLfNqxQpTmABl2sBZYrH3/dBm+PPA/aD1jwdTVV/k=;
        b=b6rwiehud9unv1ubD36/E4LJNHPe+rDwSLfgeZaYreHcbsROW51dVj1jd8PKxKwRg8
         RDGR6896fJz8q9kRVblXmFGZNtv8au+oV6ZA8yOwdG4T02jfAwIGVnQVJAVW0cPdAtnD
         XQgkpfrPxsCvrWsw7h8JRk/4cNSD3DDJOcLnmRR12TNGyldUAijeWJ0r3/MERhycCgpH
         agWBDriCVFyQrRxsIHqYhrwKN4LaH+ly0homXEndb4CzMSjX/i0yKrIrgXh1rWdJMBVY
         FMhfGjEE4981NVH6mR12vqZsPh7YFOylE0tgkcdPts0I8Ga6KQ5nJ154F7AfcHdbZ0p8
         AiNA==
X-Gm-Message-State: AJIora8QUd+RldozOXsOPEQWxL1Xtbcy74j5BF4kngUpshy+bWPHKsAZ
	jylIFbPgGs+UMBrOvwsvtqA2lA==
X-Google-Smtp-Source: 
 AGRyM1vKw4J8lRX2RNwRGevW3sE0MceW9MDSQINiy5c1MUEVMlPjHs+337J8AcXfXnBrGfliAEzIQw==
X-Received: by 2002:a5d:4b04:0:b0:21b:8640:273f with SMTP id
 v4-20020a5d4b04000000b0021b8640273fmr12828045wrq.195.1656669564006;
        Fri, 01 Jul 2022 02:59:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a49f:615b:a613:6a47?
 ([2001:8b0:aba:5f3c:a49f:615b:a613:6a47])
        by smtp.gmail.com with ESMTPSA id
 d11-20020a5d4f8b000000b0020c7ec0fdf4sm25814001wru.117.2022.07.01.02.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 02:59:22 -0700 (PDT)
Message-ID: 
 <ad9a88516501a7fb9fd5baa5ed25809fe70ef60c.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/7] kernel-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 01 Jul 2022 10:59:20 +0100
In-Reply-To: <cover.1656616115.git.bruce.ashfield@gmail.com>
References: <cover.1656616115.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 09:59:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167452

On Thu, 2022-06-30 at 15:16 -0400, bruce.ashfield@gmail.com wrote:
> With conference travel and issues with meta-virtualization, I've been
> behind in sending this out .. but I have been queueing changes, I just
> wanted to be around in case something breaks.
>=20
> Here are the -stable updates and the start of my efforts to bring
> 5.19 in as the new reference kernel for the fall release.
>=20
> lttng-modules needed it's normal tweaks to work against the 5.19 source,
> but otherwise, nothing significant has popped up.  I have other parts
> of that uprev under test (libc-headers, systemtap, etc).

Thanks Bruce!

Unfortunately there was one issue the autobuilder found, a
reproducibility issue in perf:

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20220630-53gdlqx=
v/packages/diff-html/

I've not looked into it other than looking at the above link but it
seems some python paths are creeping into the binaries.

Cheers,

Richard

