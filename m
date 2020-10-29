Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.7999.1603974758576872141
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 05:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RTuqYrOA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id k10so1234323wrw.13
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 05:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=94ZojrF2MtD+aLq7mGImy36Kb41q1IgETfObqpwBNDg=;
        b=RTuqYrOAzvGxReKmvkfeOcuRVuGLO9cqIjXBmKvh26CgzAvg4uhuwklDt6dYvggX3E
         ZEkkPin4PepUEWQidY3D2BKJCuc0biyDsjoG3Xl7pdzoJ8KNApgUddcr/UkuSqBphUVo
         aAPrz7vSsEcM7OXbDOVrOVFazAT+uVCLaqq3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=94ZojrF2MtD+aLq7mGImy36Kb41q1IgETfObqpwBNDg=;
        b=UuvAdM/tAomqj51f2jToC0tmnCrkdsTGigxiM/HPXiryVI0/e4DPHu3L86LoWtVyNJ
         fnzWLS+4WG4p8RzlWFHfsn4Rv80wjdVkPPNhHg2OxNfdSgyxzk/BSvzdwM5S+jpg1X3U
         +0/LoM5Fx07MIZDYutExiXe9GyuDyBqSAoVdwBgu50s1p46Tx6XfLk8sijFpqOQu1VkU
         9EIos+nIfAvk+N7RkwQJoyIPikMpnFuYcBp2RIXFPBJ8TSWwOB3VFhRGIuE62Il24JQq
         4ke7kzOqrZqvVuKuEMndCPZFsWfaK3W5lFXO5T3P2M3Y3WahSszvcyANgaMhDU0rFKNk
         deLQ==
X-Gm-Message-State: AOAM532+uoBo8q6RLPrDZg2H3IvQu/mfjT3aN3OuMtP+X50gNGqYMfOd
	Wbgm6kkeSCpRp5QS5rOs9gYByQ==
X-Google-Smtp-Source: ABdhPJwCIwhnvw3K8r0JhK1gMuNlhDgcMp4od44p/yorrX/SKXm6B8TCA+w8MXixulD365j9a2xVgg==
X-Received: by 2002:adf:dd8f:: with SMTP id x15mr5697450wrl.124.1603974757204;
        Thu, 29 Oct 2020 05:32:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.7.e.c.f.b.4.b.6.c.1.d.5.8.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.7.e.c.f.b.4.b.6.c.1.d.5.8.1.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b185:d1c6:b4bf:ce77])
        by smtp.gmail.com with ESMTPSA id h7sm4770872wrt.45.2020.10.29.05.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 05:32:36 -0700 (PDT)
Message-ID: <2002eb09317f295e090792f561e8ff33a67b8e96.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 00/21] Updates the gstreamer to version 1.18.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Jose Quaresma
	 <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Oct 2020 12:32:34 +0000
In-Reply-To: <CANNYZj9x+mWxJ6NnUarwF3Q1YjoqmDYq83ZwFc8aQY2fyQjtuQ@mail.gmail.com>
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
	 <6c5cc7223aec5587143b1d7e165346494a4ab77d.camel@linuxfoundation.org>
	 <CANPvuRkMioP_k1f6=xj3Gn==wQq-JUtzqcux=sCV98CibvKFrA@mail.gmail.com>
	 <CANNYZj9x+mWxJ6NnUarwF3Q1YjoqmDYq83ZwFc8aQY2fyQjtuQ@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-29 at 13:20 +0100, Alexander Kanavin wrote:
> Wait, ffmpeg has been available in oe-core for a long time:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-multimedia/ffmpeg
> 
> So the issue is not the absence of ffmpeg.

Right, that shouldn't be the issue. I think its the disabling of X11
that is breaking something somehow.

You can see the configuration used at the start of:

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2629/steps/8/logs/step1b

the key component being:

DISTRO_FEATURES_remove = 'x11'

I think ffmpeg is being disabled due to x11 being removed but something
which depends on ffmpeg is being left enabled accidentally. 

Cheers,

Richard

