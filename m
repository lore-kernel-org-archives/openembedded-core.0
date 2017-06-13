Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 476557823D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 22:13:30 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id q97so163362959wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 15:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AonIGe/Xy74KCwPITzWsIbJCzj6Syr0xNgW26Xo+e74=;
	b=MZb9yWJ5uW2yDhaWARl/1yhduCpKudsigv1+d4bcs2Qu2zYadN0IqmEtEfRFmOxZGF
	dRSJbMRj1acr1hx7aYQQPyuqENQDG1si2L1B5SLC6h7sPKVLdsFllYbsqL6Hpusy/Ydc
	1MJuNT5Pe2Xc7f36jm4hZ2qfXw/VZ4CSiHLk9KGEnf8ssvdUmQKgeglyYTxRIb9oEuBK
	0F34rlvl5sXfVJALsmXxwdMujUAYFnCqtBZ3+jDtJFF9VMs6JNajZfj+xSAygzySHc0C
	/O0Y3YoTnao4lm+OmO/nxnMiuC4h2DqdpO6hBXI5ntMRN7GR6q9q4yN0njUwIRucWBwM
	g52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AonIGe/Xy74KCwPITzWsIbJCzj6Syr0xNgW26Xo+e74=;
	b=E5AHXw2ZbjX+bbdDhrcUNFAnHLnkxiv8IdR0x10qM7GFhnBDyHAm/SiZbyF6qmhz95
	gwuc2SDsaFJvHfYovr+/eJP27enEgCvilLu7+Xw8lDdHJgVdjPKRuwGPGfoVoGTrOpiq
	3o86rvsTyfGB3fnsnDdsha2o8/NxRLYeoAqIkc1S+UJsqELYstii5SeIvyphMJ24HoX9
	KceGvrTWMcr1V58TNhh2kLO49h0bC5Mt9YltkFZcooYXt0yhI7E+xv/Apzy7w5vHUCX1
	8o2m4uFIsJk+tV389C8mLCXwEI+LGve+OdoJbvaKaBUvB0VsBIj/cj8XPlD3Vh3Dx58K
	sNAg==
X-Gm-Message-State: AKS2vOyyhaa0GfFZhzmzwcGKK3NCwUxYbUkGOXn57ZhVzkSeIzwYqqfN
	MEREPpO3KdryaWXFxB+wyzoKKc0o4Q==
X-Received: by 10.80.131.6 with SMTP id 6mr1432676edh.178.1497392011541; Tue,
	13 Jun 2017 15:13:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Tue, 13 Jun 2017 15:13:01 -0700 (PDT)
In-Reply-To: <20170613213940.GC3088@jama>
References: <cover.1489267743.git.raj.khem@gmail.com>
	<5124b899-8410-1d30-c397-65237f9d0a90@gmail.com>
	<CA+chaQdT-TRBD4mA5hHuXWBtJupOE6tfe=tqehu8DLVa78e=OA@mail.gmail.com>
	<CAMKF1sqGsV22S7MFVCMBgDxbSKFgqF1iZSviSU-e6pS0Ljx6aQ@mail.gmail.com>
	<20170331150810.GA3897@jama>
	<CAMKF1soVTYoZKuNumi+qOw8sgSQqpcXkLW2skhM9v_warvRgkw@mail.gmail.com>
	<CA+chaQdj48R74vNax1XPzc_mB6EQe7y+bgwXmOW417BQxtguoQ@mail.gmail.com>
	<CAMKF1sozG3W+axiBRVLs7ht+ficrp1Wj45SW38cJEB3bGZNx6Q@mail.gmail.com>
	<20170613213940.GC3088@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Jun 2017 15:13:01 -0700
Message-ID: <CAMKF1soTEa9paNsyPjNbrfNCY2OxydNp3s5KA5DcUjO01R5rMQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] mesa: Contain configure search for llvm
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
X-List-Received-Date: Tue, 13 Jun 2017 22:13:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 13, 2017 at 2:39 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sat, Apr 01, 2017 at 08:21:16AM -0700, Khem Raj wrote:
>> On Fri, Mar 31, 2017 at 10:52 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > Why is it needed?
>>
>> If you have clang/llvm installed on your build host then it defaults to that
>> thats why its needed.
>
> And where does meta-clang install it? Because if it doesn't match with
> the location used by meta-oe's llvm then we cannot have the same flag
> which suits both providers.
>
> As it is now I still have this change reverted in my branches and I've
> noticed some layers which just use EXTRA_OECONF_remove to just remove
> this with-llvm-prefix to unblock the builds with Pyro and Rocko.
>
>> > Without this change mesa was finding llvm-config correctly, that's why I've
>> > just reverted this to continue building.

The problem is mainly when you have clang/llvm installed on build host
now that we prune hosttools this might not be an issue anymore, although
this needs to be tested.

>>
>>
>> >
>> > On Fri, Mar 31, 2017 at 5:57 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> On Fri, Mar 31, 2017 at 8:08 AM, Martin Jansa <martin.jansa@gmail.com>
>> >> wrote:
>> >> > On Thu, Mar 23, 2017 at 10:31:07AM -0700, Khem Raj wrote:
>> >> >> On Thu, Mar 23, 2017 at 12:51 AM, Martin Jansa <martin.jansa@gmail.com>
>> >> >> wrote:
>> >> >> > I'm not sure if this is the root cause, but last qemux86 build shows:
>> >> >> >
>> >> >> >
>> >> >> > | configure: error: --enable-gallium-llvm selected but llvm-config is
>> >> >> > not
>> >> >> > found
>> >> >> > | ERROR: Function failed: do_configure (log file is located at
>> >> >> >
>> >> >> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/mesa/2_17.0.1-r0/temp/log.do_configure.11359)
>> >> >> >
>> >> >>
>> >> >> can you point where is llvm-config installed in sysroot ? its possible
>> >> >> its not in native sysroot location ${STAGING_BINDIR_NATIVE}
>> >> >
>> >> > OE qemux86@ ~/build/oe-core $ find
>> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot* -name llvm\*
>> >> >
>> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/bin/crossscripts/llvm-config
>> >> >
>> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/bin/crossscripts/llvm-config3.3
>> >> >
>> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/include/llvm3.3
>> >> >
>> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/include/llvm3.3/llvm-c
>> >> >
>> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/include/llvm3.3/llvm
>> >> >
>> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/include/llvm3.3/llvm/Config/llvm-config.h
>> >> >
>> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/lib/llvm3.3
>> >> >
>> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/sysroot-providers/llvm-common
>> >> >
>> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/sysroot-providers/llvm3.3
>> >> >
>> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/installeddeps/llvm3.3.complete
>> >> >
>> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/installeddeps/llvm-common.complete
>> >> >
>> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/installeddeps/llvm-common.6be6a4ae98ee0dff7c2a4c4df17f026a
>> >> >
>> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/installeddeps/llvm-common
>> >> >
>> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/installeddeps/llvm3.3.388adaa288ab3b1d35e01a43b6542368
>> >> >
>> >> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/installeddeps/llvm3.3
>> >> >
>> >>
>> >> so it seems it should point to <recipe-sysroot>/usr/bin/crossscripts
>> >> can you try changing -with-llvm-prefix to point to this dir ?
>> >>
>> >> >>
>> >> >> >
>> >> >> > I've noticed some llvm changes for meta-clang, do we need similar
>> >> >> > changes
>> >> >> > for meta-oe version of llvm?
>> >> >> >
>> >> >> >
>> >> >> > On Sun, Mar 12, 2017 at 12:16 AM, Khem Raj <raj.khem@gmail.com>
>> >> >> > wrote:
>> >> >> >>
>> >> >> >>
>> >> >> >>
>> >> >> >> On 3/11/17 1:30 PM, Khem Raj wrote:
>> >> >> >> > The following changes since commit
>> >> >> >> > a47e64d985a610535449730806651f5bfd75d9ec:
>> >> >> >> >
>> >> >> >> >   libcomps: add a recipe (2017-03-11 16:08:50 +0000)
>> >> >> >> >
>> >> >> >> > are available in the git repository at:
>> >> >> >> >
>> >> >> >> >   git://git.openembedded.org/openembedded-core-contrib kraj/pu
>> >> >> >> >
>> >> >> >> > http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu
>> >> >> >> >
>> >> >> >> > Khem Raj (1):
>> >> >> >> >   mesa: Contain configure search for llvm
>> >> >> >> >
>> >> >> >>
>> >> >> >> I added another fix for mesa-gl to remove one of obsolete
>> >> >> >> packageconfigs
>> >> >> >> and its on the same pull branch now.
>> >> >> >>
>> >> >> >> >  meta/recipes-graphics/mesa/mesa.inc | 2 +-
>> >> >> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >> >> >> >
>> >> >> >> --
>> >> >> >> _______________________________________________
>> >> >> >> Openembedded-core mailing list
>> >> >> >> Openembedded-core@lists.openembedded.org
>> >> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >> >> >
>> >> >> >
>> >> >
>> >> > --
>> >> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>> >
>> >
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

