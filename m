Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.719.1587129597476084926
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2020 06:19:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TNkffGSU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id g13so980744wrb.8
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2020 06:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=PSMvU3RDkRPsFE06xuRTcq7oPwWLQyvDQJ18wQlu1K0=;
        b=TNkffGSUbVKO3QSDtpneckZrIs6NWTN2ZvKly0KUGvWx2z8WTkNHYGKbC/+M3F6I0j
         u9TqN0dG/zKU2fk5MoRfCsLa+wtYChuT2u2i3NNVihRsQ69edeGxFqs8K0qsDULmH5m5
         Roq8fMNVNULNiebux/JsI2w4AYhbBze+1Yp1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=PSMvU3RDkRPsFE06xuRTcq7oPwWLQyvDQJ18wQlu1K0=;
        b=jd0Fcyz8wQ5K8SyukziI0IkdSKk0jx1EZq/748qAhBEAMFQ6AeSoZDpgqrG8wFhxoh
         FfkhC2DxAiFLlrdHZ1AGxtpmVSMrN9ld+CoKobQdur0so/jc9Fy2LvwxBGEhN6R2PHwA
         VsRQTLEImlyXmFCCryk3SVv3vQ6Uto7zG9g0QYq72lL+LvOJeK51oBs5vNUy+uEFyFa6
         /9BDF69+MWMV0Nsq3aSICaOybuROM2xGZr4KO4y7kzHjbTjjJPR4p4lF48JPJX4g122q
         YGEESI9UfuNVhaFaCyqz63U/YwFMJ9tvoWChQHEH2cEP4GhI/F3kYtzrJPdpjrkCyxHX
         IcLw==
X-Gm-Message-State: AGi0PuaWr3KT149P5/CLnDtduvmQCpsmGBeWOFe4SC0+aj8fqTdBkYMV
	8NCjMR4oKB9tpYOQ86Ww1OYaDA==
X-Google-Smtp-Source: APiQypIYz9PaEcFv7wyLL94KfwBaS7UVvDuksD6e/Abud5deArRZT67bOyKStTRQhpQ8CD+gGBPdfQ==
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr4132541wrj.419.1587129595936;
        Fri, 17 Apr 2020 06:19:55 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id r2sm7963219wmg.2.2020.04.17.06.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 06:19:54 -0700 (PDT)
Message-ID: <625881f18304de72d5df4ad14fc77b1907f4329c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] buildall-qemu: automate build testing for qemu MACHINEs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, Trevor Gamblin
	 <trevor.gamblin@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 17 Apr 2020 14:19:53 +0100
In-Reply-To: <55b9b8f7-1d5d-3b32-772a-0e918d0b0b66@windriver.com>
References: <20200225141115.876047-1-trevor.gamblin@windriver.com>
	 <55b9b8f7-1d5d-3b32-772a-0e918d0b0b66@windriver.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-04-16 at 22:10 -0400, Randy MacLeod wrote:
> On 2020-02-25 9:11 a.m., Trevor Gamblin wrote:
> > buildall-qemu simplifies the process of build testing an upgraded
> > or
> > patched recipe 
> 
> I think this is a useful little script. please rebase and re-submit
> once master opens up.

For context, the reason it was mislaid was that I was put on the
address list of the patch directly and it went to a different mail
folder. The assumption is I keep on top of my general email and I'm
clearly not, sorry :(

Cheers,

Richard

