Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id BAE9C6B898
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 17:18:32 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id b8so3902050lan.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 10:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=p7pb5TU4rqjrXwPv/jGnNiEg1QVIGhQGHRy4ftMn13Y=;
	b=CpygWfEuQMiXJQvWofIhG3YGOv334Azdha86Eje6mOGdKV2aIUGd9FW4YAi/YVzqmh
	y2pTBidego5tG1gn3cuxRulnKinrzrvAjWZfcExmZh63lOjUaQZ068Oh54UH/Z6QQ4V1
	msSANA0GvqZlGk5JJORprdcLRCeR5L2tR5BJoxDTqGqTGM6uZZBqxQqjbr6Cvc4yOXLv
	TNJQrSjeP2RnhjvdQQMUU2839ljnABYCkhmbWaOQtIBimkEgJ4/AQ9UZHbQlmLy3/Cpb
	Fmt3IjDzcrdL0zU0sbg0Mo4L9ha3+Uz4YDST9N+j2RlBYRSpgAu8ZaDVAQG+XvLnL0KM
	TO7g==
MIME-Version: 1.0
X-Received: by 10.152.120.4 with SMTP id ky4mr10947lab.75.1396027112930; Fri,
	28 Mar 2014 10:18:32 -0700 (PDT)
Received: by 10.112.58.132 with HTTP; Fri, 28 Mar 2014 10:18:32 -0700 (PDT)
In-Reply-To: <20140328171338.GI3370@denix.org>
References: <cover.1395825881.git.kai.kang@windriver.com>
	<CAP9ODKpRZXUxM=QGOBR4xmh=vBWBd6VOqYK0AZwvon_MG4pQGA@mail.gmail.com>
	<20140328171338.GI3370@denix.org>
Date: Fri, 28 Mar 2014 13:18:32 -0400
Message-ID: <CADkTA4MxeTfzCY6YT4657jZy3btMN=wDDcUAaktzE=85SvunOA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Replace ocf-linux with cryptodev-linux
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
X-List-Received-Date: Fri, 28 Mar 2014 17:18:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Mar 28, 2014 at 1:13 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Wed, Mar 26, 2014 at 11:42:39AM -0300, Otavio Salvador wrote:
>> Hello Kai,
>>
>> On Wed, Mar 26, 2014 at 7:15 AM, Kai Kang <kai.kang@windriver.com> wrote:
>> > Replace ocf-linux with cryptodev-linux because linux-yocto use cryptodev-linux to implement /dev/crypto.
>>
>> Thanks for handling it; I was going to address same issue this week so
>> we could have it upstreamed and drop the Freescale bbappends for it.
>
> So, we also have a recipe of cryptodev for TI builds. But it's not just a
> header file and we need the actual module to be built and packaged...

As long as something out of tree can co-exist with in-tree implementations,
I don't see a problem with an incremental update that builds the module
as well.

Bruce

>
> I'm rather surprised it was merged so quickly w/o further discussion... :(
>
> --
> Denys
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

