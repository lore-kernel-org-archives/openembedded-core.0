Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 1AEB679BC8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 17:02:13 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id y11-v6so12953725wma.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 10:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ievW9T8ewbQZSKT98/N5XvmMJc3Q7ShhvXg5dZ1JGmU=;
	b=UckxRXXwW8uW7yJqoXph6fnrSb3P7DLCMGWbBbycnAQ+898n04ojfkbp443bOzRRjr
	vq3Xu7ZCieUxuYHL1/F9jhCyDHQRr+SGEjLYCRs9Deh6dpKYgXM0SalZhbb4EF3yzfX0
	97iZCu5rH5IRaeF195HtC2zAu/3CQIj3S5VK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ievW9T8ewbQZSKT98/N5XvmMJc3Q7ShhvXg5dZ1JGmU=;
	b=bwR+CvG6Gv6QxTyokYbWeX1M1CqFaRDbrjYnGxJSL5MNpTaRc6UvV14AjrYIYTJUN6
	s33c5eFZa+0QSUcvi7sYX9gVviezvqchs3Yo5x+kEM5BIJiorF/qTHpsl0ONihwHOXP4
	m3KqQephYHs0ftHGBOjQcWXv2/NUFgGMrSp7SV1YG4JVU7hxhiNuPFMHtRKn66rfqH2t
	jslVpllLckokMrrt1HR+MLVUCN+fzIRCQ7eYeMBDe97a0juEt2tCg03JAPmeZeC5RqpG
	5+ipBENMZwqYlG7tH6a9a78UqGbhAFKaO/9kjbe1twHhR3rt/DGLkvrEdS0hw9GLhHEM
	VGtg==
X-Gm-Message-State: ABuFfohUxcKNVX2PRwoF/GmW7QULz2tZZFBb/VK9QmsKh9guONqDzouk
	Cq0KNjzW2sRGhbEXy7J6Q5/JwA==
X-Google-Smtp-Source: ACcGV62OPwYmPNEqlaEcWjDVhCgm1L6khgoBWZabu7+M0JeL2u/9heTKKFOzq3J1NDDqiYSI41AcOA==
X-Received: by 2002:a1c:4c16:: with SMTP id
	z22-v6mr5513001wmf.89.1539363734540; 
	Fri, 12 Oct 2018 10:02:14 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t3-v6sm1766956wru.47.2018.10.12.10.02.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 12 Oct 2018 10:02:13 -0700 (PDT)
Message-ID: <aebad17deb4dcb278b86e61fd107a2e26e50c918.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 12 Oct 2018 18:02:12 +0100
In-Reply-To: <20181012162848.21502-1-hongxu.jia@windriver.com>
References: <20181012162848.21502-1-hongxu.jia@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH] openssl: use deterministic perl Text::Template module bundled by openssl source
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
X-List-Received-Date: Fri, 12 Oct 2018 17:02:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-10-12 at 09:28 -0700, Hongxu Jia wrote:
> 1. The building openssl requires to install perl Text::Template
> module(>=1.46),
> but Text::Template is a non core Perl module, openssl chooses to
> bundle
> Text::Template 1.46 into the source, for convenience.
> 
https://github.com/openssl/openssl/commit/8ff2af548303d311ce3591406111f77862875a60
> 
> 2. While Text::Template < 1.46, the produced build files are gravely
> faulty.
> https://github.com/openssl/openssl/pull/6682
> 
> 3. If host has installed Text::Template < 1.46 (such as CentOS-7.5
> has Text::
> Template 1.45). The mismatched old module was used although the right
> one in
> openssl source.
> 
> So set PERL5LIB to use deterministic perl Text::Template module
> bundled by openssl source and ignore the one of host

This sounds like a *much* better solution, thanks!

Cheers,

Richard



