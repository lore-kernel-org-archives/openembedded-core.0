Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 68ACA6069C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 03:07:07 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id w17so2833202pgv.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 19:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PpFzaH+esmrwbx+oZ1poxnFsbQxQuwqVB7Rs3NGP3XQ=;
	b=Ghu7YdImIEvMZiv9XXeyWq7JP2muRmyoYkeijihaJ4Ld3sau+h0xc2Ca2mod6pL8Vs
	jbPloVBwtghdluVax1EYy3vEriMdEw4yNP0sqZJXtp3pzXxaNND9eCANvw99UiLMxX06
	amNKkXvY5s+SyR4/MGwiLFvZW9lSnDWbccH/D2u4KpKe4wgDCC+oILUkvFi/7NcgZUle
	JgUQKwx81zkwn57C/aC380Xw8hritemM1yVsCSv+rOveyLAC7D/6jHLFSLoX2pKrD9KH
	i+RDf+3Y7dMkks4BdhAf5ps0PEUKXvIGLgjUlAjw8QlAvLI3juMGmJeTDCExEbS+DXfh
	u1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PpFzaH+esmrwbx+oZ1poxnFsbQxQuwqVB7Rs3NGP3XQ=;
	b=FDaLqi5FWHIm/SCuMcwwz5/pllsvfzULDO/eQS2qyqCeI4NxaKCUQJBdAzfsGHhFch
	TCL5FyKgfXATFT5thafjZ0OSSRMc5ClxiiTO6wTeAVb/dSW+42eB7FzhjUGXXCmtjJCo
	589deOnxkYtO94fgy9wJo5vMlQXrc9TpxEppEz+q+7Wt3MokF8yjriMZxyBtyhWfkYLC
	jTnglNTOL+UmCZNt5CwFIr7TRxXR839OXVlCfABdXG/UoGvUFmV4sZkyQ7JTU7woefFF
	Q3wP9AQssStWUeTz3cJ+/VzQRhNbejeyv1vQMmVyJTxuu7vRW/yV7v7tMoz4uJFEY/TP
	T//w==
X-Gm-Message-State: APf1xPA68jJ/W13Nm5cM3wGiDg+e+HFerW1BVV3ALf49SY1W4/9X2tc5
	/bMmNbWh+9L1MY/VMpgpZqOPrKtATxYlhT5JqBI=
X-Google-Smtp-Source: AH8x227l0nGCh8SOytKhcOJ0Ml9Sfzkh2EquCNekZg5zLeNKph53FMlzWZ5jgZoUaBm9V895nLr70+57lx1Co5w4GvU=
X-Received: by 10.99.61.75 with SMTP id k72mr192744pga.384.1519355228323; Thu,
	22 Feb 2018 19:07:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.139.97 with HTTP; Thu, 22 Feb 2018 19:06:37 -0800 (PST)
In-Reply-To: <089d4714-011d-5cca-5af6-8f7a8e3568c4@gmail.com>
References: <cover.1517524576.git.raj.khem@gmail.com>
	<aa96375d5517a1f0170609aac7283bd71566f46a.1517524576.git.raj.khem@gmail.com>
	<CAJTo0Lax4NpwLPN2Ly_9seKFLYp-qCVJCuyzXhtN6aiXKgVKRg@mail.gmail.com>
	<CAMKF1sp8riyhF=6N_ak-TyZ6_w=aj+az=qx+mjepXPQagV7vqw@mail.gmail.com>
	<CAJTo0LYEO1e2i_dnXDT7sNRyScH_KT3Ge38yWundnr2hk3de9g@mail.gmail.com>
	<089d4714-011d-5cca-5af6-8f7a8e3568c4@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Feb 2018 19:06:37 -0800
Message-ID: <CAMKF1spdL49Ny-yqk+n-k0JSU8PGVQyv43MgpZU_fOwVc1Fr4A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] glibc: Upgrade to 2.27 release
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
X-List-Received-Date: Fri, 23 Feb 2018 03:07:07 -0000
Content-Type: text/plain; charset="UTF-8"

glibc community thinks that the way we are depending upon old
localedata while using newer
glibc in nativesdk is not a supported usecase, and there is no
guarantees of internal data structures changes between major releases,
like what we are facing here. The suggestion is
to ship own localedata instead of relying on SDK host. You can follow
the discussion on glibc
thread I added in previous email and if have some suggestions or
inputs feel free.

I will try to come up with a patch along with this upgrade to add
nativesdk locale along and
check if this fixes the issue we have

On Sat, Feb 17, 2018 at 11:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Wanted to send update on this issue
>
> I got to bottom of this issue and Ross you should have known it :)
>
> https://patchwork.openembedded.org/patch/127105/
>
> introduced an optimization into nativesdk glibc to let it ride on localedate
> from SDK host. This has now broken in glibc with
>
> https://github.com/kraj/glibc/commit/95cb863a1ef7760a11272bbd7ba5fe62dc41be54
>
> it is recommended for static programs to be relinked if using glibc 2.27
> our case is also similar mismatch of libc version and localedata just in
> opposite direction where we are trying to read old data with new glibc
> instead.
>
> I have initiated a discussion within glibc community on it to explore what
> options we have, but be prepared to ship full localedata in worst case with
> glibc 2.27,  this might be the worst case option if no alternative is found.
>
> Thank you
> -Khem
>
> On 2/15/18 4:12 AM, Burton, Ross wrote:
>>
>> Yes, that's it.
>>
>> Ross
>>
>> On 12 February 2018 at 07:32, Khem Raj <raj.khem@gmail.com
>> <mailto:raj.khem@gmail.com>> wrote:
>>
>>     On Sat, Feb 3, 2018 at 2:21 AM, Burton, Ross <ross.burton@intel.com
>>     <mailto:ross.burton@intel.com>> wrote:
>>     > Getting there: https://autobuilder.yocto.io/tgrid
>> <https://autobuilder.yocto.io/tgrid>
>>     >
>>     > Just two actual problems:
>>     > - The non-gplv3 build failed as the make fix needs to be backported
>> to
>>     > meta-gplv2
>>     > - The eSDK selftests all failed with en_US.UTF-8 problems, the new
>> glibc
>>     > shouldn't be causing a problem with uninative so this is
>> interesting, maybe
>>     > the new one is behaving slightly differently.  Should be easy to
>> replicate.
>>     > The same problem caused selftest to fail.
>>     >
>>
>>     is the UTF error like this one
>>     https://gist.github.com/25a84d23618824f0e5e6857a960eaca4
>>     <https://gist.github.com/25a84d23618824f0e5e6857a960eaca4>
>>
>>      > Ross
>>
>>
>

