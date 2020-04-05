Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.19267.1586100588235717323
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2020 08:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PGFsprLV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id j17so14280788wru.13
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2020 08:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=xNXjQosuO8WDd5FuX6UHoOAWvuX1pCBD7skwd08nIfY=;
        b=PGFsprLVawWTlK2HyOdKCDXpkP3V57hSFngHM91Duq2EC/KMJnm+K03C3okUu2v4aT
         qh+wRx86seTetiSWuxnh8riXmIbwEydkYuxQUcUmv/yknnBmKD9TiG7iU4WkuA4mN1I3
         2U9G2kgmo66PMIy+kELeJLd3cIE4Ima655Hms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xNXjQosuO8WDd5FuX6UHoOAWvuX1pCBD7skwd08nIfY=;
        b=s6TyprDRtG2mFVzjk6BA7pCi+ch5+7yrrR4r8XoLd4DOQaPr9j73avElmpCTWdSwEr
         Ma1/DRc7GS6CWuh9Ed/FAaM20nIDisdgqcbFVza+j8aCqVdMBxp6XshkH0zbj69qnKS1
         G+3z+swb6mM7CQBaKP0JyNKgxgB/JZuSaevcFPn86VGsrxMYd0EEe4W6OauPJiTZWmci
         JcPROQzotl3w5EPB1q39BCyO1TZro9wL2UtI27lJsHa74bLRILSEL432p7JRjoxf/7iY
         ZHigXeRa8fjEuxcrDuJApRibHHeKgJKt522gS/eTSKnnGBAJ2oyxEwLthpKU4nKVEOai
         SZYQ==
X-Gm-Message-State: AGi0PuZFT3oVR2YJw2GGlEF8SzMT4ruFwpZCCndSjBLMCap+/7Uaz4ER
	OGgeuZ6rEWBneIIhqlHN+QGTiw==
X-Google-Smtp-Source: APiQypJQtlOC+hw5pdhhDP11IhX0YgmMLrPO6WqzFUjKWYVQqqYqsAiH1iigxv3y99bFRWR7L9pcNA==
X-Received: by 2002:a5d:5230:: with SMTP id i16mr19182435wra.15.1586100586734;
        Sun, 05 Apr 2020 08:29:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 106sm11024115wrc.46.2020.04.05.08.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 08:29:46 -0700 (PDT)
Message-ID: <db5856cec86de82a4feddf1cf739ce7eb37c6932.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/2] wic: Fix permissions when using exclude or include path
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	jpewhacker@gmail.com, Paul Barker <pbarker@konsulko.com>
Date: Sun, 05 Apr 2020 16:29:44 +0100
In-Reply-To: <CAPybu_2LZgaDFL-jexc0DcnEb0nzsLpZq30nA4UNufztDsKs1w@mail.gmail.com>
References: <20200304144936.2559106-1-ricardo@ribalda.com>
	 <8a556aedfe46e327c5d64d77c3b282f2108d12aa.camel@linuxfoundation.org>
	 <1602DB74B6717A3F.2403@lists.openembedded.org>
	 <CAPybu_2JFR2Q-id-7Fc5+p=RhKBbscMfEF11rE_yX0bmruqJvA@mail.gmail.com>
	 <ed35318a96db8ac58bde7596f47bb0bfcd27b27b.camel@linuxfoundation.org>
	 <CAPybu_0W9FAQaH17X7jt7+cJU05XaD+3J5owAMvoXurfGpc8fA@mail.gmail.com>
	 <CAPybu_2LZgaDFL-jexc0DcnEb0nzsLpZq30nA4UNufztDsKs1w@mail.gmail.com>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-04-05 at 14:01 +0200, Ricardo Ribalda Delgado wrote:
> Ups, wrong version
> 
> This is the one, sorry.

It didn't build unfortunately:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/837

Cheers,

Richard

