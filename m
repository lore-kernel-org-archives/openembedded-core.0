Return-Path: <ross@burtonini.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id E279860C61
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 16:11:57 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id 19so11975846ljj.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 09:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=burtonini-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=o1fsBqabCRVMYCVcC8CZeBofXgF3TfJxE9D1U5nTjRg=;
	b=g8eLgMW1//H8n1wqiDzW2Ddm8Lj4tCAWcPILQVxi38a13u/LQZftbe8whBcDcAiVku
	W186QGXrZ5vXoRq+Y/qxgVIJXFPDOqVrSnhSYnpoqP/UdZZk2z0xPJYZjSLB+HtRqhk3
	XV1a0FrSD6hB4MxptTdGx5O29T6Oka4PO7eQjL4vz7HpLEEGo3Mzl1yoUv2Y+lBDyqap
	xRuxDk/mJIpDTvGOZy/X36CZSRPP/AXBLX6HQRZnMBUfRutgA7ruEnvWGFE/upUZ20IG
	QBf1pL0UVQxmk9X5XlJyr/pddf49F+3PAycDKgzsnUt5CAFTgC/RxczLNgO0m7B8E5D5
	kgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o1fsBqabCRVMYCVcC8CZeBofXgF3TfJxE9D1U5nTjRg=;
	b=kVtrx4SObqEtnqJib/vUKxvNYKymv3ZBECfuwxTMwQqHVRgZyVIXEDqQ8a7yCEDX2D
	W0tMZAG31vyeZP1rK7MvNlwGV8+PEqqdgRFnUDTQF44Cfo1zi4Xh9KloBUIwlyuTcdXN
	evjQkqr7E5IZy2H+YPk6e4/Qnwc3jSkMjWAe6LrOZH/vdaWpPaiFgN0T3GjuHyl6wxTr
	VnVxUh/Arwmv6AAJoN3PUUTFVeRI85wuwd2qefCHcLmJCNUF7+/FtvL9ho2SMAb6+wQC
	upTh241mVzR48oTYj3Plu4yOo64yOLZw2gzFglWvxgoYyvw+SDFE2mdVBomXrF39ehhy
	t3lQ==
X-Gm-Message-State: ANhLgQ0GDX2IXlqmT1xvRlLzXuL63Xa5asa/oy4qe8H/Smj1U5uw3ypN
	isejxi/u4k673pZ9Qutx4uOvWF3P/aBhmauGM0IOeb7oGY8=
X-Google-Smtp-Source: ADFU+vviSvQc7oLsqofoOIikRFKwpeU2lfnD7/ZiylApKiXCbdsNyia+yhNn7fu76p/XV2sJtXSqohmkWFjaWxao0wc=
X-Received: by 2002:a2e:9c4:: with SMTP id 187mr9545550ljj.89.1583856718118;
	Tue, 10 Mar 2020 09:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200304113217.GB7923@localhost>
	<CANNYZj8wnuNLrw6s=y0cgg5uoMTjA+fMEXW_TsmtKWZ4UDzwOA@mail.gmail.com>
	<20200304140109.GC7923@localhost>
	<CANNYZj8ciqgR7eed+B+WwfMRHKc3u_XHrT3vo004=TEX9cCmhA@mail.gmail.com>
	<20200304172415.GA29456@localhost>
	<01b3bb37-f65f-8048-1a27-b859b62d7f98@gmail.com>
	<20200306100422.GA17785@localhost>
	<877e317932176664bc7b0120439c56d4dda791af.camel@linuxfoundation.org>
	<20200308214610.GB1425@localhost>
	<CANNYZj_4sTc9vjhm1+S1GbjN=8SjChWt+gksxxKLXEZXeK9nPQ@mail.gmail.com>
	<20200309002308.GD1425@localhost>
	<f99fbcc5-bb47-a177-f1e9-815d3cf4e5c0@embexus.com>
In-Reply-To: <f99fbcc5-bb47-a177-f1e9-815d3cf4e5c0@embexus.com>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 10 Mar 2020 16:11:48 +0000
Message-ID: <CAAnfSTt5fwx3a7pPotvqrwgW58+n-UxCQiZqiAFuuJz6K+=aqg@mail.gmail.com>
To: Ayoub Zaki <ayoub.zaki@embexus.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Does YP provide security support for stable and LTS branches?
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
X-List-Received-Date: Tue, 10 Mar 2020 16:11:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Mar 2020 at 07:45, Ayoub Zaki <ayoub.zaki@embexus.com> wrote:
> Adrian is making a point here, The Yocto Project by claiming that it
> supports security patches for Stable releases is misleading the Users!
>
> I work with different customers and some of them think that by using and
> pulling the latest releases they will get the CVEs automatically fixed!
>
> YP should state that CLEARLY! Of course it will impact the choice of
> going with Yocto or Not ( probably NOT in this case).

What would the alternative to Yocto be, and what is their security
policy?  Does e.g. buildroot commit to fixing every known security
issue (which is more than just known CVEs) in their releases?

Ross

