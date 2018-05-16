Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id BB1DA7488B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 14:39:07 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id j186-v6so2483435ita.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 07:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T6IELybcafhr5hB/EpOeN+Gav+dcrcWe38uaVFBN/d8=;
	b=BmusgNe6XBOclMSd3vtawkmTWTcQBkHJtTPxjMZpvfRTmgiV5DNVg77V66TeUQfB9U
	o/8nWRM6RKJDk2BbO9BK/E1wkGCQFpS+XDVnC4MaPL2+gQANQFA/WD0EP/D1TaxfkLEn
	DKsIlSiSBy/Jm96yOa0dT2iRzWSTL0AWRKBDWMmXKHpDW3q7R37o3PTjx99gVWq3sk81
	0nH7+cWQseUIxISD8n5hd9sgEqWt40jxDsuhjPMmnXPOzd1Y3gUuzWGA6RCXLCa9UeBe
	e+Im2k3gs0PQm/ri3EklmJOb2lyAOSuxiGMgPzahSY6/A9Aw+JD8PcRKpNC4iWPI1GVl
	ajow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T6IELybcafhr5hB/EpOeN+Gav+dcrcWe38uaVFBN/d8=;
	b=HvCAOAjVRLsbgFOmY+dBOe8yQi/aYeZ3uVPTcyxQ+33etTmybLZ/ZLfev7F2AsBtEM
	DfWgoi7LPS83vHryRiWNuj1HEZVDtHnNQiCyFcm/QlwesWBnPUuuWqsLjZcaX7ufHVyB
	jfMI2m1k1t3pmb5R3PG/7232ijS/R2/OB6E1fs9jvvcnAWeUIWTQxRD48LCxcII093Fz
	L8oc0WPFaoXilnPDzqGDhKt9+aoou2UrfVp5JeFZONi0EeTfxubBSujaiC+zDeRwp6wz
	P26dkv/bbH0zW9AfjOBiEe8bCLdswC5O4kuo+lqwHQ7X28+Pa32BPI5LDZg50rSIwK4v
	JOCA==
X-Gm-Message-State: ALKqPwfoFBn4GPV0Sj3vX2vUqImgB/xfvawn73DPMZH2XWN9Gu3muO8/
	xlmIcRbIgsQlL0b6AO8X1ryF+ayZ/ZV0H68NM+lo3g==
X-Google-Smtp-Source: AB8JxZoCntElTup/CkSsA/PNhpOl315z6gh3z34ey5Fn4ljPZLuvvEo8Yq7BB/8DEzIOI+hfPZ47QFc3LZuuwRFGNY8=
X-Received: by 2002:a24:d2c4:: with SMTP id
	z187-v6mr1312354itf.60.1526481548556; 
	Wed, 16 May 2018 07:39:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Wed, 16 May 2018 07:38:48 -0700 (PDT)
In-Reply-To: <CAMKF1spJ-jTxMw4c65mqwH18P=CvLrJzA7Crcizfbr-pEM58Kw@mail.gmail.com>
References: <cover.1526452205.git.raj.khem@gmail.com>
	<13936651721b14a74b51c673c35c2b514299ca6c.1526452205.git.raj.khem@gmail.com>
	<CAJTo0LZL0Fs7i-+tm2KVw7htYkgFJFpYfEkCq1=Dda_0n9rpYQ@mail.gmail.com>
	<CAMKF1spJ-jTxMw4c65mqwH18P=CvLrJzA7Crcizfbr-pEM58Kw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 May 2018 15:38:48 +0100
Message-ID: <CAJTo0LaSp5M6=4MRaKwHgXdM=j+ftM2i0grf60d_eb4++=Fd_Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] musl: Make dev package rdep on staticdev
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
X-List-Received-Date: Wed, 16 May 2018 14:39:09 -0000
Content-Type: text/plain; charset="UTF-8"

Surely in that usecase you can add musl-staticdev yourself?  Forcing
it into every SDK seems wasteful.

Ross

On 16 May 2018 at 14:32, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, May 16, 2018 at 4:09 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> Surely if you want to support static linking in the SDK, you just need
>> to add staticdev-pkgs to the SDKIMAGE_FEATURES?
>>
>
> In some usecase, compiler runtime and c library is only required everything
> else is external. Adding whole staticdev bundle would conflict with that
>
>> Ross
>>
>> On 16 May 2018 at 07:32, Khem Raj <raj.khem@gmail.com> wrote:
>>> This is needed for enabling static linking with SDK
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>  meta/recipes-core/musl/musl_git.bb | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
>>> index a0a098f5b4..d7d201df9d 100644
>>> --- a/meta/recipes-core/musl/musl_git.bb
>>> +++ b/meta/recipes-core/musl/musl_git.bb
>>> @@ -66,7 +66,7 @@ do_install() {
>>>         done
>>>  }
>>>
>>> -RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev libssp-nonshared-staticdev"
>>> +RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev libssp-nonshared-staticdev ${PN}-staticdev"
>>>  RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
>>>  RPROVIDES_${PN} += "ldd libsegfault rtld(GNU_HASH)"
>>>
>>> --
>>> 2.17.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

