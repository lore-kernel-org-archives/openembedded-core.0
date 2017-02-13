Return-Path: <max.oss.09@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3B779731D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:55:07 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id w204so52413844oiw.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 07:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=yiGIftcCpBY6z5+DPUfXXDcctRPwftdF02C/16uOeGA=;
	b=fHAbCrVV1348l6lO+9wUpCe+h3N43m7StkGdiWTpWQFx1c7R1tz4ZQ8v3+nCDeAeDP
	sPvzxXvItO7fJMK08wfYB7xlSiFjBFPvkT9iEePS1f60gOCUoqWnFQ50X4kFhc62/GsZ
	b1bi6BQIjbnM1Gy9i3tx85cKkzF6nN8KJjr9VRdgc3aIRI/dssJfBPy3KlIHmiLnYZYP
	Ram+Dsthd/oxlJp2hYKpvu4Bs55eBM/UqbpKxhg0nylHTD/1qiFUa/4m0SKi6rhGlA3J
	QzPl8bPFw7bdVCqFrC/Spa5qu1P7IQG73fAYCB9fcqUoYTKSeHIyOpBi1aeEt+rWvV2s
	UCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=yiGIftcCpBY6z5+DPUfXXDcctRPwftdF02C/16uOeGA=;
	b=WsH1rMg22dAD3CcEh8u7YMiIO41vCahHxyOBBLZE10nclYJh7lqd5JF+BMlfeMWeT7
	hSqWirNjGVfavi7MLeXLDCBEDbt3WUcjADBAT0fni32hiZVDmxuc/duyC65Y9Bka/ZY4
	hjXrbk1e1yvl4US7ezuy9v/42zzcmx6AIld86DPAVVBK7FSK8NNa7/aVfd1SqwxIsmGB
	u9lRlXFnZIY5ejfLtlbM0uxnCWbC7xbp8//0rDrhmxGaIXvyJP950gc6CF6T2HFoIb89
	tvzTJ6Eid97b6f+bU2yfaMpqd3ElHNtHIq2vuftJlKJNeE+ojT2pOv8Hm06StaihlIg5
	Mf3w==
X-Gm-Message-State: AMke39kT3SVfATRK96X9xlSvujfaSE3wKCeCf0kXzniwBVchFvnctxe3Mu9vR1c/U3esm7TUVKe1yyvj/C364g==
X-Received: by 10.202.89.138 with SMTP id n132mr12764335oib.144.1487001307559; 
	Mon, 13 Feb 2017 07:55:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.1.56 with HTTP; Mon, 13 Feb 2017 07:55:07 -0800 (PST)
In-Reply-To: <CAEHkU3UMqALH-pxTZHxODCMOae-K7pO9PTYLLTsZ6U8TWDvYUw@mail.gmail.com>
References: <CAEHkU3UMqALH-pxTZHxODCMOae-K7pO9PTYLLTsZ6U8TWDvYUw@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Mon, 13 Feb 2017 16:55:07 +0100
Message-ID: <CAEHkU3W5k3+MDpXZUbER97HeJN3zNHpSRx+xJmU3uKPj2eHsTg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Are RDEPENDS of depending native packages installed automatically
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
X-List-Received-Date: Mon, 13 Feb 2017 15:55:08 -0000
Content-Type: text/plain; charset=UTF-8

Question is a duplicate of
http://lists.openembedded.org/pipermail/openembedded-core/2017-February/132608.html
So discuss it there.
Max

2017-02-12 19:11 GMT+01:00 Max Krummenacher <max.oss.09@gmail.com>:
> Hi
>
> Should the buildsystem install RDEPENDS of depending native packages
> automatically in the RSS?
> I.e, if a recipe DEPENDS on a native package should all RDEPENDS of this
> dependency be installed?
>
>
> I stumbled over this when trying to fix crda.
> crda.bb has
> DEPENDS = "python-m2crypto-native python-native ..."
>
> A recent update to python-m2crypto makes it RDEPEND on the python-typing
> package.
> I added to python-m2crypto recipe
> RDEPENDS_${PN} += "python-typing"
> (and I created the missing python-typing recipe)
> and did expect that crda.bb now installs python-m2crypto-native and through
> RDEPENDS python-typing-native but only python-m2crypto-native is installed.
>
> If I explicitly add python-typing-native to the DEPENDS in the crda.bb recipe
> then python-typing-native is installed and crda builds fine.
>
>
> Max

