Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.16347.1598526368093384928
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 04:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NVPAz9A/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id o21so4731542wmc.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 04:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=V0p2v4MAwUscYAV+PipUdUb8wGBz6+uoOOYZxnk9oFo=;
        b=NVPAz9A/RcmtDY81IaXCNIGOYBc3LM5+LGLo5VCPI2HipHr9c8ThZfWIfwniPqjSSv
         UV3lxDrT3oPtMfjXk3E2D8h154lED27f/KfAhEb0hssXmrSlCTntct6xuybIsgbINYeF
         RsdgZrpi4sythJp3YZNHpavA2FMGPfDU6z1Cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=V0p2v4MAwUscYAV+PipUdUb8wGBz6+uoOOYZxnk9oFo=;
        b=eUlSaGlG+R8c/iAzAE27EK5T38uqMh3Wm/nrL5g7P8CN/rtK/VQ5J69HL3MfHSaaBM
         TUAPs4vcP7mrn21gXGDqSl1dB2rTNDrqP0ZZqe+OZPMm9XaAost5k4wVmPw96jbkSzv+
         P/D4P9jeWYE/qWWz9LBAH8QuKsRoexcJPFNo4YaogjWY2Z3Eij71DvpG9yQcfOIkKjZh
         EKpxZqhhn7fPITg8KsxfuQKsPSNpea4DJkBKAZtb1tYa0oDYSceBsKrbdWCOB+NbLgbU
         6Uet/uNErUvIYYpYgmV1BuXJYHqECnlibK87Fzxj4jjaSYojoo5c+dD6cWuXcezkUrQj
         1Gow==
X-Gm-Message-State: AOAM530wmUuTBIOQei9BipxkLdEhm4mI+jSgDRIId81ln8IIiSPVY/6q
	i9X/aa9Tj0FE2PtXA7M93XCm4w==
X-Google-Smtp-Source: ABdhPJzNUTG8Ci5okWgezfp+zKyMi5ww/wZ3fGdczqQZxJISEqlRqkQ4P7b67/f/7K7c8R4AoYSodg==
X-Received: by 2002:a1c:964b:: with SMTP id y72mr11460047wmd.69.1598526366434;
        Thu, 27 Aug 2020 04:06:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id c4sm5055401wrt.41.2020.08.27.04.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 04:06:04 -0700 (PDT)
Message-ID: <7c38e0ce946af6c0f1075b95c5f41e6f772c9241.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 6/6] oeqa/multilib: un-skip the connman test
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2020 12:06:02 +0100
In-Reply-To: <20200827105933.3575-6-alex.kanavin@gmail.com>
References: <20200827105933.3575-1-alex.kanavin@gmail.com>
	 <20200827105933.3575-6-alex.kanavin@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-08-27 at 12:59 +0200, Alexander Kanavin wrote:
> It was previously skipped as it was expecting plain connman
> to not be in the image, and for core-image-sato connman is always
> there.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/lib/oeqa/runtime/cases/multilib.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oeqa/runtime/cases/multilib.py
> b/meta/lib/oeqa/runtime/cases/multilib.py
> index 56aed62eea..0d1b9ae2c9 100644
> --- a/meta/lib/oeqa/runtime/cases/multilib.py
> +++ b/meta/lib/oeqa/runtime/cases/multilib.py
> @@ -42,6 +42,6 @@ class MultilibTest(OERuntimeTestCase):
>          self.archtest("/lib64/libc.so.6", "ELF64")
>  
>      @OETestDepends(['multilib.MultilibTest.test_check_multilib_libc'
> ])
> -    @OEHasPackage(['lib32-connman', '!connman'])
> +    @OEHasPackage(['lib32-connman'])
>      def test_file_connman(self):
>          self.archtest("/usr/sbin/connmand", "ELF32")

Hmm. I think this test is only meant to trigger in a lib32-core-image-
sato where lib32-connman would be present and connman would not?

The test name could certainly be clearer as its not a generic connman
test...

Cheers,

Richard

