Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 64B80781FF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 18:09:42 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id t124so781003oih.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Sep 2017 11:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=1qvymidwuidQ9e83mgUtIExZ8oJWH2y89xSaOgEwel8=;
	b=lSpDkQf4S+/mkOPhZxFiqL68+PHITzJbP0weeetX4d4xgwiBX+vwlCfr8IMl9k4QxT
	JINyh4bOlApD/gFwkYtt3/uGMeQ4teSOPpQ9FPsTuwqOpu9TSHED6i/peVB51kUJBs7d
	ql/sxT93pvqXhUTBHSJ6Ipb9qMMEU1IW9e5ETZlEp6pM/UmlDGH9vfUfX+XR7gHfx1Cz
	f+eZONNX1rL+0bVRs4D1JsI+Yr6M2T/un8zfOSwYg5f9crYe5rBEOA351p4BMgPtKjR2
	VwtcCTigNNxB8Lx+oHmcBaoMS2TP60Usz4W7+cTUHeQf/M98fpncf0A5obLh+o2RpCm+
	z3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=1qvymidwuidQ9e83mgUtIExZ8oJWH2y89xSaOgEwel8=;
	b=mGv/hJo9aiIolrvPjluVecEASqAfjRgbgxjSNGwzbAFiRl60vnCo/LXrqKJAwjejo/
	CsjkI5/dy8Gfj70HEWB+Z3o8zktfSGfgSt38+JueDWw0XJWMtWCvZN3P5xnxETdqmiDj
	brJ66yVdAwiqTuSNS7H3aPRkH+Zo/V2AXCCjTe2C6jrG96evnzWPf2SjlfG5GW2UcSDF
	tek1kKyWxHpt1uvB25AO40fvc41TRIgAgniNfHzHDDugZKuPpZU4+V9NVArrkL4zo4pu
	0R0BIVyGooEtzsZEzmz0yl0lTuIpI45PrVRlOB9wiAyifzRlMUfetnZQ7ZTY+bWGVTqN
	1fLA==
X-Gm-Message-State: AHPjjUj8AAkqTDifFvD8dl5gzS8qmGidg5IrFYuWe+Bub2kxAO/6R+g1
	w1TGnlI1Rt/K4OykjSU=
X-Received: by 10.202.76.137 with SMTP id z131mr2388300oia.157.1504289384042; 
	Fri, 01 Sep 2017 11:09:44 -0700 (PDT)
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com.
	[209.85.218.52]) by smtp.gmail.com with ESMTPSA id
	c125sm697791oia.58.2017.09.01.11.09.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Sep 2017 11:09:42 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f52.google.com with SMTP id w10so8018058oie.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Sep 2017 11:09:42 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb5cbIR1+FRsFKhfZr4t7Lznw3YZZTKJC2IarnnfBhz/FBftM2aQSatRGMczSHMejlaZk7wV1g1cm8A+7jMn7qQ=
X-Received: by 10.202.105.11 with SMTP id e11mr2709309oic.67.1504289382089;
	Fri, 01 Sep 2017 11:09:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.37 with HTTP; Fri, 1 Sep 2017 11:09:41 -0700 (PDT)
In-Reply-To: <20170817211452.23291-1-haris.okanovic@ni.com>
References: <1500479806.27323.202.camel@intel.com>
	<20170817211452.23291-1-haris.okanovic@ni.com>
Date: Fri, 1 Sep 2017 15:09:41 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrLMWn8mgXpoX2QvcWA1htLp-+Tk181YcyDUvdd=ef2zg@mail.gmail.com>
Message-ID: <CAP9ODKrLMWn8mgXpoX2QvcWA1htLp-+Tk181YcyDUvdd=ef2zg@mail.gmail.com>
To: Haris Okanovic <haris.okanovic@ni.com>
Cc: josh.hernstrom@ni.com, Saul Wold <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v7] kernel: Add support for multiple kernel packages
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
X-List-Received-Date: Fri, 01 Sep 2017 18:09:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 17, 2017 at 6:14 PM, Haris Okanovic <haris.okanovic@ni.com> wrote:
...
>  7. Verified image contains two bzImage's under /boot/, with
>     "yocto-standard" selected to boot via symlink.

Please take a look at
https://patchwork.openembedded.org/patch/143549/; it will impact this
change.

I think you could have a symlink with the kernel name on it. So using
your example we'd have a zImage-tiny-linux next to zImage.

...
> [PATCH v5]
>  - Warn when PN == KERNEL_PACKAGE_NAME (bug # 11905)
>  - Add KERNEL_DEPLOYSUBDIR to avoid DEPLOYDIR collisions

Instead of a subdir, why not using a suffix? it avoids sub directories
and allows for an easier find of the generated files.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

