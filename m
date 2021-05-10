Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.3756.1620680852989086631
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 14:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zy9YDPpQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id x5so17994705wrv.13
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 14:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=hMNzXpdxLpZPzlm79HUfaQLnP0AsFqCQoDV/0UxnVao=;
        b=Zy9YDPpQteTAjPMFuqkgD7P0S8xs5nxvMIfzKZ0ZXEQ3F7fRLbxn6JNJZZaQheBUh6
         THGb6oxsMUpc5XDHFgsIwpg7goU0vZHZa/duF0qsgYvsBNyMDfuoDD4S7fc46O6ZtH7X
         GsG2URrTwaIbN5q0LIireILobdisbltaAusyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=hMNzXpdxLpZPzlm79HUfaQLnP0AsFqCQoDV/0UxnVao=;
        b=RkVy/SsgM55dRURgzQnD1rrGzVX7VNXEZ3L5TDKfLua9/WIRutb1mcYBki6jdv6Y+I
         zGUsMpbp7LZ8iIzriu5s65LJpKSF2UcLfoH5/Bzo7z8YOhjX2Nbuq0LQ3QUgBJ1O/2lK
         haYy4hgSqmdmICUMFmWRxwlVHvqmO+6fO2E5fipM+ASRorphDZ2Xt17XJXG7M6sjJpph
         DodMATYr7Q5px2mLw6j1il49qFp2jwPfgHWye5uffzNz6fDuUZNipv2ZPteo0tBBj8n5
         Y3ukG4D6eGOP+Fhikh8UdQt8NnPGbZe4AgT/EBZYuyolMOJv+HuHpz/LYVkyV27w/WQk
         4izQ==
X-Gm-Message-State: AOAM5315LHwrgPBjQz1HRMIOaUro4WDfwNMS36fzTSGnZsbxJBa5T5y9
	FJ+6AZj5mJt/dOrKC9sD7ecbBg==
X-Google-Smtp-Source: ABdhPJzM2FTd/Foh2ir4vigdjFJPZoElTh+Hcw0yHQbnRciiIlPxvKyD0EDL+nhA9cmFhv0mxgkmWg==
X-Received: by 2002:adf:cc8c:: with SMTP id p12mr33150571wrj.407.1620680851258;
        Mon, 10 May 2021 14:07:31 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:29c0:3873:464b:b647? ([2001:8b0:aba:5f3c:29c0:3873:464b:b647])
        by smtp.gmail.com with ESMTPSA id i11sm23694564wrp.56.2021.05.10.14.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 14:07:31 -0700 (PDT)
Message-ID: <4406c7b84bdb178af4e22b92beb805b02f2ca5bd.camel@linuxfoundation.org>
Subject: Re: [Openembedded-architecture] Open Source Maintainers - An open letter/request
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, openembedded-architecture
	 <openembedded-architecture@lists.openembedded.org>, openembedded-core
	 <openembedded-core@lists.openembedded.org>, yocto@lists.yoctoproject.org
Date: Mon, 10 May 2021 22:07:29 +0100
In-Reply-To: <fafe1a94-c4f9-adf5-03d2-50f6c4750d18@gmail.com>
References: 
	<4be3a7006f265957fadf8f5118acb756691c2f81.camel@linuxfoundation.org>
	 <fafe1a94-c4f9-adf5-03d2-50f6c4750d18@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-05-10 at 13:52 -0700, akuster808 wrote:
> 
> On 5/10/21 8:14 AM, Richard Purdie wrote:
> > I appreciate these are difficult times, both for individuals and for 
> > businesses. I'd like to conclude by thanking everyone who does participate
> > and contribute. Whilst I do want/need to highlight the above (and have been
> > asked to do so that people have something they can point people at), the 
> > project is proving to be successful, going to interesting places and making
> > things possible we can all be proud of!
> Thanks for summarizing all this.
> 
> So is the ask to forward this within the one's Employer?

I think people will know what is appropriate in their own circumstances.

There was an ask that some of these things be "documented" and I'm trying to
do that as I think some of the things here are often overlooked or misunderstood.

Cheers,

Richard

