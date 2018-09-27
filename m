Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 730B6793E6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 01:21:35 +0000 (UTC)
Received: from [192.168.0.106] (cpe-174-109-247-98.nc.res.rr.com
	[174.109.247.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6819821564;
	Thu, 27 Sep 2018 01:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1538011296;
	bh=rkhn9j262XSVYyi78HVHOrsoekFyF9OmF6uOt3MgKks=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=QaI+G03JHsKqk0fW2ESobldXjqmmoYMdIhQvEw+Z7GfC/EqsDdnR5fic+4j+w1rSP
	rPa/RcxBY7697VO4BicO/Lv7GR1TDpoEXLS9m3gh4SCVYfgdKe4xmQtjJqB77CH6VW
	C4vw5VgYgk2UQN53bmTQMUCDb1kVVh9ZQH1BwmyI=
To: akuster808 <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
References: <20180925171828.8655-1-okaya@kernel.org>
	<b82c079d-6763-cfe7-9791-d830a05c68c1@gmail.com>
From: Sinan Kaya <okaya@kernel.org>
Message-ID: <2bdca1b2-1bd0-a5d0-9633-6e9ec41477b6@kernel.org>
Date: Wed, 26 Sep 2018 21:21:33 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b82c079d-6763-cfe7-9791-d830a05c68c1@gmail.com>
Subject: Re: [sumo] [PATCH v1 1/2] libice: CVE-2017-2626
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
X-List-Received-Date: Thu, 27 Sep 2018 01:21:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/26/2018 9:15 PM, akuster808 wrote:
>> Affects libice < 1.0.9-8
> this fix is sitting in stable/sumo-next
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=stable/sumo-nmut&id=d726b210ef8f0f8d0607e0f53977fce653abae04

Yeah, I found out about it today.

