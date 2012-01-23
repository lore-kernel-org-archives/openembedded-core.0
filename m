Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1RpOHB-0004HB-Ga
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 19:05:54 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0NHw8Bb015345
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2012 09:58:08 -0800 (PST)
Received: from [128.224.146.67] (128.224.146.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 23 Jan 2012 09:58:08 -0800
Message-ID: <4F1D9FA5.4050202@windriver.com>
Date: Mon, 23 Jan 2012 12:57:57 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: Liming Wang <liming.wang@windriver.com>
References: <1326357721-19562-1-git-send-email-liming.wang@windriver.com>
	<4F0EE404.6020002@windriver.com> <4F0FC6A6.70502@windriver.com>
In-Reply-To: <4F0FC6A6.70502@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] V2 qemuppc/kernel: replace emulation of qemuppc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jan 2012 18:05:54 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-01-13 12:52 AM, Liming Wang wrote:
> On 2012-1-12 21:45, Bruce Ashfield wrote:
>> On 12-01-12 03:42 AM, Liming Wang wrote:
>>> v2 change log:
>>> - disable CONFIG_DEVTMPFS option to avoid /dev/console
>>> pointing to serial. Otherwise, keyboard doesn't work well
>>> on X-windows.
>>
>> This looks fine to me, but can you resend it as an incremental on top
>> of:
>>
>> http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-3.0/commit/?h=meta&id=73dafd44ea875df654129b32b2877f342d5573e4
>>
>>
>> Since I pushed the core support yesterday (you won't see it in
>> your local build unless you use AUTOREV or pull in my series
>> from yesterday).
>>
>> Making it incremental will show the tweak more clearly, and I can
>> merge it directly.
>
> Is pull request is enough? BTW: I used linux-yocto-dev git tree in
> previous pull request.

While fixing another problem, I tried just taking this change
and I still had no keyboard. So I went with the console=tty option
that we discussed another time.

That at least gets keyboard working for me in the tree, and we can
revisit it at a later date.

Cheers,

Bruce

>
> The following changes since commit
> 73dafd44ea875df654129b32b2877f342d5573e4:
>
> meta/qemuppc: replace kernel config file of qemu-ppc32 with mac99
> (2012-01-06 15:09:36 -0500)
>
> are available in the git repository at:
> git://128.224.163.150/linux-yocto-3.0.git meta-qemuppc
>
> Liming Wang (1):
> meta/qemuppc: disable CONFIG_DEVTMPFS option
>
> .../cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32.cfg | 2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>
>
> Liming Wang
>
>>
>> Cheers,
>>
>> Bruce
>>
>>>
>>> The following changes since commit
>>> a8ebc77767e034c589e8041406f4282136a2219b:
>>>
>>> meta/qemu-ppc32: remove references to non-existent patches
>>> (2012-01-05 10:42:40 -0500)
>>>
>>> are available in the git repository at:
>>> git://128.224.163.150/linux-yocto-dev.git meta-qemuppc
>>>
>>> Liming Wang (1):
>>> meta/qemuppc: replace kernel config file of qemu-ppc32 with mac99
>>>
>>> .../kernel-cache/bsp/qemu-ppc32/qemu-ppc32-gfx.cfg | 11 +++++
>>> .../cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32.cfg | 44
>>> +++++++++++++++----
>>> .../cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32.scc | 1 +
>>> 3 files changed, 46 insertions(+), 10 deletions(-)
>>> create mode 100644
>>> meta/cfg/kernel-cache/bsp/qemu-ppc32/qemu-ppc32-gfx.cfg
>>>
>>
>>
>



