Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3D61077B39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 17:31:36 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u132so532943wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 10:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/X3AprcYZowV/t1N3bKx8rwi3SA35HqnvLZOmjdcMfY=;
	b=vdQuHvjnD7+l3Qx7shazbukz4iQ+dMT1K5Wi+yAg1FWGd619epdRD35vgobeUmSNtU
	offF9sE+httoP7EK0qGtSUUgKznbAJi0hJwc+49nXJbIIOTVhGWSzI10vw6GV0sDyx+z
	VBk3nT2VTkt6ikNsAfhZr30WNebv9nCWdbp6ioA1L35u43QdpVtWA2J43dT8oD9Ba5Db
	ymr6bgLUa6xmqL5P/oYobzfRrMqjCS5CeeWbuHyQmQhX2/vpXllejfsJ3KKWMmW3y/Pt
	WZ26Zo+FGW9/+jy5PvaSEIlhd4ymlv/X4nLNF5wrUx93Xy8kLAlMvLG2+ea5cWBhhFmC
	E14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/X3AprcYZowV/t1N3bKx8rwi3SA35HqnvLZOmjdcMfY=;
	b=F8g1oEnmr+IUPzoBmv6nq2bky5ouMoJMSngjeWqXvi68iy9Y4FOnnaYkNxQVQnWA97
	X5pXKZ9BWqv9YFNC2zt4AdV47YkZMCA/xL7iOf976/nF5qXwPAo4A97ZXsRWKcDknsnQ
	mpHHrn4n4JJQ6GwTwYXeGfWdO/LExP0jWYrO9HG4xcJVsJZj7366/66G26A8xKUI9vv9
	bkNFKGSmoiQP1McSfBqAQLahWTReqtFc3KcQp1K9JsqZMkqkbIlacXaXpIF0AStdXgD3
	P9TIYbkms+L/P8FYPxLWq+WcekJGcY97uXQP4zG0iEap5CRNYXr3RsVHeBGiAGJ0xnaO
	S9ag==
X-Gm-Message-State: AFeK/H2VR49ZE0jR/y1jOtSE489N2Cfx6hb8uqiDiosg4472kurdgVX8MwysrlI7axFKuCbwTj9zh4AcHadXxQ==
X-Received: by 10.28.140.135 with SMTP id o129mr4022755wmd.101.1490290298071; 
	Thu, 23 Mar 2017 10:31:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Thu, 23 Mar 2017 10:31:07 -0700 (PDT)
In-Reply-To: <CA+chaQdT-TRBD4mA5hHuXWBtJupOE6tfe=tqehu8DLVa78e=OA@mail.gmail.com>
References: <cover.1489267743.git.raj.khem@gmail.com>
	<5124b899-8410-1d30-c397-65237f9d0a90@gmail.com>
	<CA+chaQdT-TRBD4mA5hHuXWBtJupOE6tfe=tqehu8DLVa78e=OA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Mar 2017 10:31:07 -0700
Message-ID: <CAMKF1sqGsV22S7MFVCMBgDxbSKFgqF1iZSviSU-e6pS0Ljx6aQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 23 Mar 2017 17:31:38 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 23, 2017 at 12:51 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> I'm not sure if this is the root cause, but last qemux86 build shows:
>
>
> | configure: error: --enable-gallium-llvm selected but llvm-config is not
> found
> | ERROR: Function failed: do_configure (log file is located at
> /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/mesa/2_17.0.1-r0/temp/log.do_configure.11359)
>

can you point where is llvm-config installed in sysroot ? its possible
its not in native sysroot location ${STAGING_BINDIR_NATIVE}

>
> I've noticed some llvm changes for meta-clang, do we need similar changes
> for meta-oe version of llvm?
>
>
> On Sun, Mar 12, 2017 at 12:16 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On 3/11/17 1:30 PM, Khem Raj wrote:
>> > The following changes since commit
>> > a47e64d985a610535449730806651f5bfd75d9ec:
>> >
>> >   libcomps: add a recipe (2017-03-11 16:08:50 +0000)
>> >
>> > are available in the git repository at:
>> >
>> >   git://git.openembedded.org/openembedded-core-contrib kraj/pu
>> >   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu
>> >
>> > Khem Raj (1):
>> >   mesa: Contain configure search for llvm
>> >
>>
>> I added another fix for mesa-gl to remove one of obsolete packageconfigs
>> and its on the same pull branch now.
>>
>> >  meta/recipes-graphics/mesa/mesa.inc | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

