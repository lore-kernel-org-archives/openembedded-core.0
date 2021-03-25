Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.5658.1616665712101361639
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 02:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nz5ZXiOz;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id k8so1617016wrc.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 02:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=p18G246UG8nBox+MAFOABdaUm5uouWDp9bg6paEAt98=;
        b=nz5ZXiOzsXgp4N8KV7d2NcDP7fWgAstK+ORNKefcnipoUZEKdfPuub2aL0WaqT//Cf
         dA1TdOsTJbgKhSEU5IzaQjSZDpK+t3dVxHewaTQdXNkJAWJS0FFaaLvEe1iqETTgUfw/
         T7nJzMqoPwJCUwPBuuzRze69SRESLhKNdc0IQzii9xudfm0Kr5JzPI7gUJNl+8jJ9SuR
         kmJ/xKhvsB1jRyMZWceMXrbxwxvoU49avTpYmLRFG+wWm6X589HGQYKNgziBthxtebIg
         ykUuQuRLHMsPP+R579V6nFSCbI4LRrSdYaZQs1cJ3OQeETtWGD1tD0087WmrD5pbKGuC
         VWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=p18G246UG8nBox+MAFOABdaUm5uouWDp9bg6paEAt98=;
        b=bnhDjigckBLwaEpvxBNk/eihx2pdN6hB3LS/LxXne32SUy7vq78KbAHMbi+enmXG7s
         jlnqRE+sFA+YiLn+OgKqTSuuo9aog+MY7YvsM0tZ9M6p2K+0Ehm1BW8lW6o82UV96f4S
         HqDWeZ/lAbYTIgpsEGFPcB/Mp8t++X9xhCYzL4n7AJV+G8KIyaUqRBcEdzSAH2bpAOGe
         cn8bqxShY8RcN4hs2tPJlfBVBKV0ZIn5AFJfzgYPSfk0eeKDu3oQnKHgFdgEykd4WNQh
         i3VZha/MENC0Cpu6DPS0D5WD75cLsl5vjP4YAOkX2EOXjlp3B+ebfXePpZXEj7EfpjO1
         PP9w==
X-Gm-Message-State: AOAM531pdVmbCYp7nErEKqM/ktjR/GwwBB9uNQu5e9khs3evwoEMxXZw
	H4MfrgGOE/eC2O/sR7w0ljc=
X-Google-Smtp-Source: ABdhPJwZDJGpqQfxDDFHUzvUynlZuVSF3cgMjHWxAvaJJ2ZnCBoF+aqaEqEG949KkGLn3+55/31fEg==
X-Received: by 2002:a5d:61c9:: with SMTP id q9mr7810576wrv.219.1616665710572;
        Thu, 25 Mar 2021 02:48:30 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from bluca-lenovo ([2a01:4b00:f419:6f00:7a8e:ed70:5c52:ea3])
        by smtp.gmail.com with ESMTPSA id j12sm7140734wrx.59.2021.03.25.02.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 02:48:29 -0700 (PDT)
Message-ID: <f6b6cd5c3ca630e9e4cfc462c7a83759db36c360.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Oleksiy
	Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco)"
	 <oobitots@cisco.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "bluelightning@bluelightning.org" <bluelightning@bluelightning.org>, 
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Khem Raj
 <raj.khem@gmail.com>
Date: Thu, 25 Mar 2021 09:48:25 +0000
In-Reply-To: <070d63d34bd6936df1e94c620103e2759dae0427.camel@linuxfoundation.org>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 ,<20210311150959.782186-1-luca.boccassi@gmail.com>
	 <PH0PR11MB49023E90CAB5E58C2B603899D7629@PH0PR11MB4902.namprd11.prod.outlook.com>
	 <070d63d34bd6936df1e94c620103e2759dae0427.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-03-25 at 09:34 +0000, Richard Purdie wrote:
> On Thu, 2021-03-25 at 09:17 +0000, Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco) wrote:
> > Could you look into this warning.
> > 
> > WARNING: util-linux-2.36.2-r0 do_package_qa: QA Issue: util-linux-dev rdepends on util-linux-libuuid-dev, but it isn't a build dependency? [build-deps]
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/3226
> 
> That failure was my fault when testing some fixes.
> 
> I've sent out a patch which renames util-linux-uuid to util-linux-libuuid
> and sorts out the license issue Peter reported.
> 
> I'm optimistic this fixes the various issues people have been having
> and simplifies the recipe a bit as an added bonus.
> 
> The patch has already tested cleanly on the autobuilder (the above warning
> was from an earlier aborted build before I opted to rename the recipe).
> 
> Khem: Thanks for the related meta-oe tweak, I think the rename whilst 
> slightly painful now is the best way forward overall.
> 
> Cheers,
> 
> Richard

Looks good to me, thanks!

-- 
Kind regards,
Luca Boccassi

