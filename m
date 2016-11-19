Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6634F6060F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2016 02:47:06 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id b126so71177457oia.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 18:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=n+ZsErPjyVKNWN1rR3Oh9Vg3Vt3jUeJrvR04PJ2pEcw=;
	b=De+OpR4zPmxq8+ZDw7E6+bJt7MHe4p5XiAY0lxSu0ehuekWgAHVTC2wd4gjkWAaXEn
	5HLUdUSD6ntDsoIsA0vtmV1FMAPUERCRUIDD16jdL7RfH3mbJ/6aE53WapmJaZoVfwjt
	xFxxjFECFRfc4V0DffRGOQhZIhMLCCBKdW+Yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=n+ZsErPjyVKNWN1rR3Oh9Vg3Vt3jUeJrvR04PJ2pEcw=;
	b=mfMSbaY+Gd67mqVgZf33tcVwV0KR7bMIQwBxwxjeIGiMvxs6V8LQugMmaSJkxWUyfM
	xRSBS4POIS9nA5tuml3P8xozYqsk4XKbKsJ2MZlVlPaDzJE3AQtbPSZuF9pOuGFFpnrD
	aFl32P/8WyHZewE+kcDPbZ25ZQto0O7PjsbYaVOFLTf7KRjSj7ZIm+hI7mN6zNmNc2Vi
	OIpZ9+fsGFZOB69l/gvm6T7WCwUuNpR/Sb+NkggiiZGsUAuMh6F+p8uYPBBFQXOihfye
	xjtPjcXqFx0AHbAc0mcqnhf7Polh9kCODwraNAlxoe+3EE935RMp5egtNXELSq252JjG
	lzOw==
X-Gm-Message-State: AKaTC038Bd+afHngDgBqi1dHbbY1ShwyAyAKT1Wy/mhkj0VsU9RVAMvahObc0y6QXtF0xZyc
X-Received: by 10.157.3.102 with SMTP id 93mr2037044otv.30.1479523627165;
	Fri, 18 Nov 2016 18:47:07 -0800 (PST)
Received: from [192.168.17.36] (CableLink64-18.telefonia.InterCable.net.
	[201.172.64.18]) by smtp.gmail.com with ESMTPSA id
	t184sm3492042oie.21.2016.11.18.18.47.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Nov 2016 18:47:06 -0800 (PST)
To: Tomas Novotny <tomas@novotny.cz>, openembedded-core@lists.openembedded.org
References: <20161118191252.43d474b6@tomas.local.tbs-biometrics.cz>
From: =?UTF-8?Q?Daniel_D=c3=adaz?= <daniel.diaz@linaro.org>
Message-ID: <f03bba38-3ac8-ee96-b272-4db2ccdae28e@linaro.org>
Date: Fri, 18 Nov 2016 20:47:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161118191252.43d474b6@tomas.local.tbs-biometrics.cz>
Subject: Re: Loss of a wayland socket by a systemd user session
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
X-List-Received-Date: Sat, 19 Nov 2016 02:47:09 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Hello!


On 11/18/2016 12:12 PM, Tomas Novotny wrote:
> I'm using weston and its 'weston-start' script shipped with oe-core (morty).
> It works perfectly until root is logged in. The problematic path is:
[...]

We've seen that [1]. If you have PAM, you can modify weston-start to
pass `-u root' to weston-launch [2].

You can also try this systemd service unit and launch Weston directly:
  https://github.com/mrchapp/meta-96boards/commit/ac3e11e

Greetings!

Daniel Díaz
daniel.diaz@linaro.org


[1] https://bugs.linaro.org/show_bug.cgi?id=2576
[2] https://github.com/mrchapp/meta-96boards/commit/ee71b7e


