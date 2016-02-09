Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 363FA60125
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 22:54:40 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id p63so3968384wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 14:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=mQCByzYqs3miCNwyZBuwizUyp2OVwSnLKmwK1wCO2uw=;
	b=YXiVUp4pdLwDHmJJdoB6USwSI8zxgrhZhFF0FFmlVTcVc0mNDHeSPMdn78OVTUJGDX
	mr3LIIOTnxrb6MvMguNov1PvwiDByaCoulZobs0cmgk9mooBBIUnhkEVKqjYdRQyfOQ7
	nLHrfQ0i7vgb3e5y73mu2DW18JPpf0TJbO3hI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mQCByzYqs3miCNwyZBuwizUyp2OVwSnLKmwK1wCO2uw=;
	b=fhCskxlnK+VfDK3zYg4IH9UDZ1QQ6eLoSw/uz5YiZMSGzIMslohWByYhMzyEJ0feTs
	CM4QUiVIsN0JRKEclxh+s/t3C1BFcoWQFjSa2ExBs0Omov/UgFg9oYhwBKzSrbJOVdoU
	yqn9sggjY2xKCuHTTT8yFRySca8HO+zpm1ltbMusYMYj/OSpdiclOZr+Zzmabo22RTLh
	fYwlggrNPmY7J74jBhZavddkngSQ1KRBXwRKztdN8ZAV6G8vHzjlfHBzt0I6Q2S1BDdI
	CrhB8ZkeCnu88ZaHOAsz/scLawuP7B+h64tc8EmxPiWIhh+WeR8LkiRwXAFDLTP8MKHo
	bTJA==
X-Gm-Message-State: AG10YOStILCR1zCVE7jGia2Js3wmf/X1OX6fKXL7dzsThJ+n3U5NOu4c+2u2XvR+QouuYo2oMkCYvcayb1VxfYLD
X-Received: by 10.28.177.85 with SMTP id a82mr7137909wmf.57.1455058481179;
	Tue, 09 Feb 2016 14:54:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.206.33 with HTTP; Tue, 9 Feb 2016 14:54:21 -0800 (PST)
In-Reply-To: <CAJTo0LZm-Q-f8im1Ssfcp6z8T2nj51ToV=s9NMYF2EP0z-Yt4Q@mail.gmail.com>
References: <1454943548-21889-1-git-send-email-nicolas.dechesne@linaro.org>
	<CAJTo0LZm-Q-f8im1Ssfcp6z8T2nj51ToV=s9NMYF2EP0z-Yt4Q@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 9 Feb 2016 23:54:21 +0100
Message-ID: <CAP71Wjzd-n9waEPeVFTP8E0fhZ9WiFQumt_74K+STpGQSVofLA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] mesa: upgrade 10.6.3 -> 11.1.1
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
X-List-Received-Date: Tue, 09 Feb 2016 22:54:41 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 9, 2016 at 11:26 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 8 February 2016 at 14:59, Nicolas Dechesne <nicolas.dechesne@linaro.org>
> wrote:
>>
>> * update SRC_URI and checksum.
>> * add PACKAGECONFIG to offer choice of crypto implementation (for sha1
>> functions)
>> * use libcrypto by default. In upstream commit a24bdce4, support for
>>   SHA-1 was copied from xserver repo, so let's use the same default for
>>   --with-sha1 option that we use in xserver recipe in OE core.
>
>
> Forgot to ask - what real hardware was this tested on, and was anything like
> Piglit used to verify it is working properly?


a couple of dragonboard with QCOM SoC , using freedreno driver. I
tested a few graphics app. I can try piglit if needed, I never did it,
but that's probably the time to get to it..

