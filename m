Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8BBEF60034
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 19:45:23 +0000 (UTC)
Received: by pabtp1 with SMTP id tp1so57718076pab.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 12:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=dG8Y1lSehTH5/TnzCuO4Cpx3GHBttSwkzWb14cMVbDQ=;
	b=Mzp2zFbLAludD2IqDu7lel8MtAUhfS41hAfzSjFb4O2OmyJRAHvHiANSY5tp3xD6B2
	xbjQcuDF5SSa86TqMN7UDuTeMtBkb1VLRCR6BqNLlhEwbn8Z2HE6QeI/Y5ONlEph82Oz
	HKOow3cny/G0pCEXjV6cx/7XR649kvscyoO9LKVTBCiWg2YYtxTjDIQnIaMSbVZ/IIcs
	3qkt7kv2y5NOpgC0uXNDQN7U74zhe1zjP088V1AggUnBuc7IJmGWkPiHhWR3sPjZGWMC
	4u3BhTuvfOqz9pjeyLM9vbXkpk4JPOJxRluUIKz91O6ResXTqdP9lJ/Zw0sutMe/sK2T
	yIJw==
X-Received: by 10.70.88.170 with SMTP id bh10mr1150225pdb.62.1431114325010;
	Fri, 08 May 2015 12:45:25 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:3156:7dfd:b20c:fb83?
	([2601:c:a700:3ba7:3156:7dfd:b20c:fb83])
	by mx.google.com with ESMTPSA id sc1sm5996768pac.36.2015.05.08.12.45.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 May 2015 12:45:23 -0700 (PDT)
Message-ID: <554D1251.20604@gmail.com>
Date: Fri, 08 May 2015 12:45:21 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Haris Okanovic <haris.okanovic@ni.com>, 
	openembedded-core@lists.openembedded.org
References: <1431040791-6559-1-git-send-email-haris.okanovic@ni.com>
	<554CDA9A.9050204@ni.com>
In-Reply-To: <554CDA9A.9050204@ni.com>
Subject: Re: [PATCH 1/2] glibc: CVE-2015-1472: wscanf allocates too little memory
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
X-List-Received-Date: Fri, 08 May 2015 19:45:25 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Haris,

thanks. I will stage this on my dizzy next branch.

please include [Dizzy/fido] in the subject line if a patch meant for a 
specific release. it will help route patches.
regards,
Armin

On 05/08/2015 08:47 AM, Haris Okanovic wrote:
> On 05/07/2015 06:19 PM, Haris Okanovic wrote:
>> Backport Paul Pluzhnikov's glibc patch for CVE-2015-1472:
>>
>> Under certain conditions wscanf can allocate too little memory for the
>> to-be-scanned arguments and overflow the allocated buffer.  The
>> implementation now correctly computes the required buffer size when
>> using malloc.
>>
>> https://sourceware.org/bugzilla/show_bug.cgi?id=16618
>>
>> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
>> Signed-off-by: Ken Sharp <ken.sharp@ni.com>
>> Reviewed-by: Rich Tollerton <rich.tollerton@ni.com>
>> ---
>
> Note that this patch is to apply to the Dizzy branch of
> openembedded-core (glibc 2.20). It might cleanly apply to other branches
> also using glibc 2.20, but I've only tested with Dizzy.
>
> CVE-2015-1472 is fixed in glibc 2.21 and later.
>
> Thanks,
> Haris

