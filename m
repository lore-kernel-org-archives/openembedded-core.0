Return-Path: <andrei@gherzan.ro>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id F1E5D7F1BA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 17:41:51 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id i12so8679799wro.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 09:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.ro; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=AVPrq+KQU+L0cSOk5yV9/FZDQExoJBd7YeaRc6w5SFM=;
	b=aN67vwNO4ZLEbxJf3P2AJdySx4oOF0tUn0w+OcNwnmzfwDcbxpc3+rmCU02ybMtF2h
	8gLCvkAKYcqLI6nhBGr1fmUB0nwU08ak1E/0/wm013EqQnLeDGMZnToEeF3xZkn31lHV
	uah8O5ODJ0jkNp1Qp4+e5rRvpOcTkOa5IVsFykLpYrMS0jYZa9t2OYuqxRl0dHjjCsFt
	0W/wNnL0+qb1VpWAl9jXsAXH6wi7D8wQe47gdDJFtDMqd/qZldn6BiuoIZiSTUZ8DMqx
	OdsvNIIijwqIDwqXiwqhFgHAD5Il5YUaYcyNxU/A9HzvbK9MypYXq0cU2svMt/1VIQfr
	2a3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=AVPrq+KQU+L0cSOk5yV9/FZDQExoJBd7YeaRc6w5SFM=;
	b=dqR4unKWtfS86RjSTtccKEiX+oMupxChgb3PvrinlfcIEte/AbvX+2w0vJxccdENMU
	pmWT0PwCHWOCmvhJbFDwDvSfXeNLt4A0Ekw+16dvck+iQB3ZOCi8aXFYV7NuE1Ax0Jk9
	9I59cbHRhw22qhLL2lp8ZkskPxeacjXIuADDz2KFoiIfcJUJ8Rm1j4MHOgLrR6aadtl0
	JALhln4gMtOkAOhmBMwHWZxYuEEaLq9rduAzcVMDlLOgKY9Loxf98Wz33obBokxiSnyT
	eRL6T+O0MfD/SI9hJ7MAPok2xgjAP5xrqHtCE1sWNaglRizNGGUlBWv+P7IOI2j/V/y4
	DKOw==
X-Gm-Message-State: APjAAAVnkecV2qht+CapHqr5JyXuQNkkSvNvjP3PPkcNo9cROcMitD7/
	37TIvLBP/6vBRolnCZ2G9JwFzg==
X-Google-Smtp-Source: APXvYqxRkYIFTXDSu6hZ8WGp+7D3YKtRYMAMYXj1UuUINmxP7eB6MLRkxh9/3b96pE2FYhE2MFlR1A==
X-Received: by 2002:adf:fd4a:: with SMTP id h10mr17041580wrs.90.1573494112522; 
	Mon, 11 Nov 2019 09:41:52 -0800 (PST)
Received: from [192.168.17.155]
	(host81-154-22-156.range81-154.btcentralplus.com. [81.154.22.156])
	by smtp.gmail.com with ESMTPSA id
	l10sm28520564wrg.90.2019.11.11.09.41.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Nov 2019 09:41:51 -0800 (PST)
To: "Grygorii Tertychnyi (gtertych)" <gtertych@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20191101071043.16558-1-gtertych@cisco.com>
	<CAK18fxFVpCbD38Y3FK2XMfvK_+pZF2-usf1xC5P2oR5FQhQC-Q@mail.gmail.com>
	<MWHPR11MB1918D426CB1703852C320064C27F0@MWHPR11MB1918.namprd11.prod.outlook.com>
	<8903613c-b2ea-f9f1-9e68-feb5302184d7@gherzan.ro>
	<MWHPR11MB191859E56C1EFF2D300698FCC2740@MWHPR11MB1918.namprd11.prod.outlook.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Message-ID: <a3087f36-4cfd-de8d-948f-7e3c56b7cfc8@gherzan.ro>
Date: Mon, 11 Nov 2019 17:41:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB191859E56C1EFF2D300698FCC2740@MWHPR11MB1918.namprd11.prod.outlook.com>
Cc: "xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>
Subject: Re: [PATCH] archiver: avoid empty incfile in ar_recipe
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
X-List-Received-Date: Mon, 11 Nov 2019 17:41:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 11/11/2019 12:29, Grygorii Tertychnyi (gtertych) wrote:
> Hi Andrei,
> 
> From: Andrei Gherzan <andrei@gherzan.ro>
> Sent: Monday, November 11, 2019 13:18
> Subject: Re: [OE-core] [PATCH] archiver: avoid empty incfile in ar_recipe
> 
>>> Not sure I understand. Archiver class does not interpret "include" directive.
>>> It just parses text files. The regular expression looks correct:
>>>
>>> These lines:
>>>
>>> 440         elif include_re.match(line):
>>> 441             incfile = include_re.match(line).group(1)
>>>
>>> put "${...}" _string_ into "incfile" variable. So, "incfile" is not None at "this stage.
> 
>> "${...}" it's already expanded to a white-space. So in that case it
>> matches "include  ".
> 
> No. "incfile" is not expanded here, it actually contains "${...}", e.g.
> ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'perf-perl.inc', '', d)}

Give me a simple way to reproduce this.

-- 
Andrei Gherzan

