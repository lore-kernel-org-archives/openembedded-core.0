Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id C25DC60103
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 16:40:18 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id b14so32633186lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 08:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=948ejiYaNVcBIsl3Q7/uEwzLZOcipWkgvpG0xL4JbM4=;
	b=0ML9jmc/KjViGj2DquK9HMilpQ0Sylu60JX9EnTcYAQ4hLzolCqybSgDL3qM85WEgy
	RJhRL3ceHH4T1Ve/Gxh0V6wHB/lpInSKkshcJ89Ib4XXRwWSSKqAvcxcDQ8/PzMThtxI
	lP5zc/Umck16pCqZBtbJaDVzkz6f3VPgg447csWr6QvQc/Oi3mp5YeZhY1gg1U3+0bbj
	p1ROKSIiw4FKEIwwUIV7j4wsH3JyPX9lRHVze9DKTDeW/99c3dj3EP9ghddiszpGgH2s
	KG7gD005RgP9QpQEMDiSUfMLiRwIpR3f0n6YIpb9I7MI/lczx3xzP6fSIQm5h/qk8024
	Hyuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=948ejiYaNVcBIsl3Q7/uEwzLZOcipWkgvpG0xL4JbM4=;
	b=LoXlRTeSmxqq6mdag3VrMbWJ8agmZnF9IGI7fKaydST6al9m6a4ODM6bMy/BL51hzt
	7P6f1Fpau/Y3A3uIz++RLwo6ln5wKjUJaqLHweJxvT9JVIO5ED6CoocbgHT6Bl7ROCGg
	3nZ+8B+QL/Y2U/Nm+bqxoriEj2QxiqXQOalNsKK1FjPuSq+CzCrFGCSgsMyjkJoqZClu
	2XSmnPn5F6FFpAoA4Iug2rBAIg2Nmk7HOTmCf3XptoPoI7f7DTVUcRrgNgqnGgInaf6/
	M2OOPHY7cTWo3M/nqUCcqNq9MBjzbD4Xi89gNnGu+W5/JZriO1omfJ02GKc4WyIQYNJN
	HFog==
X-Gm-Message-State: AKaTC01AUE/58auv6d70G8LMwpr18B5/eicSOJMYKAU+A651QKcpGXz5q2emG9/cMyCYFQ==
X-Received: by 10.25.131.144 with SMTP id f138mr1176690lfd.127.1480005619135; 
	Thu, 24 Nov 2016 08:40:19 -0800 (PST)
Received: from [192.168.1.14] ([176.111.205.58])
	by smtp.googlemail.com with ESMTPSA id
	89sm8360347lja.16.2016.11.24.08.40.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Nov 2016 08:40:18 -0800 (PST)
To: Patrick Ohly <patrick.ohly@intel.com>
References: <1479813004.3239.19.camel@intel.com>
	<6913e4bf-96dc-eefa-d214-9df5cde181b8@mender.io>
	<20161123120816.GC12545@linux.intel.com>
	<5064cacc-e724-c7b8-9631-3d961c5a29f6@mender.io>
	<20161123132229.GA13863@linux.intel.com>
	<1479916616.31880.48.camel@intel.com>
	<20161124061543.e2xpgh7zjir3oynk@pengutronix.de>
	<fa1edaed-1498-160e-2015-8b7882c04877@mender.io>
	<20161124132315.GA14497@linux.intel.com>
	<1e1a7126-15dc-33be-a863-ea93063b554f@mender.io>
	<20161124145136.GA31813@linux.intel.com>
	<1bac8afc-7037-3891-7e3a-5a590dbed9e2@opendreambox.org>
	<23608ccc-ebaa-f2a6-6b39-02121e7b4287@mender.io>
	<1480004493.6873.51.camel@intel.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <c57018f5-88c8-14bc-04c3-ec4f1a26de9b@mender.io>
Date: Thu, 24 Nov 2016 17:40:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480004493.6873.51.camel@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Contents of non-rootfs partitions
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
X-List-Received-Date: Thu, 24 Nov 2016 16:40:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 24/11/16 17:21, Patrick Ohly wrote:
> On Thu, 2016-11-24 at 16:51 +0100, Kristian Amlie wrote:
>> On 24/11/16 16:28, Andreas Oberritter wrote:
>>> Note that in a shell, "data/*" doesn't include "data/.*". So this syntax
>>> avoids the confusing rsync syntax in trade for another one. I'd prefer
>>> the rsync flavour, because "behaves like rsync" is easier to remember
>>> than "behaves like a shell glob, but differently". Confusion could be
>>> prevented with good documentation, FWIW.
>>
>> This is turning into a bit of a bikeshed discussion. I have a slight
>> preference for the glob version, because I think it's less surprising,
>> but I'm fine either way.
>>
>> I count myself and Ed in favor of glob version, Ulrich and Andreas in
>> favor of rsync version. Patrick, you wanna be tie breaker? :-)
> 
> But I said I was undecided ;-} Okay, I vote for the rsync flavor.

Rsync flavor it is then, unless anyone has strong objections!

-- 
Kristian

