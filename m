Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
	[209.85.210.44])
	by mail.openembedded.org (Postfix) with ESMTP id BD1DA7D8A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 23:28:00 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id d24so3527605otl.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 16:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=ufyPsRjpJKGrmirFQdCA2efwKXehgYhqbPKX/f+CC3M=;
	b=k1TcnP8KNBIP+OftMpSxr8Sccdhl/Req2pMPPBMrViKsOQ2F+11jX+IMJbjcxTN+py
	3Leg0opTSpKJsM+G1CYX3l2z0p3KUGvecSImkI2GVvjERrkVZp8Qt8GEe/+4wAs5GOcj
	cv97mhLPNki4LHo6YSTV/fSKXvp3NoY3u+t+OvYM78b5D/3plfoj8Tk4aHvqwnAgifey
	2gQgrrUKPa2xYdNGcUxpySgvUFNvtk7hS0QXmuePtnTLNRag27ZZIX+qVEKX6Hkh4C0F
	33gha4lJb4IRV6+5VvSwVI94y+udIIrwJX5+H+h3k4GvVFw8zSqdsqYqDaLl5fTxyihU
	kGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=ufyPsRjpJKGrmirFQdCA2efwKXehgYhqbPKX/f+CC3M=;
	b=CwvGBD8DFoo6c++M7YYwncQqiV1IhIwL0bcLh98Bt9cr1nPbGys61nvrkSWBFuM+Ky
	tMapVSEFtpBuQaPv8B+GbvQG+R4f7MkVOct6WUkiGWwOaJbwK+BpAhj2D4maTISnCiVc
	aB2daOnneMGP/HL2KX6vy9IIyKm+pPjdBsMoZ5Iqr4amh7ETOVf1fe/iGiPU2kpQWATY
	u6m/XpAsl5BJhEempQw8YKXyNyUSioxEuCP4GipprPkgeCj/NKXUeDj1MpE4pbKBy41S
	rOn9vWXCzSqBm0Et8xE/IGys0I+5pUpFiof2QLImqeXRrGz+M6D2V3BYvCqeh9pOX+eo
	uo1Q==
X-Gm-Message-State: APjAAAV3bTXaQy0HKOsT/VwUc3rKd3oy+o/BXLbpUhwJdzHt3CnwtLeO
	mDnNY3bAGm/liT3wr+VLErh8RWLsO2aZIA==
X-Google-Smtp-Source: APXvYqz0KiGlpPYZc9WR+RNBZrRYpkCJ6pYhdPFs+a1lfUq8mgQw3YtH8oCT7As4eF2Yo14wfr995Q==
X-Received: by 2002:a9d:6d05:: with SMTP id o5mr30429159otp.175.1554938881435; 
	Wed, 10 Apr 2019 16:28:01 -0700 (PDT)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com.
	[209.85.167.173]) by smtp.gmail.com with ESMTPSA id
	m63sm8411767otc.76.2019.04.10.16.28.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Apr 2019 16:28:00 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f173.google.com with SMTP id e5so3339352oii.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 16:28:00 -0700 (PDT)
X-Received: by 2002:aca:812:: with SMTP id 18mr4283615oii.134.1554938880002;
	Wed, 10 Apr 2019 16:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190410231254.25763-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20190410231254.25763-1-richard.purdie@linuxfoundation.org>
Date: Wed, 10 Apr 2019 20:27:34 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrat=4kOWAxe+RpS1w0coY-9ZAxFNCHDwNQF8mbP3MGaA@mail.gmail.com>
Message-ID: <CAP9ODKrat=4kOWAxe+RpS1w0coY-9ZAxFNCHDwNQF8mbP3MGaA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: Update to gain key bugfixes
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
X-List-Received-Date: Wed, 10 Apr 2019 23:28:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 10, 2019 at 8:13 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Newer distros are using new versions of glibc and coreutils which use the new glibc
> renameat2 function. We need to intercept this for correct functioning of pseudo. This
> is essential to ensure new distros continue to work with the project.
>
> Also, this version has a fix for path/inode cross corruption problems which
> may explain our mysterious locale permissions issues.
>
> Many thanks to Otavio and Peter Seebach for the help in figuring this out and
> fixing it.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Glad to help! ;-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

