Return-Path: <matt@madison.systems>
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id DD1CB71E4B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 19:38:53 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id g29so18312883wrg.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 12:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i1kF7pKupJbqREadSj8BSbwlJ73v88Ntli5OT+yeWMU=;
	b=bZZjRYC/HKaVe5Mb5vGjcDWmdOtzIOcNyKII2A4IOmgFSZ0hN+/4aJv5o+jJYnK3vk
	aEPFa151pNX/uwipMQKi/kuldRpwGFwP+IJAgucNUKY/w2D1IVHzUCIfzlfF6PQtju8h
	SBD6Dd3Ae8JbRhsNp2vReyH0quqarbVwZbzyQ2XWBpaOoqm7MXmKf0Y7cwD117khF82B
	+EZ8sNMRRb79cCiKlO3Wr63/Jf1SWyj/l1jM/JNcu8nb9hJa+/T3I5NHeha6cyl8rw+N
	3FeVcsixpTmDlc6S9Rq6+JCmatudWSRUjvX9zYVaL/3AYnlDmKKFl4R5EfqJ0pJok325
	zxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i1kF7pKupJbqREadSj8BSbwlJ73v88Ntli5OT+yeWMU=;
	b=q7rAhMNe3QqyR5z204FAVu/zbx9f1M/oSJseDQz1h4jQ7i/kijQ84OBWDcLO1g3s6L
	T/bYuOK9NELmlUve/aUODpe/ZAg9qLrWkf9PNDld4cZ8z7hTXitedubosf8txfuT/fy+
	bxlEfq0MXgU9X7J2xq8DTH6qc4e7vBIV3k7Tx6unqwti8YvCyefZXbQniaubW1cr8WeP
	4MoODlAVuxjCrx2DPn2gOy1wVIxTA/ES0CGRdUN3piBKmqU3eM5cLnNwHW5HgczsUBeT
	vU7drAXUVTiy7l4dfRssepas1WGdq2IgVT1FkMOgPTCQ0RqJjVbVQrVQuyh6eVXLqy4k
	7fkg==
X-Gm-Message-State: AHPjjUgfDVsVs3i8NuVLebUTUjmTcOrRl1LNkuIzbfnGiL89aWKnrIPO
	a2yBZHTCdUhyM2G9dvkFuO9SRojJyVIVMjY6VMt9rg==
X-Google-Smtp-Source: AOwi7QCSwSrEuesswXO3aLzBZGHusp4qsoaKwrebaZ8WXsXW7iOT3d4KaAsQgeykX2wm3/xyLPHQtKlxG/H9gGejzHA=
X-Received: by 10.46.25.78 with SMTP id p75mr1064522lje.24.1506541135101; Wed,
	27 Sep 2017 12:38:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.225.68 with HTTP; Wed, 27 Sep 2017 12:38:54 -0700 (PDT)
In-Reply-To: <CAJ86T=Un0JAF_M3XSck_qdCFdU3V0qFLRHsCQgri081gSj+99g@mail.gmail.com>
References: <1506513706-14213-1-git-send-email-matt@madison.systems>
	<CAJ86T=Un0JAF_M3XSck_qdCFdU3V0qFLRHsCQgri081gSj+99g@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
Date: Wed, 27 Sep 2017 12:38:54 -0700
Message-ID: <CAGgRHJr_LjkDbcvL9Jy7auo_TDAefenZN8cG=F5uoVHuYOUqMQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] goarch.bbclass: rework mips architecture checks
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
X-List-Received-Date: Wed, 27 Sep 2017 19:38:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 27, 2017 at 11:02 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Wed, Sep 27, 2017 at 5:01 AM, Matt Madison <matt@madison.systems> wrote:
>> Move the mips32r2->mips32 rewrite to an anonymous
>> python function, and change the GOARCH setting to
>> use just the passed-in architecture string, to
>> avoid an unwanted variable dependency.
>>
>> Signed-off-by: Matt Madison <matt@madison.systems>
>> ---
>>  meta/classes/goarch.bbclass | 20 +++++++++++---------
>>  1 file changed, 11 insertions(+), 9 deletions(-)
>>
>> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
>> index 9ed562d..7553987 100644
>> --- a/meta/classes/goarch.bbclass
>> +++ b/meta/classes/goarch.bbclass
>> @@ -43,14 +43,10 @@ def go_map_arch(a, d):
>>          return 'mips64le'
>>      elif re.match('mips64*', a):
>>          return 'mips64'
>> -    elif re.match('mips.*', a):
>> -        tf = d.getVar('TUNE_FEATURES').split()
>> -        if 'fpu-hard' in tf and 'n32' not in tf:
>> -            if 'mips32r2' in tf:
>> -                newtf = [t for t in tf if t != 'mips32r2']
>> -                newtf.append('mips32')
>> -                d.setVar('TUNE_FEATURES', ' '.join(newtf))
>> -            return 'mips' if 'bigendian' in tf else 'mipsle'
>> +    elif re.match('mipsel.*', a) and 'r6' not in a and '-nf' not in a and '-n32' not in a:
>> +        return 'mipsle'
>> +    elif re.match('mips', a) and 'r6' not in a and '-nf' not in a and '-n32' not in a:
>> +        return 'mipsle'
>
> Should that be "mips" rather than "mipsle" ?

Yep, thanks!

-Matt
>
>>      elif re.match('p(pc|owerpc)(64)', a):
>>          return 'ppc64'
>>      elif re.match('p(pc|owerpc)(64el)', a):
>> @@ -74,4 +70,10 @@ def go_map_os(o, d):
>>          return 'linux'
>>      return o
>>

