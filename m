Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web08.9466.1613055586321179739
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 06:59:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M5SooVak;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id b3so4486612wrj.5
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 06:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=NqSqViP3Xghn4cb/MhKRrY0M3O+c2JDqMQVDGfwyPHc=;
        b=M5SooVakgwN1qZ2esJkmTbpxckH3iejEV3D+mMDIzfrf0CB2JSVK/TppTPTGTumr+J
         neJvf4vFwxzWyEHwjncr/EprMXiNRgZlf0SIKM4a+4bSNhiuC4rPckiiMkFmiabZgTIv
         tp9kWwrz/zQNfrpbLCbrXG2q9BKIaDsk9uFXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NqSqViP3Xghn4cb/MhKRrY0M3O+c2JDqMQVDGfwyPHc=;
        b=IjWF1b6qOvBMD6Xcnt2AjuzvI4agniZA55JNrQ0a1F4xSobrtQSjZkyXqJG6YSJyIR
         K3tYV4QHq6nllXOVftk3MPPML9NZVaS0MQ7bxf2ldtF/bjJ4dezdUDL952GHg247w8F1
         gSSarPoZtil03azzKLiVh2PcYMjGdZAIM0I81B/ylZV/c8X1fMT3cX1J7h3z2EnmDxUA
         bzlmKEX7tdKg4/57ijnv2KBisA3f469f1g+NcJ6O5QewAaFqFtDc42bfyDX5h+DcsKCa
         /cDK3TRpSjK2vDpa5z0kyIGVwZVSSV/UkcOjvPnkkb0FGrHCEoUzQseh1JFWp2XJ9Zed
         6IhQ==
X-Gm-Message-State: AOAM532FgOmW1wcvJ4E2MdT5XNMullgGbUpcUwjw/uojaoEqijP0R/Mf
	UhrxF8E+Bd16J2IIO6HioLFJxg==
X-Google-Smtp-Source: ABdhPJzirMU5/pm7MyV/lguKBEVdMi1A4ykRpucblN4fu3eqYF/dWtX7A+Xr4pMQEJSPzVAkkfzHkQ==
X-Received: by 2002:adf:f1d1:: with SMTP id z17mr6012674wro.67.1613055584681;
        Thu, 11 Feb 2021 06:59:44 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1f44:6379:818:1e61? ([2001:8b0:aba:5f3c:1f44:6379:818:1e61])
        by smtp.gmail.com with ESMTPSA id t7sm5248759wrv.75.2021.02.11.06.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 06:59:44 -0800 (PST)
Message-ID: <75a09549ba5b0c04119f49c936af3e28e7ba9f80.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] insane: Add test for native/nativesdk inherit order
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, 
	openembedded-core@lists.openembedded.org, tomasz.dziendzielski@gmail.com
Date: Thu, 11 Feb 2021 14:59:40 +0000
In-Reply-To: <AM9PR09MB4642F1B612B2BC92D05BC20AA88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: <20210124095546.3329-1-tomasz.dziendzielski@gmail.com>
	 <AM9PR09MB46421810B3B2B59AAB545357A88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
	 <adeb07bdec1909082286a2dd6d16757adaf9098e.camel@linuxfoundation.org>
	 <AM9PR09MB46424CCD4DD40C8DC3F59403A88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
	 <df38a497ef1c31b72445d7ae2361d3d6db676f6e.camel@linuxfoundation.org>
	 <AM9PR09MB4642F1B612B2BC92D05BC20AA88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-02-11 at 15:47 +0100, Konrad Weihmann wrote:
> 
> On 11.02.21 14:04, Richard Purdie wrote:
> > On Thu, 2021-02-11 at 13:10 +0100, Konrad Weihmann wrote:
> > > 
> > > On 11.02.21 12:43, Richard Purdie wrote:
> > > > On Thu, 2021-02-11 at 08:21 +0100, Konrad Weihmann wrote:
> > > > > After this patch got merged I notice some "noise" in my builds.
> > 
> > I can guarantee that making any such option available will just have
> > people reach for it and use it. You clearly want to here when the
> > changes needed to avoid it are probably not that difficult.
> > 
> > > If that's not what the project wants, I'm also fine with it, but then it
> > > would be really helpful to point to the bbappend as a culprit and not
> > > the base recipe
> > 
> > I understand why you'd want it, I'm just not sure if would encourage
> > the right behaviour :(.
> 
> Fair enough - guess I will go with the educating ppl (including myself) 
> path then

One thing to remember is that you can change ERROR_QA and WARN_QA on a
per recipe basis, so in theory you can disable this per recipe, or
reduce it to a warning...

Its not neat code to do it, but it isn't really meant to be!

Cheers,

Richard

