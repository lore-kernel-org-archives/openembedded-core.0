Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.8278.1602921321346900034
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2020 00:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MLMHB1Ur;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id h5so5936666wrv.7
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2020 00:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=7Uo986a2U6JlaUS+n3ZbcSdwkA1EeP/5kNF16BGt62E=;
        b=MLMHB1Urlvx7jkC/ME85iEELZ/j8twXFAm2RCn9kp4jjxT5/89PNaqGxDMhoEYmuvN
         NGouaLJINGxHHApAwBIeT5BeyO8kOHrrlczUrkyoOOUi4Xl84J9s48G9uNqNdpWhqlQs
         MQ9GEUzjNwTglvEwyZJCE/TMhUVuuikWbr8S4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7Uo986a2U6JlaUS+n3ZbcSdwkA1EeP/5kNF16BGt62E=;
        b=WNWnLykjpI/Sa3Lwwzg1ZNKr1YqvsCbM/UMS/7OMayjS93/7m4F0+dFIqBhUo8he85
         JcgsMyGOIOQTlZ32vI4/lQGUYbqktUXTu0J3n0rDHm5JZ/dqS8wSLViPklG8Z10C6U8S
         zHP7OHCGUX6uDktdzDSKEocn1Ptfz31sWPuG5eDGNDqGL7WKW2VMwqPSfHHJFJSYfYRZ
         fzrdyss3rVOnub4myaDWK07abVhAxCOirlXLfh21wI5Ee06Urkj+j+hLhYX90tCRZ2B2
         d78jdwVEfYNiIyXh2Oloy4J/6LOByXSm62ojmPp+O5XnWxpoVHehi4Dd2ctQyZdA61fx
         fEJw==
X-Gm-Message-State: AOAM532LIPmGTwrUcIDEkpojAP2YvkrqwzT3XiUhQFs45VgkAN2m13Zh
	4XtlY4ur7SbwuN92vTmMOqMGGA==
X-Google-Smtp-Source: ABdhPJyqHOXahg7tNMzcGNjJPEQYBKsg95JROVg8agC8jw1CqWZwzZyZ5ZemESXpDXaWEPKwP+oD4A==
X-Received: by 2002:adf:ee4c:: with SMTP id w12mr8496907wro.22.1602921319755;
        Sat, 17 Oct 2020 00:55:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7d78:e5d6:b970:ac7f])
        by smtp.gmail.com with ESMTPSA id t83sm6772543wmf.39.2020.10.17.00.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 00:55:19 -0700 (PDT)
Message-ID: <c4b7539b1a57fb2b32bb68345aaaa8b807a7349d.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 1/8] Revert "package: get_package_mapping: avoid dependency mapping if renamed package provides original name"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 17 Oct 2020 08:55:17 +0100
In-Reply-To: <CAOSpxdbZ9yKWyLkALJctu5BCP77AX=PSNWuBffNa8snxMOEgjw@mail.gmail.com>
References: <cover.1602771116.git.steve@sakoman.com>
	 <163E30094343B958.12811@lists.openembedded.org>
	 <CAOSpxdbZ9yKWyLkALJctu5BCP77AX=PSNWuBffNa8snxMOEgjw@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-10-16 at 04:34 -1000, Steve Sakoman wrote:
> I've included this revert patch for comment because I have gotten
> several requests to revert and I'd like wider discussion of the
> issue.
> 
> At the moment wireguard is the only known recipe that is failing and
> there are no proposed fixes.
> 
> If you are aware of recipes in other layers that are affected, please
> let me know.
> 
> And if someone would like to tackle fixing wireguard in
> meta-openembedded that would be much preferred to a revert.

It would also be good to know if the issue exists on master or not. I'm
worried we may have the issue there as well which is a reason I'd
favour looking into and understanding this rather than blindly
reverting. I've not seen anyone have a full understanding of what the
issue is as yet.

Cheers,

Richard



