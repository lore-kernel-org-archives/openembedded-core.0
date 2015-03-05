Return-Path: <naresh.bhat@linaro.org>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6348273878
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 13:56:55 +0000 (UTC)
Received: by labmn12 with SMTP id mn12so15339112lab.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2015 05:56:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=WJjuT12AKOG9N3SD3RnbiN26h1kRdfaZ9ENQWD9XpzU=;
	b=JBNH1nfWn03hPlVvQ1atfPDNjsqRO0B32ugPmbnp0swVkxylXmgAehy+0RgBU8Ckm7
	vlO7SD9xHGZqY4cvWwZxyOmRh4ETd74S0QXjodg5kwyp6vQe7IGM/t+ZOaOicE3S58DJ
	NzbL7Y2fO2D1r+Y969OTjuitNKKpkUahj8YouCpTRDS1sc+o7XXS0H4cSeVhzNEDRudn
	tmdbs+o2YMRLqv59/U0W5BSBWEV9U1zt7KvWA6I6OzGARyeejvI/Q3Hot0l/U4YkHgjR
	PPM/C3ChpxUyl9Q/11kl3WY3ne1kG6OZEzq2CDcVcui4hUmBAdLwhVw4vu2KHFvY8DUQ
	3s7Q==
X-Gm-Message-State: ALoCoQluFULtNawF60gUPBZLsy0Clo46vox6/2fzr1Pgr+KAr9ojLISF/T2mambExTG9wo+2pSTQ
MIME-Version: 1.0
X-Received: by 10.152.204.42 with SMTP id kv10mr1758063lac.52.1425563815735;
	Thu, 05 Mar 2015 05:56:55 -0800 (PST)
Received: by 10.112.225.172 with HTTP; Thu, 5 Mar 2015 05:56:55 -0800 (PST)
In-Reply-To: <CAJTo0LY1suWrUCG-AY5pf0H+_HAiyFJOqfR8pT9K3DJA_cfJ+A@mail.gmail.com>
References: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
	<1425397584-5154-4-git-send-email-naresh.bhat@linaro.org>
	<CAJTo0LY1suWrUCG-AY5pf0H+_HAiyFJOqfR8pT9K3DJA_cfJ+A@mail.gmail.com>
Date: Thu, 5 Mar 2015 19:26:55 +0530
Message-ID: <CAFoFrHYnKAqPs0emKAX9PwFbZPTVBOaNUq+xnAqDs1xjpYtAyQ@mail.gmail.com>
From: Naresh Bhat <naresh.bhat@linaro.org>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core Yocto PATCH 3/4] bootimg: Skip build iso image for aarch64
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
X-List-Received-Date: Thu, 05 Mar 2015 13:56:57 -0000
Content-Type: text/plain; charset=UTF-8

On 5 March 2015 at 02:07, Burton, Ross <ross.burton@intel.com> wrote:
> Hi Naresh,
>
> On 3 March 2015 at 15:46, Naresh Bhat <naresh.bhat@linaro.org> wrote:
>>
>> +    if [ "${TARGET_ARCH}" == "aarch64" ]:
>> +             return
>> +    else:
>> +            bb.build.exec_func('build_iso', d)
>
>
> As Bernhard says, that isn't valid Python.  Were these patches actually
> tested?
Yes, agreed.  I will change it in my next series. I have tested with
luvOS build.
>
> Ross

