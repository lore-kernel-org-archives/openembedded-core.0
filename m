Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.4227.1615458712002509918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 02:31:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QMQS+t5S;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id d15so1238318wrv.5
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 02:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=j+79oky5lJ3zumj27XmGkQGibpg0CbQO3XfzoAnAFGE=;
        b=QMQS+t5SdA1ivCaZMI4oyAdG1dwmOQKusjUfB954AbNIPWB4d4flFQqT7+W1ZtKKuH
         cM2FKXkmCjp3sKvSUdk8skRU0TqEoBuh3wfQVjTiKuJIU7bOaZmPJc+GyTKRVrg2BlxO
         TSVguTuDL3vvqFJmyxkGZfzf2Oknw5503Czwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=j+79oky5lJ3zumj27XmGkQGibpg0CbQO3XfzoAnAFGE=;
        b=mjYbLU+rYWouGRS/AGBY3h09h2fShbU1wpTmAUBLISl74cCRavI9fRV9mpzT2tF86W
         JHdnP4uyfY2Gg71li1hmNB/r9A54a6qG7kmHjWQbKFlwLf+Ct6TPO6Ysw+5TJAJj+RkG
         1y+uPeKz5FyMrq+kuSPMWM2pMQLOl9w6d4yyaz4O32QGRoYz/x5ofUihSUNeuEAf1qoQ
         MfdoUH7iblMRvLzvhLd/niCH2J1JgcyMcZLpYmV6Wt64AWI8VplK2EG+HtTQLl3tkqVF
         owim661vw+5YV+eW2IYzJF7tDYJxOOISA4fwEd6ZDs+OptD+hRaRvfvl2NhEVJ4iOOZz
         iYkg==
X-Gm-Message-State: AOAM531o2SE8piXL01pqVp2XpN2GeYqV5UBXkjcChfXpGkazQzaWdtzm
	uNk+22l6+IITEZsQGpin3C91cg==
X-Google-Smtp-Source: ABdhPJzJHVWptVuOVQpHXJes9HFRgY4b1a1IQxxyuLcHSEl0tm29BGjYfWprAupXvnRao7zsM0jg9w==
X-Received: by 2002:adf:fb91:: with SMTP id a17mr7863235wrr.93.1615458710447;
        Thu, 11 Mar 2021 02:31:50 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:79d1:e29:deac:3ff5? ([2001:8b0:aba:5f3c:79d1:e29:deac:3ff5])
        by smtp.gmail.com with ESMTPSA id c16sm3609995wrs.81.2021.03.11.02.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 02:31:50 -0800 (PST)
Message-ID: <bf29e1132e8959b1e9b22f8131f0785f0200f0f5.camel@linuxfoundation.org>
Subject: Re: [PATCH v9] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Luca Boccassi <luca.boccassi@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org, Kory Maincent
 <kory.maincent@bootlin.com>
Date: Thu, 11 Mar 2021 10:31:48 +0000
In-Reply-To: <291a86bde929406603821b08b1fe36cfecf19103.camel@gmail.com>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210309135606.508593-1-luca.boccassi@gmail.com>
	 <681b7ba8baca230a2b95f5c1fc40e1b5108e9a70.camel@linuxfoundation.org>
	 <539920c0108d13a48eb63650be96c97435c11dca.camel@gmail.com>
	 <291a86bde929406603821b08b1fe36cfecf19103.camel@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-03-11 at 10:15 +0000, Luca Boccassi wrote:
> On Wed, 2021-03-10 at 18:28 +0000, Luca Boccassi wrote:
> > On Tue, 2021-03-09 at 23:43 +0000, Richard Purdie wrote:
> > 
> > 
> > No problem at all, it's absolutely fine to postpone, I am in no
> > immediate rush as I have local backports in use. As long as we get
> > things sorted at some point it's all good for me, so please don't delay
> > other patches because of this.
> > 
> > > I'm a little unclear if debian renaming was allowed before the split and if
> > > so, why it is disabled in the split version. I suspect there is a missing
> > > MLPREFIX somewhere causing the multilib issue too.
> > 
> > I do not remember why the DEBIAN_NOAUTONAME was added at this point.
> > I'll try to send a new version tomorrow.
> 
> So without DEBIAN_NOAUTONAME these are the package names:
> 
> libuuid1-2.36.2-r0.core2_64.rpm
> libuuid-dbg-2.36.2-r0.core2_64.rpm
> libuuid-dev-2.36.2-r0.core2_64.rpm
> util-linux-uuid-src-2.36.2-r0.core2_64.rpm
> 
> that's going to be a problem as they don't match anymore, right? Since
> they used to be util-linux-libuuid, etc. Although the poky image build
> completed just fine...

The above looks fine, they don't have to match. I think this would match 
what happens to the package before your patch too although I've not 
checked.

Cheers,

Richard


