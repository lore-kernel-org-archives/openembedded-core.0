Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1522A737A3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 19:12:09 +0000 (UTC)
Received: by padev16 with SMTP id ev16so140096373pad.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 12:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=vOHD4h7wZPMxder8rcpBSvsyq9hrpmXDkS7orPy22cE=;
	b=e7Q4ip/c9g5PeJrt1a3xtJ+skMIfQIF8dq9nd3Ys03ag/ZLaHtQ7rmeJiEA8C0CAIX
	Sw1faK4cTqBgaHfZyabHmnjnzejTZKpj3I69FJwwCmwgGpogXv5aWDFUAlGyKrJnBtXc
	DL4x94OUGxRIUarc1IK0H5cLjSk+qaoTGaiMomzQzTFTztLpxHE9Ic7Vw4rb3EUeBX5U
	+TW3G6+exd80WWND/KclldsN6YM2WslIxhn+p+co63pB177kvXkhj8drHAqBEcR5D6Pj
	QIeO+8RTUO7X2IurV/ehOnepcQZXm6/IYRF0HxVnPPC2qSc9nmIwuLUjaIafKBvQrbxf
	OUEg==
X-Received: by 10.66.90.166 with SMTP id bx6mr61351506pab.76.1435000331348;
	Mon, 22 Jun 2015 12:12:11 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:eccd:4297:a72a:d01f?
	([2601:202:4000:1239:eccd:4297:a72a:d01f])
	by mx.google.com with ESMTPSA id
	nq2sm20676116pdb.70.2015.06.22.12.12.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jun 2015 12:12:09 -0700 (PDT)
Message-ID: <55885E04.5000006@gmail.com>
Date: Mon, 22 Jun 2015 12:12:04 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <5584374B.9040201@gmail.com> <20150619165928.GC2398@jama>
In-Reply-To: <20150619165928.GC2398@jama>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: DIzzy - Call for patches for OE-core by June 26th
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
X-List-Received-Date: Mon, 22 Jun 2015 19:12:14 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 06/19/2015 09:59 AM, Martin Jansa wrote:
> On Fri, Jun 19, 2015 at 08:37:47AM -0700, akuster808 wrote:
>> thanks,
>> Armin
>
> Are these already included?

nope. I will grab them thanks,

>
> OE @ ~/openembedded-core $ git log origin/dizzy..contrib/jansa/dizzy-backports  --oneline
> 11db5b7 license.bbclass: set dirs for do_populate_lic_setscene
> 777db3a perf: add LIBNUMA_DEFINES
> d79409f squashfs-tools: build and install unsquashfs as well
> f369677 e2fsprogs: install populate-extfs.sh
> 2dbb375 mesa: update --with-llvm-shared-libs configure option
> d68cb5e test-dependencies.sh: strip only .bb suffix

- armin
>

