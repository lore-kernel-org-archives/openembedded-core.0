Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.15478.1601994461862014588
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 07:27:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FQ09zmnC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id d81so3152617wmc.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 07:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=i8jGGmJgHhY+yGLnrEpFXCr7RVl6jLzW7ZEx1wj22us=;
        b=FQ09zmnCtvxQ9cHqueJtbjpGrpLdvNFvZjVR6meVe8IETwP/C746sm8v2EHEe2FVmv
         Son+Rp61HYJqa8FNr33JiRDwsIlWwHO2vJSXklIgxKY0iU5m+ObEx/FZ1xvZQOx+wO4k
         84OZWhmwji0IbRf5NuB0+ntKlVurz5MzdJwqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=i8jGGmJgHhY+yGLnrEpFXCr7RVl6jLzW7ZEx1wj22us=;
        b=D0X8Ia5Hq6LKMZKvxvjzl0BP5Yw1zDRMiAKyWDRF6rJ8wC3IHQWvRHPJwXbDIUyHrs
         MQGsL02c9TX2udBCpALRAED773IGhA73FszdeU4fhQ8KZSF81aGD0seyPszlT2GLYHAc
         d1+x5/1+zajtZ+FDTuIhasu/imFhJjVNXZoFMrjqtsgxMqA12Yj9Yu0kA5aKvqJ0jNGO
         Ipjk+eHgkoH7c5zCd1II9LhR/5kay7JzQN8LaOlpJrWWV0VM5i94jCIPILysbzCjt1S+
         HQUTPqRvECEl5Jx5NN4JiMIqAggul/Sf0LTZm/kXUL1QxHebOdX8gep5eLvqXSr/Spmq
         E5fw==
X-Gm-Message-State: AOAM531SZeG4TF4sQ91DtLK9jORNO4Um9odzzBZr8EOOty0pGHKk76rW
	t+fZlzpyc+7HF9hdNlbKbWXfbw==
X-Google-Smtp-Source: ABdhPJwQW18MdAUltBSqOykwF6AUnuc9aM4MN8W46ChYgkil1U8K/+W8IuiLiFnsjdIRK8LVXvSTEQ==
X-Received: by 2002:a1c:7308:: with SMTP id d8mr5167575wmb.55.1601994460173;
        Tue, 06 Oct 2020 07:27:40 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f8f3:ac6a:4801:78cf])
        by smtp.gmail.com with ESMTPSA id t202sm4755815wmt.14.2020.10.06.07.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 07:27:39 -0700 (PDT)
Message-ID: <d988f9d69fdbc8fde674b0e2041d92a6807e26a9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Revert "kernel.bbclass: make dependency on lzop-native conditional"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 06 Oct 2020 15:27:37 +0100
In-Reply-To: <20201006142607.axiegefkixioktnf@pengutronix.de>
References: <20201005141838.8559-1-m.felsch@pengutronix.de>
	 <7b89c7a13fa964cd4ce706137bbc41592431fea3.camel@linuxfoundation.org>
	 <20201006142607.axiegefkixioktnf@pengutronix.de>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-10-06 at 16:26 +0200, Marco Felsch wrote:
> On 20-10-06 14:27, Richard Purdie wrote:
> > On Mon, 2020-10-05 at 16:18 +0200, Marco Felsch wrote:
> > > This reverts commit 1217ddf070261c5fe523729b2a833bd38f1e4ccd.
> > > 
> > > This commit breaks compiling if no initramfs is used because the
> > > kernel image can be compressed too using lzo.
> > 
> > Can we detect if the kernel is due to be compressed with lzo
> > through
> > any of our configuration variables?
> 
> I thought about it too.. We need to grep the .config and check if the
> Kconfig was set either by the defconfig we are providing or by some
> inheritance.

Grepping the .config isn't an option as we need to determine this at
parse time. I did wondering the kernel type/output name style variables
would tell us but it sounds like that isn't the case :(

Cheers,

Richard

