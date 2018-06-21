Return-Path: <alistair23@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id A78B376099
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 21:02:41 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id g21-v6so6320423lfb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 14:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0+aNlORGBGXdRgR71FNkQwRZPBLK+l4DWCf64DPLy7U=;
	b=FDV+rNRE2Krjli7d1hewS2H/sVomaadhpXNcsOM5+Rsg6rvv7NmzKYEwm0Ljt5ik+9
	1qeNSisrk3wcIFzjx/QHb9GYGcJjTv+BonEgZZJTuF3+DYCX96eQmUP96j9srCWBId29
	uF6uf3DLcAbPYzaY+rBzBNYLRyhP8KBWCKiVbGdTdOZ75fOm7yeg7JV5gpaCtqsi8DcF
	v4JlM01H0lOlqJ+inDnE6FNCJxH+WeYIUm7uDwgTYybfdqjt0UduaJvmnHbRRBtTCX2F
	AXlr5dtdaQl3KWT3dhDM/uWI2GnyYruQ1QlEWjRlhHy98pKTOaJylwYLJ3i+WOSucNiq
	pLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0+aNlORGBGXdRgR71FNkQwRZPBLK+l4DWCf64DPLy7U=;
	b=kcr9OAs3vXRslkhG1Yib4jlJeObb44x/X/hu9wDBuXJ0LKQrFeQ7s6dWJeweDvUyMZ
	4z8d1cc2p7rxFCt/CqCw140X2WL+2Cpm+UUedq/OhMGHB2Z0QtAAaGF3wIjLr/JPHGv8
	KkWCufOvb9d5Xe2CBR341+yoHlUE3n04h9j1hASqW+0pkovWNO27AqpvgfebigbjIUpA
	aEDnd9B2Ky3bxMuYFztmdk6oWGMxc+j9/biWTcaZ5SiTgwEkfMry4nIWmHm2XkYqasGj
	cm4IHtsLlgo1BZ/17KBO2vDJGVGTyL3m/ARzB3tpeL+oPOXpczIT0O5dmaQqDm8uiKJg
	d7dw==
X-Gm-Message-State: APt69E0cs/fex3k5X/hoP0uiZu7PGYNb4BE7+y0z/rOWFxTm9Dk+0Rbl
	vF69dyLa2XvaMzsV6eTvu3wtkUULb5l+odx1hOP1zg==
X-Google-Smtp-Source: ADUXVKL9B9/LYI5SBRv5s4o1TV8AmEIxUOqw40X2V0W/nFeqyZZqbhLUpNsx8XUZ9kLXaBkP3BOR+/9UZKt996qCmFo=
X-Received: by 2002:a19:a283:: with SMTP id
	l125-v6mr11032215lfe.100.1529614962367; 
	Thu, 21 Jun 2018 14:02:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:4242:0:0:0:0:0 with HTTP; Thu, 21 Jun 2018 14:02:11
	-0700 (PDT)
In-Reply-To: <CANNYZj_cWfMG8eALOcmuHU62RvmyuZDryEp6RbkZkqFAMPEUQA@mail.gmail.com>
References: <20180614194507.93168-1-alistair.francis@wdc.com>
	<CANNYZj_cWfMG8eALOcmuHU62RvmyuZDryEp6RbkZkqFAMPEUQA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Jun 2018 14:02:11 -0700
Message-ID: <CAKmqyKNSJqF5zqQfp_8dpo1d_9tuYXpUF6+Q2-tVg_WOGFJnUw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] recipes-extended/psmisc: Don't exclude autopoint for RISCV
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
X-List-Received-Date: Thu, 21 Jun 2018 21:02:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 14, 2018 at 1:15 PM, Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
> Don't exclude why? Needs to be in recipe comment.

Apparently this is no longer required. I'll remove it.

Alistair

>
> Alex
>
> 2018-06-14 22:45 GMT+03:00 Alistair Francis <alistair.francis@wdc.com>:
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  meta/recipes-extended/psmisc/psmisc.inc | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
>> index 82ef947709..73b4c56f69 100644
>> --- a/meta/recipes-extended/psmisc/psmisc.inc
>> +++ b/meta/recipes-extended/psmisc/psmisc.inc
>> @@ -19,7 +19,9 @@ inherit autotools gettext
>>  # Upstream has a custom autogen.sh which invokes po/update-potfiles as they
>>  # don't ship a po/POTFILES.in (which is silly).  Without that file gettext
>>  # doesn't believe po/ is a gettext directory and won't generate po/Makefile.
>> -EXTRA_AUTORECONF_remove = "--exclude=autopoint"
>> +AUTORECONF_REMOVE_ARGS = "--exclude=autopoint"
>> +AUTORECONF_REMOVE_ARGS_riscv64 = ""
>> +EXTRA_AUTORECONF_remove = "${AUTORECONF_REMOVE_ARGS}"
>>  do_configure_prepend() {
>>      ( cd ${S} && po/update-potfiles )
>>  }
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

