Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id E6EBE77E79
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 19:04:31 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a2so260964pfj.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Sep 2017 12:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ky6ZzohfLq+03qH/gkqMEc293MMNTW40vIvBE84jJ8A=;
	b=jISMQ3fNTeU9Q+MoVhU6MBeAWi/Hp6TqjdwTx98IA1sZgV1biWwdaa3Z9dozJFCVLz
	Bw9oI8XCrxdRmq63b4K77hfo9EjdZllLm7Qjwb2qa1nH7l3ClQc9fW8CXDeoyFzePt/v
	ZSaLxqLIjTg8KAXIjiUnKdQVAtGEakJpmPfaOAOIwpPC0JNDWzoZeXB2ourogI3QIcDn
	1rbhj9ZejaUrewHm50J7QPv+V91Vm1bhJOFwx8MHINFzytkArRjilxEccG37DQ1xMe6c
	U4j6kBYszEOaD9WzKYrDXWDOWs9OQTFN2W4pkAHk+6n4nbF2iVzf9q2yHXL/39fAYjem
	+6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ky6ZzohfLq+03qH/gkqMEc293MMNTW40vIvBE84jJ8A=;
	b=s9pdkk4oC2clG+V9adzFadPfUltgHRE2WJZZ70JBsSACJ1SztGuYUqh3Sk1HBogMW7
	pCdC0UHROkTbyhjQJdkbgzxBDrrSrSVaz3qcvh86XRM3ne+YJgwsZTmYD/GOqTxuKXIP
	cLsqEPG1sncvAEJBjtFlJtIml/fe+4zpBdjSbePWcz4RH/r0als73jzderaaSIPZ9E/D
	Pofxwa2jl5woMqraV6qBejjz1VM0ohxCU/vYbyWJ9xf3Wv8dseQyqqK9PsuFIQX5cfmj
	6pFts9/gbD844MQibjf6TauK6CP0HtpsQx6H7vcqkjEqklua8V2h0tUrGooAqaHZG4aN
	wccA==
X-Gm-Message-State: AHPjjUjqkzIjaK9S46BK2eJuURr3l7UYfHu+uToKbVRNOIALwowJoBq+
	D0HYV8MvkyWQQrswurmdziqs9c9ZMcF1kO68XCw=
X-Google-Smtp-Source: ADKCNb776dOIzKyWqgfSuPbO3wfoNOa0g3ACjIFBT7Jjn5kmJB9XxEZRoaWDnziS7FO88MBpkDL8fZCLpGg/n2ewd/I=
X-Received: by 10.84.241.77 with SMTP id u13mr396346plm.440.1504811073036;
	Thu, 07 Sep 2017 12:04:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.189.8 with HTTP; Thu, 7 Sep 2017 12:04:02 -0700 (PDT)
In-Reply-To: <CAJ86T=VV16HToqmQDuYgRJRvSEggTe2SZf-h1g1XyqVx9tyqHQ@mail.gmail.com>
References: <20170907123142.28622-1-willn@resin.io>
	<CAJ86T=VV16HToqmQDuYgRJRvSEggTe2SZf-h1g1XyqVx9tyqHQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Sep 2017 12:04:02 -0700
Message-ID: <CAMKF1spvB64vPx052d+KWg0c3tB5f8q3kANHYuofZmNLYXWkEQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Will Newton <willn@resin.io>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] goarch.bbclass: Replace logic for setting GOARM
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
X-List-Received-Date: Thu, 07 Sep 2017 19:04:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 7, 2017 at 11:17 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Thu, Sep 7, 2017 at 5:31 AM, Will Newton <will.newton@gmail.com> wrote:
>> The previous logic applied a regex to TUNE_FEATURES which could
>> set the GOARM value to 7 incorrectly, for example when dealing
>> with an arm1176 core. Simplify to check for the presence of
>> "armv7a" instead. At the same time add a check for "armv6" and
>> set GOARM to 6 in that case.
>>
>> Signed-off-by: Will Newton <willn@resin.io>
>> ---
>>  meta/classes/goarch.bbclass | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
>> index 4a5b2ec..35f2987 100644
>> --- a/meta/classes/goarch.bbclass
>> +++ b/meta/classes/goarch.bbclass
>> @@ -38,8 +38,11 @@ def go_map_arch(a, d):
>>
>>  def go_map_arm(a, f, d):
>>      import re
>> -    if re.match('arm.*', a) and re.match('arm.*7.*', f):
>> -        return '7'
>> +    if re.match('arm.*', a):
>> +        if 'armv7a' in f:
>
> You need to test for both armv7a (Cortex A9, etc) and armv7ve (Cortex
> A7, A15, etc).

yes good point.

>
>> +            return '7'
>> +        elif 'armv6' in f:
>> +            return '6'
>>      return ''
>>
>>  def go_map_os(o, d):
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

