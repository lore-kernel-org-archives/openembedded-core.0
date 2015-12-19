Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5B0FB6FFEC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 09:57:34 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id u7so15260631pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 01:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=lc1AgVFtq7XoR21HC3u08CZBEvf1F6ndNrXDNijLzp4=;
	b=wyZWtgIBsMgGjh/f8A04BLuQ6bex/eBSbO301S7ekvUYFvDIKtW2Ip0ZZ77ol16AXz
	LHsojugkX8TEU+feJImnl7PIzFv7tltsFrTl7xI90r56MJ1gyRLU/3GUZdI2RmvGEIef
	ZisYi3jQZUyoSH1Py1eBK8oJitxVqfcD61hczWXEWZgEag+7LCIZD/97dPsaPNVfBPq/
	mtQTemSlwI0K1HuYZo16aoUTunArk78loVTi7Q8HqI6RfVllaRuet3R5xMV/kK4ZyXDX
	dYCpt2beiShnYY5yhK4+XtaE0T2YtUDwVo/6WqSU6ZdspP550WBa1YTGNJA7hWtF8AwZ
	aQ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=lc1AgVFtq7XoR21HC3u08CZBEvf1F6ndNrXDNijLzp4=;
	b=D7wDEW2EyyqOosspTRMauMgHa6zDQV44JGz5IZujxfSs4JSoRBwNIMHTlGjK2VWgx6
	qdHf0rfyQRa74ZExUaKedfXdhacpELQVSRFGr3Qd92V6UjHL0QEME2p2KOqjiT26xHjG
	0aOvrHWvZ9UD4uUevF3J44vcZIU8xRfpjhExbbjY1bzGIB2vRsPD2jjkx4WlfB3887sv
	yG2rbtVIXPeuOZ9Tt6mHobiwDvU1t13m5lSa/x8Lt6RU9sZgxxo8jwsyL4rD2cspQj27
	pZzFHgwaDjMA5noYN+ve+bU3tYD9tlmSIFg0+yaFv4ZEWBRsWTflK2VoFbFjnLDbp8bc
	fIog==
X-Gm-Message-State: ALoCoQm2qwsnQcYm9SlDB69JZL8ehnzR+B5aR1BoaGsEcdpk/LQRFJskHjEg0rjJZYqYIL0Vk23y6EZR3JE1cmm+mpxD40cKRQ==
X-Received: by 10.98.8.212 with SMTP id 81mr11913120pfi.165.1450519055591;
	Sat, 19 Dec 2015 01:57:35 -0800 (PST)
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com.
	[209.85.220.47]) by smtp.gmail.com with ESMTPSA id
	x22sm10248727pfa.82.2015.12.19.01.57.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Dec 2015 01:57:34 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f47.google.com with SMTP id wq6so73170471pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 01:57:34 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.122.72 with SMTP id lq8mr11868290pab.1.1450519053758;
	Sat, 19 Dec 2015 01:57:33 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Sat, 19 Dec 2015 01:57:33 -0800 (PST)
In-Reply-To: <BLUPR03MB1411A316AD75000948872FC9E8E10@BLUPR03MB1411.namprd03.prod.outlook.com>
References: <1450389888-24760-1-git-send-email-tom.hochstein@freescale.com>
	<CAP9ODKryNw_GeZ7_87+geio0H54_GMuJ0fFkXvHfFVezqGGbEg@mail.gmail.com>
	<BLUPR03MB1411A316AD75000948872FC9E8E10@BLUPR03MB1411.namprd03.prod.outlook.com>
Date: Sat, 19 Dec 2015 07:57:33 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpDTaDRndcdMYygHqO60fh5NU9uxyw-193rm=mtFdLyrw@mail.gmail.com>
Message-ID: <CAP9ODKpDTaDRndcdMYygHqO60fh5NU9uxyw-193rm=mtFdLyrw@mail.gmail.com>
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
X-List-Received-Date: Sat, 19 Dec 2015 09:57:37 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 18, 2015 at 8:36 PM, Tom Hochstein
<Tom.Hochstein@freescale.com> wrote:
> Hi Otavio,
>
> Does the existence of /usr/lib/weston/xwayland.so give us what we want?
>
>         if [ -f /usr/lib/weston/xwayland.so ]; then
>             mkdir -p /tmp/.X11-unix
>             OPTARGS="--modules=xwayland.so $OPTARGS"
>         fi
>         openvt $OPENVT_ARGS -- sh -c "weston-launch -- $OPTARGS > /var/log/weston.log 2>&1"

No.

I think I came up with a plan:

 - make weston-launch to be a wrapper
 - make it source ${datadir}/weston/weston-launch.d/<scripts>
 -  XWayland package, you install a ${datadir}/weston/weston-launch.d/XWayland

XWayland file:

mkdir -p /tmp/.X11-unix
OPTARGS="--modules=xwayland.so $OPTARGS"

Done. It became a generic one ;-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

