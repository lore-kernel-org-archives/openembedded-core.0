Return-Path: <lpapp@archlinux.us>
Received: from mail-vn0-f54.google.com (mail-vn0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7E845601E3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 14:50:09 +0000 (UTC)
Received: by vnbf190 with SMTP id f190so3715210vnb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 07:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=WddLb1JrSbMpn04E8GTW1u0eYpPnyH6CKdVC9+FJOgU=;
	b=igOK05CA2Jv9D04Iv2GhRcjaLhcfG8iPBYbFAA6GVzeDoKSuG8iL2VSgemZoDsgxtU
	uibqB7PWIGlzpSBIylR2tfjyw1mqCtuV0VYeqchtBkitWJewPs6ppyZshbe0WD3ALRGO
	aJLVUvL1OcHyJmhPEmTpgPdjnVNcTXx7/08swKEPtOhsRuJhI/UvqcAV1mCgMbhojgnX
	RpOy7xkDRlwxhQYEyurqA1I8W3XctkhdYn+W/6R5Dg1ZShEQfQTFdtFntffMr3HFXKFx
	pezd9o+1kwrCsz54b7+QGFhvmq3y/4uHbPpFH4T/KMFGZErtG/6KTe/vVfkWYR+KqyRd
	oCQQ==
X-Gm-Message-State: ALoCoQlQuPGZ6BTAU+sng1qfUpm8xMORNqEihltj/eKu3mG/m2L9ugC9qQSrKCTeJa0uS9x5zSt1
MIME-Version: 1.0
X-Received: by 10.52.7.33 with SMTP id g1mr34451323vda.83.1432133411184; Wed,
	20 May 2015 07:50:11 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.53.6.12 with HTTP; Wed, 20 May 2015 07:50:11 -0700 (PDT)
In-Reply-To: <CAJTo0La5BpGRQEnNb34ZtV5-Po2dELjcN2mcy_Dn_e-c7=SWXg@mail.gmail.com>
References: <CAOMwXhNUPtaJfKHDuHPWoioyD2Sp8Abb_++Tdp3NAYN7-TGUcg@mail.gmail.com>
	<CAC1BbcQ0L1ujZA_NvXx1hmUBq1gt9gC7tMHRwNLkNvmPGYZWaA@mail.gmail.com>
	<CAC1BbcTOPBRO_3GjhSQdzQ35Y=BGAh1ntYdqK2tk8E09Hvni7g@mail.gmail.com>
	<CAOMwXhNB-5w2ywAe6anARY0Kp+osPRmu6KnoiOpfTJ6G0WCCnQ@mail.gmail.com>
	<CAJTo0La5BpGRQEnNb34ZtV5-Po2dELjcN2mcy_Dn_e-c7=SWXg@mail.gmail.com>
Date: Wed, 20 May 2015 15:50:11 +0100
X-Google-Sender-Auth: sG8xWwhVFbL9eTSvE5lDeryKSwk
Message-ID: <CAOMwXhP-fdD2SjRrOFNR-aS7Caa30sxiC-Js_Jr8B5_+Q8uHow@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: busybox: passwd: applet not found
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
X-List-Received-Date: Wed, 20 May 2015 14:50:12 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 20, 2015 at 3:45 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 20 May 2015 at 15:42, Laszlo Papp <lpapp@kde.org> wrote:
>>
>> Now that just breaks all the code that our software is using. Why did
>> this binary incompatible change sneak in, and especially: why without
>> any note in the migration guide? Furthermore, is there a way to
>> reverse this? I really would like to avoid rewriting my code just
>> because some other people think it is a cool change. Or is this change
>> absolutely necessary?
>
>
> The point was to not give "normal" applets such as cat suid rights.  Why
> can't your scripts just call passwd directly instead of proxying through
> busybox?

If busybox is available on desktop, I would like to call the busybox
applet through 'busybox appletname'. If I just call passwd, I will
call the desktop version. That is not what I want and this is not how
it has so far worked. I think this feature should have been at least
optional and if it has to break, it is definitely something to
document in the migration guide, isn't it?

Currently, I do not see any simple way without #ifdef jungle in the
code around to it. It is not nice.

>
> Ross

