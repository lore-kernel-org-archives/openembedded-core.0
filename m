Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 278DA6FF84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 18:46:24 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id m85so124153321wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 11:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5krLQhsGII4nVM2tAESs+yHr97oeJckasCfYWPhHxHk=;
	b=PPfwQyLcywYQfo9u4ObLOpAWCdJnrB7rDnfGmLZsjrq0y92jYhGYi5Qp/BDY2C6HaR
	2wuzOYkjo0U/ZA5/lYHbFDm73sf8YAkuZPpMDeynHxgnr0U4tjRXt4vIIcgprK7qr76P
	XuaTpwXp5xCDx4l6LMhW/tuklK/1Ob28/qa6kaufyx2PKHMVrXv22ajCY9Mqs6MfbIB/
	R+J0wmXYwSkBG8PYwA+zf/lfRheAOnW3G2r1u9+WdYkZasUSb8HX1P7O/ubKbaJsGLRs
	KvMt6oF/U8ZZrR5lFpafrdOYxAAk7Mbf9eNftKgSJAsSUJHig32yXPOu0DAif05tBTho
	qetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5krLQhsGII4nVM2tAESs+yHr97oeJckasCfYWPhHxHk=;
	b=jWuwmZCcPZuzIjehghUHdWhvaLp3CX9TeHxLUmzgeJQBLtbUhjHfq84e0BdqhlfzlZ
	tDwuCkXW8BF4xu2PV1aEjxeyjHDY31eW6CmvHAo05JuKpuHbNfNEQnjNIaPSBjVDw1ke
	WyMDpuXZ+rqTFJmDQZNOksdLulUpfJKrlcIrGruPodC0A7PZ1MV1a+Qs0SQDjtzCgcWX
	4eJy2nSHyGPURgrZ3KF4Ms2n8L7pWED6VOz4xfjwJKil8rTvuFsHs/92Cryu4jI6U8+U
	zmSpaKOQgqGtKSimBJEz/yKzznicZW70jcb2FfI2Qd5iwESvtl5NQ6X0/x7Zb8Q5eAS5
	UVyg==
X-Gm-Message-State: AIVw112KxHiqUQlyTfSKk5SpRKSFt1kKrrWybsJfAas0DASizRuM40qF
	HHFGGswwXXjs++NkjXDF/sP8R9lwwA==
X-Received: by 10.80.218.3 with SMTP id z3mr6156882edj.228.1501267586038; Fri,
	28 Jul 2017 11:46:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Fri, 28 Jul 2017 11:45:55 -0700 (PDT)
In-Reply-To: <1501267389.18875.14.camel@intel.com>
References: <cover.1afd007ce6c93979d7d4cc2eb225b84710ca1a65.1501253351.git-series.patrick.ohly@intel.com>
	<97b966925eaaf20263e0f8938806b6e015fc6c70.1501253351.git-series.patrick.ohly@intel.com>
	<CAMKF1sq12PyVfGStOaeuSBHx0c96chYuD7jM27pfpcm9zNurhg@mail.gmail.com>
	<1501267389.18875.14.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jul 2017 11:45:55 -0700
Message-ID: <CAMKF1so8zvtzqXsaFqgV-fCWLCG5kb-uW7r0_txLQHXNFR7DFg@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] autoconf-archive: simplify and fix recipe
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
X-List-Received-Date: Fri, 28 Jul 2017 18:46:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 28, 2017 at 11:43 AM, Patrick Ohly <patrick.ohly@intel.com> wrote:
> On Fri, 2017-07-28 at 09:44 -0700, Khem Raj wrote:
>> On Fri, Jul 28, 2017 at 7:49 AM, Patrick Ohly <patrick.ohly@intel.com
>> > +LICENSE = "GPLv3"
>>
>> Perhaps  GPL-3.0-with-autoconf-exception would be more accurate here.
>
> I wasn't sure whether such a thing existed already, but yes, as it does
> it could be used here, with COPYING.EXCEPTION added as second
> LIC_FILES_CHKSUM entry. I didn't want to be that fancy, but I can also
> do a v3 with that change.

yes please. Its important from compliance perspective, and compliance is
never fancy :)

>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.



>
>

