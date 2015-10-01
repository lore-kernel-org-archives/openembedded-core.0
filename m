Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7763C770B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 20:30:35 +0000 (UTC)
Received: by igcrk20 with SMTP id rk20so3474385igc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Oct 2015 13:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=HL/80y190DQIFzvJbMpqnm/KFJKWlEDbtOOLEM5ikPk=;
	b=DLgHdFO9BfeH9NplPbdpZ7uO/dBG0N00E729eqQr1ct1JuNm2QxOBv010M1skPpygm
	uwBYC8mxrrIng5ZjIbVQEun+1l5ZmOkmvx3wTxUdordNx7qZLsD9wYhed+3fpHx1cqDA
	QQRNL+f0DDzgG+59njQ1j0O2oQIqaolrGZJx0/L0s7skv5F4F2lmQdovTrcL88tb9TA3
	yDNrA4MM47BJ27R6DquwoMB4M0LfWUKuGvKLXZZKlZdyzsgQTnqEUd1Ip/nlyifRmcJT
	1Gro1FTMUJWx4Z2TIAMZ7ib9pf7ElZnLLhqYlSA7msqN+ZS/179wWo8XS7ph5MY1/R3f
	PK1A==
X-Gm-Message-State: ALoCoQmIM9qYX5JvZPSHeAQLcN5rweHJ/80b9Nsuh8xAwuhMHT0pWcNSfrmSRfZy5OaEm8cMBl2I
X-Received: by 10.50.27.102 with SMTP id s6mr851996igg.23.1443731436086;
	Thu, 01 Oct 2015 13:30:36 -0700 (PDT)
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com.
	[209.85.213.179])
	by smtp.gmail.com with ESMTPSA id kj5sm2548713igb.2.2015.10.01.13.30.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Oct 2015 13:30:35 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbkq10 with SMTP id kq10so4424766igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Oct 2015 13:30:34 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.66.229 with SMTP id i5mr933126igt.5.1443731434585; Thu,
	01 Oct 2015 13:30:34 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 1 Oct 2015 13:30:34 -0700 (PDT)
In-Reply-To: <1443731146.14733.30.camel@linuxfoundation.org>
References: <1443709445.14733.5.camel@linuxfoundation.org>
	<CAMKF1spovYNRYZQjaghtiRdJtgs3BxHqotiv-t7n2h0DStiiDA@mail.gmail.com>
	<1443713835.14733.13.camel@linuxfoundation.org>
	<3712B443-8857-41CB-87F9-DFFC12FE69E9@gmail.com>
	<1443731146.14733.30.camel@linuxfoundation.org>
Date: Thu, 1 Oct 2015 17:30:34 -0300
Message-ID: <CAP9ODKp2of3-766hOc_=Naqsa12uk5FntfgeHXwPcxnrQR+u6Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Branched for release
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
X-List-Received-Date: Thu, 01 Oct 2015 20:30:36 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 1, 2015 at 5:25 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2015-10-01 at 10:24 -0700, Khem Raj wrote:
>> > If we want to discuss this all again, so be it, but on the eve of
>> > release really isn't the time to start it all again.
>>
>> so when is the right time ? Do we have long enough pre-notice about
>> when we the branching is going to happen?
>
> We release approximately in April and October with a six month cadence.
>
> After the complaints about communication, there have been weekly status
> updates and the release dates were also *clearly* shown in there for
> when the release was planned. Incidentally, if those aren't useful,
> Stephen and I can stop doing them.
>
> Its not unreasonable to assume the branch for release happens sometime
> before the first rc build of the release.

I think what Khem means is that any time is time to discuss the
release process as this is a community driven project and we must to
be open for feedback and revisit our previous concepts.

I agree with Khem concerns here and I also believe we should rethink
the versioning / branching schema.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

