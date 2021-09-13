Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.27658.1631530506053063659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 03:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EI4XPvQq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id g16so13997521wrb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 03:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=9JcUUoMBT1+F/0jKt8a1clgYfXWTyUMSn+VSKU6bHS4=;
        b=EI4XPvQq9lLpwV9PdQGhsRKvON7BthVg6DG/90rbVEBPHO2swRsuqIbX66Avt6T48X
         WtebE2UcAyipnaKY5mYRpsd24N2QzHpubG6pZzlwr2CwFA0Cek1Vj68SFDNIJNtqDmhU
         fGDWmbYr6l9Ezhg/kkW40kUvM4WGajX5kGNXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9JcUUoMBT1+F/0jKt8a1clgYfXWTyUMSn+VSKU6bHS4=;
        b=tijJY2NLZYJ9OClwtpcHvTn/lDOhre/I+10OKAW92DNaqtxOYxa/f+rrkU8lv+JtNV
         JSBLOKRqwDvLU/lRWV7M2r1l+AidBG8kz3khNEO04wVt0oow+hcPzEoL8LX5ZP1uHXhC
         m0Zk7PPF399DthWf7Cf/gUCLVu9hvKPMw4+hirG2RzGSUaeTl5osbWOwSsvYXsc4r7gY
         76lG8ghUP43v+AE5wnD2t4plO8Hha36oSMw6rdj7odgPWY3X5pYWtXUKgH2kejlA5pg/
         NRagM6vb9VAiIU+Z+YfCqo83L974BH9aGSGSD8LrIctNEbYxarroAbKEWOuTxbDv6JPV
         G0OQ==
X-Gm-Message-State: AOAM530ED1TnJ804Iqn8WgYq6WIjcQvvaaLBj5IKpcEvtmyXlRkynjPo
	Yuez8h3SjT2IF5Hr/SWvCpWmGQ==
X-Google-Smtp-Source: ABdhPJwhiMh/Q+3Somf+5AZhvAVbf07liEoGwID/uv2vsvotw1ixt8N9jL0xXr11s63JbpL8MFK+Ug==
X-Received: by 2002:a5d:560e:: with SMTP id l14mr11451768wrv.205.1631530504379;
        Mon, 13 Sep 2021 03:55:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f7b8:8478:e47c:cb85? ([2001:8b0:aba:5f3c:f7b8:8478:e47c:cb85])
        by smtp.gmail.com with ESMTPSA id y15sm7479294wmi.18.2021.09.13.03.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 03:55:04 -0700 (PDT)
Message-ID: <1adc6851d1f27a41acd90c4c7ba755126743f3ac.camel@linuxfoundation.org>
Subject: Re: [OE-core][hardknott][PATCH] cpio: fix CVE-2021-38185
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, "Mittal, Anuj" <anuj.mittal@intel.com>,
  "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Sep 2021 11:55:00 +0100
In-Reply-To: <5389a90e-bd2e-3950-e4fc-4d1154bd8073@windriver.com>
References: <20210913044935.30958-1-Qi.Chen@windriver.com>
	 <24d8ba47f26a0d99ac4f0f158283d68c3f13ecae.camel@intel.com>
	 <5389a90e-bd2e-3950-e4fc-4d1154bd8073@windriver.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-09-13 at 16:33 +0800, Chen Qi wrote:
> Just found that Ross has sent out a patch for CVE-2021-38185 and it has 
> been merged in hardknott.
> So please ignore this patch.
> 
> I'm also curious about how you spot such issue. By double checking the 
> commit logs in cpio repo?

I had looked at this one a little as well. I'd looked at some of the discussion
from the debian community on the CVE and noticed they talked about regressions,
which prompts you to look further into the issue.

Ross' patches in master included the regressions fixes too.

Cheers,

Richard



