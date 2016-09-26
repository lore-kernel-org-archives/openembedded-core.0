Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 053C560125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 11:14:17 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id 197so23529652wmk.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 04:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=P+RTvK0O9dLuJJAoBbMepbKRZHWM4CdFGAroJPc0/Mk=;
	b=xNjUzzrWtx70YwEFcUOOZYvY4Y7T0zF554WDonxLYVki/t5LyaObBdbbp8JXOgBKFs
	iRGddfExM3CudaIojWKmaQmFach0nck+9b7NblhIYfS96hjaZWeOKh08y4bgMJH8KmyR
	vwo34ekeaJP2vTqVNLvC4FdR8+ezAw8zTiqHzBve5m2VpE6drZ+ZAgGcgz6CPFncig0G
	u5Y866HEKxgkm8nra1RtOpGaQ+yr7MVg+hNnftb5ZyF3qH/SDabN3vKPFSvL5ZjdpIre
	NjYAZZxNop9pDKU+V0X7Ut85vI8jX84Y4/6JCBe5zU7G6aMABFAnYUKa7As8LonRJZNx
	HpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=P+RTvK0O9dLuJJAoBbMepbKRZHWM4CdFGAroJPc0/Mk=;
	b=QdpAZGBJaseXJGBf52uzcdK0doBDGuNOWbCDBcLaJE6/9r5abKmAbBY+SkR3DOI/xe
	HZN7If9JUuqj8FJTJ9MxYe98HZQvHrsDMevZONOhLC1dluKcuf/HLG1xKiMzReibQn+n
	uhioNrfUHohcqM92I+HaniWz2OOgOqINL6QY+GqJBmCjq95ENZU/OlzUVrd8MFRSLw9f
	Wtb5IB7ibCubGU42ex5tkS/IEenJP9+MdJ7+iuSo+y53ORGP5TuqK6/UrkZCdCZsWk/3
	P9Bvj4dgM6qMcZRo+EQ3fOqElvpTHP4oBAEcWL9MYcY9VQ85WN/8+y2cb5GpLO64JKPr
	4SVw==
X-Gm-Message-State: AA6/9RnFV7iSv+Cn+InKRA79RDTB2l65FZ7JEzcbfzh56yYrXtnta770DOC78gOR3cZB9Q==
X-Received: by 10.28.52.210 with SMTP id b201mr13348644wma.32.1474888458700;
	Mon, 26 Sep 2016 04:14:18 -0700 (PDT)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	17sm21722415wju.44.2016.09.26.04.13.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Sep 2016 04:13:38 -0700 (PDT)
To: =?UTF-8?Q?Maciej_Borz=c4=99cki?= <maciej.borzecki@rndity.com>
References: <9143dac0-3a7c-59a8-13f4-f97340317f70@dresearch-fe.de>
	<CAD4b0_+M4chdScOmadG3j8i61SiCuu3Xi37rbVLxMe0VQ37+2A@mail.gmail.com>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <958bd82c-4127-f749-bbbc-eb4dd6999037@dresearch-fe.de>
Date: Mon, 26 Sep 2016 13:13:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAD4b0_+M4chdScOmadG3j8i61SiCuu3Xi37rbVLxMe0VQ37+2A@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: defining default locale (LANG/LC_ALL)
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
X-List-Received-Date: Mon, 26 Sep 2016 11:14:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 26.09.2016 13:01, Maciej Borzęcki wrote:
> On Mon, Sep 26, 2016 at 12:46 PM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
>> May be this is a FAQ, but I could not find any helpful documentation.
>>
>> What is the best way to define a system wide default locale setting (LANG and LC_ALL) for OE based Angstrom style images?
> 
> Don't know about Angstrom style images, but you can always try adding
> appropriate entries to /etc/environment.

Interesting hint.

But this file is related to the pam tooling. So it has only effect on logins and not on system services. Correct?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

