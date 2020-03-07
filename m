Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 419CD61996
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 16:58:50 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v11so5944295wrm.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 08:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Iwd1fB306dl1P6BrfwNq2Gh6q7YUpOU28+0trXVtXVA=;
	b=h4H0mQ43Txe24O8QOtDtRVgzKQ0b1+3WxmkVWKIjRqHIl/zLVvnoEUMd3z9A0AHw/I
	Js78WkEQp/eqPwABFS6g02Mvw82WnSQZtwukTbiUQTsX1tvBysw3NOpWgdTETGUShRGU
	88Wiuh4wnIR/k0PqG8e12IqHGED9IGbPGDJaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Iwd1fB306dl1P6BrfwNq2Gh6q7YUpOU28+0trXVtXVA=;
	b=rxFeHVxzWPTdCkNkblrwFUGU0KNrHK95taStgamgVodrn+zIbjC30dcK1STPOE+OXL
	af/tXKko7cialZd6On4udUp3euf1XNWbh+d8/0hhWRZhnvozndyEBWI+lyrBI8szRZcH
	HAotcyKGJznitUA4SHRWmtPYKpQz91+2V9EeEXAAAtiEjntDZQHVUUmz88Zs8FKKVI0H
	FMexAcRGiMJgdkJFuAsDGJs5YLlVoxGpi3bcRPDdT3InbRCPU5mx4B/etoJt5jfRVgAl
	dhgqovKmMtMcSN0curZs4da9LapU6YOBgrq3SD2WjQR0mI0pw8DdMvt7wiiFpElUcWtG
	acEw==
X-Gm-Message-State: ANhLgQ0zsGlqes6poujPJFgiOk6wzRY+8vTgOGdFo6/OJMJaxT81ReWp
	WnKMbErgsJU/mlWdvRyX7b5xHA==
X-Google-Smtp-Source: ADFU+vu/q0Aj0vYUUt1K6PQFfZKyJgATr4Umsju2VsNWjlNBakWN5WhFDgGTsqqlo67ndI+jsCwEoQ==
X-Received: by 2002:a05:6000:1081:: with SMTP id
	y1mr10329201wrw.52.1583600331778; 
	Sat, 07 Mar 2020 08:58:51 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t18sm4241590wml.17.2020.03.07.08.58.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Mar 2020 08:58:51 -0800 (PST)
Message-ID: <c348a21730c09536d06458ac5e5d50377f381f4e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 07 Mar 2020 16:58:49 +0000
In-Reply-To: <CANNYZj_Q72+SDFEeq68d214wt+Ft4NA0gUYHEYsdCmzkv+b_pw@mail.gmail.com>
References: <107c01d5f174$bbf566a0$33e033e0$@gmail.com>
	<CANNYZj83rytWFgGPj6BS6R874eqa6_KCoeoMA5afgnx-_YBunw@mail.gmail.com>
	<efd0caee261782a0b8d752c728c25be23f69cbae.camel@linuxfoundation.org>
	<CANNYZj_Q72+SDFEeq68d214wt+Ft4NA0gUYHEYsdCmzkv+b_pw@mail.gmail.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Yocto Project Status WW09'20
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
X-List-Received-Date: Sat, 07 Mar 2020 16:58:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2020-03-06 at 22:53 +0100, Alexander Kanavin wrote:
> On Wed, 4 Mar 2020 at 23:42, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > Just FYI I think there may also be a couple of other packages
> > coreutils
> > pulls in and they may also have reproducibility issues (gettext-
> > ptest,
> > glibc-locale-* and procps*).
> 
> Patch for gettext also sent :) glibc-locale and procps I could not
> reproduce :-/

Thanks for that fix, it helps!

FWIW, what I'm seeing with glibc-locale is that these files "disappear"
from the packages in one of my builds:

./usr/share/locale/vi/LC_MESSAGES/libc.mo
./usr/share/locale/ko/LC_MESSAGES/libc.mo
./usr/share/locale/en_GB/LC_MESSAGES/libc.mo
./usr/share/locale/ca/LC_MESSAGES/libc.mo
./usr/share/locale/fr/LC_MESSAGES/libc.mo
./usr/share/locale/pl/LC_MESSAGES/libc.mo
./usr/share/locale/id/LC_MESSAGES/libc.mo
./usr/share/locale/hr/LC_MESSAGES/libc.mo
./usr/share/locale/uk/LC_MESSAGES/libc.mo
./usr/share/locale/ja/LC_MESSAGES/libc.mo
./usr/share/locale/gl/LC_MESSAGES/libc.mo
./usr/share/locale/es/LC_MESSAGES/libc.mo
./usr/share/locale/el/LC_MESSAGES/libc.mo
./usr/share/locale/pt_BR/LC_MESSAGES/libc.mo
./usr/share/locale/sl/LC_MESSAGES/libc.mo
./usr/share/locale/lt/LC_MESSAGES/libc.mo
./usr/share/locale/rw/LC_MESSAGES/libc.mo
./usr/share/locale/sv/LC_MESSAGES/libc.mo
./usr/share/locale/cs/LC_MESSAGES/libc.mo
./usr/share/locale/nl/LC_MESSAGES/libc.mo
./usr/share/locale/zh_CN/LC_MESSAGES/libc.mo
./usr/share/locale/ia/LC_MESSAGES/libc.mo
./usr/share/locale/fi/LC_MESSAGES/libc.mo
./usr/share/locale/be/LC_MESSAGES/libc.mo
./usr/share/locale/ru/LC_MESSAGES/libc.mo
./usr/share/locale/nb/LC_MESSAGES/libc.mo
./usr/share/locale/zh_TW/LC_MESSAGES/libc.mo
./usr/share/locale/tr/LC_MESSAGES/libc.mo
./usr/share/locale/de/LC_MESSAGES/libc.mo
./usr/share/locale/da/LC_MESSAGES/libc.mo
./usr/share/locale/pt/LC_MESSAGES/libc.mo
./usr/share/locale/hu/LC_MESSAGES/libc.mo
./usr/share/locale/eo/LC_MESSAGES/libc.mo
./usr/share/locale/it/LC_MESSAGES/libc.mo
./usr/share/locale/bg/LC_MESSAGES/libc.mo
./usr/share/locale/sk/LC_MESSAGES/libc.mo

I can conform they're not in the glibc stashed-locale sstate object so
they disappear somewhere before that in the glibc recipe itself.

Quite where/why I don't know as yet.

For procps, the timestamps in the output are different, that is the
only difference. That means something is indeterminate with the source
epoch for that recipe. Again, why, I don't know. The two stamps are:

2019-12-08·04:06:03
2019-12-08·04:05:49

This latter one could potentially be a bug in hashequiv (cc Joshua). It
may need that stamps patch I have fixed up to resolve it. The fix it
needs is to make it apply only to certain tasks.

Cheers,

Richard


