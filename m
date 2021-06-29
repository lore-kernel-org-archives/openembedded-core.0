Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.7232.1624969714003558615
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 05:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PewXvgVW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id g8-20020a1c9d080000b02901f13dd1672aso731176wme.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 05:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=I+MBADUxw19G/+89IPAEUdUnPAZ9D26Tpa8GFNa1Fhs=;
        b=PewXvgVW2w+cbUkoKFI0wu6LDB2M/CFTpz8dYcUWeMOsRyEO+RlfQnj+Bc+OpWbUrZ
         WAQmMXUJ/oVOZWN0yh6+vzpwnPxjd+SPVhKdUAHk5wEu8DYumszNSLFfjEYCn3Ld6I8x
         Ye27tBbr91voK0/EJYtTfSZqfI7vQc3xShYrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=I+MBADUxw19G/+89IPAEUdUnPAZ9D26Tpa8GFNa1Fhs=;
        b=AhNrYplTO7cPAA6l0yyRzPx/+175NKrRfpSNuYfA3aRQrm2dnEYY86PMOC/EjqhJ/7
         KH+RKM7Fb46/k0f6H+B2LCMNLliU8/jFA2th3W85xNaiLFbJeh8d4hjI+jfiLy4yKhhK
         W7R+eESZeOENHeKw1FLZx1RM1htnW2UflIdcp9rC8532GNfGaCmG6MukmhtzPxvQyE4i
         kM/K7ZQAJbM3l49SruGNs3FXtlp3bpSTGuMruh5MLxdSAVck2SVClnkgPmHSDntENqWp
         /obMPCi7c+rHMXsH+fzHuVQ6meZ8AhxEdx+FqX2rRYKfj6wHPB6W2oqukDcDmZ7OgFGQ
         pzhw==
X-Gm-Message-State: AOAM533ZRdRKijHu+Hk9SJoIbr9Lq9wqV6z7nXIslIzwJ2vPz8ejYyny
	NiH5CdIqlg231bNRMYtXtcmFJQ==
X-Google-Smtp-Source: ABdhPJxYvmKhLJb6q32JM8+HWTUvhdijcIoEYphNV8cyZaV7a+RIZwWrontf4kaVham37Tyf8qayVg==
X-Received: by 2002:a1c:790a:: with SMTP id l10mr32556870wme.117.1624969712439;
        Tue, 29 Jun 2021 05:28:32 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e4cd:1977:5709:51f0? ([2001:8b0:aba:5f3c:e4cd:1977:5709:51f0])
        by smtp.gmail.com with ESMTPSA id r16sm8844170wrx.63.2021.06.29.05.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 05:28:32 -0700 (PDT)
Message-ID: <4aa364fb9dbe0cf081fd1543dc92d7a2086369a8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] util-linux: use the system binaries when running ptest
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Jun 2021 13:28:28 +0100
In-Reply-To: <CAAnfSTvpHY9k9WOsNrY4HmU_BMk+nY-pPyDwSnm2NYy-ejyPyg@mail.gmail.com>
References: <20210628130119.926307-1-ross.burton@arm.com>
	 <9e0cd3d79c36f2b061cf2d751c8b544efffc23b2.camel@linuxfoundation.org>
	 <CAAnfSTvpHY9k9WOsNrY4HmU_BMk+nY-pPyDwSnm2NYy-ejyPyg@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-06-29 at 12:25 +0100, Ross Burton wrote:
> Will this be blocked on fixing those?

It means every ptest build would have to be triaged, so yes, it does really 
block on that unfortunately :(

Cheers,

Richard

