Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 356FF605BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 01:30:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0L1U34Q027995
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Jan 2016 17:30:03 -0800 (PST)
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 20 Jan 2016 17:30:03 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Dengke Du
	<dengke.du@windriver.com>
References: <cover.1453281406.git.dengke.du@windriver.com>
	<2a8d19d4ef60a323c8770722ec7f60811ced53ca.1453281406.git.dengke.du@windriver.com>
	<1453282408.27999.143.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56A03499.2080703@windriver.com>
Date: Thu, 21 Jan 2016 09:30:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1453282408.27999.143.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] ncurses: drop the compatible option
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
X-List-Received-Date: Thu, 21 Jan 2016 01:30:05 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/20/2016 05:33 PM, Richard Purdie wrote:
> On Wed, 2016-01-20 at 04:30 -0500, Dengke Du wrote:
>> drop the compatible option --with-abi-version=5
>
> This says what the patch does, but not why.

I had talked with Dengke, we have upgraded ncurses to 6, so remove
--with-abi-version=5 seems better. He had tested world and sdk
build based on oe-core. He will test it based on meta-openembedded.

// Robert

>
> Why should we do this? Does any of our software depend on the v5 ABI?
> How did you test this?
>
> Cheers,
>
> Richard
>

