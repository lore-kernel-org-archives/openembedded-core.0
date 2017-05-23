Return-Path: <fathi.boudra@linaro.org>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 27E8E71AD5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 04:45:46 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id 7so11601903wmo.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 21:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TMcVybUyIK8cmfrZsY50Ia3/qGXSWZTrjaPwAwfPJXg=;
	b=O3qbP2GLQ77FhAtAMqgYdOxw+dJ3v/8k33DgJL5gTIQ5JbmPJt4T3ILkjxBo5Zqp0f
	TQLYW7/CpDYSP4rIteWhEVUXFhYTnJwJqxuYHIUw7a25BTox1+ZNfk0yqiDYM/MsUWBZ
	kFnOHI18vpS3fcji5NDljv+X/XC0ptxZIv+y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TMcVybUyIK8cmfrZsY50Ia3/qGXSWZTrjaPwAwfPJXg=;
	b=SMZgndcPZfy/IfyE8syu/XaJroFTI9ptFMM7rxMLTaPDNd8wXZRxREExxJUeElQyRY
	gZiTO+NRpzasHcrt4Df/UzgVYToW9WlC+ZuqSDLJY91cxkHOsMgwzuW4nS22ySgbEybP
	YpADY2Sc4R3XPHv3IrgplCw6wZUQdmxz5amSnzt7J04JZSWIjJtgwm7cc0Kz6g7ZjEwH
	CMw6LD5uhfRcr0UmqzdkWJOLsbT2CPefbdmGuPL+3nAn8HR1UvVpbbhVLaq8SXVJFyQz
	4MMtZc+SlJ34oGW/3N2e3QWUi7tACAfEDCD7q/d6H3JmseSD9zJuGFIHyxXtFlUNTgwT
	3icQ==
X-Gm-Message-State: AODbwcABUsCj/B8YrrWgOjVWddpHNEhoxNgmOmy5GlBk9iCWq9UnC+jI
	tyY15isFMu8DV9lBIm22cYxNd1ekcg2v
X-Received: by 10.28.65.213 with SMTP id o204mr609465wma.43.1495514747560;
	Mon, 22 May 2017 21:45:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.133.7 with HTTP; Mon, 22 May 2017 21:45:46 -0700 (PDT)
In-Reply-To: <54e6fc69-700d-c5ef-1b51-5432d9628e02@linux.intel.com>
References: <20170522093003.17711-1-nicolas.dechesne@linaro.org>
	<20170522093003.17711-2-nicolas.dechesne@linaro.org>
	<54e6fc69-700d-c5ef-1b51-5432d9628e02@linux.intel.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Tue, 23 May 2017 07:45:46 +0300
Message-ID: <CAGNsrLAPi15Mxkz_JJSWrobyCOGeGsoEkn2omM+Z8WjwcHtc4g@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] android-tools: import from meta-oe
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
X-List-Received-Date: Tue, 23 May 2017 04:45:47 -0000
Content-Type: text/plain; charset="UTF-8"

On 22 May 2017 at 16:12, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 05/22/2017 12:30 PM, Nicolas Dechesne wrote:
>>
>> Many development boards come with Android bootloaders nowadays (for
>> example, all
>> Qualcomm based development boards to date). The android-tools provides
>> many
>> Android specific tools which are useful when working with such boards. For
>> example, it is fairly common now to rely on fastboot to flash Android
>> sparse
>> images onto these devices.
>>
>> android-tools-native will provide all the needed tools to create Android
>> sparse
>> images, as a standard OE image type, for example.
>
>
> Are you committing to maintain these recipes going forward?

yes, we do.

> Alex
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

