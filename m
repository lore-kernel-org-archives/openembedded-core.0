Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 805AF600BC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 06:24:16 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id t72so5460199lff.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jul 2017 23:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:organization:user-agent;
	bh=4cTb5rT9m8zv6VTNMDlRbTkW+d9u4V5KQTCvBEp6A2k=;
	b=wAdlJQ+MJ+ABTFAl8BHIcYPlxWjruF0R+21DVCuU98ZJY0RZ0ZXghpLxtv4dIYpKoL
	SCOF9KXb4b71llIz6ln8fZcOn5YpM3qMdf8bKcYneXD178+3hMiYRlBHxIX0fcMsfykg
	HSma0W+MniZqZInihrT7I4JsGdXqTuG6/NWjgDnFBcIGmH3gK7rO9XOEtbdQZZ0iFc4q
	bba12TnC2gilVgeKqH7av3gR+ApIFv3pjqeph6IYx4WGemnaIANdVjRHYPEV0mKNwDC4
	oHtvqkj0EEcL9yxWK+8EE69JLR5oNucCsbCklL96ZyESdf7p9k26PUEcDEr5WpvZRxC5
	wbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:organization:user-agent;
	bh=4cTb5rT9m8zv6VTNMDlRbTkW+d9u4V5KQTCvBEp6A2k=;
	b=ozQ1env2d4upfP6AYRnnTmdw8kqzhTu3Urc0YKmKLG4tsfjM5WRTwF+QrWax6GKaes
	mrl7iP6042E21YI7Zm4kQiVceSZVoJ45bqvTz3vdT58xmGmlgDXQKIdrfFXeTw95YZl/
	b9FjIpBJc5eaMHL7OAa+jHWaVBgrcJC6lm7UAa4k6DZxHsvPHHhJfdVjdTX3inMniGtG
	kqdTNV/zf0ex2wffnIRnxtGcoiJaXzv727hNtlK2EHVqqKYPf6+tWd6gFJQ7LLNalCrz
	+bmwcO3PeCVACC/oJvqrf87op6KsnHWwaiEWf/VhUtfEhPxbxEi2fFehBVJVf6z1Laxp
	D76A==
X-Gm-Message-State: AIVw111v/ZGoTi9VxQs1sbQ1sQp2RHp3A+9H+7a3IgkfKkR83gooydRI
	mI8NuhWrH9dj4ukqFtIDhA==
X-Received: by 10.46.83.7 with SMTP id h7mr5539722ljb.22.1499322257368;
	Wed, 05 Jul 2017 23:24:17 -0700 (PDT)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	z135sm229458lff.66.2017.07.05.23.24.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Jul 2017 23:24:16 -0700 (PDT)
Date: Thu, 6 Jul 2017 08:24:14 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170706062414.hy2o5ecmucyoettj@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1498459830.git.anders@chargestorm.se>
	<25c15eb7fc3af2ec38a63ed73ae710e1e2172dad.1498459830.git.anders@chargestorm.se>
	<20170705135358.ask4pvpiaxwqusi3@ad.chargestorm.se>
	<1499265230.9571.181.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1499265230.9571.181.camel@linuxfoundation.org>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170609 (1.8.3)
Subject: Re: [pyro][PATCH 1/1] package_manager: flush installed_pkgs file before oe-pkgdata-util uses it
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
X-List-Received-Date: Thu, 06 Jul 2017 06:24:17 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Richard Purdie <richard.purdie@linuxfoundation.org> [170705 16:33]:

> On Wed, 2017-07-05 at 15:53 +0200, Anders Darander wrote:
> > * Anders Darander <anders@chargestorm.se> [170626 08:53]:


> > > From: Martin Jansa <martin.jansa@gmail.com>

> > > * since this commit:
> > > =A0 commit f5a1013ffa9815f22e13989e2bcb83f966e7ce2c
> > > =A0 Author: Ross Burton <ross.burton@intel.com>
> > > =A0 Date:=A0=A0=A0Tue Apr 18 16:19:12 2017 +0100

> > > =A0=A0=A0=A0package_manager: don't race on a file when installing
> > > complementary
> > > =A0=A0=A0=A0packages

> > > =A0 the file isn't closed before oe-pkgdata-util uses it and this
> > > =A0 temporary file might look empty to oe-pkgdata-util, because it
> > > =A0 wasn't flushed yet. Which resulted in almost empty debugfs
> > > tarballs
> > > =A0 and no locale packages in regular rootfs.
> > > * without this change:
> > > =A0 124K May 30 07:41 core-image-full-cmdline-raspberrypi3-64-
> > > 20170530054003-dbg.rootfs.tar.gz
> > > * with this change:
> > Ping.=A0

> I did queue this in pyro-next earlier too. I suspect there are others
> I've missed but I am trying to change my processes to make this easier
> for me to make sure things get caught.

Ah, thanks!

I looked at
http://git.openembedded.org/openembedded-core/log/?h=3Dpyro-next, and
couldn't find see it, that's why I sent a ping...

Cheers,
Anders

--=20
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

