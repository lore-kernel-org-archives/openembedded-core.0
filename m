Return-Path: <petr.vorel@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 374B7611CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 20:51:28 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a9so909633wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 12:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to;
	bh=6wVdul0QPn3h5J2OlAXzl9f5MVLXq8fs2axrxRzmYjM=;
	b=Snu9q5NgeK2KK/aCd5KVhKX3taOcasM9XktRbfCPWvQC+lgeGmfaE+fIRrMrd0ZdM5
	xrurqxT+FacO/F7D5ggYSyCQh6z1hi2uxblEuUwcFw4RHlLUC7iR2Nnzn7byFw59PpTL
	L2hCYGiM3BRI1P9EbidPw6FNx5Xp5md+9sI41j0DiSd/GMC9qbOAb4+vZfUzXYFpy3pX
	j2dglwfl77ehwJubf+DOosdxOiAaYiue4hKKnWD3kDOWBkbLY/EeZZL4lVo9lMnUohL0
	bC0kfIZt4Yl+A7MgSK4oWy1BfuLnEL3J3370SVIaG30R95bpBs/gAy5N3vENlW4jWE8b
	hR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to;
	bh=6wVdul0QPn3h5J2OlAXzl9f5MVLXq8fs2axrxRzmYjM=;
	b=aWU02g2OhMkP9TVbvROzSsNa99sBLMTnPQXj96vjVcqTrMPNo3meYYVUf2fSc72T2g
	Ifz98vKFiY3O34THwvutN8WAWq5yFqjvxH2IvJCxJBqdeJdOBoJ3rJDbmcqgWAv6PpH5
	fqGOvpA7EdFy2hMdSUSljSk43+h87SD2EA4UqKG+1eBHz4OUU+z0OL6EhYWHq4HXIxpy
	uK/WlqccPzfLfycdABJ+s8oQtl4F35d78m0ncXDh0KcYfFhRROQXy7kOA3TJjObAcMDY
	LlP0twZot1wGZ7MlJB6GmDBLUEG+mP5AVDGJKvcxxdXEBb9LGL4Nm8w28Z2rgMWfCtyJ
	AD3g==
X-Gm-Message-State: APjAAAXoP1m/PnbFlqeaE0z5Swef13GdqR6AT3vrKqTpinaxaUd8lSQf
	0xR3CozMYG6oQHgjE5v7Aes=
X-Google-Smtp-Source: APXvYqyrTjtIQJs5QCmiamsv4tnoUq3rRm17qnQhQ1jTb56lrEaS9acoHortJaMNspOO16BIiOsDpA==
X-Received: by 2002:a1c:f71a:: with SMTP id v26mr601924wmh.85.1582836688891;
	Thu, 27 Feb 2020 12:51:28 -0800 (PST)
Received: from dell5510 ([62.201.25.198]) by smtp.gmail.com with ESMTPSA id
	d15sm4891815wrp.37.2020.02.27.12.51.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 12:51:28 -0800 (PST)
Date: Thu, 27 Feb 2020 21:51:26 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200227205126.GB3446@dell5510>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20200227203456.7395-1-petr.vorel@gmail.com>
	<20200227203456.7395-2-petr.vorel@gmail.com>
	<CAMKF1spWKKiWwD76QXA=gOj1nJFc7cMm2=oifR8S-wEDh_CLXw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spWKKiWwD76QXA=gOj1nJFc7cMm2=oifR8S-wEDh_CLXw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"Hongzhi . Song" <hongzhi.song@windriver.com>
Subject: Re: [PATCH 2/2] ltp: Remove mips related open_posix_testsuite patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Feb 2020 20:51:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

> > please don't deliver this patch to users, it's wrong.

> Thanks Petr, is there an alternative approach we can take ?

Cyril suggested at the time to skipping the test in
the testrunner. Is that feasible? He also asked how do you run the test.
i.e. not changing the code of the test, just don't run it.
https://patchwork.ozlabs.org/comment/2012168/

Kind regards,
Petr

PS: better to ask on LTP ML, Cc Cyril and me.

