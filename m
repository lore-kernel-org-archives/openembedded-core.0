Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2AFC07CE6D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 09:57:43 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id x4so4723635ion.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 02:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LJQJyENlSZfzbTpdPnDhUR1XbfTx2x2WZ13kY9BTccg=;
	b=ZwY4WTdKhomO+VrTjsf8+fMceRqhXyg/F5d37F8Wer3sE2ZSFK8uIP/ojOiFKL4Q5/
	dRmNl2qAFa9EwplrI49NgK3l+yBQK/rAIjtqP22VRIXHJlAf/Yk0+XacdAJKRlfDLd/l
	i84ZFL18Kcv4Td8YjlnUHaSOL7AuqDIcEkUpU8jYSX2Pep+Iyd4SZUWNKs4k+TDRPwaG
	9ZnT/znGdV9REK6G+/5fsp7eUMjO7uurzNWcIXuHr/fRf0HNP9QDIflG0+4CzTdSZK6y
	+AtZQtmJi75zUmOhOGqJAIBG6mZCRrcMhC91bFU+33mWopIEAdhejUixwyZGmcNonv8E
	dqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LJQJyENlSZfzbTpdPnDhUR1XbfTx2x2WZ13kY9BTccg=;
	b=Pba+6uWV2p85xluHa+nQc0Fnuw1rzstSXis2/eJUNVb/QWvn8mNwZeliRVCLJ5IXFb
	hpdV8VH6XwoE9UBy2xWKkJPHVlzadLWNHkC4Dv6w9h8muKy4IG4tgIpfn9/4QYMn9WKb
	8/6xCFy6yg0QH1QXaAWJjquL1WWvy1Podzf/RwOomoHVYCIiIIeOIzTlQm7WJiv/Fj9k
	/yneCkZTiEPSqF4fqx3hmygkJrJcDQ8IPq4sUSe12wwRJ8D3dNpSO7eW2BsOEiEeCBCr
	4QWuEYfcd+W0fG+cYV8aQ0U2ZluXuYWJCVzrDK/H6NEGv/dUtL+6YBk1x4QKQeIVPu43
	GZEg==
X-Gm-Message-State: APjAAAUDA0Z3/UGcNVqSN2t1VbUupEm8jCwT9f6x3ctCwnH3Ucen1+gc
	xiLWmt/ZeNz3Lgwy39LGBxzgxa1LliYBifToRiUIuA==
X-Google-Smtp-Source: APXvYqxdhm24J1S0E1Y1m6pqRnPsN6n0uqrK5Du6nViqZ/K/5dkJJP9VljLlJy4i1nxXrz8PLy5sWXmFJbSeacYADw0=
X-Received: by 2002:a5d:8795:: with SMTP id f21mr1956659ion.20.1553162264191; 
	Thu, 21 Mar 2019 02:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAJTo0Lb9Aspc0Nu+H3eRzbQcOLDevn40hJ5Jnib1DKo8k4R2cA@mail.gmail.com>
	<20734cff-3215-7a9d-8bc1-87d7238876fb@windriver.com>
	<6F7B3258-B781-465F-AF58-E4E8EBA88012@gmail.com>
	<6673aa01794a9a5466969fa4a39d28b46649173d.camel@linuxfoundation.org>
	<4C429FC4-E68A-4AFC-B8D6-61DFF45CE2AA@gmail.com>
	<255f8e465f5495754319c372b39b5f94293a8d5d.camel@linuxfoundation.org>
	<9A802DA0-0509-4D9F-ADEB-B5EF17717806@gmail.com>
In-Reply-To: <9A802DA0-0509-4D9F-ADEB-B5EF17717806@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Mar 2019 09:57:32 +0000
Message-ID: <CAJTo0LY5jxs86XaEWRY=aUK+uzVjZ_u0Y=OZ-tsAEyQLXpR-qg@mail.gmail.com>
To: Rich Persaud <persaur@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Incorporating deploy artefacts from one multiconfig in another multiconfig
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
X-List-Received-Date: Thu, 21 Mar 2019 09:57:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 21 Mar 2019 at 06:48, Rich Persaud <persaur@gmail.com> wrote:
> Is it possible to avoid duplicate builds of packages which are used in mu=
ltiple VM images? Could multiconfig replace a dozen serial instances of bit=
bake with a single parsing instance, or would it use a dozen parallel insta=
nces?  If the latter, is this a constraint in bitbake architecture, recipe =
DSL, or time/resources?

If the packages are the same and sstate cache would be used, then you
can build one on its own first to populate the cache and then build
the rest using the sstate.  Currently if the sstate isn't present at
startup bitbake schedules the same build twice, which obviously isn't
ideal but also *should* be fixable with enough effort.

Ross

