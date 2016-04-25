Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1F6DE6FF5B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 15:11:08 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id r5so59577006pag.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 08:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=jGBdYftgBcMsyDtnIpPP/FQMFbCGhFrOeRfNzW7yxRo=;
	b=lyTOX7GtlIAOxWNrbRe9x6JK33adNSnRwN6ryDcUhzVvLOLn6YxuRhKtdXL6IWjBiA
	vKKb40VnrsOqkbleqwO7qu8em7HjX1FXradVl+j0Vm9qfXoanxMOQP4/5beHZrfap0IG
	PexQenw/n04Bwjhzx3CZ2lyn20QiGahdzM30NOEQWwgG0zvTkh2mxEuNf3/R5/MfSHRD
	ZMU4uPHGZji+TRPJMrAyE9GvOamjEhqel5qjDkNIobRZzsoxISRPJjZEp3js2r69NlCd
	EgeWwKo0iphZnGwemJjoPU2T4wM7fnXk7ImbZNBwLtGh+aNFk0GCxD4u27ja/F+i7vNt
	FGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=jGBdYftgBcMsyDtnIpPP/FQMFbCGhFrOeRfNzW7yxRo=;
	b=fa4F3NQUbuQWlsDH9JkFkmgc09mY7a+bDUpikdfaLl0hX3HfDsabnZgjhKUOIPiFht
	pRut1tv+YPar+yqZsdqmf8hy9fL1vB6URLZ8mW8VWQ3mKChznfirZpEJkonfkSC/fyGZ
	cyav7hEtR6DMFdEivabCcPWJ7Gc1//irNq91Vc62wV4hTCc5vGDrhK4LM1MZ3V0w5nRp
	DE3+b/iQcJgk3ji9nABVMGXHhDsZ4/OTIzBPgg/mf8teQL/l7MrSmOi8CvUui+lA7UC5
	kUnxa5QEFlvscRNOla1KNaMsqXNdp4wX16QhLjMY60BvFiMBWM8non02boCvFOLMhhcJ
	WWIg==
X-Gm-Message-State: AOPr4FU/dajApU0107D32Tu/Y1WDNlttiUcFZx2mdGS3de933z3o5ys65ddzCaSB/mGT+g==
X-Received: by 10.66.65.109 with SMTP id w13mr48908930pas.142.1461597069453;
	Mon, 25 Apr 2016 08:11:09 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:606d:9ea8:d7b2:ab08?
	([2601:202:4000:1239:606d:9ea8:d7b2:ab08])
	by smtp.googlemail.com with ESMTPSA id
	wy7sm30874429pab.5.2016.04.25.08.11.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2016 08:11:08 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <571E0BF3.8080408@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <571E3387.6090201@gmail.com>
Date: Mon, 25 Apr 2016 08:11:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <571E0BF3.8080408@linux.intel.com>
Subject: Re: moving OpenEmbedded-core to Python 3
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
X-List-Received-Date: Mon, 25 Apr 2016 15:11:09 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 04/25/2016 05:22 AM, Alexander Kanavin wrote:
> Hello everyone,
> 
> we want to deprecate Python 2 in oe-core and set Python 3 as the
> default, preferred choice. What does this mean?

What is the target to make  Python3 default, 2.2?

> 
> 1) Introducing new Python 2 dependencies via new recipes or additional
> DEPENDS etc. in existing recipes will be discouraged: you'll have to
> provide a reason.

Will there be any kind of QA warning for these dependencies? this will
help  scope how many recipes need to be looked at. there are a lot of
layers out there.

> 
> 2) Bitbake itself is at the moment Python 2 only - which will be addressed.

What will the env setup script display then?

> 
> 3) OE-core recipes that are currently dependent on Python 2 will be
> moved to Python 3 whenever possible (e.g. when nothing in oe-core
> requires them to be built against python 2). This may break some of your
> code, so please do try any patchsets before they land in master (or
> stable release), and suggest alternatives.
> 
> 4) Of course, there is a large mass of Python 2 code out there, which
> may never be ported to Python 3, so Python 2 will continue to be
> provided at least until it's no longer supported upstream (the current
> date is 2020).
> 
> I'll prepare an initial patchset for review, so please keep an eye on it.

thanks for doing the the initial work.

- armin
> 
> 
> Thanks,
> Alex

