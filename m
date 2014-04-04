Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id A83706E75A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 09:25:16 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id p61so3150899wes.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Apr 2014 02:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=oCp/6yuvQdl3tGsliKk2R+4a9Q5Eew0pGvN11etVawI=;
	b=KB8aEyCO4u2qAqqWb/Vzut/8YBn8VM4iAjW1j85ysrfiB1XEbFJU8JuWy6LsqsAHhi
	JQHMMLo86HfhjRpicEzVxZ7/G23olLHnLn3ed/IYhQoqQsm5V0FjsHP6o7GkXHuuYKDD
	JNW5NrtECFNWN+1Yf3tyYgHQ8EJv12K2gh7qTmNxFf+tPAHx20nIDzDvp1nPjkf/H31O
	DxfjuNbNjA3LYYfh/iqF9LYDW7fvSyfaoaIUfhXPeBubwD0akXcvKDZQVd/F52Cii1Yu
	7nS8wg7OCAl+gW1uPtNLn+EqVoX596i2lmpFc/EIEzenL+1J5JWoFPKwmwZUyyu63tls
	iJWw==
X-Gm-Message-State: ALoCoQlAakTPxerr4gWbEQLI3idt/x7DbxSgPxwt6qpD7wxI3FpYfMjO1a+jmR5E5HGiUmg8zxGP
X-Received: by 10.180.149.240 with SMTP id ud16mr2838205wib.23.1396603517248; 
	Fri, 04 Apr 2014 02:25:17 -0700 (PDT)
Received: from ?IPv6:2001:610:612:0:2ad2:44ff:fe4b:bc17?
	([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id
	x45sm18256219eef.15.2014.04.04.02.25.16 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 04 Apr 2014 02:25:16 -0700 (PDT)
Message-ID: <533E7A7B.1070507@linaro.org>
Date: Fri, 04 Apr 2014 11:25:15 +0200
From: Koen Kooi <koen.kooi@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1396601617-29638-1-git-send-email-koen.kooi@linaro.org>
	<CAJTo0LYKL4iyDjQS6hTA=mc9mphnr543dJagP8mM94feRWS1hw@mail.gmail.com>
In-Reply-To: <CAJTo0LYKL4iyDjQS6hTA=mc9mphnr543dJagP8mM94feRWS1hw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] dbus: split dbus-launch out into its own package (again)
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
X-List-Received-Date: Fri, 04 Apr 2014 09:25:23 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/04/2014 11:21 AM, Burton, Ross wrote:
> On 4 April 2014 09:53, Koen Kooi <koen.kooi@linaro.org> wrote:
>> When installing 'dbus-1' it will drag in X11 libs due to ${bindir}/dbus-launch being in ${PN}. Move it to a seperate package to be able to generate a small filesystem (e.g. initrd) without X11 libs without needed a seperate DISTRO.conf.
>
> What's the concrete requirement for this?  Presumably an initrd that
> is starting a system bus but that doesn't also need dbus-launch?\

Correct, an initrd using systemd as /sbin/init is what I want here. I 
don't want to change DISTRO_FEATURES just for building an initrd.

-- 
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

