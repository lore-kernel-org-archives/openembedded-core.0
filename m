Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 493BC78E42
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 16:06:50 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id c15-v6so3068259qtp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 09:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tzEz3clF4RHmJJWD7Z4zO7FfedlkkGf+l94JsqxYV4k=;
	b=fo6jX1z30EQvTPLDn0TZxemacSELqse/P5qAe7DyezPt6fpgpkxwmlZrwQA4wF1aZf
	iCoB7kus6/W2zmxL+obpAGEmKR7152X1WopXbvooWgGTy0DO1f910JzXH/ra8yYPDCFG
	uXG1HkvboPUJ8RJVKf4NgDpJB9liVli2mNGQZyFG6tm6T5OtKcHP8jAl8GIVPZelm18q
	t2EIGixOP8kFjj8ZBdHibJqgQ5so9boWDem4EllDh1nBSuzeWkUk2nc7hJnQaDxoztNF
	c5MMgo/NmXfUo0NkgpmHUFT9ZQDOKm3d/pqJNxGw8TAEhH2sVfsYxaLbDjI+ddrXG2y+
	DBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tzEz3clF4RHmJJWD7Z4zO7FfedlkkGf+l94JsqxYV4k=;
	b=bzqk8RnZhEFTnaaSSz7+Bi+EwFj7yoOkjxGicqccbEaB2l1UyGxf2y/Q5DV/6Bxz94
	rH3c8QeXI0S4IkF917zX+xP8ngt755JN3zWrZ09Owm9N1pdxklaMt7XjIYlKTviFNays
	izuGF0yhhbpewDjVLVDanTAZBY80JndLUYhcN6YyeR3I80spRvqMmokNmN2N8fTRQRJG
	Azd7BmlzEgG4GRCrJ/GDJj98ZRBKy8ayGNg1im8UYK0MLUq6Wx6yT0re02txM1Y1qfBC
	6fZClMTrDwaBvnE8jpnFmkGtV/Dr2TZBIOGC4A+hDfQUA8rex0u/Nw6DUoSetJ/i8Neb
	Ya3Q==
X-Gm-Message-State: AOUpUlEquBYtwDt7oDQZPr6syRG+AX/aGDA64ujggC9mk2kWAhQj+FTD
	rbErbGY+crkffSjeJYAQHRmXHw0+rEEgI2DUEA0=
X-Google-Smtp-Source: AA+uWPyVTy97WwbuJqUoj+p6qpet+cTOScpvporu5um4mUhFQ/FRrE0mlZeIBfatOLJfFS+AzE2TAN8y0r3RqRB+JEQ=
X-Received: by 2002:ac8:3209:: with SMTP id
	x9-v6mr3452452qta.128.1533744410948; 
	Wed, 08 Aug 2018 09:06:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1533595822.git.raj.khem@gmail.com>
	<e9bcf3a4c54ac1cd9721abc0d9be5324d4004845.1533595822.git.raj.khem@gmail.com>
	<CA+chaQfiZ4MPSPE5B3JPYNrcJaDOEQiyHE4UsMf2dP_vWsfrwQ@mail.gmail.com>
In-Reply-To: <CA+chaQfiZ4MPSPE5B3JPYNrcJaDOEQiyHE4UsMf2dP_vWsfrwQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Aug 2018 09:06:24 -0700
Message-ID: <CAMKF1sqaXt17u1gGPmZi4qiziwVtwcFrd7_2nJ8kap5BSB3LiQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/18] Disable crypt support in glibc
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
X-List-Received-Date: Wed, 08 Aug 2018 16:06:50 -0000
Content-Type: text/plain; charset="UTF-8"

I deliberately kept it separate for readability from glibc upgrade,
but squashing this with packaging changes alone is ok. I will leave
that to Ross
On Wed, Aug 8, 2018 at 8:48 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Should this be squashed with "glibc: Drop packaging libcrypt from 2.28+ onwards" ?
>
> I've accidentally cherry-picked the packaging change from patchwork and missed this one which results in:
>
> ERROR: glibc-2.28-r0 do_package: QA Issue: glibc: Files/directories were installed but not shipped in any package:
>   /lib/libcrypt.so.1
>   /lib/libcrypt-2.28.so
> Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> glibc: 2 installed and not shipped files. [installed-vs-shipped]
>
>
> On Tue, Aug 7, 2018 at 12:59 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> We have independent crypt implementation coming from libxcrypt
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-core/glibc/glibc_2.28.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.28.bb
>> index 086daed04c..906e6c2b62 100644
>> --- a/meta/recipes-core/glibc/glibc_2.28.bb
>> +++ b/meta/recipes-core/glibc/glibc_2.28.bb
>> @@ -83,6 +83,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
>>                  --enable-bind-now \
>>                  --enable-stack-protector=strong \
>>                  --enable-stackguard-randomization \
>> +                --disable-crypt \
>>                  ${GLIBCPIE} \
>>                  ${GLIBC_EXTRA_OECONF}"
>>
>> --
>> 2.18.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

