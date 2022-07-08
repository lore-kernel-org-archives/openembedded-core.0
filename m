Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF659C433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 13:05:55 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web09.7417.1657285550521865229
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 06:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bZLYJK3B;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f48.google.com with SMTP id j22so11357332ejs.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jul 2022 06:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=Y1ZxROcHgwNUDLDort3kERtjrfTOnbLQtd5ge7UdPMU=;
        b=bZLYJK3By1X13QsBfzyF3bJFhPY7ajA3uArviw/AN8DoVKVG//3GBu4tXINgwoFQ+F
         H1JHU0ys7+Nt3iZuFFV1jTYM/A5uHkcEApUEE364uAeAGriPipDy9w/1eJbMl8shbhrV
         XdalLmF2JOJMv2j/IxIm1de84y7Sl5heUj6TA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=Y1ZxROcHgwNUDLDort3kERtjrfTOnbLQtd5ge7UdPMU=;
        b=pfcYPULEeVlRmkjmwinX+hSd9NV3kTd7lUrqTOfFCoJ/vgbLn+pPGS0iSx51GOax9n
         aYl0UgDUlzFWStgmklwmU46dl9oObNcSPB0rW0u6DKl2jibCsDc5UILj9fq2BbVLo8sN
         JdWcfhBZb/xsA/ib3AbyGiPCc8amgQo+VUFshTTTxT9nUstlZorbAsLfQkuahuOEvAtE
         oneiK6/mIgBa5ymmcLjvszFTOj95zToQIGYxSWGUK3YaFOb+EUlrT3XsL66JVLjGn1zb
         DAJuaMoo8vXpwfX0HUtSnmMqamt5stwLydqgofAT+6ymP6/2rBcxurFLcGAh+uZBzIpQ
         iuqw==
X-Gm-Message-State: AJIora8pELsWj3IB60886qr51oTXviwmDMPyJGRlPE3cVW0XHAiS18QH
	ZTdnhfD8LsqYY727d3tficXVOAEQusAGsA==
X-Google-Smtp-Source: 
 AGRyM1t6Mt0xoJdoxTyWdFikeo0MBJl7IOH41CsSzd0vP9ZXyAGoWxqF42761X8p0DnVjag41knj0g==
X-Received: by 2002:a17:907:2cea:b0:72a:f6c9:8a26 with SMTP id
 hz10-20020a1709072cea00b0072af6c98a26mr3590901ejc.206.1657285548799;
        Fri, 08 Jul 2022 06:05:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5d6f:c4b9:24ca:b52c?
 ([2001:8b0:aba:5f3c:5d6f:c4b9:24ca:b52c])
        by smtp.gmail.com with ESMTPSA id
 g16-20020a170906539000b0072af7566927sm4083236ejo.13.2022.07.08.06.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 06:05:47 -0700 (PDT)
Message-ID: 
 <25ddecdf5e77515b5967dd92d804e8dbd4ef3b70.camel@linuxfoundation.org>
Subject: Re: [OE-core] libstdc++ honister -> kirkstone
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mfumita@electromag.com.au, openembedded-core@lists.openembedded.org
Date: Fri, 08 Jul 2022 14:05:47 +0100
In-Reply-To: <28194.1657080073438546558@lists.openembedded.org>
References: <fbe2ba5d-f82c-ea57-a00d-4e0ff1b9586f@electromag.com.au>
	 <28194.1657080073438546558@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Jul 2022 13:05:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167822

On Tue, 2022-07-05 at 21:01 -0700, mfumita@electromag.com.au wrote:
> Hello there,
> =C2=A0
> It isn't due to EOVERFLOW but make_file_type function in libstdc++-
> v3\src\filesystem\ops-common.h always returns file_type::unknown.
> It's because _GLIBCXX_HAVE_S_ISREG isn't defined.
> I found HAVE_S_ISREG at libstdc++-v3/config.h isn't set properly.
> =C2=A0
> It's caused by a configure failure below to tell if S_ISREG exists on
> the target.
> gcc/arm-emit-linux-gnueabi/11.3.0/ld: error: tmp-
> glibc/work/cortexa9t2hf-neon-emit-linux-gnueabi/gcc-runtime/11.3.0-
> r0/dummylib/libstdc++.so: file is empty
> collect2: error: ld returned 1 exit status
> configure:15686: $? =3D 1
> =C2=A0
> It complains dummylib/libstdc++.so is empty, configure failed then
> wrongly considered S_ISREG doesn't exist.
> This seems related to the following commit.
> https://github.com/openembedded/openembedded-core/commit/34b0edb0d3120c32=
063ff7e3dd52be20d60401d5
> =C2=A0
> Reverting this commit rectifies this issue but not sure what's the
> proper fix?
> Any help appreciated.=C2=A0

There is some piece we're still not understanding. I had a look at my
local build (master so gcc 12.1) and I see HAVE_S_ISREG is set
correctly, I don't see any "file is empty" message.

Are you able to reproduce this on master? Which linker are you using?

Cheers,

Richard



