Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id A154F7CA60
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 15:21:55 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z84so6840292wmg.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 07:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=jntpUmWhy3WVIQ95iH22Jy/SP5rFEt18WMqFfK3iCxs=;
	b=JEt9S8QFyFmrNd2mgo1HgVUBqGpsweQvuhsFQRl2TdNRGMb49LiJRuOuY9YSTrHS91
	XvttaEPQ9gfIAQ6Qs7Pv7sQ26w7HBG6I0yPHOJ5r22t7MBDMi8+rxfsiMIfjE3LsXyOk
	nLmPwmOW9UxTdxV/QnIG5lTRh3LxAQI4m/y0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=jntpUmWhy3WVIQ95iH22Jy/SP5rFEt18WMqFfK3iCxs=;
	b=a1dRrYqvaWDJBDP+gQGPCtpzTbPiC5bLnnEB1NspnD7dlJ8cFwjEAOaVnM9WTYPxHU
	/t/UPU+5nk5YkdPABTuM+L7fv1B7dB9UcqfiZ/33YDsuNKvs2aNFXp7CzbEUXzt90AYm
	LsRCP857IFwTlmJuwUlFPH6au06iy/EdRKUUaxNuZEJyC+AuHh6PY/9BF4K8A//aWk4I
	NuYNPn/OW3Ny8jbwy1HY7QL+gjB3l8waF/d4odYrR66dkyr9q/rD3R+myEpiQdc5d821
	dXhv3ZypG7rzyJi8joPY3Sr0nfcInXWO0CyLGBUF0RVrYYFVvY/mCbFuLYECBN4ktIfr
	wpDQ==
X-Gm-Message-State: AHQUAuaf3V4uuivAsahFi2FrIEl6FMkCEUBW9G3F8ZW08k0hx18t054M
	yf/2zCb5bQtOAY77QeyYyXSEIA==
X-Google-Smtp-Source: AHgI3IbKl2ukN0kqM6FyeIUUPjvFFj6TWVXxpmbIkX9CKf26VBKIv70xwT5cZs8MYQ0p0INwOcEDXQ==
X-Received: by 2002:a1c:6306:: with SMTP id x6mr7591003wmb.144.1550676116226; 
	Wed, 20 Feb 2019 07:21:56 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u184sm12968251wmg.45.2019.02.20.07.21.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 20 Feb 2019 07:21:55 -0800 (PST)
Message-ID: <6620040d80c34ea1a79f622e1ceea4c15f095f0b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Fabio Berton
	<fabio.berton@ossystems.com.br>
Date: Wed, 20 Feb 2019 15:21:53 +0000
In-Reply-To: <CANNYZj9yLw3oYy0AK6ey2F85JTV9onR47fdxCpNTMjMsyg5R_A@mail.gmail.com>
References: <20190220121544.9462-1-fabio.berton@ossystems.com.br>
	<20190220121544.9462-2-fabio.berton@ossystems.com.br>
	<CANNYZj9yLw3oYy0AK6ey2F85JTV9onR47fdxCpNTMjMsyg5R_A@mail.gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/3] mesa: Replace dri-native with dri for native and nativesdk classes
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
X-List-Received-Date: Wed, 20 Feb 2019 15:21:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-02-20 at 15:47 +0100, Alexander Kanavin wrote:
> On Wed, 20 Feb 2019 at 13:16, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
> > -DRIDRIVERS = "swrast"
> > -DRIDRIVERS_append_x86_class-target =
> > ",radeon,r200,nouveau,i965,i915"
> > -DRIDRIVERS_append_x86-64_class-target =
> > ",radeon,r200,nouveau,i965,i915"
> > +DRIDRIVERS_class-native = "swrast"
> > +DRIDRIVERS_class-nativesdk = "swrast"
> > +DRIDRIVERS_append_x86_class-target =
> > ",r100,r200,nouveau,i965,i915"
> > +DRIDRIVERS_append_x86-64_class-target =
> > ",r100,r200,nouveau,i965,i915"
> 
> This produces:
> > configure: error: classic DRI driver 'r100' does not exist
> 
> radeon has been renamed to r100 in meson builds, until then it should
> be still 'radeon'.

Its getting a bit frustrating/tedious to kill all the builds and drop
the mesa patches again :(

Cheers,

Richard


