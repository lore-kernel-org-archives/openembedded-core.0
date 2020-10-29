Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web08.8628.1603977458388789681
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 06:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WoavypmZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id k10so1395407wrw.13
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 06:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=cR5bQfNltVE5Hc9/TOJ6cKktv9JPkQWlGMyciL1P8Zk=;
        b=WoavypmZjhJPukdon0FviVtUqTSqZPWYwt2qKpvmW5YOsCv+8qAMwMAyJfZe7apKq3
         rlCnuJWifXrFpimOhOIOt0o4Z0QTjhoOPoq2SNPjNMdigKrj/5X5kYY/br+vQZP4J5EK
         8J1BqRqAAS6OLJOUxlVgdoKGoOx6KOHX8zxAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cR5bQfNltVE5Hc9/TOJ6cKktv9JPkQWlGMyciL1P8Zk=;
        b=T/0wOUChGqxicA4U8WT8Zqj8l0zFcR/7myovA2VDpHubBBGUi+azFV3z/TFrdHav+S
         cdNi+zHAO5S9I2Imwv1GKWN/141QDUz5xNNHidvsKqVGqJrs1Wp4c5C3xU4pBu4ksmaC
         DKi54tAKviZeNO2rBVPdOytv+APyF2q4p0IRSPwBQ/r+wDoXwyQ107xADHXkt9WGilq6
         gKNMTxOCATwl+NlChJXt7DIMIWwMxh74xhv0KME8paUR6ATYrjDWI+0NddlSQX9XaNLZ
         nR79IuYmBirPGUKh/THSQDtaJbWAu0l9aD4pu4hllPjBbeM2W+Utk8DY1ElVZfEvO03j
         RlVg==
X-Gm-Message-State: AOAM531eeYNPKerBZilZA0hPydUt8bHSwZvfsz7W2htlxVNi5Eo2EUPj
	nAIY3AvGz8VkVY96qpZ3Jv1iQA==
X-Google-Smtp-Source: ABdhPJwJ1DGAKmNZ3CzO9a5492WoS5HxvvJxHtLOUef6suYMrJ87MfcNAl36VFDIuWBGKzqq/oT0EA==
X-Received: by 2002:adf:a501:: with SMTP id i1mr5502528wrb.162.1603977456890;
        Thu, 29 Oct 2020 06:17:36 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.7.e.c.f.b.4.b.6.c.1.d.5.8.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.7.e.c.f.b.4.b.6.c.1.d.5.8.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b185:d1c6:b4bf:ce77])
        by smtp.gmail.com with ESMTPSA id s11sm4860407wrm.56.2020.10.29.06.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 06:17:36 -0700 (PDT)
Message-ID: <b15be544910d17ec6b22af8a5ea50dc1958c97d0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 00/21] Updates the gstreamer to version 1.18.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Oct 2020 13:17:35 +0000
In-Reply-To: <CANPvuRnJPi06YBz1uL8tc39DGszd0Q3UGX9rAMaQg2xDtHjD6g@mail.gmail.com>
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
	 <6c5cc7223aec5587143b1d7e165346494a4ab77d.camel@linuxfoundation.org>
	 <CANPvuRkMioP_k1f6=xj3Gn==wQq-JUtzqcux=sCV98CibvKFrA@mail.gmail.com>
	 <CANNYZj9x+mWxJ6NnUarwF3Q1YjoqmDYq83ZwFc8aQY2fyQjtuQ@mail.gmail.com>
	 <2002eb09317f295e090792f561e8ff33a67b8e96.camel@linuxfoundation.org>
	 <CANPvuRk13xJMo=AoTc29=BwCTqcgB56bNsQ4DuSNC2SnhuGwAg@mail.gmail.com>
	 <CANNYZj8Yzap6Np9_RndKXDEEJU1pYUFdbQcAQk5j+u-q_wxM1w@mail.gmail.com>
	 <CANPvuRnJPi06YBz1uL8tc39DGszd0Q3UGX9rAMaQg2xDtHjD6g@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-29 at 13:10 +0000, Jose Quaresma wrote:
> It is dropped because the all the code is now LGPL-2.1+
> I have reference this on the commit
> The LICENSE_FLAGS = "commercial" is there on 1.16 because the copy of
> the ffmpeg on the archive

I think if libav needs ffmpeg, it will need that line (with a comment
explaining its due to the dependency). I'm assuming libav without
ffmpeg doesn't make sense/work?

Cheers,

Richard

