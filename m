Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EF2E97F98C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 09:51:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0069pCJ4016147
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 6 Jan 2020 01:51:12 -0800 (PST)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 6 Jan 2020 01:51:11 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1578299099.git.liezhi.yang@windriver.com>
	<893cf00cc129d1f61f1b535b74874496e76cd7e1.1578299099.git.liezhi.yang@windriver.com>
	<670633f2ce674dbc50222743d42ff7735e5d0e3c.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <e049ed3a-5254-b8ff-c56d-871c3ec77d36@windriver.com>
Date: Mon, 6 Jan 2020 17:50:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <670633f2ce674dbc50222743d42ff7735e5d0e3c.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/1] gnupg: Read GNUPG_BINDIR from environment variables for nativesdk
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
X-List-Received-Date: Mon, 06 Jan 2020 09:51:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/6/20 5:34 PM, Richard Purdie wrote:
> On Mon, 2020-01-06 at 16:26 +0800, Robert Yang wrote:
>> There is already a relocate.patch for native which is used for
>> reading
>> GNUPG_BINDIR from environment variables, now also enable it for
>> nativesdk.
>> Otherwise, command like the following one doesn't work for nativesdk:
> 
> This is a misleading commit message as its also enabled on target in
> this patch. Do we need/want this enabled on target?

Sorry, I think no, I wrongly enabled it for target, I will send a V2.

// Robert

> 
> Cheers,
> 
> Richard
> 
> 
> 

