Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7E6B060589
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 19:16:23 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id c52so2596818qte.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 12:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=q2h5h+5MvJt9bNmqgclzztbH3zgRT/4D2cwHld0/bI0=;
	b=oSN4AKONBsZZxF1Xq9SqgP8UXKipscygnR2fFPpZV+XW0t2yI0go9SZNqwc5751zOl
	bip0tAoB4zdaS+7rkFLazUVkjLgU+isAqLwWgCKIfR52oTHkUITiDsXksOHDPyHSvzFR
	29vIqWg/t06pTLh1nPYy0hyQvQQXM/eaf3ANpHUourq+RBLQFN9f1ZLGRfl/SpVDcgP6
	9uazjk3N8zvdqdfV0kNPUTwXFhCjZoyIBu6UguFiH/qK0cxkd735ajFVV9asUhwEDlu1
	O533UIAfUZa9dhE2SJLm0YlX/DIDPy54IATBD0ZYsXXTWbk8ovVoLYwyvmmC9yZOiQ1y
	zReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=q2h5h+5MvJt9bNmqgclzztbH3zgRT/4D2cwHld0/bI0=;
	b=FXZOKrfqJG5gIgnQ8Lry0PBq2Z7vDQAoYn9dyqi93S2bNvZyKo87VSGILstDRi4Eni
	oMFqVf9Gx1LP8AGp/s6iMxnJi3I8jGOM8BQoXFpyUFuZY5vxUcudwaaCXE5DjXdnYk0Q
	Ejem8Uoqte6qTcEPPeywzkRJ3jTvw8dPFjuGPvTQt/mS81VJKXS0ECwCAVemwhHhMCuB
	DbHRXEor7OpDqbx+ZkSiJKjtTeN197UXJorcEd6SmAtNsUAUqXFe2I2/T9rQKppQmv8p
	gpLlhu//QvQ//v6DAg/4sfh/m3Dh8hlBy6V24e9c3BXK7RJaAtbv7rnIRhicMDMOE8/q
	lFjw==
X-Gm-Message-State: ALyK8tLoAGNhZm5AOfkeyhmcPKrdSKXcfC/EqKaLpEROghHJ93FfRtJVY6D8ggmSpToES3ba9zOUySPhcp7PFQ==
X-Received: by 10.237.43.164 with SMTP id e33mr14784217qtd.55.1468264584534;
	Mon, 11 Jul 2016 12:16:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Mon, 11 Jul 2016 12:15:55 -0700 (PDT)
In-Reply-To: <5783E66E.1000202@gmail.com>
References: <CAP9ODKpQJ8aJ3ZcOoxWSUn6V+L7RtXDF_rreVmB=P42_K5N-Fw@mail.gmail.com>
	<CAMKF1sqi=9-2E9u9M4iuh5JUs+4Dr7cx80uCR8do78DSXnRoUw@mail.gmail.com>
	<5783E66E.1000202@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Jul 2016 12:15:55 -0700
Message-ID: <CAMKF1spzApFG-_Su5c3XQVu5mzYCtKPRDBtNroaiUKOxnH+L9g@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 11 Jul 2016 19:16:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2016 at 11:33 AM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 07/11/2016 10:41 AM, Khem Raj wrote:
>> On Mon, Jul 11, 2016 at 10:39 AM, Otavio Salvador
>> <otavio.salvador@ossystems.com.br> wrote:
>>> Hello Khem and OE-Core fellows,
>>>
>>> I would like to propose the backport of following changes:
>>>
>>> commit a572a1181411668a9bd4c264f5124d13f3d7cead (HEAD -> for-krogoth)
>>> Author: Khem Raj <raj.khem@gmail.com>
>>> Date:   Thu Jun 23 15:23:19 2016 -0700
>>>
>>>     musl: Upgrade to tip
>>>
>>>     Rich Felker (4):
>>>           fix undefined pointer arithmetic in CMSG_NXTHDR macro
>>>           fix a64l undefined behavior on ILP32 archs, wrong results on
>>> LP64 archs
>>>           avoid padding gaps in struct sockaddr_storage
>>>           remove comments on copyright status from UTF-8 implementation=
 files
>>>
>>>     Szabolcs Nagy (8):
>>>           fix the use of uninitialized value in regcomp
>>>           add preadv2 and pwritev2 syscall numbers for linux v4.6
>>>           add SO_CNX_ADVICE to sys/socket.h, new in linux v4.6
>>>           add ETH_P_MACSEC netinet/if_ether.h, new in linux v4.6
>>>           update siginfo struct for linux v4.6
>>>           add CLONE_NEWCGROUP clone flag, new in linux v4.6
>>>           add new tcp_info fields from linux v4.6
>>>           update sys/socket.h to linux v4.6
>
> Don't think 4.6 is supported in Krogoth IRC.

Stll some BSPs might decide to use it for their machines.

>>>
>>>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>>>     (cherry picked from commit d81bb8c6362d59a124bbe9b3a60cb259733b120d=
)
>>>
>>> commit a8e05129847ac01bddb01dcd8f1592fcacf0c908
>>> Author: Khem Raj <raj.khem@gmail.com>
>>> Date:   Fri May 20 07:03:30 2016 -0700
>>>
>>>     musl: Update to latest tip
>>>
>>>     Bobby Bingham (3):
>>>           x32: remove arch-specific syscall remapping
>>>           x32: eliminate __X32_SYSCALL_BIT constant
>>>           deduplicate __NR_* and SYS_* syscall number definitions
>>>
>>>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>>>     (cherry picked from commit 6993e88cccbfe2f990e4ea9bd7cc186d59e5a84b=
)
>>>
>>> commit d782ecec07bd270f1a9c7a440460cf4dd0cb1616
>>> Author: Khem Raj <raj.khem@gmail.com>
>>> Date:   Wed May 11 10:35:30 2016 -0700
>>>
>>>     musl: Upgrade to tip of tree
>>>
>>>     COPYRIGHT file was changed to clarfiy the MIT Licence
>>>     which resulted in checksum change, see
>>>
>>>     http://git.musl-libc.org/cgit/musl/commit/?id=3Df0a61399330bae42bee=
b27d6ecd05570b3382a60
>>>
>>>     below are changes in upgrade
>>>
>>>     Andrew Kelley (1):
>>>           fix incorrect protocol name and number for egp
>>>
>>>     Bobby Bingham (1):
>>>           add powerpc64 port
>
> isn't this adding new arch support?

yes. However we did not claim ppc64 bit support in krogoth
so no one should be asking for support even if the port is in there
all we should ensure that port does not regress supported arches

>
>>>
>>>     LeMay, Michael (1):
>>>           fix redundant processing of --build flag in configure script
>>>
>>>     Petr Van=C4=9Bk (1):
>>>           remove dead store in res_msend
>>>
>>>     Rich Felker (10):
>>>           fix undefined pointer comparison in stdio-internal __toread
>>>           fix regression disabling use of pause instruction for x86 a_s=
pin
>>>           fix read past end of haystack buffer for short needles in mem=
mem
>
>>>           add support for mips and mips64 r6 isa
> New arch support.
>
>>>           add mips n32 port (ILP32 ABI for mips64)
>
> New arch support.
>
>>>           fix thread structure/dtv-pointer corruption on powerpc
>>>           fix FILE buffer underflow in ungetwc
>>>           update COPYRIGHT file to clarify that permissions apply for a=
ll files
>>>           follow standard configure behavior for cross compile prefix
>>>           fix spurious trailing whitespace in powerpc & powerpc64 bits/=
errno.h
>>>
>>>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>     (cherry picked from commit 21d8d60b2bfb205dcb5d304119d4dbd627db7163=
)
>>>
>>> We have been using those backports locally with success and it fixes a
>>> number of important things for our application, as musl is ABI
>>> compatible I think those backports would be good for stable. What do
>>> you think?
>>
>> These changes are safe for krogoth. Go ahead and send a pull request for=
 krogoth
>
> They may be safe but this seems to go against the rules outlined in the
> stable branch maintenance process.  Does backporting  individual patches
> that do not include new arch support destabilize musl?

yes it will.

>
> - armin
>
>>

