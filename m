Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.7171.1616497916222891880
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 04:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MEBhagyW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id b9so20335495wrt.8
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 04:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=KhsfelWkvf+X2v4oIUNIGVca/B30LgOILc6d2onhg4Q=;
        b=MEBhagyWbAvzHd/sonEwZCUdj2ttTH0ES0QAY28kLkPr8tV9XMFR47d7+jI/1EVJMJ
         Jaaa0jx5I6J0rIS1Y2ZY0RUPwn7NdNdDeXkYMsfyMs+Isq4sqfYTOadvS/BL0cn/qqM7
         dGAlxALCl8+3/OjcgsbI5GxG7NN6LrTiri8wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KhsfelWkvf+X2v4oIUNIGVca/B30LgOILc6d2onhg4Q=;
        b=MFUaDGK5XERUfPtn1dKXCFnCAr4SUAlgrVRYnDd+a//Buz2fNbRIrlyt6TiZU/yNNa
         o1z/8goK7xaLeEkX8NrnC8ldLz4nioa2orTNPB9IH+cyxkUGi6CgGtnUuYJ2R/9Zv12I
         MTbqShgp5FOFPuQSJR0U1xNrr+etNVgC2FZsYjoyYmWOtHspgkpVGzZ3K5XKeRSzQJnj
         XJWOiBqwsFdrsd00WDgbXjX5G42i0cdwO3R+lB61W1GbBr/V5Ntk5jpOmOS6B3bAD+O5
         HdTdKdJ6ht/tZ/wiYad/ima+h13jgn5hsMbOfC1XEqIpb8uICSgBgNA9HB9+m8SyBvwd
         HGSw==
X-Gm-Message-State: AOAM530gg0jR83EVY/Ys5EClluZSeVLEIjDmbmM3mrGO9toeO8Ln9rUo
	suhdNpjRAq8Iowj8OboJQRm6gA==
X-Google-Smtp-Source: ABdhPJxJDIn7tw/POMxJlTr3w6oZVeQM7TJSvDUbmgmg18O4UrT8FSg4QiZb2sytNFfrb668f4UFFg==
X-Received: by 2002:adf:84e6:: with SMTP id 93mr3236879wrg.376.1616497914584;
        Tue, 23 Mar 2021 04:11:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d9d1:ce9a:66bd:fc35? ([2001:8b0:aba:5f3c:d9d1:ce9a:66bd:fc35])
        by smtp.gmail.com with ESMTPSA id c6sm22642476wri.32.2021.03.23.04.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 04:11:54 -0700 (PDT)
Message-ID: <7f206ae780b0275524b6ee99ed225e9147f976f9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/2] gettext-minimal: Disable the unnecessary check in iconv.m4
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 23 Mar 2021 11:11:50 +0000
In-Reply-To: <32564b97-5911-f9f4-43cf-1189c3b778ff@windriver.com>
References: <166D65C2E097270E.28077@lists.openembedded.org>
	 <20210322075103.9694-1-mingli.yu@windriver.com>
	 <CANNYZj-7gQg41Qpue1ZR3HCBHKQ8veD3TOwbvRYcD5=wv0Pj6A@mail.gmail.com>
	 <d083f9194f73872623f20f81c697e0bff914764a.camel@linuxfoundation.org>
	 <32564b97-5911-f9f4-43cf-1189c3b778ff@windriver.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-03-23 at 14:25 +0800, Yu, Mingli wrote:
> 
> On 3/22/21 11:24 PM, Richard Purdie wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> > 
> > On Mon, 2021-03-22 at 11:29 +0300, Alexander Kanavin wrote:
> > > Note that this m4 file is copied verbatim from upstream gettext, and will
> > > be again overwritten on next gettext upgrade. You should figure out what’s
> > > wrong specifically in elfutils tree, and work with elfutils upstream to
> > > resolve it.
> > 
> > It's more that there is a silly/pointless macro that breaks native builds for
> > us, the issue is in gettext.
> > 
> > How about we set the cache value globally for this macro and drop the patch?
> 
> Hi Richard,
> 
> Do you mean define a cached value for the marco AM_ICONV_LINK which we 
> patch against?
> 
> Seems the definition of the macro AM_ICONV_LINK we want to patch is too 
> long and I have searched via "grep -Rn CACHED_CONFIGUREVARS *" in
> openembedded-core layer, didn't find this kind of usage. Not sure if 
> it's appropriate.

I've sent out a patch showing what I mean, see:
"site/elfutils/libunistring: Drop patching for iconv and set in site file"

Hopefully that fixes the issue.

Cheers,

Richard

