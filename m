Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web09.3990.1604104331201793495
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 17:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xl2GZyTU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id k10so6900611wrw.13
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 17:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=60kciojdLPmuu0Gnvof+vDpYBEXQkd7ABAXWeyLjhM8=;
        b=Xl2GZyTU9FsdzQI0pzSpHyk7C62eVQwkivSmF8WpkD0pVbNKBNMra3XFK0K0bhurUq
         CpggasBpb2I2v+pWUf+1TdvDbvP967G61MI2tRXw/K4evFGr2rwEJzvmeMKzlaTNTAb4
         at45RppzK9kdT/P3xlGt6tCyIloRAF8DMb8ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=60kciojdLPmuu0Gnvof+vDpYBEXQkd7ABAXWeyLjhM8=;
        b=BgWENYWTGsh0mKUJdj0BD9n79rlFmm9WOcG2Bz0l9DbJ7szQLvUpFFhUFYaMyChA05
         bwa3Bz9H2FthDc5R2Um8I6g/ly/bgW22pn85WRN9+UNrbw8jsCO+0GzqcejXH/4eHq6L
         H+k+fGFB1uqAwaPpcEVuHvaDkLcOpt6/1GLWLlpMiDdJhLPchvH61xtCiHu1LrO6/MOd
         XJbJgtQ+R1j0PO9AHfh4F673k+blkvU6zDrm6i2AuvgANAlz3iCKFmvvELyBK9Ustu4r
         o7pvso3LWMqTQEtEFFa/MMqCMMjvPEO9YKvYk3BaEc4EFiFdivIy3NzgleWSDK1Zouvb
         jGog==
X-Gm-Message-State: AOAM5309l4MOnnhEADAm5sqguBlJEDDkB4O4FAVON/ZAKP4919uMtoeq
	FO/rhvyQVpl7T2I3fvZ7tldCNQ==
X-Google-Smtp-Source: ABdhPJxYUinAe+pcL6XJ6UsxrAFXZT45COW55H7f4x2AgV25dPdsBiTeH/9LxkxJyS2waQmft74SRA==
X-Received: by 2002:adf:a553:: with SMTP id j19mr6228792wrb.349.1604104329734;
        Fri, 30 Oct 2020 17:32:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:11ab:804e:534c:cf3d])
        by smtp.gmail.com with ESMTPSA id c185sm6738916wma.44.2020.10.30.17.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 17:32:09 -0700 (PDT)
Message-ID: <aa090613e34863ee936811011d3019eafba3db81.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gstreamer: use git to fetch the sources
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 31 Oct 2020 00:32:08 +0000
In-Reply-To: <20201030232256.624297-1-quaresma.jose@gmail.com>
References: <20201030232256.624297-1-quaresma.jose@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-10-30 at 23:22 +0000, Jose Quaresma wrote:
> gstreamer has the code hosted on [1] and this repo as tags.
> manage code with git its more convenient than with tarball archives.
> 
> [1] - https://gitlab.freedesktop.org/gstreamer
> 
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>

I'm not 100% sure about this. Tarballs tend to be less overhead for
fetching and make for easier source archiving. The git repos are easier
for day to day dev work but tend to be harder for the AUH to handle and
slower to fetch for the users taking up more space to download and
unpack. I'm therefore torn. I know where we have used git for other
core components it has caused performance issues.

We do also have the option of the devupstream class although I know
that doesn't quite work for the native cases yet sadly.

Cheers,

Richard



