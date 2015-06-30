Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7C56A65C60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 19:06:49 +0000 (UTC)
Received: by obpn3 with SMTP id n3so13168617obp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 12:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=LRsVHf8rYy3NBZNNZjJAZ63e2WNiIiX8Z0hLQsi2dfY=;
	b=Hp6lIfWGBszd9E42eyzoDJ1OalfFWCJgfNoQBS9kL4UBM4qYtkn3EK5w1xHxS5ebEK
	ScWflcbS+gOiJ4TRHhx2lgjtJ6OsdbP6lOyz+ne3FMb7O+d1hr0AFCqU4dGwH2mzoY4l
	nEtg6Wsjx+pT6t78pMviyqjtpP1x86yjqKu0hsmZ7uA1WNoELKx1OkFD41RQ8MAywYiB
	J4ErjLbeHpY4IYrE1izqfFsW52oUiiPrVMK5itRS6dMNcBg3EXTipGnF+DLTG4AZTmMI
	fNN5FajC+4SjZGzwtPBSHfcjIi9DhDUmOog5va3b4u/LOOpCGDEvHvIG0rr8hXb6WAwG
	fjtA==
MIME-Version: 1.0
X-Received: by 10.182.196.72 with SMTP id ik8mr20938346obc.36.1435691210570;
	Tue, 30 Jun 2015 12:06:50 -0700 (PDT)
Received: by 10.202.64.130 with HTTP; Tue, 30 Jun 2015 12:06:50 -0700 (PDT)
In-Reply-To: <1435676821.3178.4.camel@collabora.co.uk>
References: <1435486480.10583.85.camel@linuxfoundation.org>
	<1435573194.3287.13.camel@collabora.co.uk>
	<CAJ86T=WvDKfhK_DTcZmBEZkuTJ-bQWTKqmR8bCak6tr9vkKwuw@mail.gmail.com>
	<1435676821.3178.4.camel@collabora.co.uk>
Date: Tue, 30 Jun 2015 12:06:50 -0700
Message-ID: <CAJ86T=W62s3YVASsb99v3LJUUSqymi=CoxV3tJb3B1qocuAzew@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: fido status
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
X-List-Received-Date: Tue, 30 Jun 2015 19:06:50 -0000
Content-Type: text/plain; charset=UTF-8

Hi Joshua,

On Tue, Jun 30, 2015 at 8:07 AM, Joshua Lock
<joshua.lock@collabora.co.uk> wrote:
> On Mon, 2015-06-29 at 13:25 -0700, Andre McCurdy wrote:
>>
>> One minor comment on the patches already merged. This change:
>>
>>   http://git.openembedded.org/openembedded
>> -core/commit/?h=fido&id=f46c2ac0fd05f0e10258d8f03bfb2ebd0c2bcbe3
>>
>> was reported to cause problems for multilib [1]. It needs this follow
>> -on fix:
>>
>>   http://git.openembedded.org/openembedded-core/commit/?h=master
>> -next&id=78a0e916882a747c267808c08ab8bc615198b5a8
>>
>> [1] http://lists.openembedded.org/pipermail/openembedded-core/2015
>> -May/105351.html
>
> Thanks for raising this Andre - I've included the above change in my
> fido-next branch[1].
>

Thanks. One more potential candidate for fido-next:

  http://lists.openembedded.org/pipermail/openembedded-core/2015-June/106384.html


> Regards,
>
> Joshua
>
> 1. http://cgit.openembedded.org/openembedded-core
> -contrib/log/?h=joshuagl/fido-next

