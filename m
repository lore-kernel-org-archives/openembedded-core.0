Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id C00677F7CC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 23:04:36 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g206so11077187wme.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Nov 2019 15:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=dV5+AV4oeJQeuF6wNx/0E6otlSQJXWpo3CRJlReR9yA=;
	b=HCuhFVPkFX7gCNX76nnL5Ry6LTrfSiCjTSDI/+NLj5pevq5mmr9VptDEcjj3btfbvR
	ssxBoDG3TnVB48WlHUoL2ins6fias9hcsrJ9nbQXkjnEO7IW9iIhJ42CLR3R1G7cXUqo
	YW6udcr0aLvlxylV1WT22uS0MpJNaAsVYH6Tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=dV5+AV4oeJQeuF6wNx/0E6otlSQJXWpo3CRJlReR9yA=;
	b=Xn52hke5oW8M6NMAQcv66vB+NKl55jiveqhkArmkQOI4CYxdX4r8g5Bivk0KYXKtG0
	24DvGje4IjxBirSn1TvmEimJJhoskcvqks302d75zUU+m+BGhX5Xq6rOsWlQhCwcvbfI
	9nF51dWdcRtg0NzlL0mAT4YerFk2PvsuApijtrLSibcAVlDYoCktrz37KjZbZzZjY/YQ
	H1XFsx4MjLcUBQGZjbwTUTWAtHYxgn465eBLKdFZ8xDVi6fU/U7s4vcpkPRn+DiIybpt
	GiegVPgDo0icep1qsUzZFdckw19XWgbMB+dxbt9bg/XNnnV7XI5QZ7Ml0Gv4HaLoZOsT
	zbag==
X-Gm-Message-State: APjAAAVOL5ce6HICmiRExepIaDfXyAM5ZE47atIZPZWtYDbj+ddt4Edc
	VYYN07XfgpkSOveTCVhI0WljUA==
X-Google-Smtp-Source: APXvYqwAe2sN+QE63Tv9/kOns5UNKGwcOBAFRIBhgO9HvmaySpJuTVHvsCHE5A/SDUiSHC18RjC3Uw==
X-Received: by 2002:a1c:22c6:: with SMTP id i189mr23567293wmi.51.1574550277385;
	Sat, 23 Nov 2019 15:04:37 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a26sm3162513wmm.14.2019.11.23.15.04.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 23 Nov 2019 15:04:36 -0800 (PST)
Message-ID: <9dc24ea9d874a162834550eae33afbd20e19015e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 23 Nov 2019 23:04:35 +0000
In-Reply-To: <20191120134455.125118-9-alex.kanavin@gmail.com>
References: <20191120134455.125118-1-alex.kanavin@gmail.com>
	<20191120134455.125118-9-alex.kanavin@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 09/11] p11-kit: convert to meson
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
X-List-Received-Date: Sat, 23 Nov 2019 23:04:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-11-20 at 14:44 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../p11-kit/p11-kit_0.23.18.1.bb              | 26 +++------------
> ----
>  1 file changed, 3 insertions(+), 23 deletions(-)

I think this caused a failure on the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/1268

Cheers,

Richard


