Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id DB9CD6AC00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 23:25:42 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id a132so980742oih.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 16:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=+xK9LgAwCZT1i83FQTuMoC3vxqB/Y7HBDY0y3cjPAvI=;
	b=DtRfef1TN7jfLdQkpRA3lwUqx6RQt1gL+2s8Zm+D4yrq9ITuKujzELjoFg93uTAtDt
	NQ5NIIoIOkPrgScAvJLeU9ApTMh6Gw9Cf7RhsSWI8xaFBqlFWPYoeqMWxcMRdd8bJ9/k
	x7vTh4nFU3QJnNmwqaphYOC8MVuCB3Va32GJbDoMTat5Q6X9g+FGrY+BmORIdzbz5r3F
	+JOWoy+w0po6EdFmqIEThRYdSGio2s5ul71BTP+GF0CNnKlNCIzuFU4MhM1lmZCdSXST
	VDr0YcSRFCkBY9T9x50cQs5gNI8L3Xti0VVuEELfzMkMGkKl8Q+HRtvF03HTZiic93ih
	wQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=+xK9LgAwCZT1i83FQTuMoC3vxqB/Y7HBDY0y3cjPAvI=;
	b=ZhMYtjclmwzdAXpBxHvS9R4FjAB4NwQcS+TQLBpL0nY4eZz6+3UQB16ttCEEPjTYyV
	/lopR/hrcFPRorHUyAiruUw0Zyd/WraZAjwSlxOb0T6UaUn50tRiD8hx9wYDRfLrOUnZ
	YIfmyFNprck9xYsANYW1NrwP5elaTfTv2rqE4ptlHqsnwguIIK3aef4HYRzhDQNm4Ax1
	kgx0bLnORUn1HK9NMJWvszDeKfPObHkYVKTKoKQU6Y2bwutl/we/fwo85SrtzpGPDiMf
	17Fl3QLUwopcHNxMFEjlN3V6MKPwdwM+1Spd08E6Cs7kFE3jPbKeiQSmupaVkQXG5//+
	buzA==
X-Gm-Message-State: AMCzsaWlpinFE9niDj8S0b+hn28mVZ7D23tNOR+bA3TwJSASXR1yuXw+
	x5LcqvTILikkopqKAnbZiUZvY4sX
X-Google-Smtp-Source: ABhQp+TmnrDzxIHyCvcJyAPhfjZhnTXolKcx6Y3VUpDIc26QDG65qkR97+rs+gWwBKx6b/UDqQw3CQ==
X-Received: by 10.202.173.19 with SMTP id w19mr1799582oie.4.1509492343144;
	Tue, 31 Oct 2017 16:25:43 -0700 (PDT)
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com.
	[209.85.218.41]) by smtp.gmail.com with ESMTPSA id
	f100sm1209016otf.63.2017.10.31.16.25.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Oct 2017 16:25:42 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f41.google.com with SMTP id v132so1030447oie.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 16:25:42 -0700 (PDT)
X-Received: by 10.202.205.193 with SMTP id d184mr1814261oig.17.1509492341604; 
	Tue, 31 Oct 2017 16:25:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Tue, 31 Oct 2017 16:25:40 -0700 (PDT)
In-Reply-To: <CAJTo0LYFFZ-DOhZAepuJnXUgOTZDLcqxnWgj9F8-BLne_+wFvw@mail.gmail.com>
References: <1508587571-4733-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAJTo0LYFFZ-DOhZAepuJnXUgOTZDLcqxnWgj9F8-BLne_+wFvw@mail.gmail.com>
Date: Tue, 31 Oct 2017 21:25:40 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoTc09+i4XOTwYfj9g+_=df13Gtk5TzyC2jSuxZqtZKsg@mail.gmail.com>
Message-ID: <CAP9ODKoTc09+i4XOTwYfj9g+_=df13Gtk5TzyC2jSuxZqtZKsg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe-buildenv-internal: Fix finding build directory
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
X-List-Received-Date: Tue, 31 Oct 2017 23:25:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 31, 2017 at 9:16 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 21 October 2017 at 13:06, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> The intent of the env setup scripts is to set BBPATH to point at the
>> build directory if not already set. This means if the user changes
>> directory, bitbake can still find the original build directory. The
>> default bblayers.conf files reset BBPATH to the correct components so
>> this is safe and restores the behaviour the script was intended to have.
>>
>> [YOCTO #12163]
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  scripts/oe-buildenv-internal | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
>> index e6cd141..abc5aff 100755
>> --- a/scripts/oe-buildenv-internal
>> +++ b/scripts/oe-buildenv-internal
>> @@ -105,6 +105,11 @@ fi
>>
>>  BITBAKEDIR=$(readlink -f "$BITBAKEDIR")
>>  BUILDDIR=$(readlink -f "$BUILDDIR")
>> +if [ -z "$BBPATH" ]; then
>> +    BBPATH=$BUILDDIR
>> +fi
>> +
>> +export BBPATH
>
>
> This breaks the use-case of the user switching between build directories as
> re-executing oe-init-build-env doesn't change BBPATH.

I know and that's why I asked for a warning! ;-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

