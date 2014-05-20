Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F1D1E60167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 May 2014 01:56:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4K1uEdb024639
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 May 2014 18:56:14 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Mon, 19 May 2014 18:56:14 -0700
Message-ID: <537AB65D.2030104@windriver.com>
Date: Tue, 20 May 2014 09:56:45 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1400486523.git.Qi.Chen@windriver.com>
	<3ca9244054e803966bbe4cccf29a1636b675a20d.1400486523.git.Qi.Chen@windriver.com>
	<CAMKF1spDjGZ2mBAQSXQsySNZJ-anqw-zmPOWCtSb+PYdVS+4xQ@mail.gmail.com>
In-Reply-To: <CAMKF1spDjGZ2mBAQSXQsySNZJ-anqw-zmPOWCtSb+PYdVS+4xQ@mail.gmail.com>
X-Originating-IP: [128.224.162.187]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] runqemu-internal: add "console=ttyS0" to ramfs image kernel parameters
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
X-List-Received-Date: Tue, 20 May 2014 01:56:17 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/20/2014 05:11 AM, Khem Raj wrote:
> On Mon, May 19, 2014 at 1:03 AM, Chen Qi <Qi.Chen@windriver.com> wrote:
>> +    KERNCMDLINE="root=/dev/ram0 console=ttyS0 debugshell"
> is this valid for all kind of qemu machines ?
>
>

I think so.
Notice in runqemu scripts, if '-nographic' is supplied to the qemu 
command, then 'console=ttyS0' is supplied to the '-append' option. This 
is the behaviour for the 'nographic' parameter for the 'runqemu' 
command. The exception is the case of starting a ramfs image. And this 
patch fixes this.

Thanks,
Chen Qi

