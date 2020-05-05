Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.6806.1588682436882340787
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 05:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OLtViWJj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id z8so1635541wrw.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 05:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=tir60+QxSdryupEuThktCMeEGJEGLWLiDc1SVCV6TeU=;
        b=OLtViWJjG900u8SR+TxtMEXjIFYnVygZHSjoNHSPkEbjw23YwhmvkX9GgYYl4nXyLq
         t8sLeE3Fy8GM3jDKLzrI1bZhz6J3ZoGrHW8gkNCNy6xkMLYXRBTQt61UCGkQpSMnP/HF
         scFN+7bv7bhprv5Pf0kDWOQd6uGUlh1GwPBQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=tir60+QxSdryupEuThktCMeEGJEGLWLiDc1SVCV6TeU=;
        b=eHcb7GUtfzl4iYAHZq9G+xzZGNu+LOWyFQvFbf/i3qFmmpwZ+kZ70lUhpaexj5ZGZh
         mcnH2d6a5FkopeTSY44c2OeSCEJZRXFlj6Mg5juitQFDJG0ierBr67hkfwGLbLS+kUs1
         krj1gmQbHAiqemgi9NcqaAvUZYa7mEeOvT1+ZxoKui8l+aqF7GQfPnw2+1u2vb7E3Df5
         WVEI/oVr4e/D0cR2j7chv85bnB8T0DZh2DcmDO1JyqFPnouLB/OcpBWIap24Bf5hASxz
         aQy9t7850IFyJDHe9WhDvx39Y3gralzdunEBlF0m/XArZNg22Py8kT7XU3edIiOuddjb
         +59g==
X-Gm-Message-State: AGi0PubfjMH7nYTpzYl+F4kaUR5KjA/VHkFzO1/+qHH1kFLu58LoX5jN
	p8AsCrNL1+TxYp2y+thYfZMjxAbqjuo=
X-Google-Smtp-Source: APiQypIDceOHxk6X2yTH2E3QY+JiyQQ/yiYZUQa/nxveHz1h/5qcnzzZKcWbQCVf++0MTpHz+2H/Vw==
X-Received: by 2002:a5d:4950:: with SMTP id r16mr3621792wrs.350.1588682435339;
        Tue, 05 May 2020 05:40:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id 5sm739358wmz.16.2020.05.05.05.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 05:40:34 -0700 (PDT)
Message-ID: <8f829b2e4dd8dcfbb9fe33027aa4f08ab43119dc.camel@linuxfoundation.org>
Subject: Re: [OE-core] superfluous usage of "INC_PR" in oe-core?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 05 May 2020 13:40:33 +0100
In-Reply-To: <alpine.LFD.2.21.2005050817170.11221@localhost.localdomain>
References: <alpine.LFD.2.21.2005031305110.653691@localhost.localdomain>
	 <0f91729190f8b3c6ad5f07eea053635450a2197b.camel@linuxfoundation.org>
	 <alpine.LFD.2.21.2005050817170.11221@localhost.localdomain>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-05-05 at 08:19 -0400, Robert P. J. Day wrote:
> On Tue, 5 May 2020, Richard Purdie wrote:
> 
> > On Sun, 2020-05-03 at 13:07 -0400, Robert P. J. Day wrote:
> > >   given my understanding of the rationale for INC_PR, it would
> > > seem
> > > as
> > > if at least *some* of these assignments are superfluous:
> > > 
> > >   recipes-connectivity/connman/connman.inc:INC_PR = "r20"
> > >   recipes-graphics/xorg-driver/xorg-driver-common.inc:INC_PR =
> > > "r21"
> > >   recipes-graphics/xorg-xserver/xserver-xorg.inc:INC_PR = "r8"
> > >   recipes-graphics/xorg-font/font-alias_1.0.3.bb:PR =
> > > "${INC_PR}.3"
> > >   recipes-graphics/xorg-font/xorg-font-common.inc:INC_PR = "r2"
> > >   recipes-graphics/xorg-font/encodings_1.0.5.bb:PR =
> > > "${INC_PR}.1"
> > >   recipes-graphics/xorg-app/xorg-app-common.inc:INC_PR = "r8"
> > >   recipes-kernel/linux/linux-yocto.inc:INC_PR = "r4"
> > 
> > This is a bit of a historical relic, I've sent a patch to clean it
> > up.
> 
>   just to be clear, while there's not much value to INC_PR anymore,
> it's still officially supported, yes? (there are a small number of
> occurrences in meta-openembedded as well.)

It doesn't really have "support", its a convention. It can be used just
like any other intermediate variable. That said its a rather dated one
which isn't really appropriate now so we can probably remove the
documentation.conf entry. I've not looked at what the manuals say...

Cheers,

Richard

