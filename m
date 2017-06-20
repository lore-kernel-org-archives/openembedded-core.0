Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 11A1A77BBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 22:08:04 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id 77so109556169wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 15:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=0oe1VNZEkRiAmBymK1P6jcyrh/XZ6fmKhRfSoPxVtp0=;
	b=bzjbk0I9hYUGvY4bUv26aiKbOQsvtts2g1uZ3vVXXQcdQIHLqjXloXh174YPNeRjQJ
	oIK1wUzB6eK3DI8nHqTqsG+0d3gUlfIKgKB4NxLFBJcfrhnhqZd889wlhAw35akyfJcv
	ZoOGgwA3+SxvBsDhI/4ndG+1Pqy/j/VumsJtaZqsqERYVeapCW7HkRbW+ga+pLFgZjwF
	bvBNrkkMkc7dFc9qVSHc0L6jdaNnw+Yf4OI0frnUSjYCfmyIBALqKV5/Hv9K5xLfCrkt
	SGjzxVYUjZni45Hf/WAanwQo2StjoTZ+loea6PTed3nR0C3J+s6dZyzGvCK8HZL9qRrJ
	/hoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=0oe1VNZEkRiAmBymK1P6jcyrh/XZ6fmKhRfSoPxVtp0=;
	b=aYasS3takulG0MMsDqm0tlQMefiVzmWjgEtiONeY/6q8q5A/diWLOLYhmdihK8SsZ6
	Uq1InUjkSfR2qsihNKUVnqqyzIhPthqbWWGTsOfiaJKAQeNvWqAR3ESeEFyn3JT8340q
	cVIQpQJhkvwLKWweHcXFmhKyin0mha0dJhx7TO2c6Wk0/Z95Kes+kZK3JJc6azTR0ORI
	UZaa1WryXaLeGEfWDjmfy9zcqbVTBIXWwiQshdttJHNvl5XQ28/j+d6i/bV5VF1jouo4
	q7o2PkQi0W4o2hCNvgOXcyYTbUvRV7By+A/CqG+C4zEs4+8lUPGqTTWOeNJbZ7SHc/8y
	feQw==
X-Gm-Message-State: AKS2vOwn1PjyDccOIByYGiPXh6nSsXIBz6SaV8bn/gnrTXVAfr5x24zr
	F+6fZXF0As58z8Bd8kw=
X-Received: by 10.28.8.19 with SMTP id 19mr4211100wmi.18.1497996485401;
	Tue, 20 Jun 2017 15:08:05 -0700 (PDT)
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com.
	[209.85.128.171]) by smtp.gmail.com with ESMTPSA id
	l46sm1392230wrl.15.2017.06.20.15.08.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Jun 2017 15:08:04 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f171.google.com with SMTP id y25so70266322wrd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 15:08:04 -0700 (PDT)
X-Received: by 10.223.138.252 with SMTP id z57mr24067092wrz.66.1497996483809; 
	Tue, 20 Jun 2017 15:08:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.176.5 with HTTP; Tue, 20 Jun 2017 15:08:03 -0700 (PDT)
In-Reply-To: <ae378e9f-5646-41fc-642c-9716a2a03ac4@denx.de>
References: <20170620204029.19499-1-brad.mouring@ni.com>
	<f35ef85f-1868-ef13-1003-3bf1cfc58b89@denx.de>
	<20170620205349.GA19584@zardoz.amer.corp.natinst.com>
	<CAP9ODKoR2bZgeNzzBhNmDzJw6KOvqfboYpY3cj1JMnoqS4YKMQ@mail.gmail.com>
	<ae378e9f-5646-41fc-642c-9716a2a03ac4@denx.de>
Date: Tue, 20 Jun 2017 19:08:03 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpNqhY8nj8e2yPe_b+Nk0adK3fx_4FgZt58Pk8-09j5OA@mail.gmail.com>
Message-ID: <CAP9ODKpNqhY8nj8e2yPe_b+Nk0adK3fx_4FgZt58Pk8-09j5OA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Tom Rini <trini@konsulko.com>,
	Openembedded Core <openembedded-core@lists.openembedded.org>,
	Brad Mouring <brad.mouring@ni.com>
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
X-List-Received-Date: Tue, 20 Jun 2017 22:08:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 20, 2017 at 6:16 PM, Marek Vasut <marex@denx.de> wrote:
> On 06/20/2017 10:57 PM, Otavio Salvador wrote:
>> On Tue, Jun 20, 2017 at 5:53 PM, Brad Mouring <brad.mouring@ni.com> wrote:
>>> On Tue, Jun 20, 2017 at 10:43:51PM +0200, Marek Vasut wrote:
>>>> On 06/20/2017 10:40 PM, Brad Mouring wrote:
>>>>> As implemented currently, the fw-utils recipe does not allow for
>>>>> ...
>>>>> +# by the U-Boot environment utilities "fw_printenv" and "fw_setenv".
>>>>> +# By default, use the default included in the U-Boot source
>>>>> +UBOOT_FW_ENV_CONFIG ??= "${S}/tools/env/fw_env.config"
>>>>> +
>>>>>  inherit uboot-config
>>>>>
>>>>>  do_compile () {
>>>>> @@ -19,7 +24,7 @@ do_install () {
>>>>>     install -d ${D}${sysconfdir}
>>>>>     install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
>>>>>     install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
>>>>> -   install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
>>>>> +   install -m 0644 ${UBOOT_FW_ENV_CONFIG} ${D}${sysconfdir}/fw_env.config
>>>>
>>>> Do we really need yet another variable ? Wouldn't it make more sense to
>>>> add do_install_append_yourmachine() {} in your meta-whatever to
>>>> u-boot-fw-utils_%.bbappend and install whatever additional files you need ?
>>>
>>> This is (kinda) what we were doing, there was some discussion as to
>>> whether or not this made sense upstream. I was unsure of the
>>> acceptability of a do_install_append.*() clobbering a file of the
>>> original do_install().
>>>
>>> Thanks for the input.
>>
>> Or split up the configuration to u-boot-fw-utils-config package and
>> make u-boot-fw-utils generic? So we can have the configuration in a
>> specific package.
>
> Keep in mind that u-boot-fw-utils is actually built for particular
> machine (it contains ie. the default env for that machine) so bundling
> the config file with it is IMO OK. No need to introduce additional
> packages for every simple file.

I will propose one patch. See what you think ...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

