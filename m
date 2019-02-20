Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id A9D1E7C6D7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 08:22:21 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id i5so38769279oto.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 00:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AkPcaexaVogOQDLc/SM61ngeOAeo8WEXnX69MTrXi5A=;
	b=gpzXr1KgfO/30fO5r8MWX9LLuKdxw5c3RXyVxqhwU8xb4F52K//Lmhe9voadWwqQVK
	tMpJG7/r5W05Rt5lPzjoW1IOmLnqmEFcQiiR5qUZnIqdpimAhTrPoOATvrJLMryiIw4z
	3sK0/e+YY1JA0Z8/JnbaXyrVdiXCR6N4KgyjRMhG545lLazNP5wV3JLji7vHlpytOlsy
	RRx+TiJxgArSdtl+Q1Dc8mdEPOC7p/QCNYHpepfU/GZwhvrhIxNhDIz5ISs/5PEw94CE
	6kWyMSSiniDogl9vuzHlQ7zpdZiWqI98gHt/XqoHoQGyl/uhQr+H+1+HF6wOQw3Xm7Hz
	J1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AkPcaexaVogOQDLc/SM61ngeOAeo8WEXnX69MTrXi5A=;
	b=mvzoFly5yVbimds+QvD7Em5IT3gHU0V6lNQojfsHUQOEZnYJG5FhqQ7x+52t8l3BFr
	B/5UBvRdAB3w21ZkJQd3dXKEAT0aK7i17DOFp91nGYoQStmvBk9KsMnWN6BL0v9nduuq
	j2+KqBdZQIy3oHUaMg3CgajUCkfl39p7DGgYTJ0eUQ3KZt5qmmKIUNstCJHpQbUbFGX8
	Y05YsE6JXV52tGSrTPLCnHqFVviYJgJ6vymrTNYDvaQSgYpAthLioxkGZEqTWqQBerfQ
	oB0jeL5AHhHXQiTYsSvQgG+MmW9qLobUNkkG0LqyzV856V3Fi3cX8ts3rhQOwPiRl0Ff
	Jmog==
X-Gm-Message-State: AHQUAuarwqjPX8K7HY7LKTPBOIKOjyBby+1HQ2LugNE2Uhq7E8+YYJB0
	cqqBb6XL64/Y+tm0gpzXi+7G63jhAM1fWt1HLyM=
X-Google-Smtp-Source: AHgI3IZhBgtWTNTj1EY8l6baOqmXFCxZ7GlNs58b5sxYwhLLY3pcCUA4kYJk/rkSkcFUGSd/KPdtWyM4VsgoK4gQb7Y=
X-Received: by 2002:a9d:4ca:: with SMTP id 68mr10744460otm.96.1550650942721;
	Wed, 20 Feb 2019 00:22:22 -0800 (PST)
MIME-Version: 1.0
References: <20190219165906.14377-1-fabio.berton@ossystems.com.br>
	<CAMKF1souMyUMczQ+-s_+W2Tomi=Q-7dj7Us1bwQ23rDS5CPx=Q@mail.gmail.com>
	<CANNYZj9Abo0ZeUVq7jgkHLc6rENns=GptXNHq9eN-j_rJ20noA@mail.gmail.com>
	<bd16855764cfba4d700e2be8c8ea7cecbf2dec9e.camel@linuxfoundation.org>
In-Reply-To: <bd16855764cfba4d700e2be8c8ea7cecbf2dec9e.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Feb 2019 09:22:10 +0100
Message-ID: <CANNYZj98LDCmKD2va9zX26OJCFhTS-jNs6=aikLrAx8VW-CNeA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] mesa: Update 18.1.9 -> 18.3.4
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
X-List-Received-Date: Wed, 20 Feb 2019 08:22:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Feb 2019 at 08:58, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > I guess xrandr needs to be in X11_DEPS, this was added in the
> > original
> > mega-patch, but overlooked in the split version.
>
> There were failures all over the autobuilder from this as well :(

That's why I still think it would've been better just to test and
merge the original all-in-one patch, with follow up patches if
necessary. Doing this split and delaying meson into 19.0 is just more
overhead and work for everyone.

Alex

