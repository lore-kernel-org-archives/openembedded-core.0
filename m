Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4EE9B771EF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 17:36:07 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id z8so64628234ige.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Feb 2016 09:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=YACICMIkxl/7LZqVI0PUFI3Govf2drg4KNKzrMswJu8=;
	b=MDZKV3wZjnsTG8yf13kXkEJjOl0Z/0Xx48aXCoeQpfZVyt21wj6FC1onuAhdWy+U7E
	JyKf3gk7qGU5vc6JN1f01eUhjFCVj2vl0Dit+SLL0WB57gl28+oO7yIftFbHCJYT1Keg
	Fluc1miu+RhFI0dhspivCTcdrTIvxo6QQcuqFx1h18Qc/XGLPGElOy1wnE8uoDgzIId9
	e8K2yZaL9jwB3lRmWyC2jLk50Vpf0yPvJ5Naon1XipsQDOnhRNxbWyQeMU5kpWnnJd85
	BwZNCe3S4gLGG1/vZrNwZ0dxtGS7uevaeAkxHON7OIgcwGn0+fT7GL95ZsvV/rkG9UDq
	swNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=YACICMIkxl/7LZqVI0PUFI3Govf2drg4KNKzrMswJu8=;
	b=LYYgktZWBhwObS2dz06lTIa8gIOP4lxXkO368SPL2Zknihf5ZDa7BLVeQWC3NJFctK
	jql7CCeB9vteiYKQ6GJlqn+JzkKt3KOvh0/lcgI15rjY0v5PQiLo1F5ijoCRV00n041m
	Ma5LhL+s48W6zvV8MaaDCN6qIe/xrRXyyklhitq+OFH+h7euSXTt0b0udRSZS5q48FrD
	VIvnRvyKDrzfJfAUtGQGwxgQ7mAUmM+4Er6MCOvEaHgzdEregQufaiqKyxv0n5nk3A5z
	xc63uTwtomNkx32aCpuP/VH7hxwCFP5ycWoCX2nfi8N8kx6xkS3x6Wekc52Jqy2FOeGi
	qbJQ==
X-Gm-Message-State: AD7BkJIMD5RMOPyNfcnVruCumFNukzHdpvb2tW8YkpdfisgZKdPcKfspAe4aQjU+d+GiUQ==
X-Received: by 10.50.55.104 with SMTP id r8mr6949821igp.5.1456680968663;
	Sun, 28 Feb 2016 09:36:08 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	l6sm5358679igv.10.2016.02.28.09.36.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 28 Feb 2016 09:36:08 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	brendan.le.foll@intel.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1456412817-12106-1-git-send-email-brendan.le.foll@intel.com>
	<56D24503.9010803@gmail.com>
	<1456648351.11498.130.camel@linuxfoundation.org>
	<56D329B5.5090101@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56D33008.9010306@gmail.com>
Date: Sun, 28 Feb 2016 12:36:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56D329B5.5090101@gmail.com>
Subject: Re: [PATCH] npm.bbclass: Add npm class to match fetcher
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
X-List-Received-Date: Sun, 28 Feb 2016 17:36:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/28/16 12:09, Trevor Woerner wrote:
> On 02/28/16 03:32, Richard Purdie wrote:
>> On Sat, 2016-02-27 at 19:53 -0500, Trevor Woerner wrote:
>>> On 02/25/16 10:06, brendan.le.foll@intel.com wrote:
>>>> npm class supports the npm fetcher, helping doing the basic
>>>> compile/install
>>>> stages of an npm package
>>> Any chance you might have an npm recipe example? Maybe something like
>>> express?
>> Not express but there are some in:
>>
>> https://github.com/arfoll/meta-brendan-nodepkgs/tree/master/recipes-node
>
> Thanks!
>
> I guess I don't have enough "plumbing" quite yet. I have all the 
> master branches of everything I need and I cherry picked Brendan's 
> npm.bbclass but I still get:

Ah sorry. I needed bitbake's master-next.

