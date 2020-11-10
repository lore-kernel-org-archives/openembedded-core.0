Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.25981.1605004843152610161
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 02:40:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TMF+Kd+k;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id c16so2510674wmd.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2020 02:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=BXB8wirYV2qdwGF47LFfoU8hu0DAUTHDDgMuJPpEgmA=;
        b=TMF+Kd+kAjVeRr3/MqtsOnwkejHxJEu62LqY9thcCLMgVS89qAe3oSHx4YTQG6iOm7
         cQBmqUXZ90AEzMvblZyF1WhSlrSmxcWKKWPAirj3j2Yx4+QAF2AoTf8b6rSaCTztHhjn
         pphY+4ozyIpaEdRjJByLvdLAgzKTDzIfGHheA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=BXB8wirYV2qdwGF47LFfoU8hu0DAUTHDDgMuJPpEgmA=;
        b=XkhNQRHr6CA914qBe8wMMoo9Q1uqBVnYYE/RHq31qUedwFNarqvACFG33PuaTeQYq2
         CJ6eRLAU49G24413RqUiQksN9BlM3dp6XCEOiVkrEdF55sZaZStteeYE3VlMDEMJcZzA
         RKUT0Br403z8dhEorsu8EBg2v2tVwu/noukcwfguVk27rL9J3X2ln9YmQdSyMP46j6Vp
         EyIQO6bE5WkQ4c6Zu1+LlQWiICC0A5RZDR4TgUciaFGa61RepXb7FrU0XHp2R5e5WtzH
         r1xrt7b9b9xirLb+oDO56+DHaMG5C2HWanHDh1HXpeaDd/iNvbdBBt2DrulUOfHm6TND
         vSNg==
X-Gm-Message-State: AOAM532nnaUONiaBAQ2Mg7s8aCmyk3cjv7+HdNYO6od4U7+ZYhcRRRiP
	jHJ1TUaMhjsD20DXWgapm6iE4g==
X-Google-Smtp-Source: ABdhPJw0wo7ngRJFClObGR9XvdjswKqLV4EGXnwCJKg1W4+mZOLbgbN88MJGldE9DXzX4DQ+H8Ay2w==
X-Received: by 2002:a1c:5545:: with SMTP id j66mr4184484wmb.31.1605004841572;
        Tue, 10 Nov 2020 02:40:41 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 2.f.3.d.1.3.3.a.9.f.d.f.a.e.5.a.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (2.f.3.d.1.3.3.a.9.f.d.f.a.e.5.a.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:a5ea:fdf9:a331:d3f2])
        by smtp.gmail.com with ESMTPSA id i11sm9638780wrm.1.2020.11.10.02.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 02:40:40 -0800 (PST)
Message-ID: <0fae166aace24cdd108d379cc4febd61efaf04d7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] openssl: Add c_rehash to misc package and add perl runtime dependency
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Federico Pellegrin <fede@evolware.org>, 
	openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Date: Tue, 10 Nov 2020 10:40:38 +0000
In-Reply-To: <CAM6O0Zj3fRQkqTtfDs4s-AdQo6OQgmgc3db4wXG75oyMNZdmyw@mail.gmail.com>
References: 
	<CAM6O0Zj3fRQkqTtfDs4s-AdQo6OQgmgc3db4wXG75oyMNZdmyw@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-11-10 at 05:20 +0100, Federico Pellegrin wrote:
> 
> 
> The following changes since commit f075071761172c69f8ae2be5868d51ef9ef646e7:
> 
>   conf: update for release 3.2 (2020-11-09 13:16:13 +0000)
> 
> are available in the Git repository at:
> 
>   git://push.yoctoproject.org/poky-contrib fedepell/bug14083
> 
> Federico Pellegrin (1):
>   openssl: Add c_rehash to misc package and add perl runtime dependency
> 
> 
> c_rehash implemented in perl is back (in history was moved to shell for
> some time), so handle it inside the -misc package so just that one will
> carry the heavy runtime dependency on perl and not the whole openssl
> package. Note: in misc there were already before a few perl files
> (tsget.pl and CA.pl) so the added perl dependency will fix those too.
> 
> [YOCTO #14083]

Please send patches as plain text in future. I applied this manually
but the whitespace and line endings in the patch were mangled (even the
append was missing whitespace in the plain test version in the email!)

Cheers,

Richard

