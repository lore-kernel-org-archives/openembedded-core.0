Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by mail.openembedded.org (Postfix) with ESMTP id 19B5260132
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Aug 2015 15:14:30 +0000 (UTC)
Received: from [192.168.0.201] ([37.24.103.185]) by mail.gmx.com (mrgmx002)
	with ESMTPSA (Nemesis) id 0MMk99-1ZEi442t5T-008bP4 for
	<openembedded-core@lists.openembedded.org>;
	Sat, 01 Aug 2015 17:14:27 +0200
Message-ID: <55BCE143.50900@gmx.de>
Date: Sat, 01 Aug 2015 17:09:55 +0200
From: =?UTF-8?B?RG9taW5pYyBTYWNyw6k=?= <dominic.sacre@gmx.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1437553270-9514-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRQJvy1GbYp2tBJ_5fk1-yD3cGKd_6DGd=Yubx-vAL6__g@mail.gmail.com>
In-Reply-To: <CALbNGRQJvy1GbYp2tBJ_5fk1-yD3cGKd_6DGd=Yubx-vAL6__g@mail.gmail.com>
X-Provags-ID: V03:K0:k5sQQ7Gbbv/zkcz502TFKu6a14Y0jcydg+n4LmaKEYAJ2vax5Zu
	Lzl6sFH5rJQXvO2fE8eNCGYmwsfZAJcUEYN5x/WtqALj+CNrG44+Uvp7O5dz7H1/Hg5uqWC
	xdOjosRYqqWbas1C93HWXrza+ON4wRZ2MdglgPlbuhPv+W6vsO7clNHGQfJnpJn6ns9Uc1/
	6c8qS2YVODdBiYa8m4h1g==
X-UI-Out-Filterresults: notjunk:1;V01:K0:XXmWtZq66zU=:v4tF9qevXGuycndi3a5Z+X
	Wqy0/hd6YADscZTQaBn0yZzVeZHZeXZhRjek8C3OuoULIp9vVshXiKiV7RcuM8xBtDm7518DS
	AA5gwe3/o8otoFr4URuL96CIQmr4MfHZ4reNLRiDHpTg/c3cDbRnBdAmIenhKfeMW+9YL9i5R
	kdK1oK+uyk769Nenn51YS81HmIg8te1hDAUsec8cJFhZNeDY4Zb/mKQAGoF8K/ZrB/HdBp7AN
	PvUNHKKbBWYZ98+JuOvAlGusgTBzioC9ML+g+LEqgOgu+7aEUFg21WMlU1WuPL87bbF7ormAo
	PRrlxE4WFimOkpgxWU1SlnEgz4WMZi+cRdEcerNjb/jz4dje2C5PSbDr4bK4Ss3OyNYJdpI9S
	9oEQzmpCvALjHLPy6oR7BOBNqN+A74UAQpEm5aYFx0FyXYHCwcK17UyZ/VNtLbUfUy8A27G8s
	We2NStui6X/f6HwFtyhP0XAA9qQquOlXw8nN0syhc5nvbC+jUtWIKFYHic96JP2zC2adcJwCY
	mB3jeWBJWwemtPnZN+dixia7j3VhvuA3dOJTDUdj3kZCySZDB9mCDqy44nu+fXHRiz1fY/vKG
	rz90WNnMfjShIAS+2KSqCuVt0Z8YaaOijK5yKavG4GvCylDePHs1BQPc3+CdkCfhrGe5VwLBZ
	8e6NvvGo+h3mIPuufxUB5Nf0UEE1Q9ywisGpsDQH3lcHpMHmRufqqi9T86mt7nmlHKQY=
Subject: Re: [PATCH] boost: add python3 support
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
X-List-Received-Date: Sat, 01 Aug 2015 15:14:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 2015-08-01 14:14, Andreas Müller wrote:
> On Wed, Jul 22, 2015 at 10:21 AM, Andreas Müller
> <schnitzeltony@googlemail.com> wrote:
>> * Both - python/python3 - libs are build by adding 'python' to PACKAGECONFIG
>>   but are packed into separate packages
>> * Indention was wrong in __anonymous()
>>
>> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
>
> Why do I get the feeling that most non guru patches need ping? So ping

FWIW, this patch is working nicely for me. I had previously been using a
rather hackish .bbappend to build boost with python3, and this looks
like a much better solution.


Dominic

