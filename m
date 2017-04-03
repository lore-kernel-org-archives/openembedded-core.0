Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9EC7E6011F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 17:51:23 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id f193so135182068oib.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Apr 2017 10:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=GTnSvdjtZESnVgCb7K+U9ZiAys5ocAtG6zFGUhZBjkY=;
	b=Bf5uPhn0EduPQBWUUXCAtGRvnSk60ixhB/HKHdYODBXjtTTDeNxZJKYFUyVFBMCO+4
	tdND6Dd7Orcz9dlMQoDdw8vyDTDJ4D8CipVuM9eEcwyfAQxfLt8HXdvma7FKVMjF5UYn
	MsZwgAYtFkrb1BrrxTq06ub5dyfu7gmLc6ilEd5BwFaPuo7AWLO23PzOow/p25Z21z8i
	Om0KwZwnAH1x0IpNqSm5GOJ2IZVRdhdn9Md4hb7rpMLUBUmNDwGAo3juF35ZFC1MprBB
	zp1L/m79LcuQVlL2ARUp7jp0Re7cAOQL4hv67Wc+F54fOJ8g66bOOCFj+ey68yrIHCl3
	JOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=GTnSvdjtZESnVgCb7K+U9ZiAys5ocAtG6zFGUhZBjkY=;
	b=WMMSfAVZTNzEsnIK6r38acg59TGxaJRjfJ7DHK9AxBmPJarv9qA04B6A3WA9efkdsj
	2/DFH3IhR2XxPO/Yk4VhgpVNg8JM1AnPcqF+r5/eakRm/y6IDHZrLvuviu4XKmHiwAbQ
	77KftjscJ8i6oIo/6z/6REDCs367NTzZJmUuMimxGlx279r3A33sz0AYveM9uRHAI7wz
	tpwapFpsm/cuJiRplYbNaMVNCPEUea9gvhIQXBRMSb1U0z7fpX4bD4MYOQpLNgEcXMfP
	zJ/8MOcTu4CQha/FOsWky8ZchnomyuHNLM14C8mq8NPBgNRnKNPAhJy7li7BT3KqlrjT
	awdg==
X-Gm-Message-State: AFeK/H1NNP701zaTpOw1dELym845yoOcio6leP2GlekqO9xyd2wRMUoIy9oYDAX96oYBNg==
X-Received: by 10.157.35.21 with SMTP id j21mr9152918otb.144.1491241884190;
	Mon, 03 Apr 2017 10:51:24 -0700 (PDT)
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com.
	[209.85.218.48]) by smtp.gmail.com with ESMTPSA id
	f76sm7140353oic.13.2017.04.03.10.51.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Apr 2017 10:51:23 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f48.google.com with SMTP id f193so135180895oib.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Apr 2017 10:51:23 -0700 (PDT)
X-Received: by 10.157.80.140 with SMTP id b12mr9534047oth.81.1491241882598;
	Mon, 03 Apr 2017 10:51:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.79.203 with HTTP; Mon, 3 Apr 2017 10:51:22 -0700 (PDT)
In-Reply-To: <1491223898-6338-1-git-send-email-philip@balister.org>
References: <1491223898-6338-1-git-send-email-philip@balister.org>
Date: Mon, 3 Apr 2017 14:51:22 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqfWjntCfZRd2YJccx+cVuq7hK7KUw35oExQjFtwNU7UA@mail.gmail.com>
Message-ID: <CAP9ODKqfWjntCfZRd2YJccx+cVuq7hK7KUw35oExQjFtwNU7UA@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Add bc-native to DEPENDS to fix u-boot/spl build.
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
X-List-Received-Date: Mon, 03 Apr 2017 17:51:23 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 3, 2017 at 9:51 AM, Philip Balister <philip@balister.org> wrote:
> Signed-off-by: Philip Balister <philip@balister.org>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

