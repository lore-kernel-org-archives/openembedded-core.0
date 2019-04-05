Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id 89B2C7D5C8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 16:11:29 +0000 (UTC)
Received: (qmail 8170 invoked by uid 1003); 5 Apr 2019 16:11:30 -0000
Received: from unknown (HELO ?192.168.11.100?)
	(philip@opensdr.com@73.152.143.112)
	by mail.geekisp.com with (ECDHE-RSA-AES128-GCM-SHA256 encrypted) SMTP;
	5 Apr 2019 16:11:30 -0000
To: akuster808 <akuster808@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
References: <1550192184-13460-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<1550192184-13460-2-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<679c61e2-f179-c986-b6ca-b69b95b5e22a@balister.org>
	<BYAPR02MB6005274C95E7FE6ACA65292DB97C0@BYAPR02MB6005.namprd02.prod.outlook.com>
	<6fe6cbadaf29e01975ec71a1b005d2fdb7885484.camel@linuxfoundation.org>
	<BYAPR02MB6005A0C02E838863D370C7B4B97E0@BYAPR02MB6005.namprd02.prod.outlook.com>
	<853fdac8bdfc6fc7222fce906172b08852a4eed3.camel@linuxfoundation.org>
	<2fa17d30-9a97-635f-541b-89313ee63793@balister.org>
	<285f0b42-00a6-c891-86f6-a83fabe326f1@gmail.com>
From: Philip Balister <philip@balister.org>
Openpgp: preference=signencrypt
Autocrypt: addr=philip@balister.org; prefer-encrypt=mutual; keydata=
	xsBNBE6PN4EBCADXwOSVOvTrJ370tH2RmiR22OuCBcKfnKTLztyV5zA0veDB1kmrIajh+sJe
	HWNqsib0v19S3wdrvqzKrztSfNAgUctvkAuTOloU81dmbAjDSge6nFxjzIIz6XjNvmP5xl9J
	rstPm4i4dhAs5436xf4Bh0vn3C/Bp4fKwXBSW/Xto7vuiuSK03ojon3F8O2WNEmKxHyubFP1
	2tNvXOp/PeAR4LTnYq6fdAAofvbpbPDBg8qICe6j1UXaIyU93IbW+bJp1RFbeakWxiTw+eQ2
	fVjG5XnubNX0YBlmjHDJhjeqV1uwkImNHlZknecLjT7g37vIMwz+PTfPIhmIGffzqtHlABEB
	AAHNJVBoaWxpcCBCYWxpc3RlciA8cGhpbGlwQGJhbGlzdGVyLm9yZz7CwH4EEwECACgCGyMG
	CwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJYM1D9BQkRKOdqAAoJEMDJd4rr0merDX4H/3Pr
	nYKDnml7LRiikoOTFJb4r7ub04skrkGI2DAYvRUPH110KXaan84Qo2Yl4r/ma15Lpqx+cdPR
	3KbFlSWyjgY6CMN/BclutsK4mFkoxnmhdYJvc5M2TDfZLxBPMTeQiHo0MwxUB5v81mv812bx
	YKfEOg3ndk7C/TE0Q8ZER7p6fU3ol/e0ilLyaCpd85nkEcOEI7BdBBGhKWii+Cwvv8g2ofQZ
	3wAsqQFp7PFxlEjo5Xc1QGqo7L+UlDG23QjUn33n+wZMZm9EUZFu1c1MAGZsvXiqKw8P07Mj
	yyf6h6EMVP8wME7gnkxsZkpKv04mSvKpDLIInmRW9ZlHXaJ4YxjOwE0ETo83gQEIAPs+ZC0R
	gF4blrRIiVHdkARncAxUwSUbti5Ku23dQ0iBizozh4YGucgW48gxsvJCkCc9s/4C9e3vYiCZ
	GVGC8x6Ll3vE7xwRQ/euVqJ0mXG7tNK1zAPpSgI6aooPSZCW7PBvwY8uMvzzCzP+EBd0+oA5
	uXQSEcyOJUYy4beferoHUiBjBkyNd+v2iaJf7KjAYYxJOcPvtnq/VL09hlmtCD5zghOn80rt
	LqF66BJkHmATopSWyor1qz7gmowdCkFkUJDNW7yJT1wVANqDd9P5A8vYhngwJTHsvXVftmvB
	gLiJjYuKst36G2AOHgm4ls5jRMa/k7jWue1RKM5LxzgBtLUAEQEAAcLAZQQYAQIADwIbDAUC
	WDNRbAUJESjn5AAKCRDAyXeK69Jnq1qYB/93aiBdenAuu0H/zGWEFFB14cdhDR4S4q0EbfXl
	1z9o3Irazw6WMtLe12zJ4/Xl41Mh/IH8/+AgDnigisrkKRN1TkiOGDUVnS0akkhML3ONbeFd
	ocYEwBAPDTxAaWNoyjDe/bORokSJn31cFoG6QYyzUct79npHorbaXW0zW+KC77Do53yUKQ8+
	icWpfiCMk1YzSHCr0y5NZNVxac9a0+IDzH/YBbNdJLNaMvXcuege1Qqz85pdR0P4XuCVRD2j
	ZAbcGJzZXlu9ZzpIHjtZoyF8paJRMQwzWEO3/Txksmm7K8eu8Tz2JVpjiOIj44MOTKoRGKjO
	6eUfr0u7CwnEyqiQ
Message-ID: <1fda0b3e-879f-6821-02ab-f655f0757828@balister.org>
Date: Fri, 5 Apr 2019 12:11:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <285f0b42-00a6-c891-86f6-a83fabe326f1@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel-fitimage.bbclass: Introduce a way to provide external dtb
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
X-List-Received-Date: Fri, 05 Apr 2019 16:11:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit

On 04/03/2019 10:12 PM, akuster808 wrote:
> 
> 
> On 4/3/19 10:35 AM, Philip Balister wrote:
>> I appreciate the nagging about testing, but I just did an update and
>> realized these patches never made it into master so I could request they
>> move into thud.
> Thud needs testing too, its not just a master thing.
> 
> It needs to be in warrior first ; )
> 
> Either send me the master/warrior commit ids or send a patch with the
> proper subject so its clear to me. 
> But this looks like a new feature or am I misunderstanding?

New feature maybe, or bugfix for meta-xilinx. Without these, people
using meta-xilinx may need to use thud + these changes.

meta-xilinx/thud needs these to build properly:

commit 084f4de4dbaf9821516fc0254d35f4fb04311d27
Author: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
Date:   Wed Feb 20 10:29:06 2019 -0800

    kernel-fitimage.bbclass: Introduce a way to provide external dtb

    Currently kernel-fitimage gets the dtb from KERNEL_DEVICETREE, however
    there are instances when the DTB file can be generated using other
    recipes, provide a way to include the DTB instead of inkernel device
    tree.

    Add support for external device tree during the creation of
fitimage.  If
    virtual/dtb is set using PREFERRED_PROVIDER_virtual/dtb =
"devicetree", which
    inherits the devicetree.bbclass then use the path provided in
    EXTERNAL_KERNEL_DEVICETREE else use KERNEL_DEVICETREE during
fitimage process

    Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

ommit a7d52dbffd0da95de82d910c595a6c27d9b2ad0d
Author: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
Date:   Wed Feb 20 10:29:05 2019 -0800

    devicetree.bbclass: Add virtual provider for dtb

    Add virtual provider for dtb. This class can be used to generate dtb
    from static devicetree, for reference see meta-xilinx layer
    meta-xilinx/meta-xilinx-bsp/recipes-bsp/device-tree/device-tree.bb

    By providing a virtual provider we can use it to differentiate between
    in-kernel dtb or an external one. This can be set in local.conf as
    PREFERRED_PROVIDER_virtual/dtb = "devicetree"

    Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>




> 
> - armin
>>
>> Philip
>>
>> On 02/21/2019 03:37 AM, Richard Purdie wrote:
>>> On Thu, 2019-02-21 at 03:53 +0000, Manjukumar Harthikote Matha wrote:
>>>> From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
>>>>> On Tue, 2019-02-19 at 19:34 +0000, Manjukumar Harthikote Matha
>>>>>
>>>>>>> PREFERRED_PROVIDER_virtual/dtb = "devicetree"
>>>>>>>
>>>>>> Yes, I should have added this in the commit message. I will
>>>>>> update it
>>>>>> and re-send V2
>>>>> What may also help a lot here would be some tests. This is
>>>>> currently a blackhole in
>>>>> the tests :(
>>>>>
>>>> Are there examples of having tests only for bbclass in OE-Core? 
>>> There are. See meta/lib/oeqa/selftest/cases/wic.py
>>>
>>> I appreciate wic is a tool, not a class but the examples there should
>>> help. You can trigger them with oe-selftest -r wic.
>>>
>>> Another example which is a bbclass is selftest/cases/archiver.py which
>>> does use a class inherit.
>>>
>>>> We need a recipe or create-one to inherit this class and probably add
>>>> that as a testcase. 
>>>> I am not sure how to proceed, any example would help to implement the
>>>> same
>>> See above, they show how to add small config fragments. If you do need
>>> a full recipe, then the meta-selftest layer of OE-Core should be able
>>> to help too.
>>>
>>> If you have any other questions or run into issues please do ask!
>>>
>>> Cheers,
>>>
>>> Richard
>>>
>>>
>>>
>>>
> 
> 

