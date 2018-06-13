Return-Path: <jpuhlman@mvista.com>
Received: from mail-ot0-f195.google.com (mail-ot0-f195.google.com
	[74.125.82.195])
	by mail.openembedded.org (Postfix) with ESMTP id EAE207718B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 14:32:28 +0000 (UTC)
Received: by mail-ot0-f195.google.com with SMTP id l15-v6so3193905oth.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 07:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=6mX3uBEnvDwbdamJtqJn19Ik7QkG43lLW+7ddM/+6LA=;
	b=ZvjOXgaN9qi/xEZG3k9Crx1BETBL8jRjtkZ7xQ5rlm3wt46AAk1ldOhUS2NiGboRbJ
	7w2uXBaKJMcINpjKRRoIqRTLkdGCMcPzrQr+kifef4PtDr6cuRNYt7H0Y4m0ulxLlJpF
	zRxuHQBFGSbOABSR02LleQudr61jI6+r1nH4kssTx9KnkPZSWe5QW3qF1MvsOS9C5N15
	nT5XVn1gmbtzEJbblztYfZU27+v6st16+cwGr/vlLisF3WcHl9nSbzcI1+7ZWKLqZ3wP
	Pbd6wnWZ6QaH4aicSqvDbia4rtgkCro5+bKusLJ0fEr26tY5d+1N6wkXfyMC2GroLbYP
	N+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=6mX3uBEnvDwbdamJtqJn19Ik7QkG43lLW+7ddM/+6LA=;
	b=GH7oEfZEGzJnKYpXVjDH6IJZMDJp1LB8RBXi/r6J8y1sQmUPbJy+pVdNgI3dRBBd6w
	OwTq/XAXmrWNKTLJSLmv5k1lQJYo5LhIhs9Qz3glQ6IfdC8HxqoEPl7kH6XYBE30Y39Y
	fHOzxd00I4lhiLYyJZ6luOQDkSGc+xIe9icLNIWdjh1jGkb7LrM7SQxNVGi5TUKrJc8v
	whrWLnjroCnvMD/o+CD7U78MmTbyp/C0XnOVVpS8m6vuJL/JMuNRNMTTUww3FThgdZ5C
	mDOIq5C5MFly5awCsjUP9ByOLc87O4L7of25vNrDS8K+o8yRKLvJf2rq/2XkU5IVSEXA
	dZUw==
X-Gm-Message-State: APt69E0zd3K5KtNT0Kwy9XNB+ki/wjOkQMomJUheEkGYv7sFADFwz7Re
	WgpdkKipZJKQMErnwz1DaJcC8pMqJ4o=
X-Google-Smtp-Source: ADUXVKI/RC8BgYavmKpHaHL/wguv3dVAFrzDfFkvZ7LWZRtRA5h0AoGY/5u1K8pw0t239uFxYe0crg==
X-Received: by 2002:a9d:269b:: with SMTP id
	l27-v6mr3480684otb.174.1528900349580; 
	Wed, 13 Jun 2018 07:32:29 -0700 (PDT)
Received: from ?IPv6:2600:1700:4c90:60a0:5566:b07f:3f47:4a0e?
	([2600:1700:4c90:60a0:5566:b07f:3f47:4a0e])
	by smtp.gmail.com with ESMTPSA id
	66-v6sm1390515ota.77.2018.06.13.07.32.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jun 2018 07:32:28 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1528657273-19021-1-git-send-email-jpuhlman@mvista.com>
	<CAJTo0LZXRFZ2bEgtyjRUGiUyDt_TcyjVUBZjdmtWzGFAE4McEA@mail.gmail.com>
	<b9a65b20-120d-e399-606f-3c348fc974a5@mvista.com>
	<CAJTo0LbROwWA+4_suQ=_sxHMHsv_HST16jVqq3Meqm=DFGuTwQ@mail.gmail.com>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <31dd38d2-b79a-9ece-ec2c-60d96a952730@mvista.com>
Date: Wed, 13 Jun 2018 07:32:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbROwWA+4_suQ=_sxHMHsv_HST16jVqq3Meqm=DFGuTwQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 13 Jun 2018 14:32:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Okay I did some test builds and nuking the libdir lines worked fine.

The patch is submitted here:
https://lists.x.org/archives/xorg-devel/2018-June/057123.html

It wasn't rejected out of hand. Did you want me to roll a update to this 
with the submitted
patch, or did you want to wait to see how it pays out on the x-org list?

On 6/11/2018 9:35 AM, Burton, Ross wrote:
> I'd recommend deleting the libdir lines in every .pc file (and pushing
> the patch upstream).
>
> Ross
>
> On 11 June 2018 at 17:19, Jeremy A. Puhlman <jpuhlman@mvista.com> wrote:
>>
>> On 6/11/2018 3:23 AM, Burton, Ross wrote:
>>> Upstream will (and do) argue that $datadir is the right location as
>>> these headers are architecture-independent.
>>>
>>> Would the package manager do the right thing if the files didn't have
>>> the libdir line in, so where bit-identical?
>>
>> Yes, if the files are binary identical then the package manager would not
>> call it a conflict.
>>
>>
>>> Ross
>>>
>>> On 10 June 2018 at 20:01, Jeremy Puhlman <jpuhlman@mvista.com> wrote:
>>>> * --data dir config option is only used to install pkgconfig
>>>> * Installing into ${datadir} causes mutlilib conficts on install
>>>>
>>>>     file /usr/share/pkgconfig/applewmproto.pc conflicts between attempted
>>>> installs of lib32-xorgproto-dev-2018.4-r0.i586 and
>>>> xorgproto-dev-2018.4-r0.corei7_64
>>>>     file /usr/share/pkgconfig/bigreqsproto.pc conflicts between attempted
>>>> installs of lib32-xorgproto-dev-2018.4-r0.i586 and
>>>> xorgproto-dev-2018.4-r0.corei7_64
>>>>
>>>> and so on.
>>>>
>>>> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>>>> ---
>>>>    meta/recipes-graphics/xorg-proto/xorg-proto-common.inc | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
>>>> b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
>>>> index 7a417c9..7377283 100644
>>>> --- a/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
>>>> +++ b/meta/recipes-graphics/xorg-proto/xorg-proto-common.inc
>>>> @@ -14,7 +14,7 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
>>>>    DEPENDS = "util-macros"
>>>>
>>>>    inherit autotools pkgconfig
>>>> -EXTRA_OECONF = "--without-fop"
>>>> +EXTRA_OECONF = "--without-fop --datadir=${libdir}"
>>>>
>>>>    UNKNOWN_CONFIGURE_WHITELIST += "--without-fop --without-xmlto
>>>> --with-xmlto"
>>>>
>>>> --
>>>> 2.6.2
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>> --
>> Jeremy A. Puhlman
>> jpuhlman@mvista.com
>>

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


