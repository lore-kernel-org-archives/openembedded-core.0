Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f169.google.com (mail-it1-f169.google.com
	[209.85.166.169])
	by mail.openembedded.org (Postfix) with ESMTP id 68E3A7BFD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 11:07:21 +0000 (UTC)
Received: by mail-it1-f169.google.com with SMTP id i145so20760855ita.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 03:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NekJJy0L4Eo0T5bt7GVMrSh7FJuAJ0PCrdjCCikDtRA=;
	b=m62lnk4BZ+JeL2YcTddsy4ZY7by8ndOd2Bqi9lMOc0RDRh2TJ+6sWSwWnFQkjMj6NE
	yWk+R1Xj+xfXy3XWc6w/tA88WpM+mzYTS4xNE57JzDDF8/8GqZv+IPnzHGJQ8VEHPIq5
	QRgt3sinLE/cvRP4bhGND+a8E+YRjrUSKljA7SfsK/GY40Dg1M/JTxcT04ZJCrRlZ+Im
	6qf8wVoRoRd0iLxYC+tOybdMrEejA9VrdOWpQ+aoTfJwGJcx6oec7BKO4uXaYN3v55+S
	ke1qZSlrq/DccQkCkpYZ79BZIIkSedIyg1irfLc+feeVMmKa0ENNcMf1i4wMsHpa1vgV
	ZbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NekJJy0L4Eo0T5bt7GVMrSh7FJuAJ0PCrdjCCikDtRA=;
	b=UO/eAW6HBh99L+1r+/2gJWbSeq2BdK0dSD96++57BuC9fEKjlFnMxEpUDublo+q7td
	Hl9VcUkBMSGUtv4qVyqcazwIDDmJd8OVFyfhH6tBbKSFehvlPCeP449Szkp2xdz22axR
	GT8QRglayTB9YprNtXRR7YVVzErDwSHmzWZvHYsYZIKCPXWGPL1k/A3NyRgBylejboRx
	GPkNg+B0G95EqTKDjDjtTK2t3HjfMWkwyb79JF0bdB05qFl2GxGvY9AOUgN4Le+BVxGi
	hqOxb8qXlHqyXgB3L99RJIuRyxO6LPpU5oXdqPf/KDnk+hs17C8T4lA/eeZai0YCCIDv
	3/zg==
X-Gm-Message-State: AJcUukd1S1i32JUbYMSXRyTuc/GqRuj8OZqtToQotM2N2nb/vIYWd8uX
	jjuY0xpNvPUoyiXFITFaxaDypUQDNvTsBYL+K5yJsvfm
X-Google-Smtp-Source: ALg8bN4loc+fKoT5q4ZnsRSdk+IdNuTJawIoku4EcidhMGLv32q+FnKa5PnYXUZ3l6mNVqQcMZMro3F9SIg0ECXYC2A=
X-Received: by 2002:a02:57c4:: with SMTP id b65mr20301297jad.79.1548155242534; 
	Tue, 22 Jan 2019 03:07:22 -0800 (PST)
MIME-Version: 1.0
References: <20190118030821.11213-1-hongl.fnst@cn.fujitsu.com>
	<20190118030821.11213-2-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20190118030821.11213-2-hongl.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Jan 2019 11:07:11 +0000
Message-ID: <CAJTo0LbO6Phovrb6GE_K42vnSADshzdZnUdBOZvoMsS-onsjvA@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [thud][PATCH] mdadm: add init and service scripts
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
X-List-Received-Date: Tue, 22 Jan 2019 11:07:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Jan 2019 at 03:08, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> +do_install_append() {
> +    install -d ${D}/${sysconfdir}/
> +    install -m 644 ${S}/mdadm.conf-example ${D}${sysconfdir}/mdadm.conf
> +    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then

systemd.bbclass will delete these if systemd isn't enabled, so there's
no need to guard them.

> ++FILES_${PN} += " \
> +    ${systemd_unitdir} \
> +"

I believe systemd.bbclass does this too.

Ross

