Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7165B60043
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jan 2019 17:03:33 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id u89-v6so25415452lje.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Jan 2019 09:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=2wXFSbvvkbCZxqJ9Khi6cSpKXNGV3sNBTvrXgPECDEQ=;
	b=AgHs+iUCcLGJbp+j0H0ByM5QTcW7D+kqqF1NkpJirnTqX6bu4nuuqy92A0qEdIviV9
	YRvAGoifm/9QDKFlIKiySNRXLOYf4MGueddTNh7zaBS/zL/T3ngHjeQDuh0IEmkbjpG3
	IDy3uvqYfUAz5fsj+LjVmZSqkIuRslSWqgbvkdmTpvXBwcqylXZoCDQ+QPZEFLNj4CPY
	I/EVrICYPeyV+pX3Nv+1XjLW+bi90TC0AwZhyVcFquGn1XFv4nhYf9Cft4RACnEp7xyY
	JRnVHpFQPNvRYKHB1TipsmSiZhB0B1pD8Xz4RotkYEoUNnw7AfNmxkvt/ig3qWoq61Il
	qNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=2wXFSbvvkbCZxqJ9Khi6cSpKXNGV3sNBTvrXgPECDEQ=;
	b=Cs2vLwrOt3C8bN/Mv1XOWEEus8iaD5Twgorrt234wAF+IyLXqr3Pj+ykQFzK7+8a+8
	04LyNiQ/ibh/Tr35t+IZM+CWan76idUaGjZvGj3ay7mfk+FuhMj5emxcOVEH2PPOK6wU
	rMzufXfDzMaVprxzlZQOh2xLx3CoTjMNpn3lqoJH2zppQKCsRAlQqd2fIPf8GRIljgpC
	6gA5WmD0un9L7fM3X68wrBS6DHECDe4wyDeYl9AkhFrCuAmNcte0VA/52ZVeD/axIEXJ
	2CCEzPhmCpk76GCoKlMGb2ieNMMhjFQDJ/ftwjgE0uNTvjloM6I8lUBvws2OPqISWAew
	gQrA==
X-Gm-Message-State: AJcUukf7NWahvjMlLLTcU+OW2ZJFXvw4OwZ9+r9OmxprOP4QoxLEK7Q5
	HW8yAHU/Q28hdgAzS9p15GXsUePTwdY=
X-Google-Smtp-Source: ALg8bN5NI/4X7OD4JO6kXdSzXwC9FLT2OWnXgKxhdx9Q7iz0o0P10HYhMg1QAHCelLy5O4oTHqjO0g==
X-Received: by 2002:a2e:7d15:: with SMTP id
	y21-v6mr8010426ljc.77.1546362214109; 
	Tue, 01 Jan 2019 09:03:34 -0800 (PST)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	j18-v6sm10721243ljc.52.2019.01.01.09.03.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Jan 2019 09:03:33 -0800 (PST)
To: Randy MacLeod <randy.macleod@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20181231120559.25470-1-jonas@norrbonn.se>
	<20181231120559.25470-3-jonas@norrbonn.se>
	<08f2090e-75cd-2551-5c01-5f22e5f2574d@windriver.com>
From: Jonas Bonn <jonas@norrbonn.se>
Message-ID: <dc905b3a-ef1b-410a-c670-e849c9a8e6a2@norrbonn.se>
Date: Tue, 1 Jan 2019 18:03:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <08f2090e-75cd-2551-5c01-5f22e5f2574d@windriver.com>
Subject: Re: [PATCH 2/7] systemd-conf: simplify creation of configuration
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
X-List-Received-Date: Tue, 01 Jan 2019 17:03:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Randy,

Thanks for looking at this.

On 01/01/2019 16:29, Randy MacLeod wrote:
> On 12/31/18 7:05 AM, Jonas Bonn wrote:
>> The configuration files that systemd installs are just skeletons
>> detailing the available options and their default values.  The
>> recommended means of changing the configuration is to provide snippets
>> in configuration directories.  For example, journald.conf settings are
>> best set in /usr/lib/journald.conf.d/ and can be overridden by the user
>> by providing overriding snippets in /etc/systemd/journald.conf.d/.
>>
>> The base configuration files have the lowest priority; they will always
>> be overridden by any snippets.  As such, it's probably best to not
>> provide them at all.  This also moves us a step closer to an empty /etc
>> which is should be a long term goal in order to allow running OE as a
>> "stateless system".
>>
>> This patch moves the systemd configuration to snippets in
>> /usr/lib/*.conf.d.  This simplifies the recipe considerably since it now
>> just sets up a couple of text files and doesn't even need access to the
>> systemd source anymore.
>> ---
>>   meta/recipes-core/systemd/systemd-conf.bb | 34 +++++++++--------------
>>   1 file changed, 13 insertions(+), 21 deletions(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd-conf.bb 
>> b/meta/recipes-core/systemd/systemd-conf.bb
>> index 7fe2e1105b..a504afe3e7 100644
>> --- a/meta/recipes-core/systemd/systemd-conf.bb
>> +++ b/meta/recipes-core/systemd/systemd-conf.bb
>> @@ -1,9 +1,8 @@
>> -require systemd.inc
>> -
>>   SUMMARY = "Systemd system configuration"
>>   DESCRIPTION = "Systemd may require slightly different configuration 
>> for \
>>   different machines.  For example, qemu machines require a longer \
>>   DefaultTimeoutStartSec setting."
>> +LICENSE = "GPLv2"
> 
> Systemd claims that these conf files are: LGPLv2.1+ licensed.

The configuration files from systemd may be LGPLv2 licensed, but this 
package now only creates some configuration snippets which are 
independent of systemd (it's just data, now).  As such, one could 
certainly put whatever license one wanted on this.  Honestly, GPLv2 is 
probably a stretch... I can hardly see that any license applies to this, 
to be honest.  Consider that:

/usr/lib/journald.conf.d/systemd-conf.conf

contains

ForwardToSyslog=yes
RuntimeMaxUse=64M

Just configuration data that the package creates dynamically.

> 
> https://github.com/systemd/systemd/blob/master/sysusers.d/systemd.conf.m4
> 
> https://github.com/systemd/systemd/blob/master/modprobe.d/systemd.conf
> 
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>> @@ -13,36 +12,29 @@ ${sysconfdir}/systemd/logind.conf \
>>   ${sysconfdir}/systemd/system.conf \
>>   ${sysconfdir}/systemd/user.conf"
>> -FILES_${PN} = "${sysconfdir}/systemd"
>> -
>> -do_configure[noexec] = '1'
>> -do_compile[noexec] = '1'
>> +FILES_${PN} = "/usr/lib/journald.conf.d/* \
>> +/usr/lib/logind.conf.d/* \
>> +/usr/lib/system.conf.d/* \
>> +"
>>   do_install() {
>> -    rm -rf ${D}/${sysconfdir}/systemd
>> -    install -d ${D}/${sysconfdir}/systemd
>> -
>> -    install -m 0644 ${S}/src/coredump/coredump.conf 
>> ${D}${sysconfdir}/systemd/coredump.conf
>> -
>> -    install -m 0644 ${S}/src/journal/journald.conf 
>> ${D}${sysconfdir}/systemd/journald.conf
>> +    install -d ${D}/usr/lib/journald.conf.d
> 
> Should the recipe use /usr/lib or is / should there be a
> 'systemdconfdir' var?

So, I looked into the systemd source and, as far as I can see, it seems 
that systemd hardcodes the paths to configuration files, tmpfiles, 
presets, etc.  It's all really /usr/lib/... with no method of specifying 
any other location.  For this reason, I've used these explicit paths 
above, strange though it may appear...

/Jonas

