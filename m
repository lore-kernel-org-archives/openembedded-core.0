Return-Path: <armccurdy@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6A39C76947
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 19:54:40 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so74688338wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 12:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=py9H/Sem4czzXmLyclVyobrsKa9L7qBoOT9TEH/Yx4U=;
	b=aTt4wMg2ujU0pfOTjNrr2XDidx+x3Qsg0/JZB9pxZA9ITZYhfLDPWGHWYsYuiY4jSO
	iGyHJxppxpUVWQYSMGiyuJgIRy2x89yrZuYBZ8pboyCaBYM4qmR9BxG2oUH7yikQJcz2
	zs6ZnFov3coWU77vPWPvmDelFQfK6WuifJiudhOW5FqVaIy9NgpgkycBjXGvESxiwdlE
	RrLIGj2ocHR7KFh+4RJPEuwjzs9vW4x2S74CvRopLWDcxdwtHzbRWQN2yw6GWGaNjJhw
	/Y0z5Y/wuSoIH2C2iXb3xnbHwg6TNS3RIc6QpHtX4fffP7QD+VEQHps+IXn6my9Cn1bH
	doTw==
MIME-Version: 1.0
X-Received: by 10.194.21.230 with SMTP id y6mr65629920wje.132.1439322880123;
	Tue, 11 Aug 2015 12:54:40 -0700 (PDT)
Received: by 10.194.89.129 with HTTP; Tue, 11 Aug 2015 12:54:40 -0700 (PDT)
In-Reply-To: <CAJTo0LZPwjPuxgnnjvAyqhBWoK8JWJdMOO2G6MGGgj1An6FxUg@mail.gmail.com>
References: <cover.1439204506.git.jussi.kukkonen@intel.com>
	<bf492f53a8df38b0f7d51f9e5409167d022dc291.1439204506.git.jussi.kukkonen@intel.com>
	<CAJTo0LZPwjPuxgnnjvAyqhBWoK8JWJdMOO2G6MGGgj1An6FxUg@mail.gmail.com>
Date: Tue, 11 Aug 2015 12:54:40 -0700
Message-ID: <CAJ86T=X3H8irDHCkohwFCdqou_-BuZLqHz7CYiAA9dqD5LruDw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
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
X-List-Received-Date: Tue, 11 Aug 2015 19:54:41 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 11, 2015 at 12:32 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 10 August 2015 at 13:08, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>> * Preserve the old 4.0.3 version (GPLv2+) and add new 4.3.1 (GPLv3+)
>
> Is screen considered sufficiently core that we should maintain both GPLv2
> and v3 recipes?  I'm not convinced it is.

Is it sufficiently "core" to be in oe-core at all?

Or maybe it's time to replace screen with tmux?

>> * Remove unused debian patch from SRC_URI of 4.0.3, increase PR
>
> No need to increase PR.
>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

