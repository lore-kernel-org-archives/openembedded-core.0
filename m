Return-Path: <scott.branden@broadcom.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3D06361523
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 00:26:57 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id e9so1752870pjr.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 16:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=uB+Xw3jNMWZy263ZXzIAZmOcetU73Ttp4kpL7zWmcB8=;
	b=d3CzBh7Y63nPXu9s5Q6yfgB72S3T2Wh8e90UUGY774Og8cECd565OBnVC5jJvaOE1I
	0bhkxWxF0vZRIuMu1e9rfla4Ez7+rJTqq0zD8QQCMvkUU5J7bHZ/Z8NRGfY6UEY6wmLJ
	UP7zPROx7/S45MKyrN+e2BusVggkNMVDlEoIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=uB+Xw3jNMWZy263ZXzIAZmOcetU73Ttp4kpL7zWmcB8=;
	b=ti2j1rQQiGopJZGkg6qSn7yL7daha9wPKla8p7Wr9r7S7LG4roX60o9NuW2Q0ocDEj
	ATnKUs0Yi+WSyzMSOStrLDP9GNj1jX897Gh83nKgll7ipnXyYnVDtbdawzDYczBgf0Np
	d7RiQPqVuYOr0x/sqNS2HBvH39ksqbJSOPMeghJV+tg60/dwqi0p0hjWXA/LPkuv9ZeM
	Ot3CQ+DUaelM15cKzS1W0o5upirq1LmYhaKhwnm6lU7nIV9OVNo1r+N5Zn/Zf/i4fADb
	ykAuaes+t0JACp764U49sd7jPf3x0BNtmb8cV7aSpjgVV2rS7Eab+YB3oVGynqh4hyBl
	a0pQ==
X-Gm-Message-State: APjAAAVysPs4GPTqtzRWDvZIXdXd13fMD6iJaE5Y9U15S8ezpVzlE6D6
	lDNgH/4qxeCaM9VkpjiXQmJjp8xXqihP2oHa4+r+7VFFFmc0abtAE2bY4xFZ65N0j3XZwRzNDcB
	w4nDrSWQzk+9W+GKcYXbMOkfWUA9xmgp/QK+UAR6wrDcTSPE+lbRhQbQbgpU9ohG1Su/j68nyjE
	OgjewyeDQP8rDWrHKzSjfAdUrQZcI=
X-Google-Smtp-Source: APXvYqybF/fNrpJd7TKI7q1MyfMFh5E08PFeneXC41APyFlT1IWcvVFOf2S49lQsGAwF9hVquyfzzw==
X-Received: by 2002:a17:902:9a4c:: with SMTP id
	x12mr22350402plv.297.1582072018062; 
	Tue, 18 Feb 2020 16:26:58 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id l37sm101026pjb.15.2020.02.18.16.26.57
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 18 Feb 2020 16:26:57 -0800 (PST)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <20200218224455.14551-1-scott.branden@broadcom.com>
	<20c4646f9a30462bb6c9ae0f49b71092@XBOX03.axis.com>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <f3e6219b-7506-f666-b207-1b0b2f85164f@broadcom.com>
Date: Tue, 18 Feb 2020 16:26:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20c4646f9a30462bb6c9ae0f49b71092@XBOX03.axis.com>
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
X-List-Received-Date: Wed, 19 Feb 2020 00:26:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Peter,

On 2020-02-18 3:18 p.m., Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-
>> bounces@lists.openembedded.org> On Behalf Of Scott Branden via
>> Openembedded-core
>> Sent: den 18 februari 2020 23:45
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [meta-oe][PATCH v2] iproute2: add devlink support to
>> iproute2
>>
>> Add devlink support to iproute2 recipe.
>>
>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
>> ---
>>   meta/recipes-connectivity/iproute2/iproute2.inc | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc
>> b/meta/recipes-connectivity/iproute2/iproute2.inc
>> index fc31b8444e..98793af88e 100644
>> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
>> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
>> @@ -15,11 +15,13 @@ inherit update-alternatives bash-completion pkgconfig
>>
>>   CLEANBROKEN = "1"
>>
>> -PACKAGECONFIG ??= "tipc elf"
>> +PACKAGECONFIG ??= "tipc elf devlink"
>>   PACKAGECONFIG[tipc] = ",,libmnl,"
>>   PACKAGECONFIG[elf] = ",,elfutils,"
>> +PACKAGECONFIG[devlink] = ",,libmnl,"
>>
>>   EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl \
>> +                ${@bb.utils.contains('PACKAGECONFIG', 'devlink', 'devlink', '', d)}                                               \
>>                   ${@bb.utils.contains('PACKAGECONFIG', 'tipc', 'tipc', '', d)}' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
> You can simplify the above to:
>
> EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl \
>                  ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc', d)}' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
>
> but I also recommend to reformat it to make it more readable:
>
> EXTRA_OEMAKE = "\
>      CC='${CC}' \
>      KERNEL_INCLUDE=${STAGING_INCDIR} \
>      DOCDIR=${docdir}/iproute2 \
>      SUBDIRS='lib tc ip bridge misc genl ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc', d)}' \
>      SBINDIR='${base_sbindir}' \
>      LIBDIR='${libdir}' \
> "
>
>>   do_configure_append () {
>> @@ -46,7 +48,8 @@ PACKAGES =+ "${PN}-tc \
>>                ${PN}-rtacct \
>>                ${PN}-nstat \
>>                ${PN}-ss \
>> -             ${@bb.utils.contains('PACKAGECONFIG', 'tipc', '${PN}-tipc', '', d)}"
>> +             ${@bb.utils.contains('PACKAGECONFIG', 'tipc', '${PN}-tipc', '', d)} \
>> +             ${@bb.utils.contains('PACKAGECONFIG', 'devlink', '${PN}-devlink', '', d)}"
> Assuming that the tipc and devlink binaries are only created when tipc
> and devlink are included in SUBDIRS above, which seems reasonable, you
> can simplify the above and remove the PACKAGECONFIG checks since the
> packages will only be created if there actually are files to put in
> them, e.g.:
>
> PACKAGES =+ "\
>      ${PN}-tc \
>      ${PN}-lnstat \
>      ${PN}-ifstat \
>      ${PN}-genl \
>      ${PN}-rtacct \
>      ${PN}-nstat \
>      ${PN}-ss \
>      ${PN}-tipc \
>      ${PN}-devlink \
> "
OK, all of this can be put in with this commit change - thanks.
>>   FILES_${PN}-tc = "${base_sbindir}/tc* \
>>                     ${libdir}/tc/*.so"
>>   FILES_${PN}-lnstat = "${base_sbindir}/lnstat \
>> @@ -58,6 +61,7 @@ FILES_${PN}-rtacct = "${base_sbindir}/rtacct"
>>   FILES_${PN}-nstat = "${base_sbindir}/nstat"
>>   FILES_${PN}-ss = "${base_sbindir}/ss"
>>   FILES_${PN}-tipc = "${base_sbindir}/tipc"
>> +FILES_${PN}-devlink = "${base_sbindir}/devlink"
>>
>>   ALTERNATIVE_${PN} = "ip"
>>   ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
>> --
>> 2.17.1
> //Peter


