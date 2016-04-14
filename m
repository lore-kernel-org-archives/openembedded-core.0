Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1FB87601B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 19:59:54 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id zm5so47817408pac.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 12:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=HOyVp7l0CADQ6ym883FVm8wBuwyRoVoWsFJCeWM2Pd8=;
	b=FodjZDwGjRp5d9gaAOGE12kJEakIyUQgzP9aptaJ7PpgycqBt20q09oYJeD6kp4EA5
	W73W9Bt/h3d6SAH/VdZjqN5URjgiOQICzsDDrM+DxNCp6Ss9/dTYTeYpEH0s1J/fz3Vu
	glUcssnVgZ5Sh8PZp0+42jAc24DcoCG0nht+KYPqqgfeHNAUF6d2m9KglxLtgKiWjSZT
	g5ac9ry8PNQNqBR+2rekYzy5Dk6P8BaGf+wdm28GS9noc1RaH4OCTGlubEb5zUF6JL5B
	qNrgbSQMyPEJ9N3aSjEaNC8//qTdFegOALUcLWQpvV91RUYNXi1jmIWnNBhn25ZZar7V
	qUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=HOyVp7l0CADQ6ym883FVm8wBuwyRoVoWsFJCeWM2Pd8=;
	b=OupDj3c0Y9+OMT4Rf8jJj3s0yXZ20gIiExU4pLuCPPz5G/EovZk5GCGe1g63g2UXiS
	3vMLFf3U1DIJApbXS/jKY0O2WMfrK+dixIxyw6ejv8v8RtU3OX58yi8gRuXzPzkxNG4e
	pgxPqJr7YTG7l7J17R/cPTiyj430nEOovUSL4HTa82ETUOnAmv1nXW5LRhsmQhroih4l
	N+JU7Lq+5EMl/Zew0LeQODZPxlerMkcz6arsXv6GqDhp3IUfXZ6+nIKttXd3aGQWsm0k
	lm9W0WcWhMlkz+yM/vB5WvoK+LWLhP74E89wHv7Rhn6CNR7zHTVMmrbFrj4QitZvb8Q3
	VVOQ==
X-Gm-Message-State: AOPr4FVNooCM+biyNYFgp4/YLRfrh+PS/nRJd1WxpeaZfUEO3nghtldakipXBWoXOyAcYw==
X-Received: by 10.67.14.6 with SMTP id fc6mr23324091pad.55.1460663995727;
	Thu, 14 Apr 2016 12:59:55 -0700 (PDT)
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com.
	[209.85.192.175]) by smtp.gmail.com with ESMTPSA id
	ff2sm36052995pac.15.2016.04.14.12.59.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Apr 2016 12:59:54 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f175.google.com with SMTP id 184so49178970pff.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 12:59:54 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.32.5 with SMTP id g5mr23844807pfg.95.1460663993698; Thu,
	14 Apr 2016 12:59:53 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Thu, 14 Apr 2016 12:59:53 -0700 (PDT)
In-Reply-To: <CAJTo0LY-OG4PL20oQA_KLwR+SxwtrUQjnzsPefGDRUUKZ0TJkA@mail.gmail.com>
References: <1458850608-50481-1-git-send-email-kad@kad.name>
	<CAJ86T=Wbu31V7DqS2jcG8Kf+Ltq0vD9TR2k-XzGu89=BaM0QTg@mail.gmail.com>
	<CANFkWpmtVDEPH0Ou9oarxRP=YPMqPdJCAD_bKGTF+90ocCkAmw@mail.gmail.com>
	<CAJ86T=UUaCp8FK9V+oOwg4Cj7Hu_YH27VWvmRJ0MoP03dSS7Tg@mail.gmail.com>
	<20160410184953.GH16135@denix.org>
	<CAJTo0LY-OG4PL20oQA_KLwR+SxwtrUQjnzsPefGDRUUKZ0TJkA@mail.gmail.com>
Date: Thu, 14 Apr 2016 16:59:53 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpshEqCEGhOoJfv212xOJj_zHVf1Wja-oBEZhhMc-oq_Q@mail.gmail.com>
Message-ID: <CAP9ODKpshEqCEGhOoJfv212xOJj_zHVf1Wja-oBEZhhMc-oq_Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: use compress framework to produce checksums for images
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
X-List-Received-Date: Thu, 14 Apr 2016 19:59:57 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 14, 2016 at 4:53 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 10 April 2016 at 19:49, Denys Dmytriyenko <denis@denix.org> wrote:
>>
>> BTW, at least for md5sum (not sure about sha*), isn't the de-facto
>> standard
>> extension .md5 and not .md5sum? Can we change it?
>
>
> Picking a random upstream (https://download.gnome.org/sources/glib/2.10/)
> shows that GNOME used .md5sum until they migrated over to sha256sum, so I'm
> not sure there's a de-facto standard as two equally reasonable options.

Debian does as well, IIRC.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

