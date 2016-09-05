Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2785177382
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 14:40:07 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id v189so3254893vkv.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 07:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=VDh30JC0qw49jVZYMN0xmeUHqBjfsxe79G7RLeOFXDI=;
	b=xzJuQwlIJ/HlxW2qtFtlkZt+uEh5TRyVmqgrjD9G1B1lr9AK3UZDiemWSI9KDIHnra
	JcZ3zTTPAOoZ0VyNTeizWh25zty7rTKns5ANzc3TTQ03YVhdEQJXy1Sg6ytHfYNivGxo
	7OXHZRymo5s4y36Tdt084mWedXp1hUsdJPeOmtQt/LCYKhDi4E/IFT31vSos6Amicfaa
	/rD81nau+csTGOGvbSFAGZvyzAee4diCIWrZBmp1+HJLB+KyxBNXvVzSr8NIRs6ljSXW
	oFKL0fBOKsPGT/X0wKlgnoRgb7iK3H3uaIvlISpfGFxNsnu8dmKsrhPcGW9+YdQIKk+2
	TIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=VDh30JC0qw49jVZYMN0xmeUHqBjfsxe79G7RLeOFXDI=;
	b=UUmJn8/emfKYA4mRVc9R3//6SXrKlMBTk4qK1qA/TDM2sf3c5C8ss1fHmVHyRswZtW
	fxbYaku4StWpFcdDX5u2d8HPyVF1VI1sJ2rGFFcH5JVHSe10V0Kq0nHhJdPt9yI2r6tD
	lTvwNYRIRaXLJ8mbKghgRSHytb459okuatzInscyCNAV96WRpdjs+EMHgzCex+2zv23I
	mY5u3FXSAdBsuB7a+ONsmLk7NgNC5I/vj1+KWZBaugcal8UfMZ5iMkQDlFZ7dbvPJVRn
	iA/A7YppjsE0TeV83DaKzfYoxI2PijifA5sOkon3vMUUGYRPQ6md4teCYVA1z4m++4nA
	2h2g==
X-Gm-Message-State: AE9vXwMlOeMQOMHvthCuXpe1rpxIQYlx9qIV0CwvqP0iLBWVROOPlEnRytHTx+Ka4lJBzg==
X-Received: by 10.31.226.66 with SMTP id z63mr2078164vkg.82.1473086407475;
	Mon, 05 Sep 2016 07:40:07 -0700 (PDT)
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com.
	[209.85.217.180])
	by smtp.gmail.com with ESMTPSA id r94sm3147107uar.1.2016.09.05.07.40.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 07:40:06 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ua0-f180.google.com with SMTP id 31so27192938uao.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 07:40:06 -0700 (PDT)
X-Received: by 10.159.33.232 with SMTP id 95mr22958808uac.39.1473086405739;
	Mon, 05 Sep 2016 07:40:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.154.68 with HTTP; Mon, 5 Sep 2016 07:40:04 -0700 (PDT)
In-Reply-To: <1472639558.29583.70.camel@linuxfoundation.org>
References: <1472639558.29583.70.camel@linuxfoundation.org>
Date: Mon, 5 Sep 2016 11:40:04 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq8Z8z4a7SoZoxzOz8GrEWnsoZZoL8Se++wMMWJp6yzsQ@mail.gmail.com>
Message-ID: <CAP9ODKq8Z8z4a7SoZoxzOz8GrEWnsoZZoL8Se++wMMWJp6yzsQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lttng-modules: Update 2.7.3 -> 2.8.0+master
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
X-List-Received-Date: Mon, 05 Sep 2016 14:40:08 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 31, 2016 at 7:32 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> We need master for the changes to work with 4.8 kernels.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

This broken for kernels which does not enable CONFIG_TRACEPOINTS.

Up to now, the lttng-modules build were fine if this was disabled just
printing a warning on the build. Now it makes build fail.

The behaviour changes was made on:

https://github.com/lttng/lttng-modules/commit/ca62d279e2e83fd46b8a04e6ad4471e9f8fc7c47

Another thing I noticed is that we ought to be using stable-2.8 branch
or name the recipe accordingly as master is in fact 2.9-pre.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

