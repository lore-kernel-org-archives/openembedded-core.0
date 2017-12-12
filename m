Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 926AD78866
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 16:33:06 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id j2so18278547ota.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 08:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=/UZsjGcGhFL1eYvoZMBV8PJoduVFESwmqyyTN9szkM8=;
	b=WO127ytvvNjk+qIySnc9YxM+4DN9h1bGZJRVTJassMUl+wtlWs6hYeHL/BmlD8GbVf
	y0ds3dHSAs8WafynOZVA1HLP0Ds1ohaLYbRimDmeDI2irRus9dbkwF4bU9ZFhmIaC71j
	2skOgN1aGP++cpNOYNUiuNB9nhtgCjpHBo2SNUXdR0wSyv99LXQkN5TQXnrSwkxrgbI1
	+qh1B6KUYoeBiPWGOFcs6nXk5L9mbEqjtywx31q5AKy1KC3ygQpDfd+ALsw65XwEM9ot
	XeSzaD/xCMNwhTo8VQ+ur2Csi3bs6+osMkSnKq9UQgvqQ0cYCBEISW+KGnsmFa7lErdZ
	MRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=/UZsjGcGhFL1eYvoZMBV8PJoduVFESwmqyyTN9szkM8=;
	b=FiSFZ1YVfJpwvsQJccSSa/cDrWEGENCgX618reIRM4B6uK/0IcAQ4jCKiTOSgYuEPI
	hnA2WDV95bv1bVqXdyE6co5C9Aa3rsm7hUFbhwvlymyuhE7bcFG9+fbLqHOXQ1gWsv00
	yiXepfoPttwYyq5gwez2ZIOYEpohokXE+RCYRRpksIFvkNcWR89CEiG3Jy6et0moBDaq
	rJNxnvNxRDdxfGhGG6M4UUSVAVAfNbsCTUOFJy3hYiAB27t8IH0GwMC37eAXRtNRi/N1
	KOdTT4bElZnvUEUaUdqnb7dHyr896RXI1JdPGAfk0AaOhWm2Q/ZXrhwcdi3HvWnSLV0T
	Vc0g==
X-Gm-Message-State: AKGB3mJx1DY2kqej1mI+Jk8ci0avCoJ4Cd53LbJPSaRIoMS05eVJYk+J
	BhKru9vaOO7JFYRx6FA6OBWaiECu
X-Google-Smtp-Source: ACJfBouHp3j0cskfomBZZ8gVbubtmp07oglX/K8WrsAfWbW71mQTa6xj/Y44RmQBEWCMBzNqQGqlcQ==
X-Received: by 10.157.88.22 with SMTP id r22mr3647174oth.129.1513096387132;
	Tue, 12 Dec 2017 08:33:07 -0800 (PST)
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com.
	[74.125.82.180])
	by smtp.gmail.com with ESMTPSA id 67sm7948328otg.14.2017.12.12.08.33.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 08:33:05 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f180.google.com with SMTP id y10so18277896otg.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 08:33:05 -0800 (PST)
X-Received: by 10.157.41.10 with SMTP id d10mr4298716otb.284.1513096385152;
	Tue, 12 Dec 2017 08:33:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Tue, 12 Dec 2017 08:33:04 -0800 (PST)
In-Reply-To: <20171212161324.61705-1-stefan@agner.ch>
References: <20171212161324.61705-1-stefan@agner.ch>
Date: Tue, 12 Dec 2017 14:33:04 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoEJkBHo8bLQEScJrTFxPS-R74u-gR3QG_QvhRoLYWb9g@mail.gmail.com>
Message-ID: <CAP9ODKoEJkBHo8bLQEScJrTFxPS-R74u-gR3QG_QvhRoLYWb9g@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Stefan Agner <stefan.agner@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] waf.bbclass: explicitly pass bindir and libdir if supported
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
X-List-Received-Date: Tue, 12 Dec 2017 16:33:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 12, 2017 at 2:13 PM, Stefan Agner <stefan@agner.ch> wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
>
> On some build hosts distros (e.g. Fedora 26) waf tries to be
> smart about libdir detection and defaults to [EXEC_PREFIX/lib64].
> This obviously is not what we want for 32-bit targets and usually
> fails in the do_package phase:
>   WARNING: gstreamer1.0-plugins-imx-0.13.0-r0 do_package: QA Issue: gstreamer1.0-plugins-imx: Files/directories were installed but not shipped in any package:
>     /usr/lib64/libgstimxcommon.so.0
>     ...
>
> Depending on version, waf knows prefix or prefix, bindir and
> libdir as default options. Explicitly pass the right set of
> arguments.
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>

I think it is the best we can do for now. Anything fancier than this
is risky and would not be possible to be backported.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

