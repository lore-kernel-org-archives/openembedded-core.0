Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 48A117885C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 15:57:38 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id w13-v6so3528346ote.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 08:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y4DyiaZRNEibFUo2b2TOW1bq6yleTCIbcL5nU0ubzmM=;
	b=C6CHsYpul1UdgPCcCthD7RCTderXc9lLLA2vKFxKTSLvWtNZ7lZgTJ7LKg1q2lB42z
	4PxyQKMp71sClSJUiulkucWD03/kLKBEwaLgZkKngDGkdvDOr5hspcljlFG1azQyUb9I
	T3nm1mOx/PX+qQ8RGD9gl242RQDVE9aZXnz4lw2+6eLdYK4LfKbO6FkGmL86agCmlatD
	ehNQ2fgbI8PKyeceNOuVONO7v1If+Mx4SuMWT2gUlwkmfZLbPlaOy0P5TdI43ataX4BQ
	/OM0ZLOKtn8AOFTlGWJok7DAoxSBK+HyJbSZ4z4cUANPDg+8cIj0v6Bo2e5VQpzowbPG
	+bJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y4DyiaZRNEibFUo2b2TOW1bq6yleTCIbcL5nU0ubzmM=;
	b=HGhghhiO+7WfHLqIWftj/DRdKb4qT4uJbDWtJdVTw1cuFDmoI1zcPfTKFBXqxkcERE
	0Zn1+2g6qv1W6IfN7MZw+uuLNLA7KxewViVCOSfffd0PdDtqyrqGyvc6uqgSURdtPxa9
	o39oloOD6eINZKI1qBeJ8Bg4gI76AXWR7CZMG3YUeQYXQJTXHSmQQcH6g7793NlIyP08
	nEUn/Zq++3Yq0k+fs3tl5+JRfS18Y81hF9f1Vp1FQv6IMl4bGqYgBS97NW/xJOcWNJvj
	K+YLZjBIVp/DxuQL1kFyO0krUQkuqThGAwotf4wu7bSCzBr1sxKYBv1aybF5NYVBGP7a
	coEg==
X-Gm-Message-State: APt69E0DYomkpjUx5u5cjQuCondlWo5JZTOTKd9MoMOld93LWG3+IF6S
	mz7aoAwxeSGs/0qWmGkxW+lMP3Lpr7BtoXuxOXOrmA==
X-Google-Smtp-Source: ADUXVKKNwZIlTBOrPyt1qDkvsbfQoJ7HHYHM0LxeZL3NwlcqocXNYf3IqZR1jYd6WYtL5kFeNCNuNYoUfmKrlj1HmqU=
X-Received: by 2002:a9d:357:: with SMTP id 81-v6mr3633264otv.119.1528905459310;
	Wed, 13 Jun 2018 08:57:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Wed, 13 Jun 2018 08:57:18
	-0700 (PDT)
In-Reply-To: <31dd38d2-b79a-9ece-ec2c-60d96a952730@mvista.com>
References: <1528657273-19021-1-git-send-email-jpuhlman@mvista.com>
	<CAJTo0LZXRFZ2bEgtyjRUGiUyDt_TcyjVUBZjdmtWzGFAE4McEA@mail.gmail.com>
	<b9a65b20-120d-e399-606f-3c348fc974a5@mvista.com>
	<CAJTo0LbROwWA+4_suQ=_sxHMHsv_HST16jVqq3Meqm=DFGuTwQ@mail.gmail.com>
	<31dd38d2-b79a-9ece-ec2c-60d96a952730@mvista.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Jun 2018 16:57:18 +0100
Message-ID: <CAJTo0LYKjecZFQsHRi02_ktgj-G7JjWpuKeFd8L3NAT1ajKhAw@mail.gmail.com>
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xorgproto: Install .pc files in ${libdir}/pkgconfig
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
X-List-Received-Date: Wed, 13 Jun 2018 15:57:38 -0000
Content-Type: text/plain; charset="UTF-8"

Send the patch in to oe-core with Upstream-Status: Submitted, and
hopefully we can drop it shortly.

Ross

On 13 June 2018 at 15:32, Jeremy A. Puhlman <jpuhlman@mvista.com> wrote:
> Okay I did some test builds and nuking the libdir lines worked fine.
>
> The patch is submitted here:
> https://lists.x.org/archives/xorg-devel/2018-June/057123.html
>
> It wasn't rejected out of hand. Did you want me to roll a update to this
> with the submitted
> patch, or did you want to wait to see how it pays out on the x-org list?
>
>
> On 6/11/2018 9:35 AM, Burton, Ross wrote:
>>
>> I'd recommend deleting the libdir lines in every .pc file (and pushing
>> the patch upstream).
>>
>> Ross
>>
>> On 11 June 2018 at 17:19, Jeremy A. Puhlman <jpuhlman@mvista.com> wrote:
>>>
>>>
>>> On 6/11/2018 3:23 AM, Burton, Ross wrote:
>>>>
>>>> Upstream will (and do) argue that $datadir is the right location as
>>>> these headers are architecture-independent.
>>>>
>>>> Would the package manager do the right thing if the files didn't have
>>>> the libdir line in, so where bit-identical?
>>>
>>>
>>> Yes, if the files are binary identical then the package manager would not
>>> call it a conflict.
>>>
>>>
>>>> Ross
>>>>
>>>> On 10 June 2018 at 20:01, Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>>>>>
>>>>> * --data dir config option is only used to install pkgconfig
>>>>> * Installing into ${datadir} causes mutlilib conficts on install
>>>>>
>>>>>     file /usr/share/pkgconfig/applewmproto.pc conflicts between
>>>>> attempted
>>>>> installs of lib32-xorgproto-dev-2018.4-r0.i586 and
>>>>> xorgproto-dev-2018.4-r0.corei7_64
>>>>>     file /usr/share/pkgconfig/bigreqsproto.pc conflicts between
>>>>> attempted
>>>>> installs of lib32-xorgproto-dev-2018.4-r0.i586 and
>>>>> xorgproto-dev-2018.4-r0.corei7_64
>>>>>
>>>>> and so on.
>>>>>
>>>>> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>>>>> ---
>>>>>    meta/recipes-graphics/xorg-proto/xorg-proto-common.inc | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
>>>>> b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
>>>>> index 7a417c9..7377283 100644
>>>>> --- a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
>>>>> +++ b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
>>>>> @@ -14,7 +14,7 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
>>>>>    DEPENDS = "util-macros"
>>>>>
>>>>>    inherit autotools pkgconfig
>>>>> -EXTRA_OECONF = "--without-fop"
>>>>> +EXTRA_OECONF = "--without-fop --datadir=${libdir}"
>>>>>
>>>>>    UNKNOWN_CONFIGURE_WHITELIST += "--without-fop --without-xmlto
>>>>> --with-xmlto"
>>>>>
>>>>> --
>>>>> 2.6.2
>>>>>
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>
>>> --
>>> Jeremy A. Puhlman
>>> jpuhlman@mvista.com
>>>
>
> --
> Jeremy A. Puhlman
> jpuhlman@mvista.com
>

