Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1BBA3744EC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 13:48:44 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id bj1-v6so5168760plb.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 06:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zrLT+WeOtNh/86QUhuhF8JgB88iLv8+sJ+6GZyMuVIU=;
	b=f8h1+tzbd9BN27qqUE6oioeopkKI4DYr1RV2Dp3BDrzcTvjHnc8+yGCIPPoVsFMtYu
	C0tKanlfeiyurYr+2CbOfl5rKigobsgwsYZxH0ZEQFiYCb2AByhwYbSKfDMixJPKoXJk
	0ef6oq4T2l5OiSYoiWfPPjVHHI/AcIfHuqNo/5TQ725E/RQNL0DFftc9pdAjV8WVbIto
	xKglJEm7CligX0odCQ457kJ0KYWtFdk4xob5t0N/MszbDAR85w/zMVuC05iW5UGLuf8o
	SoQu7N4ItufSRJ76d//cBF9f9jIMBlR/cOAQ6gy/0MDGn/frQeAgnqMtsIvYOpUrM1KN
	CWqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zrLT+WeOtNh/86QUhuhF8JgB88iLv8+sJ+6GZyMuVIU=;
	b=MpuzWuCEDsyjiYdMtbCOdLvpmRsoF+PmhRONTVRfh2N68Um0CdYRPp4Nz4lbZnIpRD
	2ZTaW4uyUvhmpB/EsP+FuFnRVX12gkWGLrDjAHN1JR0Fsy2fqlBxNAlvB6jlMh/n/Wvb
	ompnD2oyea/32UZi6bwKHyiU0A9bLntLj5F1clhqI3bWL2ubANmruGWaxVhHP4H//EAR
	qeW0KUy5CeRta+rKc6Kabw37/gSkDrY9e78Z4sdMmEco/VZl+W0GaRx3ah/CCmoJbIu3
	MUL3eCadp2+NCVAP7FnEWCZi+0gncHpS2koKHKQZGc9lUKQFwa6Rf9b2mc9sGi5wbfXS
	euZQ==
X-Gm-Message-State: AElRT7Fd3dVvMfDSAAGvGBmk+poOy7Ph9WjwKbHZf7DhpHaANq25LqAl
	im4QMqhNqv6x78icVlkPAJYFHSX+iFu3vZPVgA8=
X-Google-Smtp-Source: AIpwx482GMVeyYQ0u19FXWgaHUIXShTqVnlVP4vAB3V7eEQq/MqWhO57fIpMtbSP+eIcNa+cSLvGQEhvA6w6a+uhfts=
X-Received: by 2002:a17:902:244:: with SMTP id
	62-v6mr30387167plc.125.1523281724664; 
	Mon, 09 Apr 2018 06:48:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.166.196 with HTTP; Mon, 9 Apr 2018 06:48:14 -0700 (PDT)
In-Reply-To: <b904641a-c0f3-8c21-7051-a30934ab7638@denx.de>
References: <20180408230223.17260-1-marex@denx.de>
	<CAMKF1squXKSNhvmHj_p0Q-5cK3H-yKH1upwKXjvDCoindshUWA@mail.gmail.com>
	<b904641a-c0f3-8c21-7051-a30934ab7638@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Apr 2018 06:48:14 -0700
Message-ID: <CAMKF1soc4hOS+oBRfdBiO9Ng3JsbJoqf8t5n_wDxeeUtmxs7=g@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2018.03 release
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
X-List-Received-Date: Mon, 09 Apr 2018 13:48:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 9, 2018 at 1:25 AM, Marek Vasut <marex@denx.de> wrote:
> On 04/09/2018 02:54 AM, Khem Raj wrote:
>>
>> On Sun, Apr 8, 2018 at 4:10 PM Marek Vasut <marex@denx.de
>> <mailto:marex@denx.de>> wrote:
>>
>>     This upgrades the U-Boot from 2018.01 to 2018.03 release and drops
>>     patches accepted upstream, getting the patch count to zero.
>>
>>
>>
>> It fails for me if I have libfdt installed on build host
>> It seems build is doing the include dance which goes all the way into
>> hosts system include directories
>
> Which version of libfdt and dtc do you have installed ?
> And is it really libfdt or dtc ?
>

its dtc probably but header it picks is libfdt.h I am on archlinux
> --
> Best regards,
> Marek Vasut

