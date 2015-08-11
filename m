Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 145357694F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 20:37:20 +0000 (UTC)
Received: by ioeg141 with SMTP id g141so214798251ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 13:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=LtpqsujW6w063YJ7gBNmARLKxJ2H/fUcBnGnX+OpwFU=;
	b=aBovmDpWQJ1tTIv04SXxMQyxqu8dfcwyt0Mi6vv3utmchVZzTec2ia2XxsV8LxTM6Y
	A0E1UoG8f1bTmwSg/3MOaoNZkQhKP9R4fjHMHeYVVe0QKoab0aoTa1ZrF/+AcSZqYfJx
	C2IXhpr+DTsss0SwlzS8gdBQRPkCxMcvar+Hs1dxM0e1QrNrhoMAFfWv3DyOZO3523OW
	+BDGpC2dqFsGD9HkIPTv+SrqNkdFHGNvFHhJnQt0stqXTBYaqzvCpebjU3e32bPPRX1j
	LrOfJnTOkX2cA2UaMWrBPZXePLql+zTENt7d+kI0rGBbOMIW3rOfWAZlQSUBzHRna8Tx
	ICYg==
X-Gm-Message-State: ALoCoQk3kzT8Yam48rWPgQPhfRQ5g/ReIBMLK2SvCWA3BShO3xgGQnvlbK+INFyHeOp9N/WUnZqk
X-Received: by 10.107.47.34 with SMTP id j34mr29549304ioo.136.1439325440710;
	Tue, 11 Aug 2015 13:37:20 -0700 (PDT)
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com.
	[209.85.213.173])
	by smtp.gmail.com with ESMTPSA id b78sm2321828ioe.2.2015.08.11.13.37.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2015 13:37:19 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igfj19 with SMTP id j19so46264igf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 13:37:19 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.64.212 with SMTP id q20mr21444952igs.5.1439325439241;
	Tue, 11 Aug 2015 13:37:19 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 11 Aug 2015 13:37:18 -0700 (PDT)
In-Reply-To: <CAJTo0La5e49wG7u4FquPpmRz-dBP4o4yH1kb3B_K0R4VaEFdNQ@mail.gmail.com>
References: <cover.1439204506.git.jussi.kukkonen@intel.com>
	<bf492f53a8df38b0f7d51f9e5409167d022dc291.1439204506.git.jussi.kukkonen@intel.com>
	<CAJTo0LZPwjPuxgnnjvAyqhBWoK8JWJdMOO2G6MGGgj1An6FxUg@mail.gmail.com>
	<CAJ86T=X3H8irDHCkohwFCdqou_-BuZLqHz7CYiAA9dqD5LruDw@mail.gmail.com>
	<CAJTo0La5e49wG7u4FquPpmRz-dBP4o4yH1kb3B_K0R4VaEFdNQ@mail.gmail.com>
Date: Tue, 11 Aug 2015 17:37:18 -0300
Message-ID: <CAP9ODKpJbDehW=UJ1=DgO8404v7XurYEPAFAOt0NzqVhwwPR5g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] screen: Add version 4.3.1
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
X-List-Received-Date: Tue, 11 Aug 2015 20:37:24 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 11, 2015 at 5:28 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 11 August 2015 at 20:54, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> > Is screen considered sufficiently core that we should maintain both
>> > GPLv2
>> > and v3 recipes?  I'm not convinced it is.
>>
>> Is it sufficiently "core" to be in oe-core at all?
>>
>> Or maybe it's time to replace screen with tmux?
>
>
> screen or tmux is a separate debate, but I believe that something like this
> is good for oe-core as it's so useful when all you have is a serial line to
> your board.
>
> I don't believe that's enough to keep two versions of screen in oe-core
> though.

I vote it to go for meta-oe. If it was core, it would have been sent
long time ago so lets add it for meta-oe and see how many people will
ask for it to be promted.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

