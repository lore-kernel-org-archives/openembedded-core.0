Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6F4716D37F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 16:01:25 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id wp4so650867obc.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 08:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=WGkV+McBr8WIhWH2PCeJ1l+TzPvQYVX/S77liQpJx+g=;
	b=kHSOHLbDOZabLhC7bksHmQrZzRni6RdvFeB6rx4DUj3P02dGBkXeQdZOF0jwUfUgwR
	wEc3hdBzbKosR7YEr1/ifdLu3XBN1jGz2TB6LK/Fw5X7CAVSYz3Ba6gmP+hb6+95p9Zb
	8zPx9Q38tTTbkBsDPJzppFe04TAP9WAe1cW0qw4OHC3tGN5huYTRWYI5fYVW4QJFXCaY
	OGkYWGdwRa/zJYoibN+QF5AV4NXstEsVjTgtJhBX7WEx4BlCBLZYROV2gWnCAN6MtFDt
	P7Te5mzBOogd2ri9p9m3CH+cskSsFEf2T3rDZ0K3fAalpf3okaQe0HZ1ePg2bmEGvoUg
	fZZw==
MIME-Version: 1.0
X-Received: by 10.182.81.65 with SMTP id y1mr2422592obx.89.1384358486343; Wed,
	13 Nov 2013 08:01:26 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 13 Nov 2013 08:01:26 -0800 (PST)
In-Reply-To: <CAK6=ix7pDXwnH6+GOB7XmZedt1QnznfTPdUwUxRqVh+didTWSA@mail.gmail.com>
References: <CAKKsV2wExa=EZ4FWdcXiRJY1B=QnzO3uBTn2s23V9MtNSxOS0Q@mail.gmail.com>
	<CAKKsV2y+ZuaS27QqLtXjcY_qsT1UV01RVtdC=6C_SQpD7nJR5A@mail.gmail.com>
	<CAK6=ix7pDXwnH6+GOB7XmZedt1QnznfTPdUwUxRqVh+didTWSA@mail.gmail.com>
Date: Wed, 13 Nov 2013 14:01:26 -0200
X-Google-Sender-Auth: 8I7jv7L47Z9ht70_1rL4TXFcz8g
Message-ID: <CAP9ODKqy+pwcnjES=8gmkJYkqodQ=pGEMqGEh81RfhhJsX4Czg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Randy MacLeod <rwmacleod@gmail.com>
Cc: Behan Webster <behanw@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Exploring LLVM/Clang for OE
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
X-List-Received-Date: Wed, 13 Nov 2013 16:01:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 13, 2013 at 12:47 PM, Randy MacLeod <rwmacleod@gmail.com> wrote:
> On Tue, Nov 12, 2013 at 8:47 PM, Muhammad Tauqir Ahmad
> <mian.muhammad.tauqir.ahmad@gmail.com> wrote:
>> According to the link below [1], it seems some works has been done at
>> least for llvm+clang bitbake recipes, although I couldn't find any
>> clang recipes when searching the net. If anyone can point me in the
>> right direction for finding these recipes, that would be great.
>>
>> [1]: http://lists.linuxfoundation.org/pipermail/llvmlinux/2013-March/000205.html
>
>
> That would be Behan's work, adding him here.
>
> Behan,
> Are your clang recipes from, "Worked on bitbake recipes for LLVM and
> clang" mentioned in the March 2013 llvmlinux notes available?
>
> Everyone,
> Where should Muhammad stage his work and is there an example of using
> an alternative cross-compiler.

I'd say a github repository for now. This allow for easy forking,
contribution, provides issue tracking, wiki and so on.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

