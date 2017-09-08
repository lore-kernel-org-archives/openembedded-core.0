Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id D2821781F3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 14:17:46 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id t127so460375ywg.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 07:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=sSZepM26Fz3PSfGQ9Qhbq7owo3qRloPv8ywOywiKF1Y=;
	b=tfezZw6tIswokdUh4L5WlPCtotIQDA+uu0CmQf3yQMiM2mB4FhmOrWS8D4PQLAGYI3
	m6qikVPCZ8i3j8WckdwDAMBHRkhU1iV69kp3eIWSyIV5SipxVIBm54foc5DNDifGEqcB
	6+A3oED7OAc6Ce5i/vq1OK4H8Mg/ZR1OgO32GhEBUogXl3zLgGJMiV34Rlsggi0I7pRh
	ANO4RnvnPdjO/aFvyiCS55Dyvm6iUbF7CqXC6NgxTSlvFjhhQFt0jAQ1reqgPlmgMvHW
	wtEHaH1qH1t1GfvF84zLHK8iRWasgVPQh3v8/o8cqL+SSuXN9PJWvXPmHusAd+OEfpkG
	jScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=sSZepM26Fz3PSfGQ9Qhbq7owo3qRloPv8ywOywiKF1Y=;
	b=grSI0rVTFzdSoNdKm31xLApkciEA5QoUsUZsrhTo5UEi3dlv+61H8q2QMnrUUxeHS4
	I9nIlDW2OHq8ZmKTUSdUZhKc/8bUPGRcSm0hVTndOipqJnsvzAJPgjNHVC6UIx/Ug964
	VvwVBYmfVFACi1ivFSsPX0AkMA7ju3VkfI4MkSgiDUQvWmhqWk/i9GrgCEBPo9LmQuB5
	PUXyP0T20osTdWu41nN5RUImmrcKgt8LGnMevhC/e+PML/msA+GtS/atR7ZYyVvQcw0T
	HbeYEvvj66i4ae4sq9FWYqY/+RcJZbOli1eEfEGXgLiLQ8AXPPnGcH7VmyMUkAB33Rbb
	5LjA==
X-Gm-Message-State: AHPjjUhxi0Qut8XUOQzHHO+1znvF+3m4PpFC4ET6CtEiMsyi1duWuHH3
	69dW/BYWHxwswA9J5L0=
X-Received: by 10.129.68.36 with SMTP id r36mr2667596ywa.21.1504880267282;
	Fri, 08 Sep 2017 07:17:47 -0700 (PDT)
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com.
	[209.85.218.51]) by smtp.gmail.com with ESMTPSA id
	q133sm687100ywc.64.2017.09.08.07.17.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 07:17:45 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f51.google.com with SMTP id z73so12228477oia.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 07:17:45 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAK/k+6h9mm4c/Is4f8WsGfGszU6JH/qBkDmKuVkPfstBic4Dd/C9qlReVBgc7OaLZ7+TAbdZIAwXPbZ3r8vJ0=
X-Received: by 10.202.185.8 with SMTP id j8mr2687066oif.294.1504880265184;
	Fri, 08 Sep 2017 07:17:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Fri, 8 Sep 2017 07:17:43 -0700 (PDT)
In-Reply-To: <CAFbHwiTq2j7x9x3MNh1Aj5BqzfedkUJSEOWNrn3JAet_SAEr3Q@mail.gmail.com>
References: <20170908134758.7570-1-otavio@ossystems.com.br>
	<20170908134758.7570-6-otavio@ossystems.com.br>
	<CAFbHwiTq2j7x9x3MNh1Aj5BqzfedkUJSEOWNrn3JAet_SAEr3Q@mail.gmail.com>
Date: Fri, 8 Sep 2017 11:17:43 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqARj1hBJqhqiqSeFoxtbjcGp3zzV0=HyhzE16904nmvw@mail.gmail.com>
Message-ID: <CAP9ODKqARj1hBJqhqiqSeFoxtbjcGp3zzV0=HyhzE16904nmvw@mail.gmail.com>
To: Will Newton <will.newton@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 05/11] goarch.bbclass: Add support for ARMv5
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
X-List-Received-Date: Fri, 08 Sep 2017 14:17:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 8, 2017 at 10:56 AM, Will Newton <will.newton@gmail.com> wrote:
> On Fri, Sep 8, 2017 at 2:47 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> This adds support to return the proper ARMv5 format.
>>
>> This change is based on the meta-golang[1] layer. Thanks to Matt
>> Madison <matt@madison.systems> for his work on this.
>>
>> 1. https://github.com/madisongh/meta-golang
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>
>> Changes in v3: None
>> Changes in v2: None
>>
>>  meta/classes/goarch.bbclass | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
>> index 7960ac5f9e..dbec6ee2c8 100644
>> --- a/meta/classes/goarch.bbclass
>> +++ b/meta/classes/goarch.bbclass
>> @@ -47,6 +47,8 @@ def go_map_arm(a, f, d):
>>      import re
>>      if re.match('arm.*', a) and re.match('arm.*7.*', f):
>>          return '7'
>> +    if re.match('arm.*', a) and re.match('arm.*5.*', f):
>> +        return '5'
>
> I suspect this regular expression is overly general, see:
>
> http://lists.openembedded.org/pipermail/openembedded-core/2017-September/141938.html
>
> The Go toolchain default is for ARMv5 when cross-compiling so as far
> as I know setting this explicitly should have no effect at the moment,
> although it may be valuable to protect against changes to the default.

If you don't mind, I will add your patch in my patchset and rebase
mine on top of this one so we have a single patchset with all this
rework included. Are you Ok with that?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

