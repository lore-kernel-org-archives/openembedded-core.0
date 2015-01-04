Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0678172200
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jan 2015 02:38:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t042cn8l029305
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Sat, 3 Jan 2015 18:38:49 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Sat, 3 Jan 2015 18:38:49 -0800
Message-ID: <54A8A7B6.9000600@windriver.com>
Date: Sun, 4 Jan 2015 10:38:46 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1418885577.git.kai.kang@windriver.com>
	<753fbc2e1bfa852129865ba40212607cefc6ad09.1418885581.git.kai.kang@windriver.com>
	<B9A5BF78-4EBF-4BDA-BAFC-F32B8E358782@gmail.com>
In-Reply-To: <B9A5BF78-4EBF-4BDA-BAFC-F32B8E358782@gmail.com>
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 13/19] runqemu: add qemuarm64 support.
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
X-List-Received-Date: Sun, 04 Jan 2015 02:38:54 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年01月01日 09:27, Khem Raj wrote:
>> On Dec 18, 2014, at 12:51 AM, Kai Kang <kai.kang@windriver.com> wrote:
>>
>> +        "qemuarm64")
>> +            mem_size=128
>> +            ;;
> there is a limit on 32bit arm but is it same for 64bit as well ?
> if not can we use 512 or 256 atleast
>

I updated to 512 already. Thanks.


-- 
Regards,
Neil | Kai Kang


