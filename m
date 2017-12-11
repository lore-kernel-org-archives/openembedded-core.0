Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f182.google.com (mail-ot0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id B688760068
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 17:15:46 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id 103so15351665otj.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 09:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=GguETzkFd5nagCi3GtR92/B7ABW7kbDfUz2EH9eBRbc=;
	b=qfLtyBPTUlHoaUlH/hcCwDiUF0MMetXVMluROvl/ewsUJsazSTy2DaNnhMryLoNR+2
	hmLpUDX38fw2Oq+QMax4lxWT/oLs6KXvMl9h2jR5d/79Yz+sfJGHydHUCOT+V0xVs64F
	I5kJ6S9CEDfZ2t8GOejQXK+Q+lm+exnDFKttm/lacdMjIoYV81ZsLH7YuegHwN3r+y/z
	nTrGr02qUXQ5fGVakq1z/jWuognddvEb6J2FhhheYksqNsOjvekSgMZ/oYilSxSmXMpq
	egxINSieu3xR95knXXbcGOWM4fGXQCaqJ01LaZhXS3d5+/rEknq7DYKL9+IyZl24+zxB
	3qaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=GguETzkFd5nagCi3GtR92/B7ABW7kbDfUz2EH9eBRbc=;
	b=cTRr0eTkRqNR4SLklR8aMXjTJv8oDsU90Tr3XJMmXdFgr+i2YWE1j0bEX8XHG9wHCs
	XUJzFjOEtzkNYv9iRmCPKgu4iMp2k+t3oSOZ6LPrPqAp3EDErgD9bwehZPcIE4kjhJkZ
	W15NjMGXPf88vXzY8RGBq+qo9Qtwb9vG3Putprgkdx/AdoFY7fdp5Q2dmXvmzzSuyqsn
	JNa6MObgXM/kmCM/92dIZ0Yv07E/HgDDZuO+XZV9G+yfc7SMJFVhEv2hu14hiWvoQcuR
	GmAj+c0KXrs77FLG0mjZ7YelKn3vtrxVyweVO2oXjWVnP/wzkoXXaVo6SSMNLA4EklKp
	mx1g==
X-Gm-Message-State: AKGB3mI+Zur5kfZCsQvEIanpIy4W+l+9yWM+IHw7gpNqV753l9B7GyQw
	hz+Lg7dGeYIrSvbeNQaJhm61W+Su
X-Google-Smtp-Source: ACJfBotEtlSOVkI2bIDsvBkNSgR1Hw6oEb/dagFBK+mQ4UoHGaR6pn7itTLBYCnGZxZC0WXkjNabug==
X-Received: by 10.157.10.110 with SMTP id 101mr1006158otg.138.1513012547548;
	Mon, 11 Dec 2017 09:15:47 -0800 (PST)
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com.
	[209.85.218.52])
	by smtp.gmail.com with ESMTPSA id m9sm6923443otc.52.2017.12.11.09.15.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Dec 2017 09:15:46 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f52.google.com with SMTP id o64so12086300oia.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 09:15:46 -0800 (PST)
X-Received: by 10.202.83.131 with SMTP id h125mr912115oib.329.1513012545729;
	Mon, 11 Dec 2017 09:15:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Mon, 11 Dec 2017 09:15:44 -0800 (PST)
In-Reply-To: <CAJTo0LbVUE-Z84U59edVmmHu34kvNTZv+urwJAHpgBrXA96p=w@mail.gmail.com>
References: <20171211135720.38714-1-stefan@agner.ch>
	<CAJTo0LbSDm6j6yPUavimgqegidvZMQ6eY=VV2=P2oERUtU-1qA@mail.gmail.com>
	<1b5588ed9cdad157c4129eb45d2a0fe0@agner.ch>
	<CAJTo0LY5BR=kgukiW6LAjonzidsC-h0gerwxKcA-3Qqvydniuw@mail.gmail.com>
	<1513006338.9676.5.camel@gmail.com> <1513006625.9676.9.camel@gmail.com>
	<CAJTo0LbVUE-Z84U59edVmmHu34kvNTZv+urwJAHpgBrXA96p=w@mail.gmail.com>
Date: Mon, 11 Dec 2017 15:15:44 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoD9daGh83bwhLLzEW_7r+i65pH7hm4NwymD_+2LU6bMA@mail.gmail.com>
Message-ID: <CAP9ODKoD9daGh83bwhLLzEW_7r+i65pH7hm4NwymD_+2LU6bMA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH] waf.bbclass: explicitly pass libdir
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
X-List-Received-Date: Mon, 11 Dec 2017 17:15:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 11, 2017 at 3:09 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 11 December 2017 at 15:37, Joshua Watt <jpewhacker@gmail.com> wrote:
>>
>> Vanilla waf only supports --prefix, --libdir, and --bindir. Anything else
>> is a result of loading the gnu_dirs tool, which not all projects are
>> required to do.
>>
>>
>> Sorry, hit send too soo: waf (at least version 2.0) also errors out on
>> unknown options. I think the three I listed are the only ones we can do
>> generically. There might be some way to easily adding the rest if you know
>> waf is loading gnu_dirs
>
>
> One option would be for waf.bbclass to check if WAF_USES_GNU_DIRS is set
> (defaulting to 0) and pass the full set of path options automatically.

Possible. But passing the standard ones solve 99% of the issues.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

