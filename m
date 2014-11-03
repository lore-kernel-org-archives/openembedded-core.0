Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2480A60E49
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 10:00:40 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so5933634wiv.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 02:00:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=5u2w59k86hMltQ0v0TSDygwDGbcMq3o8Wjr5sqVFbQ8=;
	b=T+fAx8gIsisS61++i5nossW4VeYSPFBradek/4G3qwQbjTNVkO2JkJP8+iOEJ2Uskp
	RR5umzlvYnXN1XFoDHmRTwa87Xc26d8oyemHrz8cyvW2K+iw1k0COSFzcLEf0PB0IE2w
	YuZI9SW5+Yl5PqjgCYDjHmYEgDcnw5GH+zFHgyNwuqDI6h9TY8JnpGsvvGXBoogn7zdz
	g3GslAgO/xjyRHPlH7bObTbbOPqEWda5KfWxp+a/eJMdjvrZrFvVj/OmyWm2AImB4Edz
	qAk2LY6ojfLZGcbC5MasWtIKk/CIkGxanDKJfQBSnMM8qacT2h9CT1SNrKv29pdEucg/
	dhZQ==
X-Gm-Message-State: ALoCoQlNJGLncMPQJgUmlRQaXk35xg/ilpF9NC6KzqUZMfxFAxIKXNZxUafiqvTHmC8FuNNGduFU
X-Received: by 10.194.133.229 with SMTP id pf5mr47526172wjb.73.1415008841417; 
	Mon, 03 Nov 2014 02:00:41 -0800 (PST)
Received: from ?IPv6:2001:610:612::c425:582d:3e89:67a7?
	([2001:610:612:0:c425:582d:3e89:67a7])
	by mx.google.com with ESMTPSA id dw9sm8167760wib.0.2014.11.03.02.00.40
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 03 Nov 2014 02:00:40 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <afef7088ee50cfc2be2d08f16ddd8fe087a1c490.1415000039.git.hongxu.jia@windriver.com>
Date: Mon, 3 Nov 2014 11:00:39 +0100
Message-Id: <8179B6FE-56F3-4DDA-B1A6-D190E576AEC6@dominion.thruhere.net>
References: <cover.1415000039.git.hongxu.jia@windriver.com>
	<afef7088ee50cfc2be2d08f16ddd8fe087a1c490.1415000039.git.hongxu.jia@windriver.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: add network config while networkd supported
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
X-List-Received-Date: Mon, 03 Nov 2014 10:00:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 3 nov. 2014, om 08:37 heeft Hongxu Jia <hongxu.jia@windriver.com> =
het volgende geschreven:
>=20
> While networkd supported, we add network config which starts
> dhcp by default.
>=20
> And the customers could edit it according their own requirements.
> (dhcp or static ip...)
>=20
> It refers:
> https://wiki.archlinux.org/index.php/systemd-networkd
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
> meta/recipes-core/systemd/systemd/oe-core.network | 8 ++++++++
> meta/recipes-core/systemd/systemd_216.bb          | 6 ++++++
> 2 files changed, 14 insertions(+)
> create mode 100644 meta/recipes-core/systemd/systemd/oe-core.network
>=20
> diff --git a/meta/recipes-core/systemd/systemd/oe-core.network =
b/meta/recipes-core/systemd/systemd/oe-core.network
> new file mode 100644
> index 0000000..fcaefc2
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/oe-core.network

First: config files on the target shouldn't be named after the =
buildsystem, a better name would be 'ethernet.network' or something =
similar

> @@ -0,0 +1,8 @@
> +[Match]
> +Name=3Deth*

Add 'en*' as well for pci devices that get renamed by udev

> +[Network]
> +DHCP=3Dv4

DHCP=3Dboth or DHCP=3Dyes would be better since that would include =
dhcpv6 as well

> +[DHCPv4]
> +UseHostname=3Dfalse

Why? Using the hostname makes DHCP logs a lot easier to debug.=

