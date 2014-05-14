Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (unknown [209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id BA9BF65DBF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 20:33:51 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id f73so2196176yha.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 May 2014 13:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=8RfSTE0ID4Iwp/vmF5bP+gYNWcIx+4vkIWy5txUVGMM=;
	b=xF5o+NX0+DP/vitQTb8Ni3aYhHp4U+G0OmZzv2YV739nQNV0jwF8QrOf+5v5gdPDXW
	KSNoCtO40TBuKiAxs2Qx+YIz64J75bdwS07Tdnw8hfuSL8rz45dDzC0xCixlytZEtEih
	jz+S8d2sziHKliOCnaqLPeK6IVM7EDwWYCKiHda7kxc41aEBWcE9vc4ikIwp7uaKnsd5
	swtb3ywg0/AoRVLc1ExNlDet2ziM4xR8NLnElbpWNQ6ukJxqLHGI1RxdqVhDJzJYKx6b
	TOmGsv7p9MVb3xeJ5xmy6N51fDpocGlTx28ukKo3gsCVOqbncUAvb1zha7iVq7AzstJH
	xIfg==
MIME-Version: 1.0
X-Received: by 10.236.142.16 with SMTP id h16mr8871060yhj.2.1400099295444;
	Wed, 14 May 2014 13:28:15 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Wed, 14 May 2014 13:28:15 -0700 (PDT)
In-Reply-To: <CAMKF1sp=KGMCDifbt8e=o5zRNMMKXff65-qJFHUOuuD4evikvw@mail.gmail.com>
References: <CAP9ODKqmfR6KJa34QF1HMhBwx9muYNmTznZMJ_WH=uVKieTULA@mail.gmail.com>
	<CAMKF1sp=KGMCDifbt8e=o5zRNMMKXff65-qJFHUOuuD4evikvw@mail.gmail.com>
Date: Wed, 14 May 2014 17:28:15 -0300
X-Google-Sender-Auth: b-NlaIXgm0_H33JZtMwEmUsH0mY
Message-ID: <CAP9ODKphtj3czGzPhStYeOL9ZMGO=5ykhuEmaSfTgnzTCPNwtA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: FTBFS: qemu
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
X-List-Received-Date: Wed, 14 May 2014 20:33:55 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 14, 2014 at 5:26 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On May 14, 2014 1:18 PM, "Otavio Salvador" <otavio@ossystems.com.br> wrote:
>>
>> Hello,
>>
>> Is this error already known?
>>
>> http://errors.yoctoproject.org/Errors/Search/Details/334/1/10/97
>>
>
> yes your build box needs to have sdl installed otherwise disable it in
> local. conf

Well and why sanity check didn't trigger a failure? Should this be
added to the sanity check and doc?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

