Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.19017.1613906491242818414
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Feb 2021 03:21:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ao3wrn+X;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id m1so11786704wml.2
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Feb 2021 03:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=CsaKRejoY84PhgqYuuEP/zeS/nwYrtyGw/8OVIPvOWk=;
        b=ao3wrn+XUoYFK0gNKfS8+tvTtlS5dcQeO8TfZEmsWMrsNlfl3CwX0xdh+T2Eetho/Y
         fGul0A4m9AJAVzsaPQOsMZ9bwYBXufSmaL9CJpvlfdki8jaYBgGkxCYJejoGM6ZRToVi
         JEGMr3obDdIoy73nWoqkvWX37gPJDZ5/ft6SY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=CsaKRejoY84PhgqYuuEP/zeS/nwYrtyGw/8OVIPvOWk=;
        b=a4CkqaRg77EriwhFG+aY7lWeP2vyjUUF0whYxI1GS84GCwHtmge9ygRwtbvtKnWRBQ
         xhN912iY+fyIm/+k7DQIi4i+wDDn1s2Gb597Ic1VgRAXY3AEGI72pUAFXeqFfindRn2P
         T1/J3LkbSu88rQqnix1FYdApgf/vPr7GhDdJN7lTjMtfyPBApt3URH+/8DNtS8y+A7+Z
         tFo1nkeA2cc3kTGBiRMr5veBN0iXKV+d7OXL7Hp74KlORPv9R2BlZOHdVqnUfaxCwIEs
         rrPDZk/OASVGQJI1cYUXTS4gQ0sL9gC4Hs+TPCQEKuhfQgi2r0Ke1VacPPW0UxxOfLiv
         gzeg==
X-Gm-Message-State: AOAM5325s1p2OERALGOfZUzC0DVXHt1GQ9HdqwYaGlFG3UbqULNtqoHy
	B+E3AgN1lobA3Kt7q43FRZbzuQ==
X-Google-Smtp-Source: ABdhPJwxH9mEtgMxV1QalDhVV0jxiBuVSgc295/RWnwwqMNiL9ZbgieINwD3eeLMuwNo5ExXiy5KEA==
X-Received: by 2002:a05:600c:350c:: with SMTP id h12mr15558611wmq.39.1613906489580;
        Sun, 21 Feb 2021 03:21:29 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:eeb2:36b3:1702:48df? ([2001:8b0:aba:5f3c:eeb2:36b3:1702:48df])
        by smtp.gmail.com with ESMTPSA id b13sm23429223wrs.35.2021.02.21.03.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 03:21:29 -0800 (PST)
Message-ID: <f28ca99de869b3ab09e0f5f0543f11b12cfe67a1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky-contrib][RFC PATCH 4/5] license.bbclass: Add functions to split and canonicalise license strings
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ida Delphine <idadelm@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 21 Feb 2021 11:21:27 +0000
In-Reply-To: <CAN7sTgsLSTjyLvPrtUVjhEBxh1bOVRHkp+9DkO6rEQ4=uJtTNA@mail.gmail.com>
References: <20210217040033.21541-1-idadelm@gmail.com>
	 <20210217040033.21541-5-idadelm@gmail.com>
	 <2efffee96fae455b8cdb77d47c576bfe@XBOX03.axis.com>
	 <06102c024bfec00745d9b2dbde8b19a7fb4207b8.camel@linuxfoundation.org>
	 <CAN7sTgsoLjsnao0ijuidAP_hjTQyibeU7MWHXybbROTU0k290g@mail.gmail.com>
	 <a04c7bcd2ac63ea7a9971f011c4755f741deaaed.camel@linuxfoundation.org>
	 <CAN7sTgsLSTjyLvPrtUVjhEBxh1bOVRHkp+9DkO6rEQ4=uJtTNA@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-02-21 at 04:04 +0100, Ida Delphine wrote:
> About moving the functions to license.py I have some trouble importing 
> a .bbclass file to the python file. In one of the functions I made use
> of a function found in license.bbclass. Just wondering why it's better
>  to move the functions to license.py instead of leaving them at 
> license.bbclass and how I will deal with this import issue

The functions in license.py will need to be standalone, they can't easily
call code within a bblcass, only other functions within that module. That 
suggests you may need to move other functions, or maybe not move them at
all, it depends what the code is doing really.

We also need to be mindful about dependency tracking. Code in bbclass
files is scanned for variable dependencies, so a getVar("XXX") will
automatically add a dependency on XXX for the generation of task hashes.
Once the code moves to license.py, this does not happen so we have to
account for it manually if needed.

Cheers,

Richard

