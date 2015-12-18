Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 57E2E7014A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 16:50:09 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id o64so51607873pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 08:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=egDDFO1MnYhIPVT0VL5ZII0/1cyl2R5/eFlZ7vYAj7Q=;
	b=DT3oy5ZPha/y70kymw8mZK4YW+2MJ9ZkP9pfwV+vml8vLRHUu9vncC+olI113J74cV
	1bVHE8M4/+Fh7d4TSfyv+Y7DjUAD+AsLBLOAM47PNhsyT+ewSyjYLLotaJUQLPbfPJhy
	dcxzPCVJctXoDL3xWZTfjSY3u3QApqs4EHuw0QTpS9Me10MbwNU0CaSq8vIlh1rJqZLH
	qUyePe6Kh5tHduU80+psVrRBeTQtErkvIh2TLk+D5q1xZYiqygK/gotCRMMjG5wKPacy
	fskGOR/TdaUeW/1j8PUxNSDuanmjPlzLw7oLoytuyDls3Er1l53hGzgDOCbt/UBvZnYh
	mUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=egDDFO1MnYhIPVT0VL5ZII0/1cyl2R5/eFlZ7vYAj7Q=;
	b=OX+Vm4GD37rw4x7OKoximFDc0vOBXYZ8ZB/AaphYZkYu5ilupwX2mL+SoWqmjGUqeB
	FOvEBSIcHWf2vNISRfpmYT/PIPFjTfAMWvBnujdZLghPN5AmfMy+WIvNu5zPJJFJXj9H
	U4y1dQf53fqo7MZY8FvCeYgd8koYIVdJ4iGVTpSKtUnXpOxWs2zds28312/ZG+NtKpzG
	Zc+81Ad6oUffpfQrelWgwdOnvBgkEvaf0dSnqeZ5zfolVrbOkENb1i0ut7zue9qNjZ7G
	ZCRGZtIlXn9kE7ouq7MyJyC5srLVqLuXZkbk39dWjRCmtcyZi0EGkJff6Bry8tYpGdFH
	jaYg==
X-Gm-Message-State: ALoCoQmeZjXIaFALHKkHpfl2/0M3crtmzOwqGENZjbVUjgsJ+/x2r19ehIIC/Cstrl21FyAlE/KuRrp1ZHCEfVc+vRwzz0rAMA==
X-Received: by 10.98.89.21 with SMTP id n21mr6784902pfb.70.1450457410298;
	Fri, 18 Dec 2015 08:50:10 -0800 (PST)
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com.
	[209.85.220.54]) by smtp.gmail.com with ESMTPSA id
	e66sm18983184pfb.35.2015.12.18.08.50.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Dec 2015 08:50:08 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f54.google.com with SMTP id q3so42835050pav.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 08:50:08 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.221.228 with SMTP id qh4mr6680671pac.68.1450457408362;
	Fri, 18 Dec 2015 08:50:08 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Fri, 18 Dec 2015 08:50:08 -0800 (PST)
In-Reply-To: <1450389888-24760-1-git-send-email-tom.hochstein@freescale.com>
References: <1450389888-24760-1-git-send-email-tom.hochstein@freescale.com>
Date: Fri, 18 Dec 2015 14:50:08 -0200
X-Gmail-Original-Message-ID: <CAP9ODKryNw_GeZ7_87+geio0H54_GMuJ0fFkXvHfFVezqGGbEg@mail.gmail.com>
Message-ID: <CAP9ODKryNw_GeZ7_87+geio0H54_GMuJ0fFkXvHfFVezqGGbEg@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@freescale.com>
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 18 Dec 2015 16:50:14 -0000
Content-Type: text/plain; charset=UTF-8

Hello Tom,

On Thu, Dec 17, 2015 at 8:04 PM, Tom Hochstein
<tom.hochstein@freescale.com> wrote:
> Weston is started in different ways depending on the image
> configuration and the runtime scenario. Refer to the weston man
> page for more information.
>
> Signed-off-by: Tom Hochstein <tom.hochstein@freescale.com>

I think we are quite close to something which works for all supported
use-cases. More below...

...
> @@ -13,6 +14,18 @@ do_install() {
>
>         install -d ${D}${systemd_system_unitdir}
>         install -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}
> +
> +       install -d ${D}/${bindir}
> +       install -m755 ${WORKDIR}/weston-start ${D}/${bindir}
> +       if [ "${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)}" = "xwayland" ]; then
> +               weston_launch_setup="mkdir -p /tmp/.X11-unix"
> +               weston_launch_args="--modules=xwayland.so"
> +       else
> +               weston_launch_setup=""
> +               weston_launch_args=""
> +       fi
> +       sed -i "s#WESTON_LAUNCH_SETUP#${weston_launch_setup}#" ${D}/${bindir}/weston-start
> +       sed -i "s#WESTON_LAUNCH_ARGS#${weston_launch_args}#" ${D}/${bindir}/weston-start

We can do it at runtime and avoid using this hardcoded options?

One possibility is to check if XWayland is available. If it is, it can
enable those options.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

