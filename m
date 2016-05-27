Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 44DA56FFD4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 10:28:55 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id g64so40893095pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 03:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=NZyVKZGgGXEzuGpO+2LYf1ehlQhDcpjbgVBzPWYm9dg=;
	b=Qb0379npHUmn00fIjciiGzpsngXXi6yzRGFbSVUy6o5vWngYSNSJwQN58JsVdayCTO
	j+wLxNtXwgXDLUIOLeHPBV4HJe+tHmBLnBi7rMLAbu/egavBbAIsmBI01Vc9ZplPglx/
	lYhqJsta/b2TWzsMG2ucLuDPw5s53Ug+RcAOYZzjvcJ3X/txyfV86TTXHppCHQZyqcyU
	e/CnIsewWWaGfScsAOVN9wsAnjeXXawsNcq27BXYIhnwud7nwDLUMrMnLkbsMEDrP1nX
	/LRe9fKHF3cL80BtCDMb0b0S886w2VcTU/DH6PIdZcR929L6s1g4mbuL0qhqcrTxhsjI
	bdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=NZyVKZGgGXEzuGpO+2LYf1ehlQhDcpjbgVBzPWYm9dg=;
	b=WE4CNr48vTMx9pr7UZHbDa0dqQPqNV8yGE4CmKlrLm1NuQ7Jw1NFUvyaRxTMFHXVrw
	mlGjoHQ9WG+1S0z7cnyR8cb6Bt6lQPwkQPxDQGs0AYe9QkfxQeSe0ArdC78TrL1NT94J
	3WjYMbq1aZl/WT0iEKsHtwLhQcHjrHqVLWczj0WQ3Uw0pq3v+jl6TXUBZxWeVBUXjJod
	6fkgnFFpH3JCWcvlbaoeVYUP72GpIRwZp6z4YQMpPN2F9CjfsYRFgVk9k6y37HezeUMV
	4PrKPfgidjExZs3YToBpOfDtMQ8JS6vWApnYB7EA8sajyg2HMboiiHkUOgDxzoKxUvle
	/93A==
X-Gm-Message-State: ALyK8tId33KYFEUUaqwtZtysgbD5XAhwF3IFFVQ4Bw/N9xlH8fBAHDDbuq62aVNksvNl1A==
X-Received: by 10.98.91.198 with SMTP id p189mr21591979pfb.146.1464344936505; 
	Fri, 27 May 2016 03:28:56 -0700 (PDT)
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com.
	[209.85.220.51]) by smtp.gmail.com with ESMTPSA id
	k71sm12575513pfb.50.2016.05.27.03.28.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 May 2016 03:28:54 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f51.google.com with SMTP id fy7so22578688pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 03:28:54 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.67.14.7 with SMTP id fc7mr21350802pad.1.1464344934329; Fri,
	27 May 2016 03:28:54 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Fri, 27 May 2016 03:28:54 -0700 (PDT)
In-Reply-To: <20160527101056.GB2570@jama>
References: <1464036327-4826-1-git-send-email-otavio@ossystems.com.br>
	<1464270076.19134.19.camel@linuxfoundation.org>
	<CAP9ODKqGzsGm747bAg2N_z-mu-jXt2PB1mFL-2r7-dyNnxC8og@mail.gmail.com>
	<20160527101056.GB2570@jama>
Date: Fri, 27 May 2016 07:28:54 -0300
X-Gmail-Original-Message-ID: <CAP9ODKriKjRECTSRv_fx0M7MZQ1j_yLayVTx0TDOa2wounbVCQ@mail.gmail.com>
Message-ID: <CAP9ODKriKjRECTSRv_fx0M7MZQ1j_yLayVTx0TDOa2wounbVCQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Improve SSL certificate handling
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
X-List-Received-Date: Fri, 27 May 2016 10:28:57 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 27, 2016 at 7:10 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, May 27, 2016 at 06:55:30AM -0300, Otavio Salvador wrote:
>> On Thu, May 26, 2016 at 10:41 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Mon, 2016-05-23 at 17:45 -0300, Otavio Salvador wrote:
>> >> This patchset leverage the OpenSSL certificate handling so it works
>> >> aligned with Debian and other generic distributions regarding where
>> >> the certificates are stored and how they are installed.
>> >>
>> >> This all started when debugging why SSL certificates were not working
>> >> properly for a customer which was using QtWebEngine. It turned out to
>> >> be the integration which was not complete so this patch addresses it.
>> >>
>> >>
>> >> Otavio Salvador (3):
>> >>   openssl: Add Shell-Script based c_rehash utility
>> >>   ca-certificates: Use c_rehash utility
>> >>   openssl: Ensure SSL certificates are stored on sysconfdir
>> >
>> > Initial tests were ok but we've just seen:
>> >
>> > https://autobuilder.yoctoproject.org/main/builders/nightly-oecore/build
>> > s/792/steps/BuildImages/logs/stdio
>> >
>> > I've not looked into it but it would seem to implicate these patches :/
>>
>> It does seem to be caused by it. I sent a v2 fixing it.
>
> v1 was already merged, so you might want to send just rebased fix

Thanks; I sent a new patch for it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

