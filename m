Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3C9BE7316E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 11:24:24 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id cy9so16474637pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 03:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=W6jcJ6q0uQw5w71V0TTpil/wmvoLbj+zLvgyZ/BShaM=;
	b=BpM0dYDFs8WgQVytlY0OE6vZU4gNdvQDG6WN5eRhniKTNUDJWwyCm91AkzbCNFg3H0
	pCdhg8FX3M8vfcNuJAeSjPUu+laGOYBRwcGgyWeMDDaBOECjNRFcPg2d67hIVUp7Xxfg
	CyvIoanmbPOzKHYS6KLxZmQWbWbRGjgnMnEcKWGu8N6gcYfXSobIFv7P6JClkdbVcbO0
	LEpOUMXbt1Qlwrlddapil3tOiv+W3mvHbQy5LUhz5E62jHMQKSWIB1xrfr8LZt7cuJu1
	AnoMdLRGhPVRAFWx8mCxFyHnyTnEF8hciCub/i0hbgYgCY/TuE+aWUmNrexgpKDyAXxZ
	kJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=W6jcJ6q0uQw5w71V0TTpil/wmvoLbj+zLvgyZ/BShaM=;
	b=ktsFZnQcVSAfwJeBhKEbc/h9Hcq3abcTbTkM2BGQ1maB7I0pF9laVXP2XXvMrQgkz2
	tC4JoqS9ikcVg9969/Kc9/DhU9T4Ue/4UDSyE2gyg3gukQdF1WGffGWkfIQ9XIrrk9XU
	ZJ4W+AETwFbHSPKUSNVT2nbW3RsZ2dzIgWkkp97fph0Gg2M1X0WLPa2f0SasbGbiQTmD
	Rlvj9+30Urw1fMBoDpwlyGKQpDcQPJ+YLM7DZCI2M3dUIBOyg9YnKaEcg0VDCOj6f43s
	U3tHh/jX13i9RTmrRrUnX+Ss8jM/Xs+skjTRmtOmOqha7aXT1ipmx275R/YM0SfNvdUK
	8Xyg==
X-Gm-Message-State: ALoCoQlxpIntxXbGetQwrLK4miPEDdsli7LT3GW5q2dbceEB/8f1lYi5z8whRNVliC4NRipJ3piP7+bRU+vzmOuGCc0ifwWg3w==
X-Received: by 10.66.164.234 with SMTP id yt10mr26108938pab.11.1450697065424; 
	Mon, 21 Dec 2015 03:24:25 -0800 (PST)
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com.
	[209.85.192.180]) by smtp.gmail.com with ESMTPSA id
	s67sm8085634pfi.72.2015.12.21.03.24.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Dec 2015 03:24:24 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f180.google.com with SMTP id o64so87498836pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 03:24:23 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.14.217 with SMTP id 86mr26300536pfo.101.1450697063565;
	Mon, 21 Dec 2015 03:24:23 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Mon, 21 Dec 2015 03:24:23 -0800 (PST)
In-Reply-To: <BLUPR03MB1411453A7700F557F173C5ABE8E20@BLUPR03MB1411.namprd03.prod.outlook.com>
References: <1450389888-24760-1-git-send-email-tom.hochstein@freescale.com>
	<CAP9ODKryNw_GeZ7_87+geio0H54_GMuJ0fFkXvHfFVezqGGbEg@mail.gmail.com>
	<BLUPR03MB1411A316AD75000948872FC9E8E10@BLUPR03MB1411.namprd03.prod.outlook.com>
	<CAP9ODKpDTaDRndcdMYygHqO60fh5NU9uxyw-193rm=mtFdLyrw@mail.gmail.com>
	<BLUPR03MB1411453A7700F557F173C5ABE8E20@BLUPR03MB1411.namprd03.prod.outlook.com>
Date: Mon, 21 Dec 2015 09:24:23 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqoROWExozvMQ6KRekgDLX_AHvy4+7yDwXKGOVJ0onjqw@mail.gmail.com>
Message-ID: <CAP9ODKqoROWExozvMQ6KRekgDLX_AHvy4+7yDwXKGOVJ0onjqw@mail.gmail.com>
To: Tom Hochstein <Tom.Hochstein@freescale.com>
Cc: Sundararaj Prabhu <Prabhu.Sundararaj@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [<OE-core][PATCH v2 1/4] weston-init: Handle Weston startup correctly.
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
X-List-Received-Date: Mon, 21 Dec 2015 11:24:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Tom,

On Sat, Dec 19, 2015 at 4:08 PM, Tom Hochstein
<Tom.Hochstein@freescale.com> wrote:
> Can you be more explicit about what you mean by weston-launch wrapper? Do=
 you want to hide the current weston-launch binary and replace it by a new =
weston-launch wrapper? What happens to my proposed weston-start, which is i=
tself a wrapper? Does its functionality move into weston-launch?

Yes; my proposal is to use weston-launch to hide the real binary and
call it internally. This allows for everyone using weston-launch (even
on terminal or serial console) to benefit from it otherwise people
will be aware of the custom script.

> Can you help me understand the rationale for the extra XWayland script? T=
he existing weston recipe installs xwayland.so when the XWayland package is=
 specified. In your proposal, the weston recipe would also install the extr=
a script when the XWayland package is specified. Since the same XWayland pa=
ckage mechanism is used in both cases, the benefit of the extra script isn'=
t clear to me.

Because it would allow for same distro to generate one XWayland based
image[1] and another pure Wayland image[2].

1. xserver-xorg-xwayland (a) -> weston-module-xwayland (b)

   So (a) includes the inner script which says to weston-launch
wrapper to load the xwayland.so module. (b) is split out from normal
weston package so it avoids unneeded runtime dependencies.

2. weston

  weston includes just the normal weston bits so allowing pure Weston
images without manual changes.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

