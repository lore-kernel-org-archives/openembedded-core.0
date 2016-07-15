Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 50BC1606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 17:00:37 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id x130so3327750vkc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 10:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=fPPaPiGE7IJPOsCPpJQtdQL2SUDCYBSshINITzIINUM=;
	b=Q2GpN36jHUVSdeX5n3atrBYxiscQBewbnIFQK71oNJVBHG+IAQRuNwis7tK+8vhpyW
	KKMe/vMgfYzIiiwmvFv58D5v9D9WBlCKWOzG03K4peM85RneDNRparOEUIYopdvFrVKo
	2d54WpDFvwYdelEgxth3ooH1sJF2t/trFj2/wORj35+UijoGFKhdu3ZvpC0g6ik2ZRaI
	kUSVp0Lp2s76Ikfy+OZ3Q5yTzKjeUBS2AIuQ6Nk3Q+LTwqk8WzOq9s4SpSTvjEjzex7G
	QtC86CB+FRcxOoSFAZUyXBrEBalDySKP6wwIhCglUKLZuqzSXea8RbQGJWI0RVC03+QM
	5xqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=fPPaPiGE7IJPOsCPpJQtdQL2SUDCYBSshINITzIINUM=;
	b=RaIoPwu0SNGZ+HdWGuc4gdP+C1zfhYGPECWCaBQxTJ/HvN3ZB4VeamgjlZ9ldyG/uz
	NORA91gM4UTUbq3J8hngv8H2FFG5AY8CMT5GZEanN95wCH+gtFQL0e8WMkKpOM7JkOai
	9vh2chPVqyXYb/Ub6IF0rj806fo4sYY3zoY8Sbir+kyA6ubkxD0gO3ZlXSTr/S8Yw4m4
	s2H/U/OgI+EPhQq8Jfe9KzHHMWgy5WDNMcwCdFH/UBe5TTJ/3sDipgisybm0StydPBYA
	7T1vvOdELVHEiip+eahLtuo76N/8b7FgVnb4YKE59MtWSG5VlKa/EYHDLr9lL/IRdKPl
	dtVA==
X-Gm-Message-State: ALyK8tKKJ+/lzGOD/nbPjCFWqp3GMjrZCJEQHAZUS+qYJuzbXRb3u0aVe4n4Me8CAnLzgA==
X-Received: by 10.31.98.135 with SMTP id w129mr9678556vkb.106.1468602038099;
	Fri, 15 Jul 2016 10:00:38 -0700 (PDT)
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com.
	[209.85.213.51]) by smtp.gmail.com with ESMTPSA id
	o75sm1809494vkc.23.2016.07.15.10.00.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jul 2016 10:00:36 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f51.google.com with SMTP id x130so163581029vkc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 10:00:36 -0700 (PDT)
X-Received: by 10.159.36.15 with SMTP id 15mr9190649uaq.79.1468602036501; Fri,
	15 Jul 2016 10:00:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Fri, 15 Jul 2016 10:00:35 -0700 (PDT)
In-Reply-To: <1468600403-29471-1-git-send-email-tom.hochstein@nxp.com>
References: <1468600403-29471-1-git-send-email-tom.hochstein@nxp.com>
Date: Fri, 15 Jul 2016 14:00:35 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoWJ9eBDPU5VJyCgYb0dg6mFXyqH=bf-PJtMfOK+OVxkg@mail.gmail.com>
Message-ID: <CAP9ODKoWJ9eBDPU5VJyCgYb0dg6mFXyqH=bf-PJtMfOK+OVxkg@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] weston-init: De-couple framebuffer console from Weston for systemd startup
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
X-List-Received-Date: Fri, 15 Jul 2016 17:00:38 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 15, 2016 at 1:33 PM, Tom Hochstein <tom.hochstein@nxp.com> wrote:
> The framebuffer console was using the same I/O as Weston. We fix this
> by having openvt switch to the new VT when starting weston-launch, same
> as is already done for the sysvinit case.
>
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

