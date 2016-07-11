Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5908A60589
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 18:33:24 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id hh10so3591862pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 11:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=ao0LeDiIifLyhbCBwUxHs6Kue6yfnTm4/qcqHBSSU5Q=;
	b=QK7gBS4xOz7eOiiqZyM7fmmLxZgjyCFkmSFdhirKJVuWK0F07RbNAwHvHT5s4YhpFO
	IZ0jqDoYHzOH7l/cLemnp7MKnlfA0kVDYCdmH/4abLbUJfBO9hE7nY1oIVsW5mNxct4T
	vQAtrWQUSUYc0/JmCl3WyVSOKt4zQ/AxacusjimeV2NfMjzkcN07pnOYQSCip+S4Lp9v
	qhWkRzpQyKM2C+koDWTN4JPMBDUPgICgrq76VN8EOymm9q3AoNuYTCv2SpoRVnK1MeJd
	v85xl+xGxpYIPdmlV4s7U6HZPfbNh8vUsPOubXo1gMUD3uvOrs1AAraH0/n8e8GqDIHJ
	H1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=ao0LeDiIifLyhbCBwUxHs6Kue6yfnTm4/qcqHBSSU5Q=;
	b=VtvwFCqeptUezxpaLzdzmJaFS/nvdbWgjtsSNDB8ylyV7ylIfbtCiK12omf3O5ooFu
	VhufPKtPfELORH8PL/K9gcQrFHP8Uu7IGgFDsneZlLlVHxPPoE5X8Dgz5lw1h2YVZAg6
	fNY9Tues06pSRo1hfAkgimoiT5+tOifFQo6UF55fww2Vu3xXCZiMPy4hZIFcv5faAEJL
	BQUp9f804kLin1iuIfOfT5+7LSMRTbkw/lNFT+e53wu5HVQf0LXCCjlnlGxyj6vkxxWs
	zlwr5522Q2jFPxVY+PVTDL8lGeYH+5V7q3e1QtA74CFsccmWI2hIiYaPaqE1GD6rHiAG
	lfBw==
X-Gm-Message-State: ALyK8tKAqmNxfsohITCbg85UK728XY9fhalHnixmp3Joi8gWsodLuzYyoQjU972rlZukKQ==
X-Received: by 10.66.254.102 with SMTP id ah6mr37927960pad.59.1468262005156;
	Mon, 11 Jul 2016 11:33:25 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:c008:4767:f9d2:dea7?
	([2601:202:4001:9ea0:c008:4767:f9d2:dea7])
	by smtp.googlemail.com with ESMTPSA id
	a20sm6018595pfa.27.2016.07.11.11.33.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jul 2016 11:33:24 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <CAP9ODKpQJ8aJ3ZcOoxWSUn6V+L7RtXDF_rreVmB=P42_K5N-Fw@mail.gmail.com>
	<CAMKF1sqi=9-2E9u9M4iuh5JUs+4Dr7cx80uCR8do78DSXnRoUw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5783E66E.1000202@gmail.com>
Date: Mon, 11 Jul 2016 11:33:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqi=9-2E9u9M4iuh5JUs+4Dr7cx80uCR8do78DSXnRoUw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [for-krogoth] musl backport
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
X-List-Received-Date: Mon, 11 Jul 2016 18:33:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 07/11/2016 10:41 AM, Khem Raj wrote:
> On Mon, Jul 11, 2016 at 10:39 AM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> Hello Khem and OE-Core fellows,
>>
>> I would like to propose the backport of following changes:
>>
>> commit a572a1181411668a9bd4c264f5124d13f3d7cead (HEAD -> for-krogoth)
>> Author: Khem Raj <raj.khem@gmail.com>
>> Date:   Thu Jun 23 15:23:19 2016 -0700
>>
>>     musl: Upgrade to tip
>>
>>     Rich Felker (4):
>>           fix undefined pointer arithmetic in CMSG_NXTHDR macro
>>           fix a64l undefined behavior on ILP32 archs, wrong results on
>> LP64 archs
>>           avoid padding gaps in struct sockaddr_storage
>>           remove comments on copyright status from UTF-8 implementation files
>>
>>     Szabolcs Nagy (8):
>>           fix the use of uninitialized value in regcomp
>>           add preadv2 and pwritev2 syscall numbers for linux v4.6
>>           add SO_CNX_ADVICE to sys/socket.h, new in linux v4.6
>>           add ETH_P_MACSEC netinet/if_ether.h, new in linux v4.6
>>           update siginfo struct for linux v4.6
>>           add CLONE_NEWCGROUP clone flag, new in linux v4.6
>>           add new tcp_info fields from linux v4.6
>>           update sys/socket.h to linux v4.6

Don't think 4.6 is supported in Krogoth IRC.
>>
>>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>>     (cherry picked from commit d81bb8c6362d59a124bbe9b3a60cb259733b120d)
>>
>> commit a8e05129847ac01bddb01dcd8f1592fcacf0c908
>> Author: Khem Raj <raj.khem@gmail.com>
>> Date:   Fri May 20 07:03:30 2016 -0700
>>
>>     musl: Update to latest tip
>>
>>     Bobby Bingham (3):
>>           x32: remove arch-specific syscall remapping
>>           x32: eliminate __X32_SYSCALL_BIT constant
>>           deduplicate __NR_* and SYS_* syscall number definitions
>>
>>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>>     (cherry picked from commit 6993e88cccbfe2f990e4ea9bd7cc186d59e5a84b)
>>
>> commit d782ecec07bd270f1a9c7a440460cf4dd0cb1616
>> Author: Khem Raj <raj.khem@gmail.com>
>> Date:   Wed May 11 10:35:30 2016 -0700
>>
>>     musl: Upgrade to tip of tree
>>
>>     COPYRIGHT file was changed to clarfiy the MIT Licence
>>     which resulted in checksum change, see
>>
>>     http://git.musl-libc.org/cgit/musl/commit/?id=f0a61399330bae42beeb27d6ecd05570b3382a60
>>
>>     below are changes in upgrade
>>
>>     Andrew Kelley (1):
>>           fix incorrect protocol name and number for egp
>>
>>     Bobby Bingham (1):
>>           add powerpc64 port

isn't this adding new arch support?

>>
>>     LeMay, Michael (1):
>>           fix redundant processing of --build flag in configure script
>>
>>     Petr Vaněk (1):
>>           remove dead store in res_msend
>>
>>     Rich Felker (10):
>>           fix undefined pointer comparison in stdio-internal __toread
>>           fix regression disabling use of pause instruction for x86 a_spin
>>           fix read past end of haystack buffer for short needles in memmem

>>           add support for mips and mips64 r6 isa
New arch support.

>>           add mips n32 port (ILP32 ABI for mips64)

New arch support.

>>           fix thread structure/dtv-pointer corruption on powerpc
>>           fix FILE buffer underflow in ungetwc
>>           update COPYRIGHT file to clarify that permissions apply for all files
>>           follow standard configure behavior for cross compile prefix
>>           fix spurious trailing whitespace in powerpc & powerpc64 bits/errno.h
>>
>>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>     (cherry picked from commit 21d8d60b2bfb205dcb5d304119d4dbd627db7163)
>>
>> We have been using those backports locally with success and it fixes a
>> number of important things for our application, as musl is ABI
>> compatible I think those backports would be good for stable. What do
>> you think?
> 
> These changes are safe for krogoth. Go ahead and send a pull request for krogoth

They may be safe but this seems to go against the rules outlined in the
stable branch maintenance process.  Does backporting  individual patches
that do not include new arch support destabilize musl?

- armin

> 

