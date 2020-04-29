Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.3163.1588173328563113146
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 08:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U1ezGkTF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id b11so2992332wrs.6
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 08:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ce5P+SVLqtcpUKj7KtciB6eNUUf0OSEN7nRNXaoO/WY=;
        b=U1ezGkTFbxiknHhUFfpTOwWMI/86sipieRsYsXrg/skJYs+poiL0kN3bXld93NSnQ4
         7CDFmIH+I1CNV3k9svnyPhiIHoNmt1ASRxch+M1gPpLkdApsJpFvYDmR60EhNuLi7pFw
         VUlvJ9nJV39zpfA6mCmskwUmMnGvsm+HrLgwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ce5P+SVLqtcpUKj7KtciB6eNUUf0OSEN7nRNXaoO/WY=;
        b=iFIBUbkxDsZf6RGKfGlc1TOc0BI8VUyyPOvPDeuzSt4EvlnrTx0VbRm6VH7bIBmCgQ
         fc5BAjCmzUt7wYickngbnmLkeEEzOgdeJAJbHeit93hjG6XssEOZndH/9ETswLltN4iR
         v4zt45TtuEZDKRFRHXEs2PGP/p7HIcFnfPsW7fXie4+A7IN42ns9ksOaSmpN72YsCyLh
         DNIMR+IEY19jlzSXh7WGaAEO8Ea/V1XzA3HrtH2rfiO3vSATz5zH2qL4a0CcRvSAVYXN
         lJyaD294dB9migNrxwuVxRm/FGlSGVPltLlvqn08RXRKxtnRAOAp7JkizarcTrRmYHfN
         BYjw==
X-Gm-Message-State: AGi0PubK7bnteQvV2kFmXwy3/3PFSNBPBB0aGdXakkek6uQz28FF/PHy
	mMLXmRKlD7WcIvVJU4MEYR7X3vtCyoU=
X-Google-Smtp-Source: APiQypITBl8yHsGqvjsFd4jsaEspnehed6aI0DQS83OlFDSDjQuycdkA8fmhXhNhEn2flyt61ui/Cg==
X-Received: by 2002:adf:f5ce:: with SMTP id k14mr43009728wrp.39.1588173326796;
        Wed, 29 Apr 2020 08:15:26 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id e21sm31884878wrc.1.2020.04.29.08.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 08:15:26 -0700 (PDT)
Message-ID: <c50011f9175ac1a7fa09bf6b60494defcaef1f92.camel@linuxfoundation.org>
Subject: Re: [OE-core][zeus][PATCH] systemd: Fix CVE-2020-1712
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org, "wenlin.kang@windriver.com"
	 <wenlin.kang@windriver.com>
Date: Wed, 29 Apr 2020 16:15:25 +0100
In-Reply-To: <efdbc65e2ec15290bf434e671cdb7bc3c16b6dde.camel@intel.com>
References: <20200428083626.58382-1-wenlin.kang@windriver.com>
	 <efdbc65e2ec15290bf434e671cdb7bc3c16b6dde.camel@intel.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-04-29 at 04:47 +0000, Anuj Mittal wrote:
> I wonder if it'd be better to upgrade to latest stable release for
> v243
> instead which has this fix.
> 
> Does the stable branch policy allow that in case of systemd?

Yes, we allow updating along upstream stable branches for our stable
releases.

Cheers,

Richard

