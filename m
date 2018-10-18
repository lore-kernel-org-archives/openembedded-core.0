Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
	[209.85.210.42])
	by mail.openembedded.org (Postfix) with ESMTP id B0C637980A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 15:34:10 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id l58so30192295otd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 08:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=N9akh7PyZccm7O+9KEjVW7EdTmpa+uQv/HTIGwpVLH8=;
	b=ByFFsQ0AQFgj+cfL6vkg4x7wZirXfU070xOTh+sfqmWG25BOPYRwB8+uNIdWbeTAUb
	XN+iHxflzNuFPQKa1n0O/edh+5I4NqSjFtN4NDm8dY9xX3aMO6Gv69Jj/lKY7OA8IcgI
	4lFL1/m5TFqQPAwDTUKtUEyhEKhz7O+dSimgK0MbSqVjTtlmlRaVHpYdt1Wy5UOh6hk9
	F6WrpsNDHI62QP0thbNBJpqjr62b3Z6O2/4KP8h6+BeEJb0t+l4H8q2ACpZABP/c73Yu
	KP8hSQQhPivvt20BO+ii1ED9HxNoXXQe9UvgRrTPnazSN/ac44zzaz48PhEpSsIiYUQu
	Q6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=N9akh7PyZccm7O+9KEjVW7EdTmpa+uQv/HTIGwpVLH8=;
	b=tkYsiHrQLz+B10leMxLf/dqvcG0wmQ2+5gPqTpD8/cem6JyU/PoiZDXJPIv+R4be+I
	vBu03nC9Wd9Kczh58GhElGyA5XWu7rzcKtbnsc8XDyQ5PkqUmW/D37LRMB+BClDIgJ/H
	MeReQn/fz+yZLowVh7D/I3cEQno1stjBmj/A+jJYRmaVWmJ+brQxLSasglbZKsDU4qpa
	knpTgc+tJ0VyH0icECt04xraaRvhjQVJelBK1UFCRNmEPx/nlzXybgV/45SGJGGGaaKI
	rNdfA7ZXtPIlmqHB1QNTosvuYlpzF8rHFs1OTiPNqdhyLZErTiNfZZsQKn7bT3uKeZhC
	ICpw==
X-Gm-Message-State: ABuFfoiqsciEj5HR5/JWtWaD/9CAZpHvGrV3qgPQWlC96Y1l2axMd0xF
	GbmidfYSjFQkDPDYyKKKl/u9sXMO6jpupBOpke9BWA==
X-Google-Smtp-Source: ACcGV63QiougzlEIjY266+rbt9BFSryS0BxDGR9lTSi33CXEqnEF9oL5YcRowr6q252RktcJvQA+kCHg/m1ABrHt/v4=
X-Received: by 2002:a9d:30ae:: with SMTP id s46mr21259663otc.132.1539876851512;
	Thu, 18 Oct 2018 08:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR08MB3631013765027F3C7E24415098FF0@VI1PR08MB3631.eurprd08.prod.outlook.com>
	<VI1PR08MB3631FF25AFA7A73D6814C71998F80@VI1PR08MB3631.eurprd08.prod.outlook.com>
	<DB5PR08MB08880A125ED651AD16C50FE993F80@DB5PR08MB0888.eurprd08.prod.outlook.com>
	<CAJTo0Laa3KT0EBf1EprPyPfZS+TYL+PoXdTpY3=iXiVraiZv1w@mail.gmail.com>
	<DB5PR08MB08887D04D53A66B55244688493F80@DB5PR08MB0888.eurprd08.prod.outlook.com>
In-Reply-To: <DB5PR08MB08887D04D53A66B55244688493F80@DB5PR08MB0888.eurprd08.prod.outlook.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Oct 2018 16:33:59 +0100
Message-ID: <CAJTo0Lb5ZFfQVoO2oS4fV6Ts1ph3fs4sVg8Ee3-+X8x5Ff0Y1Q@mail.gmail.com>
To: Jonathan.Haigh@arm.com
Cc: Jeremy.Johnson@arm.com,
	Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>,
	Hugues.Kamba@arm.com, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Missing venv module in Python 3
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
X-List-Received-Date: Thu, 18 Oct 2018 15:34:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 18 Oct 2018 at 16:19, Jonathan Haigh <Jonathan.Haigh@arm.com> wrote=
:
> The venv package (https://docs.python.org/3/library/venv.html) itself is =
missing although its source is available within Python 3.5 (https://www.pyt=
hon.org/ftp/python/3.5.6/Python-3.5.6.tgz). As mentioned earlier, it seems =
the issue is because there is no entry in the manifest from which the vario=
us Python 3 modules are created (https://github.com/openembedded/openembedd=
ed-core/blob/master/meta/recipes-devtools/python/python3/python3-manifest.j=
son).
>
> The manifest is generated from https://github.com/openembedded/openembedd=
ed-core/blob/master/meta/recipes-devtools/python/python3/create_manifest3.p=
y, and it does not seem obvious to me how to go about correctly adding a ne=
w module to the manifest, using create_manifest3.py or otherwise.

Ah, right.

In that case:

$ oe-pkgdata-util find-path */*venv*py
python3-tests: /usr/lib/python3.5/test/test_venv.py
python3-misc: /usr/lib/python3.5/venv/__main__.py
python3-misc: /usr/lib/python3.5/venv/__init__.py

The files are in the python3-misc package, which is the fallback for
everything which isn't explicitly put into another package.  I'd say
the best fix for this would be to edit the manifest so the venv module
goes into the python3-pyvenv package too.

Ross

