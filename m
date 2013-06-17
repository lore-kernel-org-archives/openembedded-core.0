Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f47.google.com (mail-vb0-f47.google.com
	[209.85.212.47])
	by mail.openembedded.org (Postfix) with ESMTP id BBABD6098F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 15:16:17 +0000 (UTC)
Received: by mail-vb0-f47.google.com with SMTP id x14so2013376vbb.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 08:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=PDe+SYx5VNUZcyhrybuwqStbbOjzQIUTNOPIIP2IkCU=;
	b=I04XOB3UAOANbDmGWXCXRXBwju0D+jnBA8zHwU4BxHKXexCyCSAM13FK5IC9q3ptZN
	m+gi93yISOUYGS4/PMagQxuA2APWV2dvW2L02LcfVQ1N5cY9C7DEzuluo+mKmLuxPl7p
	D5RPVVauDrvhQ+0t4wBfSV6c5aPmeO7H0m2QRZ+umeuzgyyl8sv7YKlipz5m6FkT3/Gl
	D1AgsNDIZxRLhSIo5y1qAkGnZgCK0FGYAbqa6ogyIo/u9QcZz3ytXPrOJZDu6B8hYjcz
	yCA0j5EugbpqIjmG05AiyLgtIFsXOSQVuCsW6Ek0UhrrwMjo561PlWyI3jHGlvI2+SvM
	vLHA==
X-Received: by 10.52.21.232 with SMTP id y8mr341068vde.6.1371482178384; Mon,
	17 Jun 2013 08:16:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Mon, 17 Jun 2013 08:15:58 -0700 (PDT)
In-Reply-To: <6a4980046a3175ecdd4216cdd75c754b0b0ffa16.1371471166.git.laurentiu.palcu@intel.com>
References: <cover.1371471166.git.laurentiu.palcu@intel.com>
	<6a4980046a3175ecdd4216cdd75c754b0b0ffa16.1371471166.git.laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Jun 2013 16:15:58 +0100
Message-ID: <CAJTo0LbPGDehVTaspjcZBCL2F0DRS-HondvaO-6K0ntZj_Zu6A@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQloQgzvD8hQSYnG0FRZI7MFMr64adVNIdmcId+ym1anEV80J7Kg5QOqbvCrELoc54olsszm
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] xinput-calibrator: move it from meta-oe to oe-core
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
X-List-Received-Date: Mon, 17 Jun 2013 15:16:18 -0000
Content-Type: text/plain; charset=UTF-8

On 17 June 2013 13:26, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> People using xserver-xorg that need to calibrate their touchscreen
> devices would also need meta-oe. Bringing the recipes to oe-core will
> make it easier for them.
>
> Aditionaly, drop xterm RDEPENDS. Terminal is not needed to run the menu
> item.

I don't really like how there's a xdg-autostart desktop file and a
systemd service file for loading the calibration and performing
calibration - a single xsession file as xtscal does will be sufficient
and actually work in Sato as it can block the rest of the UI before
continuing.

Also persistent calibration doesn't work with non-root X users, so
maybe the tool should use ~/.pointercal.xinput if it can't write to
/etc.

Apart from that I've got a touchscreen that isn't X-axis-reversed now. :)

Ross

