Return-Path: <prvs=07244f0117=mike.looijmans@topicproducts.com>
Received: from mx36-out25.antispamcloud.com (mx36-out25.antispamcloud.com
	[209.126.121.73])
	by mail.openembedded.org (Postfix) with ESMTP id 53E8A78A25
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 09:20:16 +0000 (UTC)
Received: from [37.74.225.131] (helo=TOP-EX01.TOPIC.LOCAL)
	by mx66.antispamcloud.com with esmtps (TLSv1:ECDHE-RSA-AES128-SHA:128)
	(Exim 4.89) (envelope-from <mike.looijmans@topicproducts.com>)
	id 1fb05O-0000Fo-JY; Thu, 05 Jul 2018 10:58:10 +0200
Received: from [192.168.80.121] (192.168.80.121) by webmail.topic.nl
	(192.168.10.102) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 5 Jul 2018 10:57:57 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Alex Kiernan
	<alex.kiernan@gmail.com>
References: <1530441211-30826-1-git-send-email-alex.kiernan@gmail.com>
	<6b743d05-aa53-bb1c-f96b-f604a77d2911@topic.nl>
	<CAO5Uq5QqToYKu21=eKb7esa-Otxp3epBsn6ExB33Zm0GhUSEiA@mail.gmail.com>
	<CAO5Uq5Qt9BV4gtROQrDW7+1Szs8226dPc7JnvrUszB0ZyA1LYg@mail.gmail.com>
	<536e0253544bf237adf96c6efd2c1712dda715a8.camel@linuxfoundation.org>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <d3e8ee41-54be-3620-880f-86b067b0f35d@topic.nl>
Date: Thu, 5 Jul 2018 10:57:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <536e0253544bf237adf96c6efd2c1712dda715a8.camel@linuxfoundation.org>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
X-Originating-IP: 37.74.225.131
X-AntiSpamCloud-Domain: topic.nl
X-AntiSpamCloud-Username: 37.74.225.128/28
Authentication-Results: antispamcloud.com;
	auth=pass smtp.auth=37.74.225.128/28@topic.nl
X-AntiSpamCloud-Outgoing-Class: ham
X-AntiSpamCloud-Outgoing-Evidence: Combined (0.06)
X-Recommended-Action: accept
X-Filter-ID: EX5BVjFpneJeBchSMxfU5tZzHJM4iWJ+wg64dyhvVYB602E9L7XzfQH6nu9C/Fh9KJzpNe6xgvOx
	q3u0UDjvO6qsX/DhkSAAoIci1nYlKJX7kPFR6OtZeUu8K7+wz7vt+6C+I7C/fozBoJtG1PVprPg6
	1ALCt0PTgdx+jt2SCFPDMDLEo3rRq9VfLbff55ryMJDoEYJSTqV6wh7pZ7OHJy8KfAUAPEXfVtvz
	djNI781Bpc/AiUjjK788fU1YN0ZFyMfYFLhqSYPjDFbfa8hOK/7Hrzz3S1b48+29eERTSEu+UM0y
	8vxIxHF2eSIGjGM5X2XX9bIsGDSYq5OAASmskdN/iuybv6sUYbxwwE+S8kcGhpNonruIYm5BY72s
	YolvNwE6LL76s6fPz7DjaVXLY51/2FdboZS7BNSLSDKjsjLGDghetEKbzrU+L8SoLvgNHzj0ieok
	wyjKNlAIGGlk+LCquybs+d6GQBTweXSeZTdgG2PKUKCE4BJm8T34/yxOBqGq2DjYgxBcL97+2F+Z
	6GzTlZ5vycnIQy0vHCGdiKcMWsqU1zuo0qamchj13xw4Irv3F28sfojuZI3S+Bdc3vIhS0rwyLP/
	/7UAPrUjyw5wUVIZyeB5Tm7TrM7TUt3o2OUMeHyTpNN0eXybX/w7/xQLit07pP+Rx2BRQUkWCJt7
	7TBgpLqW71pqLY2ThxhVvN9GjOhZVXRvaf4xqhyIvhGDNj35zv2DLIodwLcavgt4sD6jEzSRFHWw
	xdPqpfDtgajRYjO0qDgnL4c1yStAlG7+Q5eNliMp95hE8N+XjEDJH4rKHT/5Ri9aKLzp0/MT0gww
	KpFFjW/+Wgx1zwjeLCIcqxjcZmMnQDmuRz4d87EkBaCyhz42Tu0AXCY1GxbfUV8ShebT8U8Xw9HT
	DfreWSsXKah72eEiDMyDPc/JPN9yPmy5aZrj8CJOJ6u7Jp55+qfNUE2gzmMMoHs5TsOf48s69HmG
	te1pJ3RcDpDQmZDubushWaJcouvTRIGL48/4ifnL+9wgoTj4ygNPw1XfN8Hu637FzykJGLTdrh3X
	JJBRG2VUuapnQnnYdAzeqswGsCQBjWl77ebEvIksGltwvA==
X-Report-Abuse-To: spam@quarantine2.antispamcloud.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssh: Add dependency on ssh for sftp
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
X-List-Received-Date: Thu, 05 Jul 2018 09:20:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: nl
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 02-07-18 23:13, Richard Purdie wrote:
> On Mon, 2018-07-02 at 18:44 +0100, Alex Kiernan wrote:
>> On Mon, Jul 2, 2018 at 4:06 PM Alex Kiernan <alex.kiernan@gmail.com>
>> wrote:
>>>
>>> On Mon, Jul 2, 2018 at 3:55 PM Mike Looijmans <mike.looijmans@topic
>>> .nl> wrote:
>>>>
>>>> The sftp-server runs fine using dropbear as SSH backend, I'd
>>>> expect the same
>>>> to be true for the client. Isn't that the case, and will the sftp
>>>> client only
>>>> work with openssh's ssh?
>>>>
>>>
>>> Interesting question... I hadn't realised dropbear didn't have an
>>> sftp
>>> client, but it's clearly a supported combination:
>>>
>>> https://github.com/mkj/dropbear/blob/1656db9e58e7e8188e4ca27ae4892b
>>> 14949c56a5/dbclient.1#L159
>>>
>>> I'll amend the patch so it depends on ssh not ${PN}-ssh since both
>>> dropbear and openssh provide that.
>>>
>>
>> Hmm... only that gets you this warning:
>>
>> NOTE: Multiple providers are available for runtime ssh (dropbear,
>> openssh)
>> Consider defining a PREFERRED_RPROVIDER entry to match ssh
>>
>> If you've not set it, which feels like a pretty poor upgrade
>> experience; I'm not sure how best to deal with that.
>=20
> This is not an easy problem to solve. This is why we have the horrible
> VIRTUAL-RUNTIME_* variables, I wish there were a better way...
>=20
> Basically, bitbake has to have some idea which one to build, letting
> the package manager decide at do_rootfs time isn't really good enough
> for deterministic builds.

The dropbear/ssh choice seems to be one that is being postponed until image=
=20
creation time. There's an IMAGE_FEATURE that appears to make the choice:
IMAGE_FEATURES +=3D "ssh-server-dropbear"

Since you're building openssh already, there's no need to instruct bitbake =
to=20
build more at package compile time.

Using RDEPENDS and PREFERRED_RPROVIDER or VIRTUAL-RUNTIME will 'break' a lo=
t=20
of existing setups by installing the wrong ssh client without the engineer=
=20
knowing about it. And it will also make it impossible to build two images w=
ith=20
different choices. I can imaging you'd want to have a small size "recover"=
=20
image with dropbear and a large size "full" image with openssh in the same=
=20
build for the same machine and distro.

M.


Kind regards,

Mike Looijmans
System Expert

TOPIC Products
Materiaalweg 4, NL-5681 RJ Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail




