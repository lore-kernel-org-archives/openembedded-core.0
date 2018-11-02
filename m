Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 254E779EDB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 00:43:23 +0000 (UTC)
Received: from [192.168.0.109] (cpe-174-109-247-98.nc.res.rr.com
	[174.109.247.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0AFC22086D;
	Fri,  2 Nov 2018 00:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1541119405;
	bh=qNoXMv4luuVvUt+ddFKSDuabsiXRX4ZxorvVtCSK7IE=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=sKPQd2jWqBpi3xEquOGiJvu/cb6Rui5iWBz8YB5RsX91qc4fBekmZ6zk0IIa7dAWK
	umVlm3ufkdrXrfZR5Q3F0NsSe6ANn1m0QoIGjiW9Za1iqbDvse/hFUnLnLQgo3coSD
	x4shTYffvYCQJXtgtm5TiDsuL3x2ldKIn0qUShmc=
To: akuster808 <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
References: <20181030232815.24575-1-okaya@kernel.org>
	<47198674-85e7-c0e9-bb6c-d6ed5310a9b0@gmail.com>
From: Sinan Kaya <okaya@kernel.org>
Message-ID: <a0e706c2-86bd-7773-31e9-ae8b19b95b39@kernel.org>
Date: Thu, 1 Nov 2018 20:43:20 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <47198674-85e7-c0e9-bb6c-d6ed5310a9b0@gmail.com>
Subject: Re: [sumo] [PATCH v1] strace: fix ptest path not found
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
X-List-Received-Date: Fri, 02 Nov 2018 00:43:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/1/2018 7:48 PM, akuster808 wrote:
>> srcdir = ../../ptest0/tests
>> top_srcdir = ../../strace-4.20
> Do you know if this affects Master?

I have not tested master but I have seen the same issue there.
I looked for a solution at master before debugging this.

