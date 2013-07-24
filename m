Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7781C605F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 06:15:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6O6FFAX029495
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Jul 2013 23:15:15 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 23 Jul 2013 23:15:15 -0700
Message-ID: <51EF70F6.6060800@windriver.com>
Date: Wed, 24 Jul 2013 14:15:18 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1374643300.git.rongqing.li@windriver.com>
	<947336a1ef2b936328ba6fcf519d55a4eda7085d.1374643300.git.rongqing.li@windriver.com>
	<8651FFE5-8500-4151-A4DF-BE780516C6CC@gmail.com>
In-Reply-To: <8651FFE5-8500-4151-A4DF-BE780516C6CC@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: ignore qemu output, and check its return code
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
X-List-Received-Date: Wed, 24 Jul 2013 06:15:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/24/2013 01:34 PM, Khem Raj wrote:
>
> On Jul 23, 2013, at 10:24 PM, <rongqing.li@windriver.com> wrote:
>
>> From: "Roy.Li" <rongqing.li@windriver.com>
>>
>> qemu prints errors sometime, but it works well, the error information
>> can be captured by rpm, and lead to rpm failure. like:
>>
>> 	$export D=/tmp/rootfs;.../usr/bin/qemu-i386 -L $D \
>> 		-E LD_LIBRARY_PATH=$D/usr/lib:$D/lib $D/bin/udevadm hwdb --update --root $D
>> 	qemu: Unsupported syscall: 240
>
>
> hmm this is a qemu issue and I bet qemu is segfaulting
> This should be fixed. Can you try porting
>

qemu is not segfaulting, except error message, it returns 0,
and udevadm hwdb finished its task.

> http://lists.gnu.org/archive/html/qemu-devel/2010-02/msg00870.html
>

why was this patch be not merged, it was submitted on 02/2010


-Roy
> To qemu please ?
>
> Then you won't need this patch.
>
>
>

-- 
Best Reagrds,
Roy | RongQing Li

