Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5D850746D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 15:55:35 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id p6so4063192pfn.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 08:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=oCc9+kOSrb6uFLQ6rw/c7ELOmeYPksVSkupofpI5D7g=;
	b=hdxUBjHpyfZ0lX5eUudbt7sWUwm372PEy6SQD5Ku5dd1KKMs02IZbOAZMCUagSrJ8q
	L93RoS+X5QuRK9wZwK9VAGHXQhuWvfTGdUIXiN1Rswb1jjoU7hXyd5PUD9uUpTM4DXUW
	mR/Uup8FsdehlzwJICnealYY8CUaCsM7hqaUay1/HHAxmsTnEcRVLTkhOmISfGaL1WbX
	8sM5x0uxjpuyWvVxE/NlpCtEQ1m0gTjBxR/hjPLGw7Bpno6WNj4tizQBPTyZQrI6rBKA
	rFgsqLxiQAlqqV+F1uqCUNLv35SPL/Sna3LMxKTe6ujMJeayklp+3f5K3GmhssU23x7s
	tQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=oCc9+kOSrb6uFLQ6rw/c7ELOmeYPksVSkupofpI5D7g=;
	b=tNg5SVC20jhg/slXtTOW44FO1P/b0/eQmQlZ3+byYx6/a61uWTYC0M0ppdX0+NUnmj
	OE6XIqT0McSic5RUmyEPsFdsV34xrSH5F2Quw0WTwgDuwKnU0dr4ZsGF/TX/G5MfPirg
	Pjzp+SDTtntgcg065FZbMAQAHzorr6lOWMoLPV/ISPr0eJ9J9hwEZpZsLTCySlTezKiW
	tYaV//aBxkuHD9c6SLRz1ZdSuTfDygOR6Mwch/dh2adpc5lUYRjPuG2dOsIAZr440bfT
	s4rs2WsImeEv/mR4wb6RXfVaDOooczNdJ3tdqCsCkA7JAWelJtDuRUzTfXBHA3Qavhs0
	ONeA==
X-Gm-Message-State: ALQs6tCBCAb4Tbgpn5EF2d9tWNBYY00YcaKTDjXFdDZ1T3jlG8FjOcXS
	+nLzt99+OsTiTTxWWfYfpLbU0wmt
X-Google-Smtp-Source: AIpwx4+wPlSRYXKSi76wOO4Czl7/vyZT2bfEHa+WDd+Aj0VlXrv1W6PRrzOuRkz1kuomK3UzqXmfKA==
X-Received: by 10.101.91.133 with SMTP id i5mr1119220pgr.249.1523548536979;
	Thu, 12 Apr 2018 08:55:36 -0700 (PDT)
Received: from ?IPv6:2601:646:8880:466c:b946:b3:7b1:a98f?
	([2601:646:8880:466c:b946:b3:7b1:a98f])
	by smtp.gmail.com with ESMTPSA id
	v16sm8031237pfl.14.2018.04.12.08.55.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Apr 2018 08:55:36 -0700 (PDT)
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Ramon Fried <ramon.fried@linaro.org>
References: <20180410112040.13506-1-ramon.fried@linaro.org>
	<CAP71WjxWzSc8pCSv=_NcRNna-pA8mMNUhhhM+X9M7ShO0XK39A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <00c42779-b82f-f318-4e02-86c5ee9509d6@gmail.com>
Date: Thu, 12 Apr 2018 08:55:35 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAP71WjxWzSc8pCSv=_NcRNna-pA8mMNUhhhM+X9M7ShO0XK39A@mail.gmail.com>
Cc: Ramon Fried <rfried@codeaurora.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xserver-nodm-init: Respawn service in case of failure
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
X-List-Received-Date: Thu, 12 Apr 2018 15:55:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/10/18 12:48 PM, Nicolas Dechesne wrote:
> On Tue, Apr 10, 2018 at 1:20 PM, Ramon Fried <ramon.fried@linaro.org> wrote:
>> From: Ramon Fried <rfried@codeaurora.org>
>>
>> It appears that sometimes xserver-nodm.service is starting before
>> display driver finished loading causing the following failure in
>> Xorg log:
>> (EE) open /dev/dri/card0: No such file or directory
>>
>> The introduced by this patch is to restart the service,
>> hopefully the display driver will finish loading.
>>
>> Signed-off-by: Ramon Fried <rfried@codeaurora.org>
> 
> we are seeing this issue on Dragonboard with meta-qcom BSP, where all
> drivers needed for display/gpu are modules, so the display
> initialization comes up 'late' in the boot. I had a discussion with
> some upstream gnome folks who indicated that a similar race can be
> observed on any hardware, it is not uncommon, and that's why they use
> Restart=always in gdm.service as well, so that it keep trying until
> the display comes up.
> 
> it sounds reasonable change to me.

Restarting service always seems like a workaround here. I wonder if the
kernel modules tied themselves to systemd-modules-load.service then the
dependencies should
sort themselves out. Alternatively we can also create a dependency on
device being made available.

> 
> Reviewed-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> 
>> ---
>>  .../x11-common/xserver-nodm-init/xserver-nodm.service.in                 | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
>> index 324a26f549..87dc4f8fcd 100644
>> --- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
>> +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm.service.in
>> @@ -5,6 +5,7 @@ Description=Xserver startup without a display manager
>>  EnvironmentFile=/etc/default/xserver-nodm
>>  User=@USER@
>>  ExecStart=/etc/xserver-nodm/Xserver
>> +Restart=always
>>
>>  [Install]
>>  Alias=display-manager.service
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>


