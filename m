Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id B457D77060;
	Mon,  1 Feb 2016 21:34:50 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id d63so156046875ioj.2;
	Mon, 01 Feb 2016 13:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fxgGoy4bSkKSPq//Dl6StOaTNcGtVUjKScmtILPW/Qc=;
	b=h73IEMOHeLHok2cwpVJS3DxZwuUiTRGwLD5MoUhywXXbtzutrgPpfb06MZQ6Kj3vUA
	58xbW67JE9zG3NaZXWnXGYc6pEV8hQYXOWERwBSpMlBDDR349/yaWkCcNkOUoq3wN4XM
	Gq7CmtbMrneUNXRElOie0Iq/ba4E7Du/1uej0Iq3i+aQSDTVFhGoFBUeTmvr29JE4xnb
	ygKDcMhE0nngqpcUdlDYxQ+9dAURXpH66FROb3ed0Ohh25VvS8RNGsmC8HXiI2GXcuAa
	TUB17UMvuYO2C6zRIW75nTvl2/9+x+6JEb5+fpfckhuSiqRyiqMGDdgGo6xpzg9w6drZ
	rRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=fxgGoy4bSkKSPq//Dl6StOaTNcGtVUjKScmtILPW/Qc=;
	b=EUnBDb+/nVO69eBK30DFiVI8A6yqse+O1RxIUjS/mpoI4DxYDIKnI/wlFWVTE52K3C
	HxPfrN7UuD7pzz+RSvTqdA24trX7GIHaeUp4mWSmUoZT0aYrZfvZ4IdYbZKFDtpV+mjq
	tRTd7CaIFshxmYuGnIbn44W6uwit4MQxe3o3hD6CNICMWPDi0FJB1+z1oQgbXCvB8Sw/
	qI0KvanCwy6fPPirwY35DJp+UNos9LKAzdqck9iD2vBFT79bJrJ/3GCpqgWoELmFtXCo
	OAqfkS5vOD40218YTvt49X4ZDkERClNyJjX1wUWRZA/DC8N0Jvi+1Tw8HSQIJhFzir2x
	Rksg==
X-Gm-Message-State: AG10YOS/V4BzyB+QjSvOtk9+5G7f+uO7zE/yJ17iqFD/h4n7QleRzT8CZJ7PoGSG6FFo/1wA8epYVsHHObzV6A==
MIME-Version: 1.0
X-Received: by 10.107.3.220 with SMTP id e89mr4396935ioi.99.1454362491360;
	Mon, 01 Feb 2016 13:34:51 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Mon, 1 Feb 2016 13:34:51 -0800 (PST)
In-Reply-To: <20160201143944.GA2639@jama>
References: <20160201143944.GA2639@jama>
Date: Mon, 1 Feb 2016 22:34:51 +0100
Message-ID: <CALbNGRT62=pA=DzGQB=zMiPu9dCY9u5EkriDrL-XNLyp3qvnaw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, Failed tasks 2016-01-30
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
X-List-Received-Date: Mon, 01 Feb 2016 21:34:54 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 1, 2016 at 3:39 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> === common (8) ===
>     * /meta-openembedded/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb, do_install
>     * /meta-openembedded/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb, do_install
>     * /meta-openembedded/meta-networking/recipes-daemons/squid/squid_3.5.7.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-connectivity/thrift/thrift_0.9.3.bb, do_configure
>     * /meta-openembedded/meta-oe/recipes-extended/efivar/efivar_0.21.bb, do_compile
>     * /meta-openembedded/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb, do_compile
>     * /meta-openembedded/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb, do_configure
^ Anybody able to volunteer/test

-EXTRA_OECONF = "-with-vala-api=0.28"
+EXTRA_OECONF = "-with-vala-api=0.30"

Andreas

