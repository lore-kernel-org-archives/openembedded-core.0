Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id BFC6478B52
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 16:35:52 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id 92-v6so24500855otw.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 09:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4qx98d3aUvl+CcfUxy+SLT3ul0Wrq+mcijWzbn1ez0A=;
	b=KVHSA/JjgUSb59bfWEaaK0u1TiVLRBV28FLdThNHvGJOBzCVpsGnAKVHw3pRzAWDCL
	xh+tLcTMfCYlgRHz4aBaZYx38T0BBOrGFD87HBlOckJyxSfjdD6nazU2dhI1G9YR0yGT
	8uCSEDYcNEEN9VPjODGYsG05sln7M7gzRhrK3tM0wR2krYvqmVHBOBe2D76vqaWh4Tb3
	8LL1TsKvXW7N1ehJmmDSJIBabxMi2hU8gbZR9w+BhDhwRQN2HFSz7Vi0c7Fr5TuVUhzG
	0tF9p+F/ZgCZnp257BHcC2+YGiDbhD9GWVSf9P8btUwGbWRySgaSmHccA1DaQConhLtA
	f/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4qx98d3aUvl+CcfUxy+SLT3ul0Wrq+mcijWzbn1ez0A=;
	b=JLLo+seOBwsBeCn6sQrEo/m6AGwp/MzWV04oyOGyxs1BeCQ68xtqUiK7EJ5+Pb4AZ8
	qlotdpkaEKk7ZFS0XlKfPy/tkLmmCBp9ZUA69E/A6Ea9eEJXQKvQ7Ni+ChtcAORTbErA
	V9lhrpP4q7A2HXTPBZhAM3wM1sTk0GdIrs9xlyV+dKXrlNL3c2J7QPN6pfNXzKMO88aU
	RsFVLUA5wRaiMMXqyvJ6HqQb/Zjxu1GyY08F021V6AHCTs0ic8YQQIoq6rZ8JgKCYTz7
	D+/1fCzUWtWpRiq7XEdf+aBUowVQkGec+Tp/llwfhnolAubImYIyQIO0EShyHgxkKPpF
	xQFQ==
X-Gm-Message-State: APt69E2tGYQGdnrMImR5fqREk7z/SxBt5K8wz0sxKdjf7F7G8W9XMVpK
	HqRPoUK+pUBIb5IKkHuPM+VKBpe0300MK1wwox+Miw==
X-Google-Smtp-Source: ADUXVKKT0BvXXF1hMjt9e6OirC4slCqipQ65W3AcwaQvG200TpOoIk8yxTGbHyZZksekDzPKARmKfWHKWARkUBbsqYw=
X-Received: by 2002:a9d:2989:: with SMTP id
	n9-v6mr10995207otb.152.1528734953790; 
	Mon, 11 Jun 2018 09:35:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 09:35:33
	-0700 (PDT)
In-Reply-To: <b9a65b20-120d-e399-606f-3c348fc974a5@mvista.com>
References: <1528657273-19021-1-git-send-email-jpuhlman@mvista.com>
	<CAJTo0LZXRFZ2bEgtyjRUGiUyDt_TcyjVUBZjdmtWzGFAE4McEA@mail.gmail.com>
	<b9a65b20-120d-e399-606f-3c348fc974a5@mvista.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Jun 2018 17:35:33 +0100
Message-ID: <CAJTo0LbROwWA+4_suQ=_sxHMHsv_HST16jVqq3Meqm=DFGuTwQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 11 Jun 2018 16:35:52 -0000
Content-Type: text/plain; charset="UTF-8"

I'd recommend deleting the libdir lines in every .pc file (and pushing
the patch upstream).

Ross

On 11 June 2018 at 17:19, Jeremy A. Puhlman <jpuhlman@mvista.com> wrote:
>
>
> On 6/11/2018 3:23 AM, Burton, Ross wrote:
>>
>> Upstream will (and do) argue that $datadir is the right location as
>> these headers are architecture-independent.
>>
>> Would the package manager do the right thing if the files didn't have
>> the libdir line in, so where bit-identical?
>
>
> Yes, if the files are binary identical then the package manager would not
> call it a conflict.
>
>
>>
>> Ross
>>
>> On 10 June 2018 at 20:01, Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>>>
>>> * --data dir config option is only used to install pkgconfig
>>> * Installing into ${datadir} causes mutlilib conficts on install
>>>
>>>    file /usr/share/pkgconfig/applewmproto.pc conflicts between attempted
>>> installs of lib32-xorgproto-dev-2018.4-r0.i586 and
>>> xorgproto-dev-2018.4-r0.corei7_64
>>>    file /usr/share/pkgconfig/bigreqsproto.pc conflicts between attempted
>>> installs of lib32-xorgproto-dev-2018.4-r0.i586 and
>>> xorgproto-dev-2018.4-r0.corei7_64
>>>
>>> and so on.
>>>
>>> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>>> ---
>>>   meta/recipes-graphics/xorg-proto/xorg-proto-common.inc | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
>>> b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
>>> index 7a417c9..7377283 100644
>>> --- a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
>>> +++ b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
>>> @@ -14,7 +14,7 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
>>>   DEPENDS = "util-macros"
>>>
>>>   inherit autotools pkgconfig
>>> -EXTRA_OECONF = "--without-fop"
>>> +EXTRA_OECONF = "--without-fop --datadir=${libdir}"
>>>
>>>   UNKNOWN_CONFIGURE_WHITELIST += "--without-fop --without-xmlto
>>> --with-xmlto"
>>>
>>> --
>>> 2.6.2
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> --
> Jeremy A. Puhlman
> jpuhlman@mvista.com
>

