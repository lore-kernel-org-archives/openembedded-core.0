Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 785186059F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 17:52:42 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id i88so16692885pfk.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2016 09:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=ouVjb+JMldYwPgE+a8jnYPfbKRHV5CV+bGBusPW2WIA=;
	b=FwjnF0QTTGgitxzJaal3KdFxZ3du16uwPE5KSJDmBOdgp9b6ciJQFdjuNeJS0ndFbS
	2+DSCcMV31FpudLUatKps5haYFDlLLD0QAw2xsrsnejEfzMGg8UgClF9JbOtGCNx5c8c
	+ujJVp/w/b8RE3d65LXhzgXneTYdJyb3y/3Oal1njUJS6+nWxhHHeFBxwrnA7kr9a7hy
	mTjrXx+7b7QchCS3jIfvMK5S6I+Vo+k8xd7l0v8d7I1JzeLd5eGB5mRdd2iW06wLX/tf
	/AZbqSMtHKk6jv7n2UzeTAjbylNA3Xn30Bqdu1yioRJ36FqcgsDPk5gfBgdxLJ5r6sIP
	LhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=ouVjb+JMldYwPgE+a8jnYPfbKRHV5CV+bGBusPW2WIA=;
	b=cSwuZ4eZnmUPXFSqsn703NP0T3LNleHrzaz3xjHYeuwSjsEt0BnTrjoyHYAkU1gcNk
	OmCMisU3xn7WjUOFDKwARk6pobnfV5bl3ANLb+8u8i/4rjMK7pTPjGV8bAfjht6o4BdQ
	XJTovScZr/4AaF3v3xL3L1WrnhO9nXVoxXm0kTfipqwJpH/CaRZ6WXwkE45U9Af2P657
	MxNdQ6EX5T3XLB1M/LfSQ4y/PnS6q85J8nv6Rck+/vkrvZOX56IQ6F/KrgVv9Vv3q9ln
	OHQoBkc5v7mnF7nDBoT9/hFfRrYsYwtofeSd2sOkaHSgMOLQL3YQN7gSUfp5pmaGlcIO
	u/cA==
X-Gm-Message-State: ABUngvd4smN/mjpi3OzJ6valX5BZkm2oqdwTb9uRCPGiiMwU2YVSDvyo8jkCrh24Cb04tw==
X-Received: by 10.99.144.65 with SMTP id a62mr12360253pge.103.1478540095509;
	Mon, 07 Nov 2016 09:34:55 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:d844:e9e6:5f6d:525])
	by smtp.gmail.com with ESMTPSA id
	y2sm41917092pff.82.2016.11.07.09.34.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Nov 2016 09:34:54 -0800 (PST)
To: Mark Hatle <mark.hatle@windriver.com>,
	Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
	openembedded-core@lists.openembedded.org
References: <20161107150135.40266-1-Zubair.Kakakhel@imgtec.com>
	<72beb05b-1399-f8c7-f258-94a7885cc188@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <1c6c09da-efbc-f4a4-8be6-8197eb94ed81@gmail.com>
Date: Mon, 7 Nov 2016 09:34:53 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <72beb05b-1399-f8c7-f258-94a7885cc188@windriver.com>
Subject: Re: [Patch 00/13] MIPS: Use MACHINEOVERRIDES and reduce duplication
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
X-List-Received-Date: Mon, 07 Nov 2016 17:52:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 11/7/16 8:05 AM, Mark Hatle wrote:
> 
> I've looked over the set, it all looks reasonable to me.

Its an improvement definitely, however we should address
the endianness issue while we are here.

> 
> Acked-by: Mark Hatle <mark.hatle@windriver.com>
> 
> --Mark
> 
> On 11/7/16 9:01 AM, Zubair Lutfullah Kakakhel wrote:
>> Hi,
>>
>> This patch series adds a few MACHINEOVERRIDES options in arch-mips
>> to reduce duplicate configurations in various recipes.
>>
>> Further info in 
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10404
>>
>> Regards,
>> ZubairLK
>>
>> Zubair Lutfullah Kakakhel (13):
>>   arch-mips: Add MACHINEOVERRIDES variables to reduce duplication
>>   bitbake.conf: Reduce duplication in MIPS variants
>>   fts: Reduce duplication in MIPS variants.
>>   glibc: Reduce duplication in MIPS variants
>>   packagegroup: Reduce duplication in MIPS variants.
>>   gcc-runtime: Reduce duplication in MIPS variants.
>>   gdb: Reduce duplication in MIPS variants.
>>   mmc-utils: Reduce duplication in MIPS variants.
>>   valgrind: Reduce duplication in MIPS variants.
>>   ghostscript: Reduce duplication in MIPS variants.
>>   ltp: Reduce duplication in MIPS variants.
>>   mdadm: Reduce duplication in MIPS variants.
>>   webkit: Reduce duplication in MIPS variants.
>>
>>  meta/conf/bitbake.conf                                  | 11 +----------
>>  meta/conf/machine/include/mips/arch-mips.inc            |  7 +++++++
>>  meta/recipes-core/fts/fts.bb                            |  5 +----
>>  meta/recipes-core/glibc/glibc-ld.inc                    | 17 ++---------------
>>  .../recipes-core/packagegroups/packagegroup-core-sdk.bb |  5 +----
>>  .../packagegroups/packagegroup-core-tools-profile.bb    | 10 ++--------
>>  meta/recipes-devtools/gcc/gcc-runtime.inc               |  9 +--------
>>  meta/recipes-devtools/gdb/gdb-common.inc                |  7 +------
>>  meta/recipes-devtools/mmc/mmc-utils_git.bb              |  6 ++++--
>>  meta/recipes-devtools/valgrind/valgrind_3.12.0.bb       |  3 +--
>>  meta/recipes-extended/ghostscript/ghostscript_9.19.bb   |  4 ++--
>>  meta/recipes-extended/ltp/ltp_20160126.bb               |  3 ++-
>>  meta/recipes-extended/mdadm/mdadm_3.4.bb                |  6 ++++--
>>  meta/recipes-sato/webkit/webkitgtk_2.14.1.bb            |  3 +--
>>  14 files changed, 30 insertions(+), 66 deletions(-)
>>
> 

