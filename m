Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id CF19A767B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 07:55:00 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so16258093wic.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 00:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=n5evyfQgHq2OQRj4yop5mWs0eXQi+Xzt3mGN/6r5KHw=;
	b=kSG70KzKLOJUHZJjFNw4e3mZ6gB5DGpPAlGGzpljIT6YtG3A2c4DV/cbrEbiCLcx2A
	5TovvOs0per+HSemi5wNL18Wq+6+y0E4fk3QRFbAkF/2xmkcqNKlTGWVePIq+VuKCBbL
	3B17Tb3J4L6szgVvE2Gl8TrNLZFByb3f2XcvzyruzjGVT8z3ElJi5jJK8bYZYpKMdoKn
	Qir1MVQg7aE+2EhLKVI/ds590aRb3xMYLKF8mQFRQw07GcE0HzDtLLcaYsf6tsJnJBVq
	3+sogUQisFAdJqj9jAaYCoFeKupOjqwoqXiUNcF8ZEkDgw+DOy2emJEEKLsR7H8R1QBb
	gKKQ==
X-Gm-Message-State: ALoCoQnRSbvNieEAG+9yNdxrEWXxI4DjGwcJVMXUyOs8AJlTDFHutYD4FNB/1OeIWUU+Yu2zPQMh
X-Received: by 10.194.191.129 with SMTP id gy1mr31836184wjc.86.1439366100290; 
	Wed, 12 Aug 2015 00:55:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.175.160 with HTTP; Wed, 12 Aug 2015 00:54:30 -0700 (PDT)
In-Reply-To: <CAP9ODKpJbDehW=UJ1=DgO8404v7XurYEPAFAOt0NzqVhwwPR5g@mail.gmail.com>
References: <cover.1439204506.git.jussi.kukkonen@intel.com>
	<bf492f53a8df38b0f7d51f9e5409167d022dc291.1439204506.git.jussi.kukkonen@intel.com>
	<CAJTo0LZPwjPuxgnnjvAyqhBWoK8JWJdMOO2G6MGGgj1An6FxUg@mail.gmail.com>
	<CAJ86T=X3H8irDHCkohwFCdqou_-BuZLqHz7CYiAA9dqD5LruDw@mail.gmail.com>
	<CAJTo0La5e49wG7u4FquPpmRz-dBP4o4yH1kb3B_K0R4VaEFdNQ@mail.gmail.com>
	<CAP9ODKpJbDehW=UJ1=DgO8404v7XurYEPAFAOt0NzqVhwwPR5g@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 12 Aug 2015 10:54:30 +0300
Message-ID: <CAHiDW_H1QaKH2CmN41eXdcGBhiru8B2szB6ExMFP7YZPS7SL9g@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
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
X-List-Received-Date: Wed, 12 Aug 2015 07:55:04 -0000
Content-Type: text/plain; charset=UTF-8

On 11 August 2015 at 23:37, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Tue, Aug 11, 2015 at 5:28 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 11 August 2015 at 20:54, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>
>>> > Is screen considered sufficiently core that we should maintain both
>>> > GPLv2
>>> > and v3 recipes?  I'm not convinced it is.
>>>
>>> Is it sufficiently "core" to be in oe-core at all?
>>>
>>> Or maybe it's time to replace screen with tmux?
>>
>>
>> screen or tmux is a separate debate, but I believe that something like this
>> is good for oe-core as it's so useful when all you have is a serial line to
>> your board.
>>
>> I don't believe that's enough to keep two versions of screen in oe-core
>> though.
>
> I vote it to go for meta-oe. If it was core, it would have been sent
> long time ago so lets add it for meta-oe and see how many people will
> ask for it to be promted.

I'm not totally sure what _exactly_ is being said here... so paraphrasing:
* Ross prefers dropping screen 4.0.3 but keeping 4.3.1 in oe-core, correct?
* Otavio/Khem, are you saying we should remove screen from oe-core and
put 4.3.1 into meta-oe, or did I misunderstand?


For what it's worth, I'm happy to remove 4.0.3 at least: if Debian
thought it required 19k lines of patching (in oldoldstable days!),
there could well be dragons there and I wasn't planning on spending
much time finding them.

Cheers,
Jussi

