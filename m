Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.4421.1604618585094895624
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 15:23:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KOFmKIFy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id n18so3655440wrs.5
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2020 15:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=E6n4JughKMkHLbjdDRnph2R+jud1iqDmmEP+DCY3FfA=;
        b=KOFmKIFy3UKF4EO+I6KGtah6cOCs39LRPov8kSTNelYq6ThwtUU8ThvnbRN66dtOOL
         +2b2EU/uQjj8K1ul974Pmh8tgkwfFr1EPrakcrRDHIiaT0n9mVZjkFrB/ez/8tQjtoR4
         dBOKGSE8bb28dbtEm2l/1J/u7QBTuSpu/B7o4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=E6n4JughKMkHLbjdDRnph2R+jud1iqDmmEP+DCY3FfA=;
        b=CBRr7HKIV7IqUV7WewJS8hS1dplTEXfT6gWmeDveL/r+O8NR+ob72UINPs5XzvMwE/
         34pmL+pAD3EFRVPVTN+7xKlv0HPsj99FOHfaVdYugAKXPrOrEjHk4iKl/VLs34XRv3cj
         sNLCH0pqlB1w9EHMRfWSpNMdmJZn1UrlSqqn/HdjrDrkHWhxAlYP4MijxXdpXiMP30FS
         f2zFodquLS8gJUk7Lf5q5Wn6cVf4ZqFPLaD4ipUdIK8J58jTnOySCvBnd8GhJkQhedsL
         TmQdwUIRLXtk4bX60dodcQTkc5G7CDBB79ljaGL75nvbBIYnkC7hNr6P/a79eN5BZ0Sx
         tppQ==
X-Gm-Message-State: AOAM530v7LAdKjmhuHNFqWKhUXHbC0z3U82yE4r86Liuo/iKVZPIUlqR
	O7caYfBb/E5svMaDz77l9fi5DQ==
X-Google-Smtp-Source: ABdhPJyIBfxdp87tFY+OQw60uJIX+IykOzFImmZQ/nwySZX3F6qGCxs7evb42BY2VGp/1AvBjnhxCw==
X-Received: by 2002:a5d:688c:: with SMTP id h12mr5754340wru.92.1604618583588;
        Thu, 05 Nov 2020 15:23:03 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 8.b.5.4.f.1.8.b.1.d.2.1.c.c.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (8.b.5.4.f.1.8.b.1.d.2.1.c.c.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:90cc:12d1:b81f:45b8])
        by smtp.gmail.com with ESMTPSA id f23sm4440626wmb.43.2020.11.05.15.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 15:23:02 -0800 (PST)
Message-ID: <e58359a509249839ba7c72caadf4d4ca80aed6e8.camel@linuxfoundation.org>
Subject: Re: [OE-core] Gatesgarth Maintainer
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Mittal, Anuj" <anuj.mittal@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 05 Nov 2020 23:22:59 +0000
In-Reply-To: <2bdc1c830b06b757361f0b1f716e78f2fa4642b5.camel@intel.com>
References: 
	<f9234c1de8b2c54dae4cf406d39435858c4364e5.camel@linuxfoundation.org>
	 <2bdc1c830b06b757361f0b1f716e78f2fa4642b5.camel@intel.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-11-01 at 23:53 +0000, Mittal, Anuj wrote:
> On Sun, 2020-11-01 at 13:39 +0000, Richard Purdie wrote:
> > Do we have anyone interested in helping with Gatesgarth stable
> > branch
> > maintenance?
> 
> I am interested and can help with this.

I'd be happy to take you up on that offer, thanks!

I did start pulling together patches into gatesgarth-next but haven't
got very far with it yet.

Cheers,

Richard

