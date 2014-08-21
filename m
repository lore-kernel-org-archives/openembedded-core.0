Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 25A77601A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 16:55:11 +0000 (UTC)
Received: by mail-yk0-f182.google.com with SMTP id q9so7830251ykb.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 09:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=g445NKFS5npIv0qWDpJiokjx7/CNCNnfa5jY2elvT94=;
	b=uepw1Sh5IvbeGDsKcos8ss02jhnAau0W+3XoWgZyiZwbfKRqUokJiRPrmvP83lHohX
	1KJfavrInXn8/NjWsApx3BKQc+lgMZpxkhJuV5/xozoCxPZDIn6nkAGF7gB078BH5eYU
	uai8ovMwj0PMbarXoTj5MqPwCOROpumYFAVoJ1MIMnTC0FZJqm4F4cyd29neZBouPfy2
	v793XMVMuwXv4v8MIaCf23Jftic+wlN/Day9K2pD2zMjZpXKBLGphoHjANpzmP5ZPdem
	wpvRHiO8o6uqtdhNJkoOmMPcVraqTBgzJvkhF1zAO0Ibj0THDbUpXjrcybvZaa/qjQB7
	wluQ==
MIME-Version: 1.0
X-Received: by 10.236.23.70 with SMTP id u46mr81949664yhu.13.1408640112939;
	Thu, 21 Aug 2014 09:55:12 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Thu, 21 Aug 2014 09:55:12 -0700 (PDT)
In-Reply-To: <53F60350.4010005@gmail.com>
References: <1408316808-13486-1-git-send-email-akuster808@gmail.com>
	<1408606690.1669.103.camel@ted> <53F60350.4010005@gmail.com>
Date: Thu, 21 Aug 2014 13:55:12 -0300
X-Google-Sender-Auth: 5hzcwvzfR0QHA3Umu2Ryj-V6iq4
Message-ID: <CAP9ODKr7T+64hTcNr6-L=c11RxzX_QPXQioeu6hx5LZatTFx4w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] nettle: update nettle to version 3.0
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
X-List-Received-Date: Thu, 21 Aug 2014 16:55:12 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 21, 2014 at 11:33 AM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 08/21/2014 12:38 AM, Richard Purdie wrote:
>>
>> On Sun, 2014-08-17 at 16:06 -0700, Armin Kuster wrote:
>>>
>>> With this update, LGPLv3 or GPLv3 where  added to many files.
>>> Each supported algorithms govern which license they want.
>>> Many are stated as  "ether v2 or v3 or both in parallel".
>>> Update license to be v2 or LGPLv3 or GPLv3.
>>>
>>> The previous verion had one GPLv3 file so the license was incorrect.
>>
>>
>> With this change, "bitbke gnutls" stops working.
>>
>
>  gnutls is targeting to port to nettle 3.0 in gnutls version 3.4.
>
> what should I do?

Revert for now? :)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

