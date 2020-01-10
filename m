Return-Path: <jpewhacker@gmail.com>
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
	[209.85.166.176])
	by mail.openembedded.org (Postfix) with ESMTP id 55D2D7FFE3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 22:02:20 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id c4so2987033ilo.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 14:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=Nd7rrNJx4S1rEqV9kaE7XOo1JLLzwqccvug+GHkF3WA=;
	b=rmEiKJLr67ui7/luwmXpt/czW+RfPPqGAWc6BVaN9DBYMD3hkOxinZcMCnJeT244Sd
	fGLHOECfs9QM2a37o+rZQxoLYHPPTMaDoY9opfhlz5mlI/x1ss/wi2y+MdS8OspMsmkp
	956PpFVLY/qUmOXt1DsCZ8IaoXqSOcRQjer6/F8SQ4kIVyVvdZ/oJzZGXDqGJiqFsMcI
	Mrbt/3bN/FTLh+lxNj2Ofa+c5NBheK3yEDlkcAKUPuVAm85fcUjSqkKxv+vLLpeUgyG8
	iXQqA1NxBbgV5b4KflvudXu+7dmjyqxKK+xTAucxnyI9dmtM9bsfCXR3HNvhhtUOwG5t
	4YOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Nd7rrNJx4S1rEqV9kaE7XOo1JLLzwqccvug+GHkF3WA=;
	b=AeXnKwWLE4mOhr7ZMxgnWq2t+mWNg/9Y9RoJrozE+8iTIThFEuhNWyTtjfNnSZ3GyA
	psippAReiRH7xqrTwApogkhVhlVjHijl5y7UALGtVLZt96Z7Dc2FCpUaNzfuf6g8JBSY
	K5mnzGBGiRTvGooXiImc3bIXaRq5A00nc6PT1E+wjGtuAn4G73iY0KYvoYKHAsvHK4Gc
	2+6l2GJmlaJhEOLrDEGfzMHhW5bWdS4CYUA/oogU6zEhEynUgL31gNUab/ZOeL6ldiQM
	H8333pvFR89byUcQlu4PN+kX+k8Uo/DM63DtUFN5I+8d6wYInHN8XX5z8GQtduSKPSVN
	HnSg==
X-Gm-Message-State: APjAAAUZeo3vJweDy0WXUNFb2zd94ZVVSNle9+0JIBw613EDVP+ykQSV
	lB/W3E8zU2WiFwdN56R2DfJKvCN4
X-Google-Smtp-Source: APXvYqxjoLhvkKS3DkWH6y2fzV4k4BLSNEK0+9v1oCs8PHRTP9BD6x3FA6HmJmcSGcvLvWlQhSEs0A==
X-Received: by 2002:a92:3a4b:: with SMTP id h72mr4731976ila.292.1578693740982; 
	Fri, 10 Jan 2020 14:02:20 -0800 (PST)
Received: from [10.30.196.43] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id n5sm1068475ili.28.2020.01.10.14.02.20
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 10 Jan 2020 14:02:20 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20191205222617.31872-1-pkj@axis.com>
	<df22f3c3-1f02-4ea6-3881-8ecca3ee655b@gmail.com>
	<9ebc0390e45449a0a9f9d8859e9a9f5d@XBOX03.axis.com>
Message-ID: <7ad2ef47-ddde-a281-013f-48205010a3e8@gmail.com>
Date: Fri, 10 Jan 2020 16:02:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <9ebc0390e45449a0a9f9d8859e9a9f5d@XBOX03.axis.com>
Subject: Re: [master][zeus][PATCH] cairo: Adapt license for cairo-dbg and cairo-src based on contents
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
X-List-Received-Date: Fri, 10 Jan 2020 22:02:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 1/10/20 3:58 PM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: Joshua Watt <jpewhacker@gmail.com>
>> Sent: den 10 januari 2020 16:23
>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
>> core@lists.openembedded.org
>> Subject: Re: [OE-core] [master][zeus][PATCH] cairo: Adapt license for
>> cairo-dbg and cairo-src based on contents
>>
>> On 12/5/19 4:26 PM, Peter Kjellerstedt wrote:
>>> Introduce a PACKAGECONFIG "trace" to disable cairo-trace (the only
>>> part of the code licensed as GPL-3.0, and which is normally packaged
>>> separately in cairo-perf-utils). By disabling this, we can adapt the
>>> licenses for cairo-dbg and cairo-src so that they do not include
>>> "GPLv3+" when trace is disabled and thus they can be used also when,
>>> e.g., GPL-3.0 is blacklisted in INCOMPATIBLE_LICENSE.
>> Thanks for this, it fixes a build error I was experiencing. However,
> Out of curiosity, how can it fix a build failure?

As you pointed out in the commit message, it allows image construction 
when INCOMPATIBLE_LICENSE contains "GPL-3.0" :)

>
>> when I apply this patch locally for testing, I get QA errors saying that
>> the "/usr/bin" and "/usr/lib/cairo" directories aren't part of any
>> package. It looks like these directories are empty when trace is
>> disabled and should be removed in do_install ?
> Ok, that's embarrassing. Apparently I had --disable-script in
> EXTRA_OECONF (from a local bbappend we have) when I tested without
> "trace" in PACKAGECONFIG, and apparently that causes cairo-sphinx
> not to be built and thus the /usr/bin and /usr/lib/cairo directories
> are never created.
>
> I'll send an updated patch.
>
> //Peter
>

