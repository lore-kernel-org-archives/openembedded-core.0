Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id D84CB786BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 09:38:52 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id x10so9839928oig.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 01:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=sTQ9gnOLAXTQ5ck7+P8M1mG4g9THdo9FOjpWh9mbKgc=;
	b=VZZJoFSizpXK77D++aEW9RI9Z4RZCz0AY51dt4pYGlI/a6qqV2zJIW8jEOYg9o7nfO
	wRNsQpcEUnQcCj0SRh5ibY2zYylSrSMR5POXXN7P9aPnyFIBwnN3k/HE/21I6W5WLibU
	AbRMQuZL80HhQ/i1dVKn/cWdAmZ1LhYA5CnISIHg6kDNLQc4i3Ddl6N1WiwhJYqI9S8U
	wYytnN4WIFa+76Pr3StYoFswMcZ04giPNMDF+Hv6JOHIvs0T2/VXNg7cUQJRHhBJQBxl
	MOouKX8PRJeJx6WUjTwo2iFp9tGRCumg5zaOzwSe98SOOQx2NdKpwak1pvaZ8m+Z+Q4i
	pszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=sTQ9gnOLAXTQ5ck7+P8M1mG4g9THdo9FOjpWh9mbKgc=;
	b=q1NXKnNu4F5hpWQ5QOj87OTvX89+PmO6Z4X9PoGTL/mOFaa7ZdKtS+jNbqKeHzOkGY
	xnEgBuFR0MAsc3fmaazPpKWf23ZRdVrQueAB+W9MxtFyyXD/bhVVKn+IFBHYrSFm8DWh
	5EyriJlHYGxrCzUE6+D0S+bzwPmF5nPZQH2gRG1cExAwsxQpDPA3MNcteMPxyVGnwr1C
	Zap9XuCrjBKLRfHbdvdmGptqEGsdl7/u/QFxP842sp6j+X9R8DGgILxeAVpYy2QlZUfm
	qa/myhS1i8QKHg5NPoCnRLi13ss3+njwhiGAd4vZE8vP5QEmOLmcV28pufRXV2PIE2NG
	W4vg==
X-Gm-Message-State: APf1xPAXJStlhrSjj5tcdJ8RGduUAGsZn/Kdntz3RxCT0Eap7y2jAEAY
	7OItCCvuuj0SiUuB23aUrG9azpUb
X-Google-Smtp-Source: AH8x224VECriCfrYP9qGanP3RYtEN/HqkWCftjXQ5mTnnZI0xsNgw8rFNnFIRQzoBrogXQwVYNEHDw==
X-Received: by 10.202.108.73 with SMTP id h70mr8244659oic.282.1519724333449;
	Tue, 27 Feb 2018 01:38:53 -0800 (PST)
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com.
	[209.85.218.50])
	by smtp.gmail.com with ESMTPSA id 62sm2123923otg.42.2018.02.27.01.38.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 01:38:51 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f50.google.com with SMTP id c83so12410684oib.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 01:38:51 -0800 (PST)
X-Received: by 10.202.80.13 with SMTP id e13mr8843398oib.304.1519724331332;
	Tue, 27 Feb 2018 01:38:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.80.129 with HTTP; Tue, 27 Feb 2018 01:38:50 -0800 (PST)
In-Reply-To: <1519721818-32415-1-git-send-email-anuj.mittal@intel.com>
References: <1519721818-32415-1-git-send-email-anuj.mittal@intel.com>
Date: Tue, 27 Feb 2018 06:38:50 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqodPyQQcTptx1oPPTZXSLg+w7tFNsOPTr15wsQZmHyDw@mail.gmail.com>
Message-ID: <CAP9ODKqodPyQQcTptx1oPPTZXSLg+w7tFNsOPTr15wsQZmHyDw@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer: enable ptest support
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
X-List-Received-Date: Tue, 27 Feb 2018 09:38:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 27, 2018 at 5:56 AM, Anuj Mittal <anuj.mittal@intel.com> wrote:
...
> +++ b/meta/recipes-multimedia/gstreamer/files/add-a-target-to-compile-tests.patch
> @@ -0,0 +1,61 @@
> +From 442691c7778601e3e4b88d0fbfb9d512ed34f414 Mon Sep 17 00:00:00 2001
> +From: Anuj Mittal <anuj.mittal@intel.com>
> +Date: Tue, 27 Feb 2018 09:27:01 +0800
> +Subject: [PATCH] add targets for test installation
> +
> +Targets to make sure tests can be installed and then run on
> +the target.
> +
> +Upstream-Status: Pending [specific to oe setup]

You choose the wrong status. It should be Inappropriate.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

