Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1A9C562132
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 05:16:14 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id p65so50202549wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 22:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=2vC+gWvauPUMi7pYenELod9MUtppYpnhoYCAdO2xwSE=;
	b=f/U0uaaHOnSIKk67bjGlWLhxbfIQ34A1ab18w4faHLPvxD9zkiw2fX8QSkFOPIyBQn
	u11FVQMIW7m00SavvY4ehyoLCZ81/Imh0SJkqYClYbr1eLGkqOy0Q4HsulkYmDMldHLt
	XK9VmYbvtih1083nHu43Ax6OAEUsFfV0PmYnJXJMzXCZajT+m+iLD3JtjBJ09noKLcGy
	dOTnhFAZa++fdj6JCfCrdxw2yzy1upWpaOjtVLgw4sv8/TyeNfo4O1Ma8ejGiY9OJMv6
	Pthq3IMZ0ZV9XqnWv7IyA9hi7hHieWOjzGdYx4pHU6RZwoYuYW0zGx0rp+ANWYJU+Uzl
	evGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=2vC+gWvauPUMi7pYenELod9MUtppYpnhoYCAdO2xwSE=;
	b=BkonrGvUmes2Q+xQaI9yWwbadfrKaR3xeqBntUBFJYMFVgPCMNxJfmnQ4yRxqNwy5Y
	eYESwP5TX13tZBo1Ow3dTERgaNHxV1MjNBvBMtCAP8HpIzbWKgIvFc/rYI+HJQVcrgfY
	wz/arUijH6SyPUblqRSNY83DbnFvfTEvPz/Whl7WGo/91PzIbgiSutAQKw0Biqmkihy0
	sgvudoJEh/Bn8n/WlWjIO7eBXMwClT0xrs5nSlbElqGaO6Zv+KnbN1qs3YU2ZwSN7cvL
	v2jgWtsNXHhjtZAgA3mBk1QTaH0kT6Jui9bZ/LDMVLSBfgi9sP7LhOwu+Ou46/Mu46ng
	NFqQ==
X-Gm-Message-State: AD7BkJKAmiCnxrlssgqKR2GUB1KzffB/AdV0rin93srO0UURmUXP1PDhaGm9zW7ynvcRxD8lH8PoBpP9vXlLLA==
MIME-Version: 1.0
X-Received: by 10.194.103.227 with SMTP id fz3mr7265247wjb.43.1458796574826;
	Wed, 23 Mar 2016 22:16:14 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Wed, 23 Mar 2016 22:16:14 -0700 (PDT)
In-Reply-To: <CAMKF1spVnsTtz4Wwa562aVaafzSUR3tJrrvstRGjRhT-VGOUAw@mail.gmail.com>
References: <1458789553-3629-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1spVnsTtz4Wwa562aVaafzSUR3tJrrvstRGjRhT-VGOUAw@mail.gmail.com>
Date: Wed, 23 Mar 2016 22:16:14 -0700
Message-ID: <CAJ86T=X4fDmNRjWv4nNPX3U3+Ak=z+2psGtTgFvt4-ga7b_sEg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-configure-common.inc: duplicate armv7a over-ride for armv8a
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
X-List-Received-Date: Thu, 24 Mar 2016 05:16:15 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 23, 2016 at 9:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mar 23, 2016 8:19 PM, "Andre McCurdy" <armccurdy@gmail.com> wrote:
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc
>> b/meta/recipes-devtools/gcc/gcc-configure-common.inc
>> index f4f76bd..a7b8d63 100644
>> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
>> @@ -65,6 +65,7 @@ EXTRA_OECONF_append_mips64eln32 = " --with-abi=64
>> --with-arch-64=mips64 --with-t
>>  EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
>>  EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
>>  EXTRA_OECONF_append_armv7ve = " --with-arch=armv7-a"
>> +EXTRA_OECONF_append_armv8a = " --with-arch=armv7-a"
>
> Armv8 is different architecture and even gcc backends for armv8 arent shared
> with armv7. This change doesn't look right to me. What are you fixing with
> this change

In the context of oe-core machine specific over-rides, "armv8a"
signifies that we're building 32bit code for an ARMv8-A class CPU.
See:

  http://git.openembedded.org/openembedded-core/commit/?h=master-next&id=823af99d825375485d64fcb82c00fb85004813b8

(Maybe it would have been better to use aarch32 as the over-ride in this case?).

>>
>>  EXTRA_OECONF_GCC_FLOAT ??= ""
>>  CPPFLAGS = ""
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

