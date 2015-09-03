Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2A51B76FF2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 20:22:44 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so1890211igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 13:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=6S119ePrLUJKMvIjErQLmn5Hd+2Dq5XFYK9vgkV4T8I=;
	b=msy5lZS4GiKg2YvyBPzo94qQBz6lMGS+91ojjSNBfl/O7UTNgy0teWmxqrkcPzp2Bl
	4UkUGIi+nqgE05Xa31SDllpC15MsIARugG61HET14orjpBWApAXwEmja0kwToOFga/T5
	0BaP9rPl6dD/fnoH4Oioyi/Au1OLP1/UGYgzXpuQi4rAzusZRbR/a6HMX8qEMYitosSq
	V5c+Nciu4elPWCpfwv1kINLzcgnwqVZ+ChPSy2Y3KKnfr24Cn+JPWrukqR7+3LqdTwlQ
	Afuu7vFv1K8Q9Hq266AQTaT6tv4n0My8HOp/zt2HuxRez3jWfW49anK0jiqegYkn+/ZK
	+fFA==
X-Received: by 10.50.55.73 with SMTP id q9mr1995154igp.11.1441311764997; Thu,
	03 Sep 2015 13:22:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.202 with HTTP; Thu, 3 Sep 2015 13:22:15 -0700 (PDT)
In-Reply-To: <CADkTA4N7yd=iNEJh4dY8Mdt75j25RV8LgCQAqsZ8zRw_h=o1wg@mail.gmail.com>
References: <1441143270-27322-1-git-send-email-jslater@windriver.com>
	<1441143270-27322-2-git-send-email-jslater@windriver.com>
	<CAP9ODKp5sMLAB1ohdVPAPZrDeUCjfSGuLVF-VU53BsvzHX29mg@mail.gmail.com>
	<55E74986.1030703@windriver.com>
	<CAP9ODKpx4niWDNDy4t2SUf7xwz5ShoZMsivtM6_qA3o-kBo5AA@mail.gmail.com>
	<1441282288.24871.113.camel@linuxfoundation.org>
	<CADkTA4N7yd=iNEJh4dY8Mdt75j25RV8LgCQAqsZ8zRw_h=o1wg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Sep 2015 13:22:15 -0700
Message-ID: <CAMKF1sp=Hiwt=oYfFy8Mhj4TMXj3x3Tykmg6mNLLtyEXV+TVwQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Joe Slater <jslater@windriver.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [PATCH 1/2] ifupdown: import recipe
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
X-List-Received-Date: Thu, 03 Sep 2015 20:22:45 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 3, 2015 at 5:20 AM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>> To put this another way, I think it is probably reasonable that we
>> should be able to build an image from OE-Core with basic functionality
>> like networking without busybox?
>
> That's what I'd support. If everything you need for the functionality with busy
> box is in oe-core, to me, it doesn't make sense to go outside core to get that
> same functionality without busybox.

irrespective of this change. I see yet another configuration with this
into OE-core, overall OE-Core should get smaller
and case does not sound convincing to me. You dont want to use busybox
in a fairly large image which has other GPLv2 software in
it. Thats fine but doesnt look like a common usecase to me

