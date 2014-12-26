Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1F45672656
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 14:01:56 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 79so5070156ykr.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Dec 2014 06:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=6itNXOIBTULPB52fmHMBcfp1Cp/nAsQwHPQltcEZL3U=;
	b=XpKUQsc+3o3BUcgJJPrT5fZjA0Q6gbY2sTN5mj6typIsBluVxvA+LVF/9Q/V8keTwM
	4h6zgWimP+wtickiF2b+bQ0Ya0IFtmKGXVPkJ80z88Amk4J8yBi5SQKQLVl3e9APuR5a
	9oyub1giF/VJobmJaV7szJ+IIMMIk9Ch4MkKkBVTVI0+ZSOYFPUuSuxqYeNZQk0A1/Yc
	mo9w0rRQOYTeuRMe52RNG14y9dG7ieDC0u+Vy7FLnUosqVDS8ur+K1LjBkYWK2kGXI/E
	VvarlNKceki+kToaS+GAHRTtw1iZct+8Jjco31VxDj2qjOGaKM5Xi2iOLhL22HKI72ly
	LiCQ==
MIME-Version: 1.0
X-Received: by 10.236.30.98 with SMTP id j62mr22127328yha.105.1419602516375;
	Fri, 26 Dec 2014 06:01:56 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Fri, 26 Dec 2014 06:01:56 -0800 (PST)
In-Reply-To: <1419478883-14044-1-git-send-email-jackie.huang@windriver.com>
References: <1419478883-14044-1-git-send-email-jackie.huang@windriver.com>
Date: Fri, 26 Dec 2014 12:01:56 -0200
X-Google-Sender-Auth: RR4uVd3PdFvuIGNapUd-6e6GZ24
Message-ID: <CAP9ODKp-Gvo0hed3iww8uji90x5yVHJ_kKd6sE_bMnFO3KTurQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Huang, Jie (Jackie)" <jackie.huang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-2.0: filter out -fvisibility=default option
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
X-List-Received-Date: Fri, 26 Dec 2014 14:02:05 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 25, 2014 at 1:41 AM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> Once -fvisibility=default option is added, matchbox-desktop
> will run into segfault, so filter it out as a workaround for now.
>
> [YOCTO #7099]
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

Sorry but I think this needs fixing in matchbox-desktop and not a
workaround here in a library which is used in several projects.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

