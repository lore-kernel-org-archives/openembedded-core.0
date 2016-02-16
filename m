Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2AD08600B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 15:55:10 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id fl4so93537879pad.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 07:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=ivlK5JgDnT16PRK4l69P9MhaQla4w4ajd3qcpkcE8Vk=;
	b=kGvLfKqt6j7DJ0Jsel0O0lVhIbZl4RX9oZiLPxPYCjTQMho5Or+Jcs7KBiG//PKVUs
	K87Q/Rfqnwk91kPYIUXY1FEVGkj7pgJpKwLleWQM9R0+J1MmN1egP0dHXwel298pSGSC
	kBhHjW6T/FtrZ/TeLo+m3aVfGmB/ajlECcqTDEij65GF7KOGBJV1JeFpgM8pMTeIO0mv
	opkgHQVqQIC6hcl1xBMmsZaG53z52Uy+V5F9IlIBs1P1BkZhnekY4FSvnVSUYr25+nyJ
	lFfEZk2FajPr1sr3Q7OjgFkW5lp7nd3TkmYOlZHBZUbq7dM8On7wQP1q9tZu2t64EOVt
	EBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ivlK5JgDnT16PRK4l69P9MhaQla4w4ajd3qcpkcE8Vk=;
	b=j9lnD8Ek5fHP2ueJPwYUHunHz9JJasRlPeYdBB4ac+xunLvFnnlr7g7UKyJU9RFKVh
	N0g4sEgi4rU6ktpBG6fz+Ycnvmsh75KB75f3FKgHH1rXIRQtoXiVTeM5TTuTqEJkt5Wz
	zIl5s+aMPWfRtJy/PF+9Ptptgwcszg6/x6x+mE4C6Vdt36h3+RpSpO5+pQsuNwCsaqSv
	ZrFBDdJJkhglYrApwCmwsJ8dmMUiz86z7iiXWaCUvUDk/W9BSeftL0izp6UEjRJGA/Ns
	UtsY2A62D4OdXICkeLA+7SrC0MHjP3SrMCH1G3r+AHt07hsb3KHe+SnJvI23xC6oYAsK
	o8Ig==
X-Gm-Message-State: AG10YOTs0sd3EDeu1L9b5aH9z2MRT2YOI4bzCA3wjlnT3vmugMUvPX6CF2TVv0iK8BDRYg==
X-Received: by 10.66.233.131 with SMTP id tw3mr32357401pac.89.1455638111529;
	Tue, 16 Feb 2016 07:55:11 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:2108:9bd6:551e:d5c0?
	([2601:202:4000:1239:2108:9bd6:551e:d5c0])
	by smtp.googlemail.com with ESMTPSA id
	wh9sm46801321pab.8.2016.02.16.07.55.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Feb 2016 07:55:10 -0800 (PST)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
	<6ebf64ba55b2abcb17cfaf487d412a7072d9034b.1455107972.git.alexander.kanavin@linux.intel.com>
	<56BCDC10.8050901@gmail.com> <56C33375.4040200@linux.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <56C3465B.7020702@gmail.com>
Date: Tue, 16 Feb 2016 07:55:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <56C33375.4040200@linux.intel.com>
Subject: Re: [PATCH 6/7] webkitgtk: update to 2.10.7
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
X-List-Received-Date: Tue, 16 Feb 2016 15:55:11 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 02/16/2016 06:34 AM, Alexander Kanavin wrote:
> On 02/11/2016 09:08 PM, akuster808 wrote:
>> this update includes:
>>
>>
>> CVE-2015-7096
>>      Versions affected: WebKitGTK+ before 2.10.5.
>>
>> CVE-2015-7098
>>      Versions affected: WebKitGTK+ before 2.10.5.
>>
>>
>> http://webkitgtk.org/security.html
> 
> Yes, which means that jethro (which has 2.8.5) needs the same update.

there is a bug open for that 8877. there are a huge number of CVE's that
need fixing.

- armin
> 
> Generally, this manual check for vulnerabilities is error-prone and
> doesn't scale. We really should automate cve checks (using
> cve-check-tool or something similar) when doing package builds, I'll try
> to look if it's feasible. There's been an open bug for a long time:
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7515
> 
> 
> Alex

