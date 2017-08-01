Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id C3C1178246
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 20:32:33 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q189so4687701wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 13:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=rctHE3DHyX8y3ju48o0nvmDwo+c/41leA2Mb3G9sDXE=;
	b=jiK2ONQC/FfPllD+kDcVW6ogJ7J3eo6ElQm5f/syJbjK5lMV93dasCQFie3KezYf5W
	jXHdc08QgNxFTKWpVLFadAQGFz70OinczXXWsKBQ6Xg6/FsV9Ds6ZcW6fUvWAYOugUcX
	sa1CGbLvfDYdMFfLB2gnbLdAhgJuE4Txp/qFahRQD8AZViVYeQsa9ql7v0jWcJ0aeBF/
	wVRs7Xax3nC5yVuQ9+qoJA1gysxXTpgD7+m0H7zd8kYx4kTF+JYJ1RDuyJ8jjuC79cOR
	pZvOMVfGmadt9psT28hpph+KpYY7kij0ouUjoImm/APas0Gn1Fj5wQ1MzGyi/Gc+xcFI
	9UwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=rctHE3DHyX8y3ju48o0nvmDwo+c/41leA2Mb3G9sDXE=;
	b=LDyIrkTP6ew1tNtDz5+0gx6dMiU2BXwA2v+8UQ9TnEIfLRcpwZ4SjlkX9mwYhQsklb
	EduynfT7M6SaG0W4j2yjxinfLymFzk9clRF3Yuw2/HdoCrCvXIOdv2gQBmYRGtHzqich
	26IiTv4KmJhRDTfP02UmPmiHPYfZwiIqa7E912SlsFYTCAw571sQGYOI/sDtjrgcMGdd
	WZBULXQkCjxD9AENMgBH8HX+sHJTYNkvpz7UlNOjYO2ohxsfcGg6kGM8m9IAH/hQQ2UB
	1I7Zp7Hd/1LCp3tuiFIw6f1FHlElTAOPJuF6uReOyntaKTPlRmvgdK8PweeI8yCHKKo1
	Qfrw==
X-Gm-Message-State: AIVw1125kzoB2UhEwDfAqU6u76Yl46QHrvFn6qb764RnKGuL+ZCxgr+Q
	Hcqx8scNLtKYpdVA3MQ=
X-Received: by 10.80.153.38 with SMTP id k35mr18074467edb.63.1501619554192;
	Tue, 01 Aug 2017 13:32:34 -0700 (PDT)
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com.
	[209.85.128.176]) by smtp.gmail.com with ESMTPSA id
	w26sm1324273edw.94.2017.08.01.13.32.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Aug 2017 13:32:33 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f176.google.com with SMTP id 33so11167456wrz.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 13:32:33 -0700 (PDT)
X-Received: by 10.223.179.211 with SMTP id x19mr2387250wrd.7.1501619553021;
	Tue, 01 Aug 2017 13:32:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.198.70 with HTTP; Tue, 1 Aug 2017 13:32:32 -0700 (PDT)
In-Reply-To: <4a2dc4e3-7291-ad72-838c-c54a907312e6@gmail.com>
References: <14e5f528-a64b-94e2-4e86-7a22770623d6@yadro.com>
	<9d9d1ea9-d594-e08d-9e17-858b10a1aeca@gmail.com>
	<4a2dc4e3-7291-ad72-838c-c54a907312e6@gmail.com>
Date: Tue, 1 Aug 2017 17:32:32 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqTykvrXqC82Dyq2X_v7MOLbOormG2YCjFoyvxs2_iW3g@mail.gmail.com>
Message-ID: <CAP9ODKqTykvrXqC82Dyq2X_v7MOLbOormG2YCjFoyvxs2_iW3g@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Anton Novikov <a.novikov@yadro.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] (morty) Arch Linux build fixes
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
X-List-Received-Date: Tue, 01 Aug 2017 20:32:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 1, 2017 at 5:30 PM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 08/01/2017 02:50 AM, Ian Arkver wrote:
>>
>> On 21/06/17 10:05, Anton Novikov wrote:
>>>
>>> [3 patch attachments]
>
>
> only one patch is missing
>
> "fix case fallthrough and printf overflow warnings"
>
> the others I already had from other back ports. all are in my
> akuster/morty-next.

It has been there for  a while; what is holding them to be applied?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

