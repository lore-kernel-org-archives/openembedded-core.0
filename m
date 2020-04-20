Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.2541.1587391404672206697
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2020 07:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ccBjIzW7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id x18so12349734wrq.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2020 07:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=0v7zrgui3tNNwdW3jQCcIHttPQ5Oph1rXrARvZI2gxA=;
        b=ccBjIzW7M0J9gyiOxY26ViwtmH0CmFmO5r2BmBe5hUsemaagVI2aHTtaci6qUuSNS6
         Vt1MVhK/Qj+3sqO4PtZRaZolwyXLk30ymrqOTY+0F3nxnjk8zo7ZfmsTMcvwHtCg1Xiq
         fnvQdzxB9krrwM3W2856OvQkwJ3blB0l5P9vU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0v7zrgui3tNNwdW3jQCcIHttPQ5Oph1rXrARvZI2gxA=;
        b=FdPbikPLjd8xloNPAZgFy5ZAM2Hk1yPS4r39ubeyYUzpVT9gqzeoa61D2gIhuPnGUJ
         DJ0G/uwMtc7Hs/kpmY920EXMDXX1gY6PUIfewaFtqEaAc9kSDEdY4JCncaIpd9zUMLSh
         1Y8qFYO0trBX9LUuxg7B8IroAbIbgqTnMUF6smzYF15mL5OBK79duvNePTENa2vceUFi
         Gypxzr6bcVV3Rh4kHSTMRYceRWk/fZF0cP0oqhd3jUS55PzNuUSH5Vi7AqElCui10fUq
         LmxiB3eYcyOpXWZeVjBFaCQ3iWcF20HQooOaPUMEfHNBUMvfS4/qCJrkc3zMQAlRCJuR
         t8Lg==
X-Gm-Message-State: AGi0PuZFE6+L2afQY01LA77VGRf3cWOhXEQj4ruYa5UOV7W05wPgKy2i
	SDyGEceA99+9N22IOYNuT7MA7g==
X-Google-Smtp-Source: APiQypJtxKEcz0k7v0DqK/E9Z9OnArhFEoPUay890T4pU6ZgBWF77sbO2t/xAJgLY9UvndnNrgRLwQ==
X-Received: by 2002:a5d:5082:: with SMTP id a2mr16831847wrt.224.1587391403067;
        Mon, 20 Apr 2020 07:03:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 36sm1389967wrc.35.2020.04.20.07.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 07:03:22 -0700 (PDT)
Message-ID: <867b96d7dbaa0d7605aa9328b6fc9f88ec613d22.camel@linuxfoundation.org>
Subject: Re: [OE-core] Uninative for i386 native tool?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>, Martin Jansa
	 <martin.jansa@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Apr 2020 15:03:20 +0100
In-Reply-To: <DM5PR12MB2471EFA4F9009E30FF859FC28BD40@DM5PR12MB2471.namprd12.prod.outlook.com>
References: 
	<DM5PR12MB24716958338957D20225905B8BD70@DM5PR12MB2471.namprd12.prod.outlook.com>
	 <CA+chaQdBw7KakRcy3A-1TBi361ZPutzWVG3jyRiaswoXH9+2TQ@mail.gmail.com>
	 <DM5PR12MB2471B5B5A25824BCF32B57DA8BD70@DM5PR12MB2471.namprd12.prod.outlook.com>
	 <207860401ddfafd8de45143986549873935deff7.camel@linuxfoundation.org>
	 <DM5PR12MB2471EFA4F9009E30FF859FC28BD40@DM5PR12MB2471.namprd12.prod.outlook.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-04-20 at 13:56 +0000, chris.laplante@agilent.com wrote:
> > I suspect uninative assumes all binaries are for the main system
> > architecture
> > so its probably trying to change the interpreter to a 64 bit one
> > which clearly
> > won't work in this case.
> > 
> > It would be a question of stopping it for these binaries somehow...
> 
> Maybe a matter of doing something like UNINATIVE_LOADER_pn-my-tool =
> "???"

If only life were that simple.

> Where "???" would be the loader in a hypothetical i386 uninative. 

There is a non-hypothetical i386 loader, it already exists.
Unfortunately the loader has to be downloaded and extracted in place
before anything gets run so it all happens very early. Its done
centrally with one uninative, not two or per recipe.

I think you might be able to do something like:

SSTATEPOSTUNPACKFUNCS_remove_pn-mytool = "uninative_changeinterp"

and it may at least stop breaking it...

Cheers,

Richard

