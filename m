Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.13868.1600344334546497807
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2020 05:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OOFLKDhg;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id c18so1773433wrm.9
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2020 05:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JD6A1AqTfmD2uaLaYj/gjOMD53VOhQ6V2s08s0wCGDk=;
        b=OOFLKDhgreNqBaKMvLsoEiJt6ZTnPAHVBOzrxLO8SvTJwTR7B5oITK3A0DK66zwA9c
         kWlVl9xarKybGej4OPmoSEUvDVA7u0itEFdwo9pknKOf32yh+I49PeaJ/DjNGPuA7+Mc
         I5mx7R3ZN6gJPEATaARrkKVWeJ5VViSL0uKtR7rZSs1Z6EA0kFWZvIdoEsG8njxzt3DT
         M/VxQJ3z/0FfFtcDZQacdGKxYVnNavLXvT5dzW2SR0745eox4iq5kb/+6ZLiHUlqrjdx
         wzLE0haizvL2cBp6ja+7SfBBpW+U2qXt8Z1OkXYxGiNyUJqhWe17Q2SQHRkM9Aey9enn
         KQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JD6A1AqTfmD2uaLaYj/gjOMD53VOhQ6V2s08s0wCGDk=;
        b=Fs4Ed740qsfoRtJkaGgy3KlaskILMs1dydRMVpnuCrjMOth+81i2B1zhAOteYQnNza
         WSHGiDTTleW9lBwLXvSfAouXCKZnqiHZHNQxXDYqY874+a9G28knCC/OaKmtitdKKEha
         qI3zUIC3fMTHM5Yb04MEmX/KPzE8ECFkH+DznmRDnTESyP1f5OJrxLtxd/GPjOviCXRK
         gqq5HOlzSmdizirXkP2kYh9wTuCiucsnWjRJHsnxtITj5INxu07kRGXb6ePcN8QME4zW
         fCOeBEzdp2DKPhRQfP6aoeAg350IiCl2qWLnU36fz5ndmz037qLKNWewAKgRF+Lbypmn
         M2vQ==
X-Gm-Message-State: AOAM533oqIskU116+5zEVD7ov+C13u2GGdMT3430H2+a+ZHN03PNedod
	GNnY8nxvpgo/bqBSkTDiSmoyk60gNCg=
X-Google-Smtp-Source: ABdhPJzaufXXhiP2cL3fkxpb/TF94qzDLPoiM89UymJWdSMaIf80r83Cl21RdTIhjT/YGEULawQ/Vw==
X-Received: by 2002:adf:91e1:: with SMTP id 88mr31351954wri.305.1600344332656;
        Thu, 17 Sep 2020 05:05:32 -0700 (PDT)
Return-Path: <oecore.mailinglist@gmail.com>
Received: from [192.168.42.52] (ppp-2-86-237-227.home.otenet.gr. [2.86.237.227])
        by smtp.gmail.com with ESMTPSA id a81sm11532899wmf.32.2020.09.17.05.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 05:05:32 -0700 (PDT)
Subject: Re: [OE-core] [meta-oe][PATCH 0/5] ARMv8 Tune reorg
To: Jon Mason <jdmason@kudzu.us>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20200914151359.11240-1-jon.mason@arm.com>
 <442cfca7-9e64-c161-3f7e-af858472e910@gmail.com>
 <CAPoiz9wRF+A4UntZeE=OieVkYeAxts5iLqRUpwfg8MJTTWx_Yg@mail.gmail.com>
From: "Robert Berger" <oecore.mailinglist@gmail.com>
Message-ID: <f7fb890c-e200-19db-297c-efb38af5e361@gmail.com>
Date: Thu, 17 Sep 2020 15:05:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPoiz9wRF+A4UntZeE=OieVkYeAxts5iLqRUpwfg8MJTTWx_Yg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Please see my comments in-line.

On 16/09/2020 16:38, Jon Mason wrote:
>> [1]
>> https://yoctoproject.blogspot.com/2020/09/compiler-tunes-benchmarks-with-yocto.html
>>
>> Should we expect so see differences?
> 
> There are more things at play here than simply performance.  

Hmm interesting. This did not cross my mind at all;)

> But
> speaking of performance, there might not be much of a benefit between
> a generic ARMv8.0 and a ARMv8 based core (like A53), but I do expect
> to see a performance bump for a ARMv8.2 based core (like A76).  The
> delta between the former is much smaller than the latter.

I guess you mean between ARMv8.0/A53 and ARMv8.2/A76. I'll need some 
toys to run tests/benchmarks there;)

> 
> The differences are not only performance.  Tuning for A76 versus a
> more generic armv8a allows for security features like
> branch-protection to be enabled (as it isn't supported in older
> versions).  You get these kind of things "by default" when tuning for
> the specific model.

OK - This is a very good point I completely ignored so far. I guess this 
will be tricky to test.

> 
> Thanks,
> Jon
> 
>> If so can you suggest benchmarks which show those differences?
>>
>>
>> Regards,
>>
>> Robert

Thanks - I updated my Blog post.

Regards,

Robert
