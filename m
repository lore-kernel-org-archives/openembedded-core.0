Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 052646067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 14:15:42 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id ib6so1113337pad.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 07:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=FWItw0HqGhQsEK3KA5ZGIUTAzPm6ZAqtXNcAXw0N7l0=;
	b=mJNkxwcunxcE4+AiA59ue+9idPoUl9KPKBMoN54jMJHijd6AhzBIFs8iq1dC205RlJ
	f1haJ4WXtNV0rJHqYKNMFgWLNhY/RdAEPzeCAwV5+Ll2JAxtcXCcCLfXqvaQkLca+1a0
	gTNWurUhrtd3OQGZuls+OnMOMFZiSieMGuvXFn8OT9GfgwWJf7BM36FJ9Km50B/JptoB
	YGeYaiQjmszbmXwJIRl6fGYvkQGy9CI5wung0Aw2qyBQ+L9CkOvms98GlNfW3hF3s7Tk
	93S0rAze+DiACDswdgE3Xv3hr5UG2u+VpeQK1cmw4KMvQz93ytH5hyQxtugwqvREadWK
	9cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=FWItw0HqGhQsEK3KA5ZGIUTAzPm6ZAqtXNcAXw0N7l0=;
	b=C4sR31+J+ItGpxb1SOxBbvdPdKdCoV+tZd6e+vWGyr6KfOfOosikaL0qTBe+UIMqtU
	Hs24J1AZmaqO6Pko1kIBm0uqXjZmO6W5tq/hY5rGzeCbvrPQv7OxGxZDoIPeJq31w7g9
	OuraP+sXV0v0p+PNxtIx0Dw17e3C+QDnrUVGXeyplR1Ej/r9Q7L44PXj3CgejGoP9VpF
	NhFvPRCmapXRpMdUuP8tdrWBbxxoi2iTJuCvANy0sYQoOdDmt+Ne7DwJC3xl0s4U8D19
	/MPJAwYaH+LXG4ZVcnLTexTHM6npZF4K10CoGq/PWAOHegFCZ1DhwP8+JB2+Z8arEjXa
	r+8Q==
X-Gm-Message-State: ALyK8tLERbwOSicX7nR/HG2W1hnFv1FdRHU2WQF6IFTIVRGUmcS9GEUanUFySUomXZo92g==
X-Received: by 10.66.189.199 with SMTP id gk7mr4456711pac.158.1468332942850;
	Tue, 12 Jul 2016 07:15:42 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:344d:d49:bd5b:9177?
	([2601:202:4001:9ea0:344d:d49:bd5b:9177])
	by smtp.gmail.com with ESMTPSA id e4sm4584279pfe.69.2016.07.12.07.15.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jul 2016 07:15:41 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <CAP9ODKpQJ8aJ3ZcOoxWSUn6V+L7RtXDF_rreVmB=P42_K5N-Fw@mail.gmail.com>
	<CAMKF1sqi=9-2E9u9M4iuh5JUs+4Dr7cx80uCR8do78DSXnRoUw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5784FB8C.1070909@gmail.com>
Date: Tue, 12 Jul 2016 07:15:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
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
X-List-Received-Date: Tue, 12 Jul 2016 14:15:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
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
>>      musl: Upgrade to tip
>>
>>      Rich Felker (4):
>>            fix undefined pointer arithmetic in CMSG_NXTHDR macro
>>            fix a64l undefined behavior on ILP32 archs, wrong results on
>> LP64 archs
>>            avoid padding gaps in struct sockaddr_storage
>>            remove comments on copyright status from UTF-8 implementation files
>>
>>      Szabolcs Nagy (8):
>>            fix the use of uninitialized value in regcomp
>>            add preadv2 and pwritev2 syscall numbers for linux v4.6
>>            add SO_CNX_ADVICE to sys/socket.h, new in linux v4.6
>>            add ETH_P_MACSEC netinet/if_ether.h, new in linux v4.6
>>            update siginfo struct for linux v4.6
>>            add CLONE_NEWCGROUP clone flag, new in linux v4.6
>>            add new tcp_info fields from linux v4.6
>>            update sys/socket.h to linux v4.6
>>
>>      Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>      Signed-off-by: Ross Burton <ross.burton@intel.com>
>>      (cherry picked from commit d81bb8c6362d59a124bbe9b3a60cb259733b120d)
>>
>> commit a8e05129847ac01bddb01dcd8f1592fcacf0c908
>> Author: Khem Raj <raj.khem@gmail.com>
>> Date:   Fri May 20 07:03:30 2016 -0700
>>
>>      musl: Update to latest tip
>>
>>      Bobby Bingham (3):
>>            x32: remove arch-specific syscall remapping
>>            x32: eliminate __X32_SYSCALL_BIT constant
>>            deduplicate __NR_* and SYS_* syscall number definitions
>>
>>      Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>      Signed-off-by: Ross Burton <ross.burton@intel.com>
>>      (cherry picked from commit 6993e88cccbfe2f990e4ea9bd7cc186d59e5a84b)
>>
>> commit d782ecec07bd270f1a9c7a440460cf4dd0cb1616
>> Author: Khem Raj <raj.khem@gmail.com>
>> Date:   Wed May 11 10:35:30 2016 -0700
>>
>>      musl: Upgrade to tip of tree
>>
>>      COPYRIGHT file was changed to clarfiy the MIT Licence
>>      which resulted in checksum change, see
>>
>>      http://git.musl-libc.org/cgit/musl/commit/?id=f0a61399330bae42beeb27d6ecd05570b3382a60
>>
>>      below are changes in upgrade
>>
>>      Andrew Kelley (1):
>>            fix incorrect protocol name and number for egp
>>
>>      Bobby Bingham (1):
>>            add powerpc64 port
>>
>>      LeMay, Michael (1):
>>            fix redundant processing of --build flag in configure script
>>
>>      Petr Vaněk (1):
>>            remove dead store in res_msend
>>
>>      Rich Felker (10):
>>            fix undefined pointer comparison in stdio-internal __toread
>>            fix regression disabling use of pause instruction for x86 a_spin
>>            fix read past end of haystack buffer for short needles in memmem
>>            add support for mips and mips64 r6 isa
>>            add mips n32 port (ILP32 ABI for mips64)
>>            fix thread structure/dtv-pointer corruption on powerpc
>>            fix FILE buffer underflow in ungetwc
>>            update COPYRIGHT file to clarify that permissions apply for all files
>>            follow standard configure behavior for cross compile prefix
>>            fix spurious trailing whitespace in powerpc & powerpc64 bits/errno.h
>>
>>      Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>      (cherry picked from commit 21d8d60b2bfb205dcb5d304119d4dbd627db7163)
>>
>> We have been using those backports locally with success and it fixes a
>> number of important things for our application, as musl is ABI
>> compatible I think those backports would be good for stable. What do
>> you think?
> These changes are safe for krogoth. Go ahead and send a pull request for krogoth

pulled into akuster/krogoth-next.

- armin


