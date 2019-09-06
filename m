Return-Path: <sean@geanix.com>
X-Greylist: delayed 484 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 06 Sep 2019 05:59:10 UTC
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id 068757F308
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 05:59:10 +0000 (UTC)
Received: from [192.168.100.95] (unknown [95.138.208.137])
	by first.geanix.com (Postfix) with ESMTPSA id 1532563709;
	Fri,  6 Sep 2019 05:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1567749049; bh=Y/MFUBqJ+g/cbvkCM5OvHqIGqYnxCc6s53n5fqNP8FM=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=HTdruNIhrkPbEsBm4xSlbDIptN3lqrvUiR+hC8vUZENEnflYnj8SYBwT0W7TuMkS9
	oYsKGFO62m42fKVtMuuwJ3OSpn9arQJH+FefTq83zD/3ciUxjPzxnFhN4KJcuihSg1
	e03iP3Btmg3R2Wkx07yNbM3Bk8MZK554t/QeSNyCDvF41poW60Q/FQXyXLf6/SeMtN
	eEpBHePHlNHASd7BY/Kb4eBn15lNZTWPnDpj69RLlhgHddCiDjwHPUUFpuaLG0jWxo
	yKIq/2M7fU8PGFseyzuIccY7WPGDLiofDsHCJzVtWwZCkTLOcHoab76sVDiIjjNC3k
	o6RW7iiB9Wr9g==
To: Khem Raj <raj.khem@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Armin Kuster <akuster808@gmail.com>
References: <20190831142252.7204-1-raj.khem@gmail.com>
	<CAMKF1spmWGzRPyih6uZsDmZj4Rwb0s_uwLOaDJuVGxyvtbS-jw@mail.gmail.com>
From: Sean Nyekjaer <sean@geanix.com>
Message-ID: <540dfb8b-f256-3983-a61e-ca4cc833c6d5@geanix.com>
Date: Fri, 6 Sep 2019 07:50:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spmWGzRPyih6uZsDmZj4Rwb0s_uwLOaDJuVGxyvtbS-jw@mail.gmail.com>
X-Spam-Status: No, score=-3.1 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on 77834cc0481d
Subject: Re: [PATCH] libgpg-error: Fix build with gawk 5.x
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
X-List-Received-Date: Fri, 06 Sep 2019 05:59:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit



On 04/09/2019 01.50, Khem Raj wrote:
> Can we cherry-pick this patch to warrior and thud, please ?

Hi

For thud that uses a older version af libgpg-error, and the patch 
doesn't apply :-)
Should I update the patch for thud and resend?

/Sean

