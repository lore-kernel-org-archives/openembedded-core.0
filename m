Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 97826745F1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 09:58:48 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id l82-v6so20659604oih.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 02:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NRA1FrUbc3jI9IUz/UDFKbqfdKaKmxPdjAB47/TBQ3A=;
	b=h8d6O/pDnLSX//Rrgv5nXvXrcCG3N/TG+6j71w3AG5xKW56ilkhqikqGj+xSEIC9JK
	gbjdDaOJkvI0ncF0Et3U431wowGGjk1PJ04PrFNhK1PlDmmfGMUssiOcZ5CmKw8bRaGh
	uo2DRYocxgjbuzNDs79dwtzFOpQLFl8N/Ywnw8nllZUYETqbYR9Bc0E9jQyyBXmfdvdI
	lrSaj7421E5LIxSb2BQ6JW0u+nXYsf80evv4PIdxqIAxMQpROJr6n3p4cEFYkKKh0dK3
	ryy2/d+yldNq3Bjk0mWmFcLMVzHZSRqw8SoFlSdnX/h6TEbY03J42jVzm/MojTIV6OcN
	Uu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NRA1FrUbc3jI9IUz/UDFKbqfdKaKmxPdjAB47/TBQ3A=;
	b=XEjly6AChCiL4WRGJR1w87RIpT2M+z7MY4+QDBsII1t9SFhNbJkfqbkCVeyzYOlnmk
	VX5wo5XzicbkPNCulovnH8tfCXoAYsWtKaoPiqF6jksR1ifvnyKQC+nNabeOvtzfihkf
	AN2hG4av0mL6hA2S+uAJF+yzdKLi8KoYMB5ldDSl2F710iSfpKrB2vixCYypfl09XY5a
	baqIZlHF0f3HVVOZpWoReO9Hsu4/2D9/JJlj6NgC18kOVWm7h6/GFqcgtIRnjACcXSbm
	WgXCvogEqjXx2gr/+ZXRE6mKg+3jzMuXnMmEIjLMywn8DpXu2ClwMwQA8n+Fe7Pyss4c
	EAzA==
X-Gm-Message-State: APzg51CNY+whhbrw7dRJapE4MSRmTZxIctbtYE3qij2VoOnU6p4iPwz9
	Jf4z5+9PNCrg+YGur3TDKyqPcb18YjsyoEpMvM/Ogg==
X-Google-Smtp-Source: ANB0VdZcAuagpynG+gUK8Vjoq5Fm1RNEleyS3GYsBnncIOJPAjlcAdg5SzEMS6FJuCmyc4WVp6NMw6MF6jL4k73E/rc=
X-Received: by 2002:aca:6a48:: with SMTP id
	f69-v6mr6122762oic.279.1535709529481; 
	Fri, 31 Aug 2018 02:58:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7c0c:0:0:0:0:0 with HTTP; Fri, 31 Aug 2018 02:58:28
	-0700 (PDT)
In-Reply-To: <CAO5Uq5Ro-s04ePOeODyktaVS42POFwut6ADYAzYFf7Qve9SbCQ@mail.gmail.com>
References: <1535618064-18215-1-git-send-email-alex.kiernan@gmail.com>
	<CAJTo0LYyqaNRO39badfpH8F-H97-v0M_NpBrGhYamzaOn+MqEQ@mail.gmail.com>
	<CAO5Uq5Ro-s04ePOeODyktaVS42POFwut6ADYAzYFf7Qve9SbCQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 Aug 2018 10:58:28 +0100
Message-ID: <CAJTo0LaBhtM=jPYeOLMsfsmPyc23CyJg=D3ivx9q-LufJrwStA@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sudo: Add missing dep on virtual/crypt
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
X-List-Received-Date: Fri, 31 Aug 2018 09:58:48 -0000
Content-Type: text/plain; charset="UTF-8"

Yeah, that sounds right.

Ross

On 31 August 2018 at 08:18, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> I have to admit, I didn't look, I just assumed it was working for the
> pam case, since I don't have a build which needs pam.
>
> Looking at the sudo code/libpam, it looks like you need it, but you'd
> get it through transitive dependencies - should we just add it
> unconditionally here?
>
> On Thu, Aug 30, 2018 at 9:52 PM Burton, Ross <ross.burton@intel.com> wrote:
>>
>> That suggests that the crypt dependency is only needed if pam is
>> disabled, is that the case?
>>
>> Ross
>>
>> On 30 August 2018 at 09:34, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>> > Ensure we have virtual/crypt even if building without PAM; fixes:
>> >
>> >   sudo: error in /etc/sudo.conf, line 0 while loading plugin "sudoers_policy"
>> >   sudo: unable to load /usr/libexec/sudo/sudoers.so: /usr/libexec/sudo/sudoers.so: undefined symbol: crypt
>> >   sudo: fatal error, unable to load plugins
>> >
>> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>> > ---
>> >
>> >  meta/recipes-extended/sudo/sudo_1.8.23.bb | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-extended/sudo/sudo_1.8.23.bb b/meta/recipes-extended/sudo/sudo_1.8.23.bb
>> > index ab9c8cb..18add22 100644
>> > --- a/meta/recipes-extended/sudo/sudo_1.8.23.bb
>> > +++ b/meta/recipes-extended/sudo/sudo_1.8.23.bb
>> > @@ -10,7 +10,7 @@ PAM_SRC_URI = "file://sudo.pam"
>> >  SRC_URI[md5sum] = "ea444d747feb1decfebdffd0b38b0739"
>> >  SRC_URI[sha256sum] = "d863d29b6fc87bc784a3223350e2b28a2ff2c4738f0fb8f1c92bb38c3017e679"
>> >
>> > -DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>> > +DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', 'virtual/crypt', d)}"
>> >  RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
>> >
>> >  EXTRA_OECONF += " \
>> > --
>> > 2.7.4
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
> --
> Alex Kiernan

