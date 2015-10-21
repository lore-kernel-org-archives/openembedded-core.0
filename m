Return-Path: <armccurdy@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 2BA6376E04
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 05:55:37 +0000 (UTC)
Received: by wijp11 with SMTP id p11so77858862wij.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 22:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=1jw/it3DdFarp2Cnabyha6fzY7CccW7saQkwtbLgJjA=;
	b=ArKtbzTbj6ZWOXWFCSqbRO4ANd0Aqaey4gv7yuivua0vORqA2dWZK9hSbkDj4jscr7
	ydjkrpraYOYOAGU5x91B0xAy275meumL792Z12rjgrfI9gnCDRsYjYIHr8f9NsWBUz8Q
	R3r4gINg9LrOZvXSQBBQDG0t08lbaXVgZgNwF63PeWmkAl5+wjdlsg5Mk5vcBbmMRqb/
	etJPmK+7RZ6HoQKAXbS3GS8AeAFVWOnN5mkurVW9oCV8ttfVFPy6PkDdLYRS9LugkHD/
	FwyO4woQbTH1DWlUq6r6Fd6FU+3QsQiVZshdZlcq/k1JMy8antSghp/fr1BO8xxjxA1Y
	1WGw==
MIME-Version: 1.0
X-Received: by 10.194.90.169 with SMTP id bx9mr9352009wjb.1.1445406937274;
	Tue, 20 Oct 2015 22:55:37 -0700 (PDT)
Received: by 10.194.140.38 with HTTP; Tue, 20 Oct 2015 22:55:37 -0700 (PDT)
In-Reply-To: <CAMKF1sq4T-MPZPNVxSvpJP1CEYqsGqQsx6EMieOP3A2LMucKnQ@mail.gmail.com>
References: <1445402033-28721-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1sq4T-MPZPNVxSvpJP1CEYqsGqQsx6EMieOP3A2LMucKnQ@mail.gmail.com>
Date: Tue, 20 Oct 2015 22:55:37 -0700
Message-ID: <CAJ86T=VkE=79N8UXL0iiMJTJMMdzKONzCYE+_tkr89n-AFcqWw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image-mklibs.bbclass: update i586 TARGET_ARCH test to also handle i686
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
X-List-Received-Date: Wed, 21 Oct 2015 05:55:39 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 20, 2015 at 10:36 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Oct 20, 2015 at 9:33 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/classes/image-mklibs.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
>> index c455a8e..d5f668c 100644
>> --- a/meta/classes/image-mklibs.bbclass
>> +++ b/meta/classes/image-mklibs.bbclass
>> @@ -25,7 +25,7 @@ mklibs_optimize_image_doit() {
>>                 x86_64)
>>                         dynamic_loader="${base_libdir}/ld-linux-x86-64.so.2"
>>                         ;;
>> -               i586 )
>> +               i586 | i686 )
>
> i*86 once for all

OK.

Looks like the armhf ld path needs fixing too...


>>                         dynamic_loader="${base_libdir}/ld-linux.so.2"
>>                         ;;
>>                 arm )
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

