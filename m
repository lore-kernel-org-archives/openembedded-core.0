Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6A61B615D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 23:52:18 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id q9so109858wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 15:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=uwIEcjcy99K1G7iwO3vO+3TUriaLWqdlFxtYyR9wi/8=;
	b=Qzadkd8lNuEuFaPxMECJPwbiBqJ3d7hrvMkruuJQEeTXlkAEPY9XC1zwo1tTanhdD9
	hbaGD9arvAFXE2U0ovPFfLBdrVPmGIf7OvQkWbAFFMobPjeaekIshF1gm3ET9RWygJ4g
	eqF8epxtg8bZZybWSnDsrph6y0iH+0LjC5Ms8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=uwIEcjcy99K1G7iwO3vO+3TUriaLWqdlFxtYyR9wi/8=;
	b=E/MKvthodczrhH7xNbT2pTDMMq9FddbwRhxCvXdypuXKLtm0LlPeeLpyr2XQ+8Bij9
	ELoWX7vll9OgGdWT8mhYYgh3+b7tGBWY5CE7bvK767TjweddUIUIfthWjp0eRsbwjJRU
	FLDVLU75v5n73Slaqxg7AgfcpDVOCwr3igQ/FvjldEoNXLT/fFZNPYT1tzmk2SFwHGMJ
	3+AGn8XwyumZQa1GqK645PrIFF9W59Kl7DAbK+WEmpfDFOwXkUwmKGupcb7RD09I+DoP
	5uzf4z9+bTr5mRgvNO8cjyvN4/PKVxziOfGB2aUvz1Ctqcax7Y0sP2MA+NKm5IHM0E8v
	LTbA==
X-Gm-Message-State: APjAAAWzN7QtvXwEYUOLhSUlEQ3smcJY3+jiAL1tZS5h5u5JhBhMHfTS
	kn5ggGbrHHZe0cQPAO4qLs1kHqFGwVg=
X-Google-Smtp-Source: APXvYqzDoofXxEUn7Hs40beeNw/t263NWNtU9C9RARZdpV+6d11KMcgUbsNV+QIDikCbXn9HYuxVxg==
X-Received: by 2002:a05:600c:295d:: with SMTP id
	n29mr220683wmd.101.1582156338885; 
	Wed, 19 Feb 2020 15:52:18 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d204sm1850534wmd.30.2020.02.19.15.52.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 15:52:18 -0800 (PST)
Message-ID: <89165b4cb39fa5f4619079145b85f04a15920641.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 23:52:17 +0000
In-Reply-To: <20200219194752.7967-3-alex.kanavin@gmail.com>
References: <20200219194752.7967-1-alex.kanavin@gmail.com>
	<20200219194752.7967-3-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH 03/13] webkitgtk: unbreak wayland build
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
X-List-Received-Date: Wed, 19 Feb 2020 23:52:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-02-19 at 20:47 +0100, Alexander Kanavin wrote:
> webkit nowadays requires a couple of supplementary libraries for
> this,
> so bring them in (courtesy of meta-webkit[1], which will hopefully
> adjust without a lot of trouble).
> 
> [1] https://github.com/Igalia/meta-webkit/
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/705

(missing MAINTAINERs)

Cheers,

Richard


