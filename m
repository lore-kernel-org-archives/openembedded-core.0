Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9CB32721DF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 15:50:23 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id y13so15660985pdi.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 07:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=+FuXKMqXK1sNf+EG6s8Q0z4ff54fwV32PC2MbMzxZ3U=;
	b=A8YppCK3d8PHEfcP2cmjLSiMx+l5t3/r0BaEcaTYlN7CEhej/uU7cPRMXrA8mt8pyw
	sR/hC3Ondz9oFuorOvyVXNwDhUTA7O3+WXNyRbF2B1wPWGE2Yr5tSYWtI3xcKYnT/qH4
	m9XqXZ6agtucmd1V+RrD3Xj2PhhvExxExH/e9zEOoSmXSlg2w1rGMMb7FqSLYGrswf6m
	eeGbtKa/n90AhYlaumfHZhua3Yh6UoolTOyxLPhUAq2c9KBdbkPl2F5Pj4Uvm+g8ADkE
	POKPNPixrQckE9EQC+BJF4Y0hAWWD2HwOTB2dcYmJ6cTs7yVfgvAouNmOXdkc9s5htlb
	zDLg==
X-Received: by 10.70.50.102 with SMTP id b6mr10298231pdo.38.1417621824572;
	Wed, 03 Dec 2014 07:50:24 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:7817:c089:b413:c9c4?
	([2601:c:9380:601:7817:c089:b413:c9c4])
	by mx.google.com with ESMTPSA id
	gy10sm23366876pbd.67.2014.12.03.07.50.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Dec 2014 07:50:23 -0800 (PST)
Message-ID: <547F313D.6020603@gmail.com>
Date: Wed, 03 Dec 2014 07:50:21 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Philip Balister <philip@balister.org>, 
	Tom Zanussi <tom.zanussi@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1416585198.git.tom.zanussi@linux.intel.com>
	<547F12C2.5070700@balister.org>
In-Reply-To: <547F12C2.5070700@balister.org>
Subject: Re: [PATCH 0/6][dizzy] some wic bugfixes
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
X-List-Received-Date: Wed, 03 Dec 2014 15:50:25 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 12/03/2014 05:40 AM, Philip Balister wrote:
> On 11/21/2014 11:07 AM, Tom Zanussi wrote:
>> >From the original posting:
>>
>> This patchset fixes a couple serious wic bugs:
>>
>> [YOCTO #6863] - Wic fails to create a working image for a large file system
>> [YOCTO #6290] - Update WIC for gummiboot
>>
>> I generated core-image-sdk images for each of the wic image types and
>> was able to fsck/mount the resulting filesystems.
>>
>> These should be applied to the next dizzy point release.
>>
>> The following changes since commit e69653b01dd8ad9fda2355b8112a65c813ce7fd5:
>>
>>    tzdata: update to 2014j (2014-11-17 08:01:21 -0800)
>>
>> are available in the git repository at:
>>
>>    git://git.yoctoproject.org/poky-contrib.git tzanussi/dizzy-next
>>    http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/dizzy-next
>>
>> Tom Zanussi (6):
>>    wic: Don't allow mkfs to fail silently in partition command
>>    wic: Use overhead factor when creating partitions from rootfs
>>      directories
>
> It looks like all the patches in this request made it into dizzy, except
> the overhead factor one.

Then its not technically _all_ then ; )

Is there a reason for this?
No reason. just missed it

Can we get the
> overhead one into dizzy also?

sure.

- Armin

>
> Philip
>
>
>
>
>>    wic: Update the help text to include -D (--debug)
>>    Revert "wic: set bootimg_dir when using image-name artifacts"
>>    wic: Remove special-case bootimg_dir
>>    wic: Update bootimg-partition to use bootimg_dir
>>
>>   scripts/lib/image/engine.py                        | 42 +++++-----------------
>>   scripts/lib/image/help.py                          | 23 ++++++++----
>>   scripts/lib/wic/imager/direct.py                   |  5 +--
>>   .../lib/wic/kickstart/custom_commands/partition.py | 24 +++++++++----
>>   scripts/lib/wic/plugins/imager/direct_plugin.py    | 20 +++++------
>>   scripts/lib/wic/plugins/source/bootimg-efi.py      |  5 ++-
>>   .../lib/wic/plugins/source/bootimg-partition.py    |  9 +++--
>>   scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  3 +-
>>   scripts/lib/wic/utils/oe/misc.py                   |  1 +
>>   scripts/wic                                        | 13 +++----
>>   10 files changed, 68 insertions(+), 77 deletions(-)
>>

