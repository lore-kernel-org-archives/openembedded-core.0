Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7759973AA9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 02:50:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2B2ofqX007102
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Mar 2015 19:50:41 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Mar 2015 19:50:41 -0700
Message-ID: <54FFAD7F.3070706@windriver.com>
Date: Wed, 11 Mar 2015 10:50:39 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1425979509.git.liezhi.yang@windriver.com>
	<30f590c7e3d62ff1adb5d6b14fe0dca71f555f5f.1425979509.git.liezhi.yang@windriver.com>
	<CAMKF1sqgaHnXqynr2rEihsJ62QPnUyTw8q07-YihWA=3kUyZ=Q@mail.gmail.com>
	<54FFA2E4.5080500@windriver.com>
	<CAMKF1sq2BnBr_cdVJOngc5Ltmsiv2pzd7aFQFpE8cn7WgVtWwA@mail.gmail.com>
In-Reply-To: <CAMKF1sq2BnBr_cdVJOngc5Ltmsiv2pzd7aFQFpE8cn7WgVtWwA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] btrfs-tools: workaround DEBUG_BUILD for arm
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
X-List-Received-Date: Wed, 11 Mar 2015 02:50:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/11/2015 10:12 AM, Khem Raj wrote:
> On Tue, Mar 10, 2015 at 7:05 PM, Robert Yang <liezhi.yang@windriver.com> wrote:
>>      [CC]     btrfs-show-super.o
>> {standard input}: Assembler messages:
>> {standard input}:3368: Error: invalid operands (.text and *UND* sections)
>> for `-'
>> {standard input}:3374: Error: invalid operands (.text and *UND* sections)
>> for `-'
>>      [AR]     libbtrfs.a
>
> I meant detailed. use V=1

Thanks, here it is:

|     [CC]     cmds-fi-disk_usage.o
| arm-poky-linux-gnueabi-gcc  -march=armv5e -marm  -mthumb-interwork 
--sysroot=/buildarea/lyang1/test_w5/tmp/sysroots/qemuarm -Wall 
-D_FILE_OFFSET_BITS=64 -DBTRFS_FLAT_INCLUDES -D_XOPEN_SOURCE=700 -D_GNU_SOURCE 
-fno-strict-aliasing -fPIC -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2  -O 
-fno-omit-frame-pointer -g -feliminate-unused-debug-types -pipe -c 
cmds-fi-disk_usage.c
| {standard input}: Assembler messages:
| {standard input}:3383: Error: invalid operands (.text and *UND* sections) for `-'
| {standard input}:3389: Error: invalid operands (.text and *UND* sections) for `-'
| make: *** [cmds-fi-disk_usage.o] Error 1
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.

// Robert


>
>

