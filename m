Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id B54E171AB3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2016 17:43:15 +0000 (UTC)
Received: by mail-ua0-f181.google.com with SMTP id b35so195758428uaa.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2016 09:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MsEtYUyUWsRNnVnkEWf7jP4RW1yMTGF/lTNMy7aQZKk=;
	b=LmMP3nZdocGEKA5ti3/WKC1gHolbtbmSP58Dxub0ugNrAnEcNacRBcgZu9GjbsZYBt
	P3OczSfCmaDfkIjF2p/yHC3U5mW8qYXPXTT/XrdFwq7MpsZflMhub20t7aC5soRDENRy
	YNWDzuNxddApDHo/F6ZpMP4n/Oxoxt6IM+TibBJkPrkm07Aa+C+ERh8pWlIafMEivrLC
	cEyeKWyDz+YcB+Vz1tJVZdZNDMnqWAqUZmYhaPMG3Yjb571m+PW3PraW3c0UdIf6avV+
	BrDZJMznkDy3EnaqrQSyoPuXXxiR3ErSQrxXFTdcnWGNBnRzmhD3pTukDl6aatr734QF
	CoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MsEtYUyUWsRNnVnkEWf7jP4RW1yMTGF/lTNMy7aQZKk=;
	b=H8Plhiez5nFmOqtT+gWe9v+M3KqV6+J+ZjDgHt11nJ9gYaPc0e2q/88auCIA+xrFbH
	7Qo7AeeYFCVnrbsx2RSyUaW+G7YFpkFYx5C9hYPMcyloL1HrriYoSIPrOmPEFN0lwKYy
	/AqJLnoBIp3ehKFq5RuRxjp+avbAXGoMF+4j1I0VjzDy/r5XOpz3zL75SyLmIHDJbpyT
	UAaOtKcIvNEu+0Xvt2tlpVgbKZoCDVuoV89B35gdDU34uuauh0ExGsMEWZzBaL5HbTPr
	EeHLg5/PwNmbuGP7wWQ28F8m+10qurfAJ/TmkkDLhBCtGXcKgaCeooZUObR4NWy5D6Gb
	78ow==
X-Gm-Message-State: AKaTC03jv6luteuO66YNvkEW1O3g9jZOBiNI/A//ireb3NqZxcMlhFJgWcxtolDaDpN6S9sftafnPr3pzvBvtA==
X-Received: by 10.176.1.17 with SMTP id 17mr2460387uak.143.1479577397008; Sat,
	19 Nov 2016 09:43:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Sat, 19 Nov 2016 09:42:46 -0800 (PST)
In-Reply-To: <20161119021100.29350-1-jackie.huang@windriver.com>
References: <20161119021100.29350-1-jackie.huang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Nov 2016 09:42:46 -0800
Message-ID: <CAMKF1spNggU8ChOA9gCUm3BRWME8E8e6AjAYaKAjeJzr=J-EVA@mail.gmail.com>
To: jhuang0 <jackie.huang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: fix an incorrect macro checking
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
X-List-Received-Date: Sat, 19 Nov 2016 17:43:16 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 18, 2016 at 6:11 PM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> The previous patch added a check but incorrectly
> change the elif to if, then it always return 0
> for cpuid if the machine is not __i386__
>
> getcpu01    1  TFAIL  :  getcpu01.c:140: getcpu() returned wrong value expected cpuid:7, returned value cpuid: 0
>
> After this fix:
> getcpu01    1  TPASS  :  getcpu() returned proper cpuid:7, node id:0
>

This is ok.

