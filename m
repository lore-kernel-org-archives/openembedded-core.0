Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6A95F76FDE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 22:51:33 +0000 (UTC)
Received: by iofb144 with SMTP id b144so814737iof.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 15:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=qrQo+NNxb1ai40HqhKSt20iJj7yGl4vPlNTRZasuMRQ=;
	b=PL88qYFIc0EnbW/yY5hIZL0V+VDNCv/Rb0zdKiAwiQz+R+J9Se3uOHIzMpwx3hIEPz
	qXAkCgVv/SOIA5De4I9gKamfsOfskDAUtWP+KuO1/dNxZBqnQKUkC9fixpuI+onczvhn
	JZ/QPMABedeFzSYmzFKrt45Pi8KO6011TCFKf8qvnCT/qvxrDo/Bq6WhqahTC5gOTggq
	9oki7ZZwmM/i+qhiOjVME7vBgYL+U+KBIzVTI6Vd1I/WaNfVCJghDRx1edPNLtY5kR1I
	oZ3VEOsKgTqQ5Epft9umhcoYbES7NZvKdotz60jAFubLGO46DeVWu7AC1pkIiDUc6NXB
	tLkA==
X-Gm-Message-State: ALoCoQkTcVXKHYqd+M3Ht9UzXuu6szkm+XSQp/nMBOq9khSdTzyrA+GWzkp8XbJbKNEFBwP6JyZc
X-Received: by 10.107.35.66 with SMTP id j63mr14662313ioj.167.1441147893868;
	Tue, 01 Sep 2015 15:51:33 -0700 (PDT)
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com.
	[209.85.223.182]) by smtp.gmail.com with ESMTPSA id
	x23sm8781084ioi.41.2015.09.01.15.51.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Sep 2015 15:51:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ioiz6 with SMTP id z6so772648ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 15:51:32 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.7.225 with SMTP id g94mr598797ioi.28.1441147892166; Tue,
	01 Sep 2015 15:51:32 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 1 Sep 2015 15:51:32 -0700 (PDT)
In-Reply-To: <255516EC-098E-457B-A2E6-2F7C953CAA8D@gmail.com>
References: <8B394616-9009-4FF4-828C-561A859D34B3@gmail.com>
	<20150901215512.GE2458@jama>
	<CAP9ODKq=HsV79hXhHeCwdhpF6uhHdCxYrhC53Kt5+Pe6Qdpf1w@mail.gmail.com>
	<255516EC-098E-457B-A2E6-2F7C953CAA8D@gmail.com>
Date: Tue, 1 Sep 2015 19:51:32 -0300
Message-ID: <CAP9ODKp9Vkw-vHNp1PMqE1eTfmW8-s5o6+0JYTv=sFEHm9nc1g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patch merge process
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
X-List-Received-Date: Tue, 01 Sep 2015 22:51:36 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 1, 2015 at 7:46 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Sep 1, 2015, at 3:05 PM, Otavio Salvador <otavio.salvador@ossystems.com.br> wrote:
>>
>> On Tue, Sep 1, 2015 at 6:55 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> I hate to say it, but for meta-oe and meta-qt5 I would like to use
>>> gerrit - it's great to see all related information (all revisions of the
>>> patch, all review comments, all results of verification builds) in
>>> single location from where you do the actual submissions to official
>>> branch when all criteria are satisfied.
>>
>> Me too; we have been using Gerrit for patch management for a while and
>> it works very well.
>>
>> If you want, we can host it at our server, by the way.
>
> hmm can we use gerrit.openembedded.org or review.openembedded.org ?
> may be redirected to a different hosting area underneath.

If people want it, we can provide a VM for it. So OE can freely host it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

