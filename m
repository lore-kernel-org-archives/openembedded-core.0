Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2071C6BA7C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 02:26:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7S2Q3sV005017
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Aug 2013 19:26:03 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Tue, 27 Aug 2013 19:26:02 -0700
Message-ID: <521D5FAA.3000503@windriver.com>
Date: Wed, 28 Aug 2013 10:25:46 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1377587203.git.Qi.Chen@windriver.com>
	<f1e2a5ea20351fbe0e1e0552462752a5f5c70330.1377587203.git.Qi.Chen@windriver.com>
	<1377598192.32502.3.camel@ted>
In-Reply-To: <1377598192.32502.3.camel@ted>
X-Originating-IP: [128.224.162.233]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] runqemu-internal: change the lock acquire/release logic
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
X-List-Received-Date: Wed, 28 Aug 2013 02:26:06 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/27/2013 06:09 PM, Richard Purdie wrote:
> On Tue, 2013-08-27 at 15:08 +0800, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Checking whether the lock file exists is sufficient for runqemu.
>> The contents of the lock file is not important.
> What happens if the runqemu script crashes and leaves the lockfile
> around? Why are we removing perfectly functional code?
>
> Cheers,
>
> Richard
>
>
>
>

Yes. You're right.
I'll drop this patch and send out a V2.

Best Regards,
Chen Qi

