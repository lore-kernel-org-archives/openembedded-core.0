Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5C6C972718
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 17:04:30 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id eu11so9736935pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 09:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=MkDpkapIPv8WMDhTdePOwOVeoZ9XN9RT0gRtKvA8h/o=;
	b=afHrEloga2vzGt5STbOjk0ASSvIKkZ/fNLxFFzzR/uGKbLJParWdB8S/iWP8i1JhTy
	pMSUD7aIvHCajJ8mmftwctfnFOQ6Zn8V9xp5Alk2Gn46hYcjNE19Skc/uzEhep6mZGqP
	p+4I7Yvu8QZj7VIYrlceLKTbV/ptO83HH3mrWXLI+rwVXhae2OQ+RHTGfz8NJWtY6Md0
	H/+P+csifjP3e864fNHkkklvVRxd2qItKR4G34FPW/ggRFf1Uo6dXNWcv1bj4wYjGMYE
	kKtBmpxp/86Kg8u3cLHvZeCeb4rtYBaWHhY3LBKiu2g6X97EScrZOqNyQ/keV/d26oy+
	wucA==
X-Received: by 10.66.66.102 with SMTP id e6mr13238194pat.6.1422032671385;
	Fri, 23 Jan 2015 09:04:31 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:c86a:c1a:2910:546?
	([2601:c:a700:272f:c86a:c1a:2910:546])
	by mx.google.com with ESMTPSA id uf3sm2454704pbc.25.2015.01.23.09.04.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Jan 2015 09:04:30 -0800 (PST)
Message-ID: <54C27F1C.2070606@gmail.com>
Date: Fri, 23 Jan 2015 09:04:28 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, 
	Robert Yang <liezhi.yang@windriver.com>
References: <54C1AE00.6010402@windriver.com>
	<CAP9ODKrqNOqQ1_d7iJRAcpNQgEbeNg=Ve1SLob1m2k2xZX4DkA@mail.gmail.com>
In-Reply-To: <CAP9ODKrqNOqQ1_d7iJRAcpNQgEbeNg=Ve1SLob1m2k2xZX4DkA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] About GPLv2's native recipe
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
X-List-Received-Date: Fri, 23 Jan 2015 17:04:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 01/23/2015 04:47 AM, Otavio Salvador wrote:
> On Fri, Jan 23, 2015 at 12:12 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> We have several GPLv2 recipes such as m4-native_1.4.9.bb, while we also
>> have GPLv3's m4-native_1.4.17.bb, I think that we can remove
>> m4-native_1.4.9.bb if the target m4_1.4.9.bb builds well ?
>>
>> I'd like to remove it because we don't build the lower native version by
>> default, and we don't know whether it works or when it would fail.
>
> I second this; not tested recipes are always good to remove.
>

Speaking of not tested, what about 'BLACKLISTED' recipes? is there a 
policy regarding how long to keep them around when they are in that state?

- Armin

