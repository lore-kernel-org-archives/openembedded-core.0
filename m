Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web10.2076.1600296154171601794
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 15:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 08GMgPaf029063
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Wed, 16 Sep 2020 17:42:28 -0500
Subject: Re: [OE-core] [PATCH] oe-setup-builddir: create conf/multiconfig/ from TEMPLATECONF
To: gr embeter <grembeter@gmail.com>, Christopher Larson <kergoth@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <CAGFuAuz+8M62V2qkc5HutJZDDLXxacF2ajr-4wuZaOKqZ1i-nw@mail.gmail.com>
 <CABcZAN=LCFfzCi=RVqggOno1sxcsC=F9SEj2hDL7MQHu=SM=yQ@mail.gmail.com>
 <CAGFuAuyc3TdWx_a1EwgnvMxjXh7+Nj4w+bTrZ_yJa+KBxbEgCw@mail.gmail.com>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <661f48ab-da7a-cefd-a409-25631e7330c2@kernel.crashing.org>
Date: Wed, 16 Sep 2020 17:42:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAGFuAuyc3TdWx_a1EwgnvMxjXh7+Nj4w+bTrZ_yJa+KBxbEgCw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

In my configurations, we refernce the multiconfig directories inside of our many
layers.  I definitely don't want the copied into the conf/* directory structure,
since I don't want users modifying the prebuilt ones.

--Mark

On 9/16/20 12:08 PM, gr embeter wrote:
>> Why copy this from TEMPLATECONF when they can be supplied by any layer in your BBLAYERS?
> 
> At the stage of creating build directory I think it is logically to
> use TEMPLATECONF both for "local.conf" and "multiconfig"
> 
> 
> 
> 
> 
