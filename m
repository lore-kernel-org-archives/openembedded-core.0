Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id CC073789AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 06:19:58 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id w5B6JwBo013989
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Mon, 11 Jun 2018 08:19:58 +0200
Received: from [192.168.253.100] ([163.242.57.90])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id w5B6JwoE012282
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 11 Jun 2018 08:19:58 +0200
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <24e47452-9ff5-778c-5146-599589458a3f@linux.intel.com>
	<20180608140403.27855-1-andrej.valek@siemens.com>
	<CANNYZj9ecWrsg61KiAirO5YnkATOtEihRgym0iD5o1c0po5KNA@mail.gmail.com>
From: Andrej Valek <andrej.valek@siemens.com>
Openpgp: preference=signencrypt
Message-ID: <78456fb6-d8a1-c681-792a-36e78d7fb790@siemens.com>
Date: Mon, 11 Jun 2018 08:19:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj9ecWrsg61KiAirO5YnkATOtEihRgym0iD5o1c0po5KNA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] openssl-1.1: rework packaging
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
X-List-Received-Date: Mon, 11 Jun 2018 06:19:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Alex,

I have tested your branch and seems to be, that openssl is working
correctly.

We are now using original (perl) c_rehash script, but dependency to perl
is missing. Are you ok with adding runtime dependency to bin package?
Just for notice, it will install perl on target.

BR,
Andrej

On 06/08/18 17:57, Alexander Kanavin wrote:
> 2018-06-08 17:04 GMT+03:00 Andrej Valek <andrej.valek@siemens.com>:
>> The main idea is to have libssl and libcrypto in separate packages.
>> This saves space if only single library is needed and also some recipes
>> (in other layers) depend on these library packages.
>> Together with this other packages like in 1.0.x were created.
>> The only difference is that openssl 1.1 has additional package openssl-bin.
>>
>> Patch original c_rehash instead of overriding it with our own.
>> After applying patch from Debian c_rehash is working.
> 
> Can you split this in two different commits please?
> 
> Alex
> 

