Return-Path: <patrick@advancedtelematic.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 368207866C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 16:22:03 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id r68so3819610wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 08:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=advancedtelematic.com; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=U+vBFFTKpLKF5T1ImuoZ6SJYcU4kdtoMlG1cLrI+OAw=;
	b=opX2sbdGaTf8eyKliN8enzhO0sq1gVEK5qLyD5lQ6uHm1odq/ppd6TZeJyLYgb7cZR
	x41jk6olOwMc3OJoxbgM52mYNv8j8tx4GylkMkXhN1xjhyjKO1u0vr4DKUinge0cUX+2
	49VFYY97vE9z0pye0D9GDHTyUgPCos/eM9PPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=U+vBFFTKpLKF5T1ImuoZ6SJYcU4kdtoMlG1cLrI+OAw=;
	b=PTCR9idr/WjrcBYSwCjI4279hkekZHubd5rauKfZuu4v/rviAhPWxYvD4dP3rWmeBt
	itqbASd4C4phcg63KQkN2ez7U7fqC6nc9RPWXVbVIQbRq/ReupB8ALTH4MGEePJGD4SE
	ohvSK568O12BvNuL5GjFmTS1x0mG9Uv2OnDRsb1ZfqH1apPSo/Eckt/unc9nWUzVvN6e
	xE5Pshn2mL0ReFjoQowIIym1KHP4znZmrFtfJLNvZewiGRed5NhcBscTGWIHdQhzFhlL
	FIR8Cu6fjPAMlVLeVrFQUw9HZAOBpGfMAT/kv9/JS3B+ULVVpzcidmaY7OP9UDgfdtSq
	O4Fw==
X-Gm-Message-State: AJaThX4VyScsERUzhJm2MWoEhjf+7B16Dr9OxdBZqGnMjTIsWNpQcpop
	ZAZ9LLKqICtqdyjCv2atjHD8S6YuEdE=
X-Google-Smtp-Source: AGs4zMZzUsgG6HnQXcEC6V3olnboa+hIJxf5CoDH7T1eVr2vEn2VYHPmai8QtNJ3P12jhvDjK4b2Xw==
X-Received: by 10.80.160.231 with SMTP id 94mr1249666edo.242.1510330924872;
	Fri, 10 Nov 2017 08:22:04 -0800 (PST)
Received: from [192.168.1.39] (p57bf9f95.dip0.t-ipconnect.de. [87.191.159.149])
	by smtp.gmail.com with ESMTPSA id h2sm8396127edc.89.2017.11.10.08.22.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Nov 2017 08:22:04 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20171109140310.659-1-patrick@advancedtelematic.com>
	<CAJTo0LYvfRJ_Abmp=jcUPhjJjiJ8PPx2mnV08b83MR_xpAwiAA@mail.gmail.com>
From: Patrick Vacek <patrick@advancedtelematic.com>
Message-ID: <bc025692-5c78-739a-ba9e-41f070f07f95@advancedtelematic.com>
Date: Fri, 10 Nov 2017 17:22:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYvfRJ_Abmp=jcUPhjJjiJ8PPx2mnV08b83MR_xpAwiAA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ca-certificates: Add /etc to SYSROOT_DIRS
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
X-List-Received-Date: Fri, 10 Nov 2017 16:22:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10.11.2017 17:05, Burton, Ross wrote:
> On 9 November 2017 at 14:03, Patrick Vacek
> <patrick@advancedtelematic.com <mailto:patrick@advancedtelematic.com>>
> wrote:
> 
>     +SYSROOT_DIRS_class-native += "/etc"
> 
> 
> ${sysconfdir}, surely, to cater for people who change the paths.

That does make sense now that you mention it. I naively followed the
literal advice from here:

https://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#ref-tasks-populate_sysroot

Shall I make an updated patch?

Thanks,
Patrick

