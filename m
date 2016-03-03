Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7F64E6FFFE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 06:24:58 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id y89so9998979qge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2016 22:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FgkgG8qrvkCrvBeEzb1azabdQ/JESxB28h6RNsjAoLw=;
	b=KbOUX22sQngTMFO2eumLUXGog+ZHG8Xm7VPnDJxLf0+Q2557XJi1AKoY7UAKSVMi1N
	BOw6Fv+4O5GtV93ovVuD5rU4AIcs3srpGYrs9FdiXzLZ1xOBK2vTTG6uYkHmdgnBav05
	9NJnmLhXXjzNa9Uc9xIka3Uy8rVHGZgE7zhKKGGsGd9SO7gJ+zFexZlLqyOvjniw7WZD
	jJ4Q0wqrTwHx5RR0NmgiqtfG9p7aRWq/DAwsh+RVjv1glaBKxND0m45sQMeviRHCpuFg
	4vzzn8ZZDvKLGU8Wnc9Ly7Fee45LpQKWGlFX7JGAjaW5PVuxh7Mpt3dNa7IinrV5Q7Q1
	hvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FgkgG8qrvkCrvBeEzb1azabdQ/JESxB28h6RNsjAoLw=;
	b=SmmMyPUp/W2fTFPYXx+AtY38KTQbgDTEBFIv2cwtWm6ZM1kRSA9OhA5azXpC3QWsmy
	wPGTe6qnUI/sW9aRZbYNUCzbSxSVU30/hODF2NBzigeDk/iYc7qY4WmuFrBjFpGlnl5f
	NguRzTr+4XdQBK/0tETFdoyqqB9HIq2NpmPqc10t7fU27qby92iYaJ3vbEAV2r5GeZ+6
	w0rZdopxdOTlBxdX3N5M5GFWUR4KFiPzJ15do8wNBMXDE3AU/GNZkVwb8rsrNhJnTpOo
	JemvB846+Lgg+I2SbkYtgN5GmNTIT3E307T23NUIrOcrM/enJRCdcPjXr3WHdbr4NnnC
	OppQ==
X-Gm-Message-State: AD7BkJKsBz73qDw4l4zcinO2X24O/qCX+J8qTSbxVo/QcLLHwpElz5+edDKEWOk7g3ASsXZLRDy7mdwRZelL9w==
X-Received: by 10.140.180.207 with SMTP id b198mr983348qha.41.1456986299437;
	Wed, 02 Mar 2016 22:24:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Wed, 2 Mar 2016 22:24:30 -0800 (PST)
In-Reply-To: <56D7D404.4090500@windriver.com>
References: <1456981633-16756-1-git-send-email-armccurdy@gmail.com>
	<56D7D404.4090500@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Mar 2016 22:24:30 -0800
Message-ID: <CAMKF1soUxs=Q0qABjqsp8XDppipHTKQkOUB0uVC5aODCkSBk9A@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-runtime.inc: disable libitm for little endian MIPS too
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
X-List-Received-Date: Thu, 03 Mar 2016 06:25:01 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 2, 2016 at 10:04 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 3/2/16 11:07 PM, Andre McCurdy wrote:
>> libitm is already disabled for big endian MIPS, but needs to be
>> disabled for little endian MIPS targets too.
>
> No objection to the patch, but do we have any little endian MIPS currently
> defined or buildable to test?
>

most of mips based set-top boxes are mipsel.

> All of the samples I've seen are all big endian these days.  (QEMU or actual
> boards.)
>
> --Mark
>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/recipes-devtools/gcc/gcc-runtime.inc | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
>> index 707db37..1c3dd54 100644
>> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
>> @@ -12,7 +12,9 @@ EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
>>
>>  RUNTIMELIBITM = "libitm"
>>  RUNTIMELIBITM_mips = ""
>> +RUNTIMELIBITM_mipsel = ""
>>  RUNTIMELIBITM_mips64 = ""
>> +RUNTIMELIBITM_mips64el = ""
>>
>>  RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
>>      ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmath', '', d)} \
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

