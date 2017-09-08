Return-Path: <will.newton@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 69E0C719AF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 08:53:24 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id y15so854083lfd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 01:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+mmRMRq9eSb6ciww1BywmUYDz4jl9crcCrUB3RVF+yA=;
	b=CxnMasNzdaXr8bau56NVJiMp+8MGJ+hSMsTt24JxaE1vZl06MhNw27rrxYdNgfH9Xp
	BlpOtTCgVPaVBJib7Qe9aduWJdLeoPTBKMVXXngFXPBIogJPBHNDUImfJi8joREbn2g/
	jky0YaKW3YfMePd3j9DBb0lgjKhh4oont916YkiLyXhhjlV3aBZmQpZN3CwCfxq1PvT9
	Cm4gSLcHBz3WfsM8Htvc5lcmEE2sn3NrIYWZCVabYVaWZE1CEYCTnRcHn+5JEqXvxqW7
	jpd9+cezUigGCfmGEhNyUZBz8+wQLgwhd0V3upTKf5HCyAnvf8xenTlIM4AgbyyWQMq3
	iOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+mmRMRq9eSb6ciww1BywmUYDz4jl9crcCrUB3RVF+yA=;
	b=hFGplAmTP3gmp8ZKJ+MEy7WQ7RuS1FEKAWer8YWrgnjW7digEDwseTOHtm2nxXWFob
	N4bwFVRkv50lUCpg+z59f3GkhijGQomyzx/XVUpy/YWdGPLCy/4erlUy6ct7hl8s57z9
	bJc+Q+/2OcdDyBcdK6jhk3+OyOepDpMIOFXPM5nqCeR3Kf9EVA+gVkPPLgB602h+8n87
	YdBL1hjuff3jhJCrdjBfq/ywSh48A0tHbHwx0nwwQCFEP1dxV/N/D8qvmAg9X2MYpJrO
	CigxpZDWGvVYmPKdkC6EW3YEALbeCiT6zS6HbHjCYT99tZ4DQcILawHC+yk+nN/d0qxV
	s3Gw==
X-Gm-Message-State: AHPjjUjbRIkyQB8K/s0JH1Xxbqy9twoNuwNpdiG3InmLRcnUsnfMDI3h
	Q/9PI4wRvpAa3zqMdLC02VCVK8K2jg==
X-Google-Smtp-Source: AOwi7QBUDCIko9b0Ww0WBWz899fZ6leE3sCHKj0a1T5l9kcM1vKICwTCHRqvfRr9pOuQe6YBNQhYpE0YI9mM9k8O0yw=
X-Received: by 10.46.87.5 with SMTP id l5mr659216ljb.128.1504860805675; Fri,
	08 Sep 2017 01:53:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.179.66.9 with HTTP; Fri, 8 Sep 2017 01:53:25 -0700 (PDT)
In-Reply-To: <CAJ86T=VV16HToqmQDuYgRJRvSEggTe2SZf-h1g1XyqVx9tyqHQ@mail.gmail.com>
References: <20170907123142.28622-1-willn@resin.io>
	<CAJ86T=VV16HToqmQDuYgRJRvSEggTe2SZf-h1g1XyqVx9tyqHQ@mail.gmail.com>
From: Will Newton <will.newton@gmail.com>
Date: Fri, 8 Sep 2017 09:53:25 +0100
Message-ID: <CAFbHwiRdEbi3XhkJfHeYVZgNx6CzKMRf7+aMNxufgkyPh+-15Q@mail.gmail.com>
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
X-List-Received-Date: Fri, 08 Sep 2017 08:53:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 7, 2017 at 7:17 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
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

Thanks, I've done a v2 that should take care of that.

