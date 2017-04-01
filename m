Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9D8CC77E5C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Apr 2017 15:21:46 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id v203so3482305wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Apr 2017 08:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ddlkfq5HyY7Y1cpLB9G/xqo11FUJjpdACoVbiPb+RDo=;
	b=WyZLwx66yu9kdzYG3c1tkdopZu3qLwBaXzAAEm4SjFXWTSOzA5fzzF/Xtt+uIKtaG/
	B1lsSLibGtOI3T7lgp4MSlaQH/Bm/VqpTHqTh0wyhTZPQMstxoYtnHeqrbpLVxKu3l3O
	w50LYE5uqIdLBvFlzloINyQMI9gBpYLuJDBRc9O3iq7j4iZJ9OiwQ7BeZQs4D7fQg6vd
	6swZX2EKnR5URpAtwxPwvvOgiq3vTwxDsPI8Lu0i+Zg4zEgXu+xwXc2df/270uah9fpV
	jRn1bbT1Zn8IfiDsMG1oOtkKTFpbG8CUbUlov6ran2vCQKyV8zvXnjDevL0jOG//W7o6
	qgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ddlkfq5HyY7Y1cpLB9G/xqo11FUJjpdACoVbiPb+RDo=;
	b=hSchJK5MDPjckIwzaQigRsoiKWhlMFRhQLF+7iZLmoB1MnDkeOjmunqRPQ/s1m+SbR
	NNB3tbC/9o8xxnO1v8J3yan7XxWYlFfLAjqEjujO9i6tJq08haY1fGbIlo5k4Zc8u77o
	Iwk5iPBabhtVrQ+JrxJH4oNKlkAwHxi8rsaQFPhYoRTU7NvkmyReR4cWUvhpJ2Nlzq9J
	BJfAW+TJx5DFcfA94du5KTYCexOsNY15pyHIqGwWn9AVOqYh1dbsrV12xnlUY49K1H1C
	GoMVjQ752CJkCrz24dOBp+WMJhrh++RV4E9s0WkAo6LTmch6p93ZVz2GbBH1MW1YGeca
	Lspg==
X-Gm-Message-State: AFeK/H06CunsAxs5Ku8yCq0pVImOzJ49Bb0JcbiUi35AdzzD9Db7lsQl
	CCQP5sfuucQn5pYlGvvc1rIAG2VWXw==
X-Received: by 10.28.165.145 with SMTP id o139mr2747391wme.13.1491060107285;
	Sat, 01 Apr 2017 08:21:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Sat, 1 Apr 2017 08:21:16 -0700 (PDT)
In-Reply-To: <CA+chaQdj48R74vNax1XPzc_mB6EQe7y+bgwXmOW417BQxtguoQ@mail.gmail.com>
References: <cover.1489267743.git.raj.khem@gmail.com>
	<5124b899-8410-1d30-c397-65237f9d0a90@gmail.com>
	<CA+chaQdT-TRBD4mA5hHuXWBtJupOE6tfe=tqehu8DLVa78e=OA@mail.gmail.com>
	<CAMKF1sqGsV22S7MFVCMBgDxbSKFgqF1iZSviSU-e6pS0Ljx6aQ@mail.gmail.com>
	<20170331150810.GA3897@jama>
	<CAMKF1soVTYoZKuNumi+qOw8sgSQqpcXkLW2skhM9v_warvRgkw@mail.gmail.com>
	<CA+chaQdj48R74vNax1XPzc_mB6EQe7y+bgwXmOW417BQxtguoQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 1 Apr 2017 08:21:16 -0700
Message-ID: <CAMKF1sozG3W+axiBRVLs7ht+ficrp1Wj45SW38cJEB3bGZNx6Q@mail.gmail.com>
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
X-List-Received-Date: Sat, 01 Apr 2017 15:21:47 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 31, 2017 at 10:52 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Why is it needed?

If you have clang/llvm installed on your build host then it defaults to that
thats why its needed.

> Without this change mesa was finding llvm-config correctly, that's why I've
> just reverted this to continue building.


>
> On Fri, Mar 31, 2017 at 5:57 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Fri, Mar 31, 2017 at 8:08 AM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> > On Thu, Mar 23, 2017 at 10:31:07AM -0700, Khem Raj wrote:
>> >> On Thu, Mar 23, 2017 at 12:51 AM, Martin Jansa <martin.jansa@gmail.com>
>> >> wrote:
>> >> > I'm not sure if this is the root cause, but last qemux86 build shows:
>> >> >
>> >> >
>> >> > | configure: error: --enable-gallium-llvm selected but llvm-config is
>> >> > not
>> >> > found
>> >> > | ERROR: Function failed: do_configure (log file is located at
>> >> >
>> >> > /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/mesa/2_17.0.1-r0/temp/log.do_configure.11359)
>> >> >
>> >>
>> >> can you point where is llvm-config installed in sysroot ? its possible
>> >> its not in native sysroot location ${STAGING_BINDIR_NATIVE}
>> >
>> > OE qemux86@ ~/build/oe-core $ find
>> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot* -name llvm\*
>> >
>> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/bin/crossscripts/llvm-config
>> >
>> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/bin/crossscripts/llvm-config3.3
>> >
>> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/include/llvm3.3
>> >
>> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/include/llvm3.3/llvm-c
>> >
>> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/include/llvm3.3/llvm
>> >
>> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/include/llvm3.3/llvm/Config/llvm-config.h
>> >
>> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/usr/lib/llvm3.3
>> >
>> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/sysroot-providers/llvm-common
>> >
>> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot/sysroot-providers/llvm3.3
>> >
>> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/installeddeps/llvm3.3.complete
>> >
>> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/installeddeps/llvm-common.complete
>> >
>> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/installeddeps/llvm-common.6be6a4ae98ee0dff7c2a4c4df17f026a
>> >
>> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/installeddeps/llvm-common
>> >
>> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/installeddeps/llvm3.3.388adaa288ab3b1d35e01a43b6542368
>> >
>> > tmp-glibc/work/i586-oe-linux/mesa/2_17.0.2-r0/recipe-sysroot-native/installeddeps/llvm3.3
>> >
>>
>> so it seems it should point to <recipe-sysroot>/usr/bin/crossscripts
>> can you try changing -with-llvm-prefix to point to this dir ?
>>
>> >>
>> >> >
>> >> > I've noticed some llvm changes for meta-clang, do we need similar
>> >> > changes
>> >> > for meta-oe version of llvm?
>> >> >
>> >> >
>> >> > On Sun, Mar 12, 2017 at 12:16 AM, Khem Raj <raj.khem@gmail.com>
>> >> > wrote:
>> >> >>
>> >> >>
>> >> >>
>> >> >> On 3/11/17 1:30 PM, Khem Raj wrote:
>> >> >> > The following changes since commit
>> >> >> > a47e64d985a610535449730806651f5bfd75d9ec:
>> >> >> >
>> >> >> >   libcomps: add a recipe (2017-03-11 16:08:50 +0000)
>> >> >> >
>> >> >> > are available in the git repository at:
>> >> >> >
>> >> >> >   git://git.openembedded.org/openembedded-core-contrib kraj/pu
>> >> >> >
>> >> >> > http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu
>> >> >> >
>> >> >> > Khem Raj (1):
>> >> >> >   mesa: Contain configure search for llvm
>> >> >> >
>> >> >>
>> >> >> I added another fix for mesa-gl to remove one of obsolete
>> >> >> packageconfigs
>> >> >> and its on the same pull branch now.
>> >> >>
>> >> >> >  meta/recipes-graphics/mesa/mesa.inc | 2 +-
>> >> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >> >> >
>> >> >> --
>> >> >> _______________________________________________
>> >> >> Openembedded-core mailing list
>> >> >> Openembedded-core@lists.openembedded.org
>> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >> >
>> >> >
>> >
>> > --
>> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>

