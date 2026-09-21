Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91611C982E6
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 21:43:41 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7735.1790027018208057915
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 14:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=Qlz1xdR/;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [10.0.5.46] (unknown [4.194.122.170])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7241820B7167;
	Mon, 21 Sep 2026 14:42:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7241820B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1790026969;
	bh=UPDV3Ivl2uCk48FQQcvFvoR2fqG9YTmvy9LqlbU1GOI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qlz1xdR/cmN/o3sTYpHaTWVaDQcCDpdKHGx+6/NTqaAyJuo77a7H/6B2coo1Rr/Uh
	 mOdxkqrp02MabdNmcT07ncAoP3QrAud5vCdgYPx5JI0rEaww03zUifNqRgUeBRJZR/
	 40nw4rEhBku2eNKEQ913ojkJ8BpByzItOAU/vhdM=
Content-Type: multipart/alternative;
 boundary="------------BMnvKWQpb1NzcJ0TykLbHoVI"
Message-ID: <8211cf54-ffcd-4596-9360-dbcbebbf98dd@linux.microsoft.com>
Date: Mon, 21 Sep 2026 15:43:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/5] rust: reproducibility fixes for arm build
 hosts
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 SunilKumar.Dora@windriver.com, openembedded-core@lists.openembedded.org
Cc: sundeep.kokkonda@windriver.com, Randy.Macleod@windriver.com,
 alejandro@enedino.org
References: <20260915141834.1212812-1-sunilkumar.dora@windriver.com>
 <b8a0599c-a7e4-44b5-b8c9-6a72d14a70fc@linux.microsoft.com>
 <3cd5b736f6fc19ed3242c2da05dd60b675cfe0f1.camel@linuxfoundation.org>
Content-Language: en-US
From: Alejandro Hernandez <alhe@linux.microsoft.com>
In-Reply-To: <3cd5b736f6fc19ed3242c2da05dd60b675cfe0f1.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 21:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246362

This is a multi-part message in MIME format.
--------------BMnvKWQpb1NzcJ0TykLbHoVI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/21/2026 3:46 AM, Richard Purdie wrote:
> On Tue, 2026-09-15 at 09:53 -0600, Alejandro Hernandez wrote:
>> Hopefully these fix reproducibility issue when built from different
>> hosts.
>>
>> Unfortunately these go in a bit of a different way than my next
>> version, so I will wait for the result before sending to avoid
>> confusion, but I'm fine with these if they work, lets just add my
>> sign off to the actual patches based off of mine
>> instead of the "Patch from Alejandro + OE link".
> I just wanted to say a big thanks to you both. The autobuilder is
> showing much less delta for the cross build arch tests now, around 30
> or so differences in the maximum case. I've added the git fix from
> Sunil and some queued some locale and perl fixes I came up with to get
> us there but the rust 'noise' is removed, which helps a lot.
>
> Thanks again!
>
> Cheers,
>
> Richard

I'm glad things are looking better now!

Alejandro

--------------BMnvKWQpb1NzcJ0TykLbHoVI
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/21/2026 3:46 AM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:3cd5b736f6fc19ed3242c2da05dd60b675cfe0f1.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">On Tue, 2026-09-15 at 09:53 -0600, Alejandro Hernandez wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Hopefully these fix reproducibility issue when built from different
hosts.

Unfortunately these go in a bit of a different way than my next
version, so I will wait for the result before sending to avoid
confusion, but I'm fine with these if they work, lets just add my
sign off to the actual patches based off of mine
instead of the "Patch from Alejandro + OE link".
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I just wanted to say a big thanks to you both. The autobuilder is
showing much less delta for the cross build arch tests now, around 30
or so differences in the maximum case. I've added the git fix from
Sunil and some queued some locale and perl fixes I came up with to get
us there but the rust 'noise' is removed, which helps a lot.

Thanks again!

Cheers,

Richard</pre>
    </blockquote>
    <pre>I'm glad things are looking better now!

Alejandro</pre>
  </body>
</html>

--------------BMnvKWQpb1NzcJ0TykLbHoVI--

