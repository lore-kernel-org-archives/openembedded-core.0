Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.518.1588083455446241493
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 07:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bI7pS4Hv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id t14so24818758wrw.12
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2020 07:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=7DShVV/Hb8Ex4/rJkHiNBVwdixbY/fzFpc19562NKEQ=;
        b=bI7pS4HvA85TxmxRBGyQIJjnhf2h4r5M/tQqDXrc6r8IkaMSA6Gf9rrqRnI76h5BbV
         idrBhrwvIHb5hp0kFSvaet2DcX/yCJ7vRRJsgV1T+gdzjm2rMi55sngGspwaVctzjaSd
         yGiIjKjSbXb9OsP0y/Vjoq4lsyli+693ofyKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7DShVV/Hb8Ex4/rJkHiNBVwdixbY/fzFpc19562NKEQ=;
        b=Du+SotluxyJmNMSRNVeec8AgrOdrIhmLEJAKtAd0eu5lo9hMGhRCcyD7UCsZ4i1UzH
         9SKMfU1Lo1nJ73sr/W64qmQWYoDS+iTubAsFkM4nev8WcrO/ENNyfvbfPh2TexaiZ2Xy
         AvLUro+H1+srAf1oFZPuu1vEucGbaQfaCV8CY75W4x3LaPIOYh6FDCEYk3+wPwdP3fI8
         PFa01YeFoztrk0FCcI0VdlJnFDm4mtLaWsFp/GgyQusrdAuE+1tvd6tW6d2UXP6UIM7D
         BC78QLFpB7+aqnmSJfnpQUUibWLLJPN6GAPP0QzYi3h8Za1kD8TJ89hY0LkyvPVvEB7w
         fF1Q==
X-Gm-Message-State: AGi0PuZNNB2kcOFBmbKJlZHCw+e1MwCEl+rtp86QPJ8mT7DWEMu8RzuR
	bSYryuEFtv9Uoyo6UAH810PGpA==
X-Google-Smtp-Source: APiQypIRRpa8ioR5C+Cxf4RTOVnAivPRPPwWKildBww3Myxtz8AMxqTKTCf71oZfJs+3Ukrdby9pHw==
X-Received: by 2002:adf:fa04:: with SMTP id m4mr32793552wrr.30.1588083453916;
        Tue, 28 Apr 2020 07:17:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id k3sm28453604wru.90.2020.04.28.07.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 07:17:33 -0700 (PDT)
Message-ID: <c018a2db3552d7757712897ab012139759cd19ae.camel@linuxfoundation.org>
Subject: Re: [OE-core] any value in still supporting PACKAGE_GROUP_*?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Apr 2020 15:17:28 +0100
In-Reply-To: <alpine.LFD.2.21.2004280942150.915506@localhost.localdomain>
References: <alpine.LFD.2.21.2004280942150.915506@localhost.localdomain>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-04-28 at 09:44 -0400, Robert P. J. Day wrote:
>   just noticed that that variable was deprecated waaaaaay back in
> 2014
> in favour of FEATURE_PACKAGES, and i see no reference to it in any of
> the numerous layers i have currently checked out.
> 
>   if someone here wants to take it out of OE-core, i can do the
> equivalent in the YP reference manual.

That can definitely be removed, I've sent a patch which I'll queue for
testing.

Cheers,

Richard

