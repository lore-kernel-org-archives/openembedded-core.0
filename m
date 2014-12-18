Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5679772821
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 14:44:17 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id i57so581727yha.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 06:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=MWnqFP9YrTKHmLLSAmBDxvC0dvKknfz8DuIcG1SD8RY=;
	b=kbhunikkDUkNqTnjrShL9xa9pH3mcxr/IMT4AcI34qSN2PtTJG5pFfJcv7lX3NmaGO
	IaWKx3C0HJY85OZSoGc6g9jBQS8RThmTYmv19QXAIud5PGVXZVC4p9WtLfxiSyt93aN8
	0ZzkI5pdlhQ8WHX+YsKkQRPcw1v8veWzsLMktFrJxzJPv2qucRrIrU9kLY6XYEHAAmsw
	lyOdyUEw6L+0TGDNDOobuwcXhnTuGI4qZv/r5lLKxHOlun645VnPE6+6tPNhiUm65y66
	zLweSublY5jhgmx6XblSg+dmNIy8sBNfi/teXegMp7Pz2WcDt/LcQev29u+/PDMwMOkJ
	zY/w==
MIME-Version: 1.0
X-Received: by 10.236.44.8 with SMTP id m8mr2052494yhb.136.1418913858429; Thu,
	18 Dec 2014 06:44:18 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Thu, 18 Dec 2014 06:44:17 -0800 (PST)
In-Reply-To: <5492E26C.1090700@topic.nl>
References: <1417688866-8329-1-git-send-email-mike.looijmans@topic.nl>
	<1418912251-3313-1-git-send-email-mike.looijmans@topic.nl>
	<5492E26C.1090700@topic.nl>
Date: Thu, 18 Dec 2014 12:44:17 -0200
X-Google-Sender-Auth: vpkCtTIMksXnAG6-dx04TYCgE7k
Message-ID: <CAP9ODKrqd6L+-rOtjNFCmf_hDzWzbns1v7jCXV5PPfdW8K-_ow@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 3/4] busybox-mdev: Add hotplug kernel module support to mdev.conf
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
X-List-Received-Date: Thu, 18 Dec 2014 14:44:28 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 18, 2014 at 12:19 PM, Mike Looijmans
<mike.looijmans@topic.nl> wrote:
> Add a line to mdev.conf that tells mdev to load kernel modules when
> required.
>
> For example, if you built wifi support as an external module, inserting
> a wifi stick into a USB port will now automatically load that module
> into the kernel and the wlan device will be ready for configuration.
> Without this patch, you have to load required modules manually or force
> them to load at system startup.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

