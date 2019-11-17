Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id D203D7F7DE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2019 16:14:59 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id a16so770884pjs.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2019 08:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=1iAETpl6+o3I00DnjKdZqfWcd+snrYYJhOHxEEQumWk=;
	b=VnsrY9V23ts9BgZMmVA/lshuA3UXudiVTWzkE39+jA7seIO04Yl7BQcQ5DFZhVCjJI
	bFornwPXxGHRczPmDwctv0kq7vdAsXCaGu/Dhv7VYaXwY04pwAHzpROPmNW5Y1x1K7gf
	gTXFffawtQLnQI3DqnjqWRLKKwhBiCb46LmiJh3oSwpcLzD14/YuMUt+GtxaJJKqp22/
	p3xGfgisNfngMJ5I7eDMZixQdvL++0CE2D6n3/rlO2Qsj/SyaBX+0JRAjQZeCx0X7fAR
	sXHwH4sJiCdG3qP7ay+1gsVbnRhPli3qiYBi+e7MaThmBXUH/nItYDwV+sQTI/p/rlZp
	205Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=1iAETpl6+o3I00DnjKdZqfWcd+snrYYJhOHxEEQumWk=;
	b=o5pK0xSJkTMrAJHmhujtbJJ1cwIY1uRexjnyX93kCeRp2ZFLHN2kzw+S0VoURTYAV3
	+/uAf4dv85SRlIKBVKhlg5EF+xPCJ+WXA7xGWaryyX3NcKsg90BLscJHkxR5vsCuCd/F
	Kifbc0lv0XrZxn9yPVgJ7DjRPZxaUw1DnNrzyzvQqxXb6kofRgslKIkRn2UQLw3RrVtD
	83CtZBjwNqnNe+x9VWeUDEfD25gxR3YIacXYk1EUykcU2FdAXmDhGjwCIUN8bV7FIlBs
	lctXRWCuMARfDSLn3HJpVMlbE7wv14D3RAmfC2SzlhbYDIkFdMgcK+S2+rTJyD1XMBKs
	xnQA==
X-Gm-Message-State: APjAAAXBlhpebOEUJem05anHP2Btlh/1JsfmDTY7UWCNdSv+zLrIVMcX
	6jLZX2j4IR//7GD4Zuwwh8sg96/P
X-Google-Smtp-Source: APXvYqyefWHyLyMMhLLS5J4NS6JZdO8HqWmuUVarN1e0wYZBdoDFgUhjDuciaSEoj1QAY6HyqFQm1Q==
X-Received: by 2002:a17:90a:cc07:: with SMTP id
	b7mr33341753pju.135.1574007300001; 
	Sun, 17 Nov 2019 08:15:00 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:a049:e40e:fb9e:4d3d?
	([2601:202:4180:a5c0:a049:e40e:fb9e:4d3d])
	by smtp.gmail.com with ESMTPSA id
	i5sm16923274pfo.52.2019.11.17.08.14.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Nov 2019 08:14:59 -0800 (PST)
To: Adrian Bunk <bunk@stusta.de>
References: <20191113081914.28778-1-bunk@stusta.de>
	<02d2657c-0beb-eeb1-ca00-3add30515f9c@intel.com>
	<20191114125101.GB13971@localhost>
	<cc75af7e-6229-44d0-5d30-d74a8ba11576@gmail.com>
	<20191115214605.GA17923@localhost>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <f1fd7ccf-e5c0-ca95-0390-d6fef323686d@gmail.com>
Date: Sun, 17 Nov 2019 08:14:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191115214605.GA17923@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bind: Whitelist CVE-2019-6470
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
X-List-Received-Date: Sun, 17 Nov 2019 16:15:01 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/15/19 1:46 PM, Adrian Bunk wrote:
> On Thu, Nov 14, 2019 at 07:18:28AM -0800, akuster808 wrote:
>>
>> On 11/14/19 4:51 AM, Adrian Bunk wrote:
>>> On Thu, Nov 14, 2019 at 12:04:40PM +0000, Ross Burton wrote:
>>>> On 13/11/2019 08:19, Adrian Bunk wrote:
>>>>> +# Affects: Builds of dhcpd versions prior to version 4.4.1 when using BIND versions 9.11.2 or later
>>>>> +CVE_CHECK_WHITELIST += "CVE-2019-6470"
>>>> Can you be a bit more explicit about why this is whitelisted?
>>> Something like
>>>   BIND >= 9.11.2 need dhcpd >= 4.4.1, don't report it here since
>>>   dhcpd is already recent enough.
>> Actual. checking isc dhcp sources, it appears the fix is sitting in
>> master and has not been merged to any of the stable branches. I have not
>> had the time to unpack and check in an OE env ti validate that.
>>
>> Have you done that?
> At what commit are you looking?
https://source.isc.org/cgi-bin/gitweb.cgi?p=dhcp.git;a=commit;h=abacf8ad0d8844685e5cd76645a34ef2b8da3253

An like I said "it appears" and I alway verify with what sources get
unpacked. I finally got around to it doing that this morning and the
dhcp does have this fix.

-armin
>
> rt46719 was merged in 2017, actually before 4.4.0.
>
>> - Armin
> cu
> Adrian
>


