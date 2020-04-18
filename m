Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.8628.1587253179360695000
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 16:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g80cPu/5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id j2so7477905wrs.9
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2020 16:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=OQ4dZhqvJqEQn9oWUxaOhPD8SpdKC3X6u1orhXt0Yqg=;
        b=g80cPu/56GkT2d8+wCveQz6LU8duWa7baF0Ep9wss4kivGtF216ykFgvEhLcqaMgEC
         1LCP+xrY5NRPIew2/0yOclsUIUFWO8ZdkbOFYC75Gq7Wkx3vyfbzIOcn5pcZ/9rWHs9V
         A7GjyIRnYJclXM7X3wzourTO13tpCH7d2LKBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=OQ4dZhqvJqEQn9oWUxaOhPD8SpdKC3X6u1orhXt0Yqg=;
        b=QH5KFjfjymrBajluYPlIrstjRkyDaOvxxlpmRdal1YAZOOvHRYhoItVAW8bn2So1Ve
         V9K4y9iEfqzPYPTMPAAHRU1X4z5ubT5H/S6rJHHLEGFLbGmsq2ckR5UIgK4OmUjO6Gbh
         Sjk7RWQZ7P2fbkwiczi6wrQQfMNlLDNzdCfdA2iT9Q1793gmlXpIsYX851hioq07Jgvu
         1zASVfL1LU6/OoSp954HYFM5wEu7Lb2mcEs6j1zO/D1JOcmyIo0esGm5A2EZVuD9Y7/x
         D6ZIryUNV3zri+mPmvvjZToHht9GRrDD9JHrxw4DX/0ehJrErjiLIgxxXbAne4jwnoYx
         W14A==
X-Gm-Message-State: AGi0Pubdzm7y1yHFcXhwAEeDdVg6kMM5R7MNaGMgnzdqFAogfFjk11Fh
	WgnOjJDPuXoPbVThnr4KXf/jBw==
X-Google-Smtp-Source: APiQypJqE87sOuQrg56CX3dUlfB4GvSdlfax0VvbmSicLpZ/UQ6JIfXAu9kw33WUyFLawDo3NejG8w==
X-Received: by 2002:adf:dd8a:: with SMTP id x10mr10081036wrl.308.1587253177912;
        Sat, 18 Apr 2020 16:39:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id m1sm32279774wro.64.2020.04.18.16.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 16:39:37 -0700 (PDT)
Message-ID: <d2f052416cef21416444e08512f84dd8c4f1aeca.camel@linuxfoundation.org>
Subject: Re: [OE-core] why does oe-buildenv-internal check for -z "$BDIR"?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, Christopher Larson
	 <kergoth@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"chris.laplante@agilent.com"
	 <chris.laplante@agilent.com>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 19 Apr 2020 00:39:36 +0100
In-Reply-To: <alpine.LFD.2.21.2004181815360.571354@localhost.localdomain>
References: <alpine.LFD.2.21.2004181159130.1300328@localhost.localdomain>
	 <e610ad1ecb7cd084ab61fe4bcf56b01568c5edc7.camel@linuxfoundation.org>
	 <alpine.LFD.2.21.2004181235160.1301461@localhost.localdomain>
	 <DM5PR12MB24711A9EF9D90BB86E95EDAA8BD60@DM5PR12MB2471.namprd12.prod.outlook.com>
	 <alpine.LFD.2.21.2004181320230.1304434@localhost.localdomain>
	 <fc3149fc55b34156baee2c375002a2a6@XBOX03.axis.com>
	 <alpine.LFD.2.21.2004181605480.8183@localhost.localdomain>
	 <d1b1bb06-3222-4073-831d-7f25e2566ed5@Spark>
	 <alpine.LFD.2.21.2004181815360.571354@localhost.localdomain>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-04-18 at 18:17 -0400, Robert P. J. Day wrote:
>   that actually matches with what i concluded -- BDIR is dead and
> gone, but i realized that BITBAKEDIR could still be useful, even if
> it's currently undocumented. so i'll submit a patch to ditch BDIR,
> and leave all else as is. for now.

BDIR allows the build directory to be set explicitly from a script
without worrying about which shell is in use.

I'd note it is used by scripts/build-perf-test-wrapper in yocto-
autobuilder-helper, probably for exactly this reason (I've not checked
the history).

Cheers,

Richard

