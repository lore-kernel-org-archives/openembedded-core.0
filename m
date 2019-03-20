Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id E82BD6C230
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 10:19:15 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id p17so1428747iol.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 03:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QLeT+LkuvaLsr0VdRuEwPtQ4Smu7RIGbcYlDG6EyRKU=;
	b=zQkR7F2lQsxa92vAy07D2skm6gOlpjArrmOilBOiMpU6mkQHbtT+Vken26KpXCTcFT
	t7bUbRAirnAX+fDdlPh+LrSPJRMqxR8/+Yo8ewHFEDC4XjPVrhnO6fLrCg5PIdbmoIUG
	kDCYVFURx/AWMObAJ7MBc2ua0pyO4Ppg5mnyYxyAaI7KjHQzjHQC/Fn0+7SeRBMf5W86
	6OSdcgugsRSI1KqnykVy4owECCK+L+RIEVPlkHxN61/cV9SrdzqiGa/DWlIPGG23YeLI
	WNG/ex8GrDE13BjX9bYcxKDV8OmGWxE6sO1E/OEAmFuUwSmPOeLg68pPHTTIdBuXoVFm
	a1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QLeT+LkuvaLsr0VdRuEwPtQ4Smu7RIGbcYlDG6EyRKU=;
	b=AD4DKKW8phLTw5O+7zHQeYmVO/+5QjrnoqyG6HCf76975B00hlq3n1H0c8DfZSZ+Jz
	PixPTUC2+B6OvsyCPuF7ctM9QHo+MvHLto83Biav6fl7fXsqh2JeoyT2IiLDsEVzgraV
	ABRVTVH9BqR8dQGZRjA56w+rCGVvMfyyH+dXW4vOyCUTO4jbWA5hFKa2a55QyeuhV0c0
	N2B763J8AGLqgdtxM/FUQsXXRd2qmyfJXm4kV5vZ4uhRA7HPKr2LfYdY5V/qFdjr7fKx
	1JAg1Zgb2gZzy+bFXluD4jEqyPbAROAZtl/aKSvSVbKjIK8ORDVtUlVWhyTPW5CxFx7v
	JxYQ==
X-Gm-Message-State: APjAAAX+r/FHycw2xIZ6UAZfVYXZ5eyT8eme7Jtoo/BMe0XEeEDXpMmL
	RoEl/jfO30CZ/7ZI5mjZcA8WLk7fES6HgREgyeXIpQ==
X-Google-Smtp-Source: APXvYqzKLnItRXswUwy+DRfU+olUvOb4YuVk+fE37s0nh2TnGlhgW6+LkVSPljdu6TrXoBKHBy80/bifnyLClfTs/Ps=
X-Received: by 2002:a5d:8795:: with SMTP id f21mr4465971ion.20.1553077156978; 
	Wed, 20 Mar 2019 03:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190320093929.28688-1-lu.jiang@windriver.com>
	<20190320093929.28688-4-lu.jiang@windriver.com>
In-Reply-To: <20190320093929.28688-4-lu.jiang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Mar 2019 10:19:06 +0000
Message-ID: <CAJTo0LaCF5__QA-mw-oCewVVRbEZvAcHk2YfS-SCaLFnG0=5iQ@mail.gmail.com>
To: Jiang Lu <lu.jiang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] glib-networking:enable glib-networking build as native package
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
X-List-Received-Date: Wed, 20 Mar 2019 10:19:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Mar 2019 at 09:42, Jiang Lu <lu.jiang@windriver.com> wrote:
> +# Make sure we compile with ca-certificates support enabled.
> +PACKAGECONFIG_append = " ca-certificates"

Aside from doing PACKAGECONFIG_append in a recipe being the wrong thing to do:

PACKAGECONFIG ??= "gnutls"
PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
PACKAGECONFIG[libproxy] =
"-Dlibproxy_support=true,-Dlibproxy_support=false,libproxy"

There is no ca-certificates PACKAGECONFIG.

> +DEPENDS += "ca-certificates"
> +RDEPENDS_${PN} += "ca-certificates"

Build time and runtime?  Not explained in the commit message.  Should
be part of this mythical ca-certificates PACKAGECONFIG.

> +# We need native version for ostree-/flatpak-native.
> +BBCLASSEXTEND = "native"

oe-core doesnt need a comment listing the recipes that you're trying to build.

Ross

