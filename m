Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8425F71A84
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 20:57:43 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id c11so51958456wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 13:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=JQqQyGuEf/8F5opX7AajfMuCoQD0TWmhHvsWDD0PPFU=;
	b=bPE1zybXsHSXle82U0SbePlQGJsFhhw8gM8O3otlh+zinTVLRVq6ALZvtQ7tlYmdj9
	fB5/Db8si7DyVzvnZtTd6tDNKBhgytupG84LuvBVvbXsiX3nzpThgkVnb0V3H6qXu0Kk
	+K6FsmT6qGzyT77p6tsVUKK/2BB/v7noRYNXYxL0BZl9Ug+gxjjITwHruxaW0fLx7lQ7
	JRQo1KyfIyhmCvE1SG8ZMGl6AL6l5KRIzbk8zMev0kHrGnWR7Fk5vrP3CQGCqymMPCtf
	wL3y4rPdjMKHdaB0YV6xULTTB0gRQBTVFcoLdJssOo8XVSjBspiY1qOsEidAS46t/kSc
	TD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=JQqQyGuEf/8F5opX7AajfMuCoQD0TWmhHvsWDD0PPFU=;
	b=dRhsoc02JKlPFv14Ux08z1OAO7diBigYCCM6QutcDOhYU0JmgA0SAKuS0JpniTFCwm
	zSj0/131/b34aSZJybIlnV+K4pWebknvEQe/STEFTMP7kFhUl3FAv3swxmPqZS/gs1QJ
	g///aTtG+SpTIRawdclUo989yIHmny4iHHzl5NDFZAzv6OwZmEgQjEe625rTqCGYuDsA
	mI1P+FJvLDAogBnMdU0vJL+azhKAOzOUDBG0WAPqTy4wc12xO6u5IZXazOdSHVfbWzJW
	cSm8IZj+Bik9dx5qRJsxEZ7g4ceJEa0T6fVRcoazTqr3Bs+7m3qzjL8E0X2Wj7Ss++1h
	b7nA==
X-Gm-Message-State: AKS2vOzd4xSjLEMyOzQlTdTlmdbu9BQOOzfR6h52eChmHLf8WHEtIhfK
	cLWwDEbKqYEnsd39olA=
X-Received: by 10.223.163.197 with SMTP id m5mr8359586wrb.128.1497992264786;
	Tue, 20 Jun 2017 13:57:44 -0700 (PDT)
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com.
	[209.85.128.177]) by smtp.gmail.com with ESMTPSA id
	v13sm13852814wmd.5.2017.06.20.13.57.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Jun 2017 13:57:43 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f177.google.com with SMTP id y25so68149449wrd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 13:57:43 -0700 (PDT)
X-Received: by 10.223.138.252 with SMTP id z57mr23913401wrz.66.1497992263700; 
	Tue, 20 Jun 2017 13:57:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.176.5 with HTTP; Tue, 20 Jun 2017 13:57:42 -0700 (PDT)
In-Reply-To: <20170620205349.GA19584@zardoz.amer.corp.natinst.com>
References: <20170620204029.19499-1-brad.mouring@ni.com>
	<f35ef85f-1868-ef13-1003-3bf1cfc58b89@denx.de>
	<20170620205349.GA19584@zardoz.amer.corp.natinst.com>
Date: Tue, 20 Jun 2017 17:57:42 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoR2bZgeNzzBhNmDzJw6KOvqfboYpY3cj1JMnoqS4YKMQ@mail.gmail.com>
Message-ID: <CAP9ODKoR2bZgeNzzBhNmDzJw6KOvqfboYpY3cj1JMnoqS4YKMQ@mail.gmail.com>
To: Brad Mouring <brad.mouring@ni.com>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
	Openembedded Core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] u-boot-fw-utils: Allow target-specific fw_env.config
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
X-List-Received-Date: Tue, 20 Jun 2017 20:57:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 20, 2017 at 5:53 PM, Brad Mouring <brad.mouring@ni.com> wrote:
> On Tue, Jun 20, 2017 at 10:43:51PM +0200, Marek Vasut wrote:
>> On 06/20/2017 10:40 PM, Brad Mouring wrote:
>> > As implemented currently, the fw-utils recipe does not allow for
>> > ...
>> > +# by the U-Boot environment utilities "fw_printenv" and "fw_setenv".
>> > +# By default, use the default included in the U-Boot source
>> > +UBOOT_FW_ENV_CONFIG ??= "${S}/tools/env/fw_env.config"
>> > +
>> >  inherit uboot-config
>> >
>> >  do_compile () {
>> > @@ -19,7 +24,7 @@ do_install () {
>> >     install -d ${D}${sysconfdir}
>> >     install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
>> >     install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
>> > -   install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
>> > +   install -m 0644 ${UBOOT_FW_ENV_CONFIG} ${D}${sysconfdir}/fw_env.config
>>
>> Do we really need yet another variable ? Wouldn't it make more sense to
>> add do_install_append_yourmachine() {} in your meta-whatever to
>> u-boot-fw-utils_%.bbappend and install whatever additional files you need ?
>
> This is (kinda) what we were doing, there was some discussion as to
> whether or not this made sense upstream. I was unsure of the
> acceptability of a do_install_append.*() clobbering a file of the
> original do_install().
>
> Thanks for the input.

Or split up the configuration to u-boot-fw-utils-config package and
make u-boot-fw-utils generic? So we can have the configuration in a
specific package.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

