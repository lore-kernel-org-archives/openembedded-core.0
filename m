Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 1889665CC7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Sep 2018 01:39:51 +0000 (UTC)
Received: from [192.168.0.114] (cpe-174-109-247-98.nc.res.rr.com
	[174.109.247.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D4A012157C;
	Sat, 22 Sep 2018 01:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1537580393;
	bh=n/6U8ek8VIGFune93DF1uWTcXGrsggdkM6ZIs1fybsA=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=uTwWvVRV9CwwqCUf162ngY83H1WTWEykcu0jUvEiXq6ERNvmDtYCz81EB/C5npuNf
	vTeXMydwAjLgbSke5zRbBL3yp4JQn6tPG7RUEiBdELNe3KBXK3xda9YY3BN1HSJpQU
	6+BeVwh+kUdhFf+rdNfB0azhv8blFtt90x/H5tmg=
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20180921221553.23399-1-okaya@kernel.org>
	<20180921223301.29310.35097@do.openembedded.org>
	<4c603f5b-d4b3-0a1d-42a5-4ed594953788@kernel.org>
	<0a3643b6280d453e860ed5a727ec1720@XBOX02.axis.com>
From: Sinan Kaya <okaya@kernel.org>
Message-ID: <bdf064ff-c299-5b20-57b9-9ba76e14b081@kernel.org>
Date: Fri, 21 Sep 2018 21:39:51 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <0a3643b6280d453e860ed5a727ec1720@XBOX02.axis.com>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJbdjFdIGJ1c3lib3g6IENWRS0yMDE3LTE1ODc0Li4uIiBhbmQgMiBtb3Jl?=
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
X-List-Received-Date: Sat, 22 Sep 2018 01:39:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/21/2018 8:35 PM, Peter Kjellerstedt wrote:
>> the original patch doesn't have a signed-off. What's the policy?
> You should add a Signed-off-by with your own name to the patches.
> 

thanks, let me try this one more time.

