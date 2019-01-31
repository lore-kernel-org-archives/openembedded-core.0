Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id CDC817C439
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 13:19:16 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id v1-v6so2683185ljd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2019 05:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=ey1kxJ/MAqHFkzSpY9vAzzJp5iHDLOnEwEF5ku6EoyY=;
	b=0FAGQx5mosxSlz8sK9R3uQHlTDtOIQ+By/PRj/g67rVsMjdcGoQUIX3CabM4rB+co3
	G5FBMI6QUq5T46W7gzwZSLuxwrWb/gnYCR4V6mdsv2jcj1FSRweS/HZ9s4ElxRjno0AD
	nKpi/cE6P2UNwwJKeaF1cLCRYaPDIrjKmTG/vilSREQgwhp/kzJNA55UbJTO2YSrFQHW
	DLYHoFmkProyaZoHUAraScZLQwbH8h8yt+kJeQNCxslWQH/fg80i6cRMybtqFgCovc/+
	0JClQvvXcexcwQGKcQUmJn6KU29JrpCaDcUo0plmBiNdQpIJ5/Lct0qmB50Pjt2qv2R1
	EDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ey1kxJ/MAqHFkzSpY9vAzzJp5iHDLOnEwEF5ku6EoyY=;
	b=QQs9uA8zq6YPyzK+egnOL0qhYm/nABJBXcfTFGqEa4dWbE4fDUCDH/I8LrO7Vv77np
	Xlu3sjl3ghpgXQ2QuyqisjSN26vSgVxw/NS/lrvvQlDXzGCaQ1PilpMy95IAXq9ymrVQ
	hjSGA/D782UR2fiY49/VB95qGsKDHQn0mfDGB0kUqx+jrpJiX5V4uYj3F6pn1Xirl6hx
	qAioRLNAhXkSi+310Un50DK63sh/XvWv+phM+jFGJ7lLkj7TrE+e6JluEnR9d0Ecez6w
	ATXBfCWcnhXdjlqZp99OL/+Bsf44m3nqrBPJ/uGukMLe/r9nN3wkImITd0wBtLQv45BP
	mT2g==
X-Gm-Message-State: AHQUAuaIo0ohmbK5aGSNGeBplSqFWmS/3UGqQXWkxoEInqBdEkXzs90t
	atEp8Y62X5dJzZOqmuwL2KW3s5lNF9g=
X-Google-Smtp-Source: ALg8bN45AKblL0HULPK1RiN3M/pX31oO7CR9mKCRZwprVY8Gedsa6T46n3/j5a9LzNRSK40Uuzo1XA==
X-Received: by 2002:a2e:9e95:: with SMTP id
	f21-v6mr19240881ljk.128.1548940756482; 
	Thu, 31 Jan 2019 05:19:16 -0800 (PST)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	b69sm844542lfl.28.2019.01.31.05.19.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jan 2019 05:19:15 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190128205848.12834-1-jonas@norrbonn.se>
	<2acd4017b1a5bf6882bb54e2e559588b7d8cac67.camel@linuxfoundation.org>
From: Jonas Bonn <jonas@norrbonn.se>
Message-ID: <eca0ac37-bd7a-b3d9-55a9-937215963f31@norrbonn.se>
Date: Thu, 31 Jan 2019 14:19:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <2acd4017b1a5bf6882bb54e2e559588b7d8cac67.camel@linuxfoundation.org>
Subject: Re: [PATCH v4 0/6] systemd patches
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
X-List-Received-Date: Thu, 31 Jan 2019 13:19:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Richard,

On 30/01/2019 22:54, Richard Purdie wrote:
> On Mon, 2019-01-28 at 21:58 +0100, Jonas Bonn wrote:
>> Changed in v4:
>> - add patch to make systemd-firstboot a non-default option to systemd
>> to
>>    prevent unexpected prompts at runtime
> 
> There were still some failures:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/237
> 
> (steps 5c, 6c and 7c)

OK, thanks.

I looked into these failures and have a couple of comments:

i)  There are seemingly two failures here:  unable to sync time and 
unable to connect to network (by looks of things).  These are related 
because the network failure leads to the timesync failure, AFAICT.

ii)  I have seen these failures locally; however, I even get these 
failures on origin/master, i.e. without any of my systemd patches.

iii)  The failure behaviour on this end is strange:  sometimes I get 
warnings from the ethernet driver about "incomplete frames" being 
detected.  Same kernel on the same hardware with Thud doesn't produce 
these warnings (with or without the systemd patches in this series).

iv)  connman-1.36 crashes (something about Wispr despite 'wispr' being 
disabled in my connman build... it seems bits of wispr are built despite 
this) immediately after getting a DHCP address and is unable to get an 
address when it's restarted.

v)  Disabling connman altogether and things work much better. 
systemd-network can bring up the network without ethernet driver frame 
errors, strangely enough.

So with that:

a)  Does buildbot use connman, systemd-networkd, both, or something 
else?  How do I find this out?

b)  I'll poke at the patch series again once I get a working 
origin/master build so that I have sane state to work from.  The systemd 
patches work fine on Thud... I suspect the problem lies elsewhere.

c)  Are others seeing similar errors with connman?

Thanks,
/Jonas

> 
> Cheers,
> 
> Richard
> 

