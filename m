Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4644774F4B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 14:19:30 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id n9-v6so4502213pgq.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 May 2018 07:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=D4FZx79ahk683sCJS3fDIQTdZUcHhvBd4UPuiSHT2Ow=;
	b=Gjlcj5TY7BtDMxaqdENQpIfTCGw6KZD2pIsLWVzaAoapUhB5gogvI0FRV05n92LYaf
	QiSQCs2bk/yTZFmbuFQLu9kgbSCmVXjm8/J149UT6Kq34V4AbBOl4N7X+ra7QM4pTlIB
	Vfj2X8EWezbP8xXkZdfvOt+H9tJv0LptHIqxAhlgvhH8Ug8JBa81F6yPx2GFoTCNIeqN
	qhtL4ODPqcMEHT/FNk5MXeGXlq9tebhRe5CfnUwC5wMOckOIOrYDA017RuuyVs+IAAYb
	Utsq9mRCdlJVIX68q0bgKVllfHUUxuQtd1fPo52jwJ7r8gQ44RcrTLlxw46jzo8BocYC
	MSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=D4FZx79ahk683sCJS3fDIQTdZUcHhvBd4UPuiSHT2Ow=;
	b=TI+ApP4huBnlufjRrKLdKzh4MYAv9WUupou2u5jFruJ2BMr1XqNI2JB5etPeXiFUEq
	ZQsOebxggFPP30iEGwwaax+DuNlkIUx7CI/3B/LV3yy5tf7mgeg0idK3NfEqCBQNDQ+/
	jgOIFAd42erG+kCn2SAVsitXFjgQeM7NADr6/dPm72h2MFqSVtC3mZrplbNMO8D18YnY
	61SmEauZxCv+ozDl/G6WdzWbP8JLfzMrzcb1oMg4Jr+gBCyK7tCHUEvP2rAgfDpXRI2J
	sJtCmwE7vKOiB5Er6ZuQ0YQ059RRXswzfilDOH5KhLtWNoc36MWNKUtfyy+CfRpZGS7C
	32bA==
X-Gm-Message-State: ALKqPwenTSb0pE54Xo6A/JYCTrYsD1DIAbgNAFRTw5LGdsOGcsP1SDDU
	jmFAI5VPnlYHCWbMHDQ52UZI8A==
X-Google-Smtp-Source: AB8JxZoNy1GgKNIjwYjqEowoCIw8nx4N9eNvWNw95JRzwEWKv1AItLQkoQcHjip616WnZRc+JMfaWg==
X-Received: by 2002:a65:5b8a:: with SMTP id
	i10-v6mr6440836pgr.352.1526739571828; 
	Sat, 19 May 2018 07:19:31 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:9b2:161b:3570:905a?
	([2601:202:4000:1184:9b2:161b:3570:905a])
	by smtp.gmail.com with ESMTPSA id
	e10-v6sm20151660pfb.136.2018.05.19.07.19.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 May 2018 07:19:31 -0700 (PDT)
To: Anuj Mittal <anuj.mittal@intel.com>, Armin Kuster <akuster808@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <1526696034-3857-1-git-send-email-akuster@mvista.com>
	<1526696034-3857-7-git-send-email-akuster@mvista.com>
	<ed930412-44bf-466d-ffe5-a3d9cd85442f@intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <607210d4-032b-dce9-5db5-ffeb4d7795f1@gmail.com>
Date: Sat, 19 May 2018 07:19:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <ed930412-44bf-466d-ffe5-a3d9cd85442f@intel.com>
Subject: Re: [PATCH 7/8] busybox: update to 1.28.3
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
X-List-Received-Date: Sat, 19 May 2018 14:19:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 05/18/2018 07:30 PM, Anuj Mittal wrote:
> On 05/19/2018 10:13 AM, Armin Kuster wrote:
>>  SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>> -           file://busybox-udhcpc-no_deconfig.patch \
>>             file://find-touchscreen.sh \
>>             file://busybox-cron \
>>             file://busybox-httpd \
>> @@ -42,11 +41,9 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>>             file://rcK \
>>             file://runlevel \
>>             file://makefile-libbb-race.patch \
>> -           file://CVE-2011-5325.patch \
>> -           file://CVE-2017-15873.patch \
>> -           file://busybox-CVE-2017-16544.patch \
>>  "
>>  SRC_URI_append_libc-musl = " file://musl.cfg "
>>  
>> -SRC_URI[tarball.md5sum] = "476186f4bab81781dab2369bfd42734e"
>> -SRC_URI[tarball.sha256sum] = "9d4be516b61e6480f156b11eb42577a13529f75d3383850bb75c50c285de63df"
>> +#file://busybox-udhcpc-no_deconfig.patch
> Why has this been removed and commented out? Is this intentional?
No, just being a goof. sad thing is I believe I re factored that patch.

thanks for catching this.
armin

>
> Thanks.


