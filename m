Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 53A5D7EF4C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 12:52:47 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id k20so51185194ios.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 05:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UMUGS4JyAufPEYFR7wAk+W+RtufOUqlghnUa4SI/H0I=;
	b=W24gVYblx1zu3dSMgtujE0cIIAYc8vf4mZL//Z7xiAsgsLptpyn9xngXZDTE3MaaYZ
	/+2vOcHoOgU30vxiHxuy0IirrpFRH7vEEkcd7wkgWKSXy+gAT6AVJNixURZunOnWzwLz
	RabRALvSUJ0h4AxkR7wOeM1GzhIRAV23h+shrBfGxLlaWboFjLpjruKxyyBq3j4yoByp
	i7UCyo3ZYL0Z97N1BctUflM0Vi0KO63ZAxzgCuqlCIi6Oz9VBNV/8/NPp44cWMzPora0
	oYXNUHfEPKIwDxNJxszIH8ZOsrNjbmUXXzO/R9gsXOWDRhgjWfTvOh10oLb4PyZbv92H
	aRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UMUGS4JyAufPEYFR7wAk+W+RtufOUqlghnUa4SI/H0I=;
	b=rowBc23OLVv7dDiznkpxwaj35VN8YMr4jarzGi/FNOxU5N6QT+4PCDYUwRAnuh4FnE
	DM+i3uNsUSDNTQJAdwnIIQ+5w7v9PG3SdK4K+RXM7UMlfIMBRaGVHiVevo+tQJxCA8nU
	/wigS67zKcIItogL89EE5cRLR2uBSqJVnSsRVwSKoXEu47KyPff6V/n5ecoqaX7c0sPd
	Fag5lQvWMmT6lmH1HYE5zCLOCRgnvxqpVcs8hHOPSMAlE2Qr6VGgB8k3ZB+qoU+Q8t4I
	YmILfGcvpSLBpWBISZW7mtKLRk92T02AscOFAW5WomNhp6OluY0FzW2yIdHBEONC+TtC
	Lh2w==
X-Gm-Message-State: APjAAAUWUT9CPqRV8svadewzm1XOH5qwmK9XbCkDs9l6u3i/ZBL3l8GH
	RlhuLUBnbc1tfPA/HVjG6coq0DVNtsU4Qoa1sFKxJQ==
X-Google-Smtp-Source: APXvYqxhzfUvhcDHoSQ01PPXz24/+U7cbzlOcG6zaEBLTwk6triUUzkFthstLRDvz1Q/nRlPzCSwJDErkKGd7m9np84=
X-Received: by 2002:a5e:c744:: with SMTP id g4mr41228899iop.187.1563454368230; 
	Thu, 18 Jul 2019 05:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190628101353.11933-1-jean-tiare.le-bigot@easymile.com>
	<CAPVBjxFRyEvgBoNN818RD0Lg9D1GjdBidxrit-PQ4cqVwxJswQ@mail.gmail.com>
	<0582005b00d2a7789ed794501c57064f265a0205.camel@linuxfoundation.org>
	<CAPVBjxEk1mg1gE+CDAc1Suiuie-sDD0ywsd2OL1Vgae8+eAFjA@mail.gmail.com>
In-Reply-To: <CAPVBjxEk1mg1gE+CDAc1Suiuie-sDD0ywsd2OL1Vgae8+eAFjA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Jul 2019 13:52:37 +0100
Message-ID: <CAJTo0LY2V+E+ZoPgXgYZRbox_vj0AkcKk6eajU+MwdxTmF=5vw@mail.gmail.com>
To: Jean-Tiare Le Bigot <jean-tiare.le-bigot@easymile.com>
Cc: =?UTF-8?Q?Jo=C3=ABl_Esponde?= <joel.esponde@easymile.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: fix directories setuid and setgid bits
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
X-List-Received-Date: Thu, 18 Jul 2019 12:52:47 -0000
Content-Type: text/plain; charset="UTF-8"

> Should I submit individual patches for backport to "thud" and "warrior" branches ?

Yes, please.

Ross

