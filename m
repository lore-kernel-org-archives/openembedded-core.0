Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 299C97D3A2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 12:05:20 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id a184so6396693wma.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 05:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=PqoR4U2fPa42JO7m3JHmyRW6kucGQwJBdMr058udCG0=;
	b=W18OXTIF50Mr5xLtnUP1ljTtlbzE9oCMNCIu592vpFc/CFcSPDgcZBuFAASixsALhf
	P3bHEnmoIbX7AXJ4z9Y+TKmPO3U8R+GyEOL8jILZMGti4zdpULW/poRAImG8DszOvmDk
	7Wd27jLmBEzQhhoEKjjuc51uI0pxn3VcOqaKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=PqoR4U2fPa42JO7m3JHmyRW6kucGQwJBdMr058udCG0=;
	b=K850w+ngxPNe47aTBbAdnI9E/76WR3qtB+byxcYi6poZbVgiTlbWkEtOmFMJeAfU7N
	pxaSbqaseJY30gV3iNUzkSWnl9aVj1AZe2SOgBG5fmGuchf1h3dQMSYvYK4MhG8H/6yb
	wfmIH93QYePaF921yEyXbjzthU6NTfiKsdvRDriln8oKjIKUOkWZNjc3vZb0W8NmLGDn
	6tdNoe7Wf9l33lKn6gV3ZX03YbbSwsx6UPfpO3Q/eT3z3znEovEuzOPjhT3QKvONZByK
	ErQhA0NjDb1Sa99ufR+bLyjAk7rYmcu9il0fC13CYEc7iDok9xb4KWmz+VYCJ2hKqqEU
	h4Bg==
X-Gm-Message-State: APjAAAVYNcuIA0k5po8wPOBDBPZpC3/HdEnDoF/jvbIvRTR/lldAEUh0
	tCZq/o/RPsgEEkNUmd6jyPnGIg==
X-Google-Smtp-Source: APXvYqy7osmZwLzuVfGNaT+6f5xjROmF5BGYbUe/YdXX/IPpPT2Or1nvYO7W0P3Q3zbeJlpuHZRFwg==
X-Received: by 2002:a7b:c053:: with SMTP id u19mr2465614wmc.63.1554984321650; 
	Thu, 11 Apr 2019 05:05:21 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d14sm58606731wro.79.2019.04.11.05.05.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 11 Apr 2019 05:05:20 -0700 (PDT)
Message-ID: <60b0b95f4227efd2be7ac7908b92aa08243de396.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Zheng Ruoqin
	<zhengrq.fnst@cn.fujitsu.com>
Date: Thu, 11 Apr 2019 13:05:19 +0100
In-Reply-To: <CANNYZj_rYwg3Y5uDxKiwzJZrzMsmjLCNXOU2TMpgmB5Ydgt2sw@mail.gmail.com>
References: <1554995545-20943-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CANNYZj_rYwg3Y5uDxKiwzJZrzMsmjLCNXOU2TMpgmB5Ydgt2sw@mail.gmail.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dnf: Enable nativesdk
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
X-List-Received-Date: Thu, 11 Apr 2019 12:05:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-04-11 at 13:19 +0200, Alexander Kanavin wrote:
> On Thu, 11 Apr 2019 at 08:13, Zheng Ruoqin <
> zhengrq.fnst@cn.fujitsu.com> wrote:
> 
> > +RDEPENDS_${PN}_class-nativesdk += " \
> > +  python3-core \
> > +  python3-codecs \
> > +  python3-netclient \
> > +  python3-email \
> > +  python3-threading \
> > +  python3-distutils \
> > +  python3-logging \
> > +  python3-fcntl \
> > +  librepo \
> > +  python3-shell \
> > +  libcomps \
> > +  libdnf \
> > +  python3-sqlite3 \
> > +  python3-compression \
> > +  python3-rpm \
> > +  python3-iniparse \
> > +  python3-json \
> > +  python3-curses \
> > +  python3-misc \
> > +  python3-gpg \
> > +  "
> > +
> >  RRECOMMENDS_${PN}_class-target += "gnupg"
> 
> Do not copy-paste large chunks like this please. Assign the
> dependencies to a variable, and use it where needed.

Its worse than that, those are target dependencies, why would nativesdk
need them?

Cheers,

Richard


