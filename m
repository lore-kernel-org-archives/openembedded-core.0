Return-Path: <scott.branden@broadcom.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9F3CF6155C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 00:26:15 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id m13so1752247pjb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 16:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=kFdCuEG+UIWzs1dX9R3psPGlcXZx4QJR+44RpvFPcH0=;
	b=ASeTq60Sl6M/Vto9r4WjL+o/TUbVVmYhsct0HvkhjiRk3lj+w4TLaT9do89LvZeU7V
	KF68RPFlESitXN7EjWjpVcHnEpdZmQALTIQDqOlom01sNxErs9HSiDHnkszUb4YH+BWA
	Q4BeAFhu03gd9y+QvlMufTFqGLizuHzOyYJLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=kFdCuEG+UIWzs1dX9R3psPGlcXZx4QJR+44RpvFPcH0=;
	b=GjENxU/njQd8Wvjbh5q3zeo0PRsjwhvRLHoPuT+Mk0CsvEn/7KBs9my40y4hdwkJP6
	TgeJem9MKIA38v4kaUFh39G5SunJhKbQ29TI26uOjk9rFmPhOkH+Hx5OecAX7eqJiLuu
	yhhFPfsy/pKlaEOkrPrAhfyQu8EYLh+4n6N0mTrXSnXuN3xdxwPJ94hIpst5GNo9ZE7R
	JvEOqHoFAUdZbCJzflMZXaCw70AqaHLdANmVGeR9xHFOlw1QU6exiJMBUtkCziuMsVpU
	9FfeC3zDeTTaIAOetwcjuPIGtQLBbvJmmzjQbGm36NNvtgFPdVy+rSPOjhhsCqFBcWNR
	FQng==
X-Gm-Message-State: APjAAAUsJBHutyU+IjkM9nR4SzdGf818oKgoeAOSW6MrpdFlZiHwmVax
	madnT6I4bXcyWmMiQ7OQMR84zP/LLRcOboZJqRhsQXahfMZLvrUVrjjjp8T5BHMmMELElGhGN+f
	bkFSCnJRrEdJ7BiFYi+Fc/48F2UKDfugcH9QRrQmyxTUkmNeLVVXFmPxHKTQY7bE1ax9fkUif/2
	sOvrCGGGIUkOm9TdZ46wPOmCBdtTQ=
X-Google-Smtp-Source: APXvYqw1PzD1jFyDOGUTXaDa0V59Y/DIm/N6u0i60NAoOQSG67coKsBTHgRl3Xu0t0L48bB6nx2iOQ==
X-Received: by 2002:a17:90b:254:: with SMTP id
	fz20mr5665424pjb.25.1582071976085; 
	Tue, 18 Feb 2020 16:26:16 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	u126sm149232pfu.182.2020.02.18.16.26.14
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 18 Feb 2020 16:26:15 -0800 (PST)
To: Andre McCurdy <armccurdy@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <20200218224455.14551-1-scott.branden@broadcom.com>
	<20c4646f9a30462bb6c9ae0f49b71092@XBOX03.axis.com>
	<CAJ86T=XXS=3Mzj3sc_M3UjCar6-+EHR8ZkkA6LJm+VrLsdsXYw@mail.gmail.com>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <9dde2b9f-e709-a7dd-df85-70af5e720af6@broadcom.com>
Date: Tue, 18 Feb 2020 16:26:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAJ86T=XXS=3Mzj3sc_M3UjCar6-+EHR8ZkkA6LJm+VrLsdsXYw@mail.gmail.com>
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] iproute2: add devlink support to iproute2
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
X-List-Received-Date: Wed, 19 Feb 2020 00:26:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Andre,

On 2020-02-18 3:36 p.m., Andre McCurdy wrote:
> On Tue, Feb 18, 2020 at 3:19 PM Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
>>> -----Original Message-----
>>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-
>>> bounces@lists.openembedded.org> On Behalf Of Scott Branden via
>>> Openembedded-core
>>> Sent: den 18 februari 2020 23:45
>>> To: openembedded-core@lists.openembedded.org
>>> Subject: [OE-core] [meta-oe][PATCH v2] iproute2: add devlink support to
>>> iproute2
>>>
>>> Add devlink support to iproute2 recipe.
>>>
>>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
>>> ---
>>>   meta/recipes-connectivity/iproute2/iproute2.inc | 8 ++++++--
>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc
>>> b/meta/recipes-connectivity/iproute2/iproute2.inc
>>> index fc31b8444e..98793af88e 100644
>>> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
>>> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
>>> @@ -15,11 +15,13 @@ inherit update-alternatives bash-completion pkgconfig
>>>
>>>   CLEANBROKEN = "1"
>>>
>>> -PACKAGECONFIG ??= "tipc elf"
>>> +PACKAGECONFIG ??= "tipc elf devlink"
>>>   PACKAGECONFIG[tipc] = ",,libmnl,"
>>>   PACKAGECONFIG[elf] = ",,elfutils,"
>>> +PACKAGECONFIG[devlink] = ",,libmnl,"
>>>
>>>   EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl \
>>> +                ${@bb.utils.contains('PACKAGECONFIG', 'devlink', 'devlink', '', d)}                                               \
>>>                   ${@bb.utils.contains('PACKAGECONFIG', 'tipc', 'tipc', '', d)}' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
>> You can simplify the above to:
>>
>> EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl \
>>                  ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc', d)}' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
>>
>> but I also recommend to reformat it to make it more readable:
>>
>> EXTRA_OEMAKE = "\
>>      CC='${CC}' \
>>      KERNEL_INCLUDE=${STAGING_INCDIR} \
>>      DOCDIR=${docdir}/iproute2 \
>>      SUBDIRS='lib tc ip bridge misc genl ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc', d)}' \
>>      SBINDIR='${base_sbindir}' \
>>      LIBDIR='${libdir}' \
>> "
> You could take the cleanup one step further by merging the recipe and
> the .inc file (and then including CCOPTS='${CFLAGS}' directly in the
> definition of EXTRA_OEMAKE).
Sounds like a more involved change that should be taken up in an 
unrelated cleanup exercise?
>
>>>   do_configure_append () {
>>> @@ -46,7 +48,8 @@ PACKAGES =+ "${PN}-tc \
>>>                ${PN}-rtacct \
>>>                ${PN}-nstat \
>>>                ${PN}-ss \
>>> -             ${@bb.utils.contains('PACKAGECONFIG', 'tipc', '${PN}-tipc', '', d)}"
>>> +             ${@bb.utils.contains('PACKAGECONFIG', 'tipc', '${PN}-tipc', '', d)} \
>>> +             ${@bb.utils.contains('PACKAGECONFIG', 'devlink', '${PN}-devlink', '', d)}"
>> Assuming that the tipc and devlink binaries are only created when tipc
>> and devlink are included in SUBDIRS above, which seems reasonable, you
>> can simplify the above and remove the PACKAGECONFIG checks since the
>> packages will only be created if there actually are files to put in
>> them, e.g.:
>>
>> PACKAGES =+ "\
>>      ${PN}-tc \
>>      ${PN}-lnstat \
>>      ${PN}-ifstat \
>>      ${PN}-genl \
>>      ${PN}-rtacct \
>>      ${PN}-nstat \
>>      ${PN}-ss \
>>      ${PN}-tipc \
>>      ${PN}-devlink \
>> "
>>
>>>   FILES_${PN}-tc = "${base_sbindir}/tc* \
>>>                     ${libdir}/tc/*.so"
>>>   FILES_${PN}-lnstat = "${base_sbindir}/lnstat \
>>> @@ -58,6 +61,7 @@ FILES_${PN}-rtacct = "${base_sbindir}/rtacct"
>>>   FILES_${PN}-nstat = "${base_sbindir}/nstat"
>>>   FILES_${PN}-ss = "${base_sbindir}/ss"
>>>   FILES_${PN}-tipc = "${base_sbindir}/tipc"
>>> +FILES_${PN}-devlink = "${base_sbindir}/devlink"
>>>
>>>   ALTERNATIVE_${PN} = "ip"
>>>   ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
>>> --
>>> 2.17.1
>> //Peter
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


