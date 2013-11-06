Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id AF5B16B1A9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 03:21:53 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id c11so7379427lbj.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2013 19:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ppKIagO2OxvHkWvecD+8Vpe+rF7bYPe+yT1fLf2bEIE=;
	b=WKdu0BcCme8Ds6c03odTezAqFc5cV07pxmACQQHOM137zzgWT6bVZf1WgbEUaadKEx
	UORbKpuUOEGpj7ajIjYG4S8b1FNAdosvuoDyx9AiArB0lsv5Cqte0C0I2R+4e8pAj1zu
	m/xNwarLeVGoCrILrzgQcWs8fL7wgNiNDAtUMW5pNB/DqnZUNlJH62Ws/Jm8Mdetk8eF
	R8PylKsPo6IXFxf2p9mXA7lhXx2IotWm5yIgsQ7YYExeD3r17MyYO53/kvS3TJ+aIv+3
	bqPncbpxnuEm1O3whgjcCofKFqK/IQAk6MelSLY62El1HhMJFSSIb47+cSUv3oCjMs2Q
	6zLw==
MIME-Version: 1.0
X-Received: by 10.152.28.105 with SMTP id a9mr29492lah.41.1383708114448; Tue,
	05 Nov 2013 19:21:54 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Tue, 5 Nov 2013 19:21:54 -0800 (PST)
In-Reply-To: <1383684977.8901.133.camel@x121e.pbcl.net>
References: <cover.1383677174.git.bruce.ashfield@windriver.com>
	<1383684977.8901.133.camel@x121e.pbcl.net>
Date: Tue, 5 Nov 2013 22:21:54 -0500
Message-ID: <CADkTA4O-dTZO3uKtdbA3bnbhsxZUzuw3_YZoz0tRB+aeYy5WvQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] linux-yocto/3.10: fix qemuarm boot and spurious mips build warning
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
X-List-Received-Date: Wed, 06 Nov 2013 03:21:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 5, 2013 at 3:56 PM, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2013-11-05 at 13:47 -0500, Bruce Ashfield wrote:
>> I don't have anything extra to add outside of what I put in the
>> patch commit log ..
>
> That's certainly a good thing and to be applauded, but in this situation
> maybe you could consider just sending the patch without a cover letter.
>

I honestly dislike lone patches in nearly every situation. So let's
just say that
opinions differ and leave it at that.

Cheers,

Bruce

> p.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

