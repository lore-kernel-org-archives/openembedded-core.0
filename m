Return-Path: <akuster808@gmail.com>
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id BC5C262131
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 02:07:14 +0000 (UTC)
Received: by ykba77 with SMTP id a77so40607663ykb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 18:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=TOq0W9MHSriWaxYd8OyAGRDPVfc9oEVDulGD5tNEgb8=;
	b=iS5EowePMZExNzL/NgSM0orp9kw1HjU2nDms8R/2aVPJ5ZFxzPgt0Bw88due1+SsLV
	S1G1uLUxGbBvqkRj4JOtou6HiHvHDTW3FrkzIf4dkz3nohML7TrPxr1KZc38CBwJEfZ6
	FVBuZGjhR/wsACqetjt8EkNvgg7wu0vwjSEvkoh9uHXSa2mIe2medEZ8xiLh/ZIDEAa8
	/WPOpnjyGp/56pz446f7qXcL9PXFLPW1cHtg4Zo8m4fKj1F6eENwQFqWCAvi3hfCPcFH
	iDTzj3rXGbtjopQ3pHu7bGgKNY057j1/Oy7ahDgy1yTtorzX7YjQPC/DOl1vP+4kASr4
	EO0w==
X-Received: by 10.129.92.86 with SMTP id q83mr11408386ywb.239.1447812435482;
	Tue, 17 Nov 2015 18:07:15 -0800 (PST)
Received: from [10.43.100.29] ([64.2.3.194])
	by smtp.googlemail.com with ESMTPSA id
	p202sm574819ywe.44.2015.11.17.18.07.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Nov 2015 18:07:14 -0800 (PST)
To: wenzong fan <wenzong.fan@windriver.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <cover.1447659023.git.wenzong.fan@windriver.com>
	<CAJTo0Lb_4Cyt+40faL1tddvJv5PDiG4cWcN9bjfGsBRU5yfY6Q@mail.gmail.com>
	<564A8C2C.7050303@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <564BDD4D.6090000@gmail.com>
Date: Tue, 17 Nov 2015 18:07:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <564A8C2C.7050303@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] qemu: fix CVE-2015-5225, CVE-2015-6855, CVE-2015-7295
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
X-List-Received-Date: Wed, 18 Nov 2015 02:07:19 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

I believe this patch series would have been fine for Jethro.

- armin

On 11/16/2015 06:08 PM, wenzong fan wrote:
> On 11/16/2015 09:57 PM, Burton, Ross wrote:
>>
>> On 16 November 2015 at 07:32, <wenzong.fan@windriver.com
>> <mailto:wenzong.fan@windriver.com>> wrote:
>>
>>     Wenzong Fan (3):
>>        qemu: fix CVE-2015-5225
>>        qemu: fix CVE-2015-6855
>>        qemu: fix CVE-2015-7295
>>
>>
>> Master has the 2.4.0.1 upgrade now, can you rebase this series?  At
>> least 5225 is fixed there already.
> 
> Ok, I'll rebase them.
> 
> Thanks
> Wenzong
> 
>>
>> Ross

