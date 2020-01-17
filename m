Return-Path: <sumit.garg@linaro.org>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 50EA57F898
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:12:15 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id l18so18314834lfc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 05:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QHnn/lQ+Ri0FG3DLyHeZw4fAg9TiVgKkdBY6BTaKsQY=;
	b=lrSTrHsPXfVMjMwGty2iVLM1+FB2xkSV/kZDbD5oUYtvK/yOgm81O/LxdHRVIEbtNo
	XWBGFSXSK1MVblH7Ht39YNqPMQEowahLQsHSEfSzTNrW0l9S+OwjXpvkOBeYm6I0GGFx
	ccoLeDqB4UqITrVoEOUHRlAGuAWcS/dNDcdeREo5kfBd/8ZwmCoqF2sA8LOY5DODSXAz
	hljQZkv+PRYPa4Z2Z8Pb5XdAos8PyfS500cR7DNIoQcsZYEZjVHU29KUxXGBEO6a4ppH
	PeO+WtIbdhJEPzT650rwJCCK93C9IRdQs7XiS9KW1ZE/DS6WQaLmPVCZAZeLb11t8OtE
	YC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QHnn/lQ+Ri0FG3DLyHeZw4fAg9TiVgKkdBY6BTaKsQY=;
	b=LvjDVSpf6aEeuUTaS9yvmT9dOi9B7i+KUO/HI7sz2K/GA52PqNroKTnHrGqL0u1/R3
	HatY3+HhFuWcKGY4p7sAitsDM9LGTd7YcdZPmzeSWU4mOl63Z8/DhVr4ndrtzr+M3IZw
	Ug8ODitVRZwvQmmfw8LR829zicvoqZdBLNPlTrmRFLBLizjvs0ZKUqLe/9M/epJ9PJ5R
	Idiv5tY8u7eS7o1IYCiHilTBBLxLfraTdhMgEFPOrt17lavSacXpzl3y8wvsWsSeEUqe
	s+rn/LTRs55zfpUUGBnLDy26AaqR+MKVLRYC7BKlAARgMyj32/dp7q0TEIAnfVVhBQsZ
	CAcA==
X-Gm-Message-State: APjAAAVOGqI/aN/eAMK8mq/Lpp09WVZw0ESU1ElHg7Yq6R8Cl1lBWjBq
	ngz3EWZJw8Anmzwg94GJ2B/M/yO8JXrTJ2ruORSIzQ==
X-Google-Smtp-Source: APXvYqwXX22QkE9T4uhIhUn4GNgtVUb9G9uZpS3uXhstGUSD527KbGcSeHdjR29x7NaVtB6IUFTF1DycbY7fcnZgwlY=
X-Received: by 2002:ac2:4909:: with SMTP id n9mr5412399lfi.21.1579266735821;
	Fri, 17 Jan 2020 05:12:15 -0800 (PST)
MIME-Version: 1.0
References: <1579244354-13596-1-git-send-email-sumit.garg@linaro.org>
	<b21d1a39c0c1e5585e72586ca806967bae37decf.camel@linuxfoundation.org>
	<CAFA6WYOm4a8_mqyNA+zkFHPznN10SyKb4atiCtmS=qabZzyM+A@mail.gmail.com>
	<CANNYZj9tcgw0KZeqZRQdL5etBdAEPP+S29S4YWkE94jhVQbLNw@mail.gmail.com>
	<CAFA6WYO-fHRo4e7aYr5V8QkNus6hB9=ZWjQ7snRRPEijU5oa6Q@mail.gmail.com>
	<CANNYZj-bN7uU-wASdvTKznrt=mtFdxSy5LLawHax8vNnCrMMdw@mail.gmail.com>
In-Reply-To: <CANNYZj-bN7uU-wASdvTKznrt=mtFdxSy5LLawHax8vNnCrMMdw@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Fri, 17 Jan 2020 18:42:04 +0530
Message-ID: <CAFA6WYO58SUHWhFQUeRLU4c5_fJR9ECtDNDVVKyQo41YiMedKw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] core: recipes: fix some native tools dependencies
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
X-List-Received-Date: Fri, 17 Jan 2020 13:12:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Jan 2020 at 18:34, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> You can send a patch for psmisc specifically for those stable branches, using [branch name] in the subject.

Ok will add "xz-native" dependency for psmisc recipe specifically for
stable branches.

-Sumit

>
> Alex
>
> On Fri, 17 Jan 2020 at 13:49, Sumit Garg <sumit.garg@linaro.org> wrote:
>>
>> On Fri, 17 Jan 2020 at 17:35, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>> >
>> > On Fri, 17 Jan 2020 at 12:55, Sumit Garg <sumit.garg@linaro.org> wrote:
>> >>
>> >> But looking at this failure again it seems like "autopoint" is
>> >> provided by gettext rather than autotools. So yes, I think you are
>> >> right and "xz-native" dependency should go in
>> >> meta/classes/gettext.bbclass instead as follows:
>> >>
>> >> diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
>> >> index be2ef3b311..443c9c4cb0 100644
>> >> --- a/meta/classes/gettext.bbclass
>> >> +++ b/meta/classes/gettext.bbclass
>> >> @@ -2,8 +2,8 @@ def gettext_dependencies(d):
>> >>      if d.getVar('INHIBIT_DEFAULT_DEPS') and not oe.utils.inherits(d,
>> >> 'cross-canadian'):
>> >>          return ""
>> >>      if d.getVar('USE_NLS') == 'no':
>> >> -        return "gettext-minimal-native"
>> >> -    return "gettext-native"
>> >> +        return "gettext-minimal-native xz-native"
>> >> +    return "gettext-native xz-native"
>> >
>> >
>> > I don't believe this is right either, at least not for the master branch. Autopoint is specifically excluded for all autotools-based recipes; psmisc used to be an exception to that, but no longer is with the latest master branch and latest gettext.
>> >
>>
>> How would you like to handle it on stable branches for recipes (like
>> psmisc) which depends on autopoint?
>>
>> -Sumit
>>
>> > Alex

