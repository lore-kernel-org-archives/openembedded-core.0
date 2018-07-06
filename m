Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 11A7178A11
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 04:57:38 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id b15-v6so21124296oib.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 21:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ng24GY3+jV/7yZufOL1hIZJFewWQS95g3omHvMPdKrA=;
	b=d2qle9Wd8Z+2nexX6k0Ty/DJzYWQwU/oNMKA21vwDp+m0EAGEh0cmDqHOTKHPJmauc
	NOyefrB4bX789QouknMlB37+KvnPzHjEIND4gEUV87vlr09ik7Llrv/DJEAA56mBOVea
	731CoxnoCg4fx1ttWQlGIqIXHJvYJVizh8+FF6PGQo0lcSuqUBwcJ/96SEpWuGSrBe6X
	CkKiC0e/Aptd/kICcDbAXck497Gmbgk3iNxaKgjUQMZlb1dwpdvxEDRUBTR2076k8RY5
	eJ49ehi/LkW1cE1bUbd3LbFer5/wLxhChlJZFYYU9w+ClnLb7sX9eR1zY50IWNnexvk5
	NmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ng24GY3+jV/7yZufOL1hIZJFewWQS95g3omHvMPdKrA=;
	b=Xfu1Xf8YayPBppzXclcrE8Y/4E6aWlQ6d/WJ9bFtaogm/V1pftkf2u3SE0bMTxF5Ga
	Ho4D2si59qDivO55ASKs2CqR/VKt0Xjsp5/9nPuvAfCeTT29nyIdWwL5e72DwZ/dRovW
	hk7ar9TDms6NoktqqJmLKI5NI/InqCrDvnbgAeoPvdRQwE9hLrJFdubqvNyB+3rQnba9
	M0rkYLFvWm+t3DXQtDJ/8rauOdzilLPqbd4VhY+hlmEHytbb2lH4Zy7WFF+OB//w7ykS
	bTVxUhc2aGqjMPmV05YVK1UfpGSwqChHLkI5JAyz9oUjC6m4onQtkahJ6S826QUmc51l
	UKIQ==
X-Gm-Message-State: APt69E1ScGC/wRPnQ/kMqwczVPZr/49/MJ8tuAAtGWQq1IwKGg6wirX7
	J2eUyOd7PplUIIYQ+f6ZF1KmJcDXtyDxw9o6AWw=
X-Google-Smtp-Source: AAOMgpeyE6DJLEbZ9imlNIsD8oUOgBHF52nWypFu2l+QFV+xM9hDmekNkZF/6vKTc3Dj/kg9ccTB1tT6AVoOh8jsDLU=
X-Received: by 2002:aca:560d:: with SMTP id
	k13-v6mr9277593oib.190.1530853060093; 
	Thu, 05 Jul 2018 21:57:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP;
	Thu, 5 Jul 2018 21:57:39 -0700 (PDT)
In-Reply-To: <CAJ86T=W476NOCmnwYcfs57wmM1eOshyBaaeSgrF0D6XPgU1Esg@mail.gmail.com>
References: <20171115124041.23289-1-patrick@advancedtelematic.com>
	<CAJ86T=W476NOCmnwYcfs57wmM1eOshyBaaeSgrF0D6XPgU1Esg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Jul 2018 06:57:39 +0200
Message-ID: <CANNYZj-aniU5dteDkg_VWdRPVWJRP3Zs0et79LVyzzYwzrQD0w@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patrick Vacek <patrick@advancedtelematic.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] ca-certificates: Add /etc to SYSROOT_DIRS
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
X-List-Received-Date: Fri, 06 Jul 2018 04:57:39 -0000
Content-Type: text/plain; charset="UTF-8"

There's no problem in reverting the change, if there is no real need
for it, just in case.

Alex

2018-07-06 5:28 GMT+02:00 Andre McCurdy <armccurdy@gmail.com>:
> On Wed, Nov 15, 2017 at 4:40 AM, Patrick Vacek
> <patrick@advancedtelematic.com> wrote:
>> From: Patrick Vacek <patrickvacek@gmail.com>
>>
>> For recipes that depend on native ca-certificates.crt, /etc should be
>> added to the list of directories that automatically populate the
>> sysroot, otherwise the file may not be there.
>>
>> Signed-off-by: Patrick Vacek <patrick@advancedtelematic.com>
>> ---
>>  meta/recipes-support/ca-certificates/ca-certificates_20170717.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb b/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
>> index 59e7d51437..52a1a07f68 100644
>> --- a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
>> +++ b/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
>> @@ -24,6 +24,7 @@ SRC_URI = "git://anonscm.debian.org/collab-maint/ca-certificates.git \
>>             file://sbindir.patch"
>>
>>  S = "${WORKDIR}/git"
>> +SYSROOT_DIRS_class-native += "${sysconfdir}"
>
> This change has now been merged, but unfortunately it looks wrong.
> This use of += with an over-ride doesn't achieve what you describe in
> the commit message (the += will append "${sysconfdir}" to the
> over-ride value and then the over-ride value will COMPLETELY REPLACE
> the original value of SYSROOT_DIRS, not add to it).
>
> The change also appears to be unnecessary as ${sysconfdir} is appended
> to SYSROOT_DIRS for -native recipes by default (via
> SYSROOT_DIRS_NATIVE in staging.bbclass).
>
> Exactly what issue were you trying to solve?
>
>>
>>  inherit allarch
>>
>> --
>> 2.11.0
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

