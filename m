Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.32539.1610973393931997669
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 04:36:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=calFdWOY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id m4so16288695wrx.9
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Jan 2021 04:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=AAlxMKxusKtQzfwQYq4yo6izsOu0F4ImUYeLLeaUOR8=;
        b=calFdWOY6MjB5Hdn0v786rPuuRNUBxYXbz+zxhFu/PbuqdJvCPvglB8LBagtVN0lMq
         DoZXL38Op13uNwblWINnbXN/CWGIihmTcvLRKPuRM6doT041FCZOH14Mz9HWpKsIgXWM
         KPzVipCRj1IdyRu2ekjRIQDyPoHgxkE17ZUUk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AAlxMKxusKtQzfwQYq4yo6izsOu0F4ImUYeLLeaUOR8=;
        b=DN+VzPbv/KBUbiDOtCLAj3FANZ1zKA7LTmesu2q2o/2ejUOfRXj/xQcVWWlZ9slpf6
         ES58ZF7bCB2C38vwW2llp+if8ev3rYCSGygEVau8I2OLvuOldENwm2lmeSOG33RTBfdx
         YPS58Kxi4+lxotIKoEpvAg4TelMqsf5KvQqwRVXQ3jP/vpu0hxG0kNjwa8hX35zdcHrJ
         LsrVG8lxo8UvRMKh+riAiGhPj3AEcyh4EUIts47uLuWKpDBasvm151lp8bijSQCIyWuC
         KrEtdEvjuRm3vauI4widZ6x9aP2CGA7v13Df9/ic9ORrSJfG8YwIQU8tnI0TrwPjw7bB
         VpiA==
X-Gm-Message-State: AOAM533E24wnZlEaGtXiSDPYZkLVcWypIXJMMYRmSHrYyg+J2gPHdhgs
	+fnwcnQU1qupoctURniqa1BoKA==
X-Google-Smtp-Source: ABdhPJwgIVswVj+Sm5sQE6MLJe54DEAoejoxRDYu6L7uvAwMrHBaav63lazX3A8DWP6pJE2Mq1Zu7Q==
X-Received: by 2002:a5d:4683:: with SMTP id u3mr25992226wrq.19.1610973392458;
        Mon, 18 Jan 2021 04:36:32 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:cbf2:64a0:76c7:1d6a? ([2001:8b0:aba:5f3c:cbf2:64a0:76c7:1d6a])
        by smtp.gmail.com with ESMTPSA id u26sm25069068wmm.24.2021.01.18.04.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 04:36:32 -0800 (PST)
Message-ID: <532ac1990efd985355f28d565233af87f65db51f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] systemd: dont spew hidepid mount errors for kernels < v5.8
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Luca Boccassi <Luca.Boccassi@microsoft.com>, "bruce.ashfield@gmail.com"
	 <bruce.ashfield@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "paul.gortmaker@windriver.com"
	 <paul.gortmaker@windriver.com>
Date: Mon, 18 Jan 2021 12:36:31 +0000
In-Reply-To: <9fa544389d040b0fbacd14a1861cac0721d7d2c0.camel@microsoft.com>
References: <20210115052615.29893-1-paul.gortmaker@windriver.com>
	 <12145df57b9fdec6933497849a2d8b40fcb8a023.camel@linuxfoundation.org>
	 <a81ea7e632a26636d966540a86ec1978f557e63c.camel@microsoft.com>
	 <20210115144724.GM16838@windriver.com>
	 <96b7ff9f43b96d80021b3f797a6295de210711ea.camel@microsoft.com>
	 <CADkTA4MHjfrAf01PDVY8hyR9r_f5mqheLomuWKuUZY-+Rgi0=g@mail.gmail.com>
	 <6b4797ffe82f0ddd48352363ad85b3e5a52c3f7e.camel@microsoft.com>
	 <CADkTA4PrQefBMme_z6JAquZCv=7CYMsq8OA4+Y7xVHwL=VjseA@mail.gmail.com>
	 <9fa544389d040b0fbacd14a1861cac0721d7d2c0.camel@microsoft.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-01-15 at 17:35 +0000, Luca Boccassi wrote:
> On Fri, 2021-01-15 at 11:59 -0500, Bruce Ashfield wrote:
> > That code block isn't particularly complex and it is self contained,
> > so really, there's not much to see there. But I'm not in the business
> > of predicting anything, I'm in the wait and see camp (AUH will be the
> > first to pick it up if it causes patch problems, etc).
> > 
> > Richard can either take the change or not, I'm just supporting how
> > it has currently been submitted as chances are that no further
> > revisions are coming from Paul, so it can live or die as-is.
> 
> Even if a patch was preferred to a config, the current patch changes
> too much and should really be reduced in scope, as commented in the
> other email.

Doing this with a patch is probably 'safer' or less ugly than the other
options.

I had meant to test this whilst as the same time,  suggest we reduce
the context in the patch as mentioned, then merge. Unfortunately I
confused the systemd patches and this has sneaked in without that
tweak.

If we could reduce the noise in the diff, that would be useful though. 

Cheers,

Richard






