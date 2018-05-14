Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f170.google.com (mail-ua0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6F883754C5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 18:47:01 +0000 (UTC)
Received: by mail-ua0-f170.google.com with SMTP id y8-v6so9085188ual.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2018 11:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ilYGPVAd0ousbq6lEe/zfXJZumH9MTNh27KGON3J5bY=;
	b=MgrdVzMzNz40dHrPQHjdl2s5qxCtyc66UI+CRcQ22ofFw/lGLujNibdEzmq8Yko8VP
	wVuzfbHatc9znzcNQAzlUiJRmY1OgrYL8y2Yn31VKUrC7p46H3FI3HZjHM/rZ2RhWXhy
	wST9IeKWwpRRFoGb5fxY50y9BwTd4grAXsevGolu2jYgg2knAYXrntRs1lJYLRWrqthO
	Z8NEAMXO3WJIGZwlyWfTwfB80WsIJdWX9o8ff/4rwicYUVgTyVx5VXY4dNtY2M6E1CTG
	muHSGnu3NduTqIOalG0rZYdsMDmukX22e+mEsMQ49M9PuZNjFKA4S4cdy5UXZcBz029o
	z3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ilYGPVAd0ousbq6lEe/zfXJZumH9MTNh27KGON3J5bY=;
	b=tQkpF4+HjhXHCroRxLTksmbPHeqG56OqNsFHw5qo7m99OP1fuc2f3ZuPqES3upDaDQ
	r6t0Ts8M4V3gW0YeqlNxxOI2ss+/nm1I/HxXhgoEq339hAcQtzIrH5TAnvRXcy0BoOfi
	Lhm5XTahFsDJOJxWA/EkP5mV07MzXkPOUxLS1YrK25zmDDlcFwneRrzrmB9CUJD0DmvQ
	+NQk0fSmBcOZY1eJzroon/hwCPYzZf6Bsj+TYVL9ctcM0DpefCnWsaGdJUKfg+vOqtdb
	F0gKbjO+78BUWG1pYX0IN2wV755F53Khggkznslw0e0M2D4lIrOu4o3RbKXK13JjBtqO
	HihA==
X-Gm-Message-State: ALKqPwfJUbRGYSpewgm1OAymaOmJKnU6XUGU2maojo1gon+NUz+1s4tD
	PkJORShhRw/V1l1KBEMFmYb25ZkwnXrprQZNLBU=
X-Google-Smtp-Source: AB8JxZq6Qfu2ns4mTrYfK6UfYPimC05TOl/Gs7P8H6vHJrlhwqeRQB6m+FIJd+8yfaDRx5Z0/nZnKR6fi82q8YN1Jvg=
X-Received: by 2002:a9f:2823:: with SMTP id
	c32-v6mr13580794uac.193.1526323622066; 
	Mon, 14 May 2018 11:47:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.48.148 with HTTP; Mon, 14 May 2018 11:47:01 -0700 (PDT)
In-Reply-To: <2a39f03d-6e92-7c80-dd87-971fcfd57665@windriver.com>
References: <1526083324-13743-1-git-send-email-armccurdy@gmail.com>
	<2a39f03d-6e92-7c80-dd87-971fcfd57665@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 14 May 2018 11:47:01 -0700
Message-ID: <CAJ86T=VPyGZMifdZmASU5pTjv_3WeK8L+bmcOm54vfhD_jdt5w@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] default-distrovars.inc: drop obsolete LGPLv2_WHITELIST_GPL-3.0
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
X-List-Received-Date: Mon, 14 May 2018 18:47:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 14, 2018 at 9:18 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 5/11/18 7:02 PM, Andre McCurdy wrote:
>> There doesn't seem to be a clear reason to have two separate
>> variables to hold whitelisted GPLv3 recipes. Both variables are
>> treated the same, so adding a recipe to LGPLv2_WHITELIST_GPL-3.0 is
>> already equivalent to adding it to WHITELIST_GPL-3.0.
>>
>> Anyone needing to whitelist a GPLv3 recipe should now just use
>> WHITELIST_GPL-3.0.
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>
> ...
>
>> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
>> index 76d09af..2f46e13 100644
>> --- a/meta/conf/distro/include/default-distrovars.inc
>> +++ b/meta/conf/distro/include/default-distrovars.inc
>> @@ -24,7 +24,6 @@ DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
>>  IMAGE_FEATURES ?= ""
>>
>>  WHITELIST_GPL-3.0 ?= ""
>> -LGPLv2_WHITELIST_GPL-3.0 ?= ""
>
> I don't have enough context to know if this matters, but there are a number of
> GPLv3 tools, that have LGPLv2 libraries.  I believe this whitelist was added to
> specifically allow this these items to be present on the system, as it was a
> distinctly different use-case then just the GPL-3.0 version.
>
> (Not sure how relevant that still is.  Is there any documentation in either the
> documentation.conf or guide?)

That used to be relevant a while ago when LICENSE was applied to all
packages created by the recipe. Nowadays, LICENSE can be defined on a
per-package basis, so the case where a recipe builds (for example) an
LPGLv2 library and a GPLv3 demo app and an image in a GPLv3-free
distro needs to include only the library is handled fine without any
whitelisting. The cairo and gnutls recipes are examples of that in
oe-core.

