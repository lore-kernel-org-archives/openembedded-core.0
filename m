Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 770A06D548
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 22:28:21 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id x15so30077096wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 15:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=2SRC2X0hJgu6id531bTClj4tV9Y4RqMdvj747SzBrQ0=;
	b=aLeeAtsIdjRU2isl4fSUL2Cdmg8vZuM2dJu0tqJLmbSiJVqFwJmmOueStzVwmo4+db
	QFbZtS93zN4jM9XOoAzk2DYMasdoB75WlWCJSPhxmNhtGeFgAfqldNquK1/QeccTSOGR
	qxw0kxiAuhXfyuihd0Bah7oXLEL8aqw6JEZEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=2SRC2X0hJgu6id531bTClj4tV9Y4RqMdvj747SzBrQ0=;
	b=ata94gUZ/RfYq4K7mI6K9O31KhQhyxF2Sb8cyLGX63w5oL4uNzmnnPfODJg5R96Hvq
	zjOFHL3YWdah9IbLZRB27gsOEChVTOvBRLu+2RMXGpAC+M9ngGkyOHmM6bSkCfD59pIC
	CsJR23bTNOYBUMA6Vs3vIGp+AfcIyVYoAA80X5P3DZYYYG7jyz9HfpDJ/2xzO9LydmH1
	XC+JTjH30vvuZeC/KU/KU1N8J/jCK2eelOEX5thYZyE5MxaOPgBHgGuZq3+wE9K016JN
	DgWUAl4ym+hnfWyJ7qtVdpF66KBBTgQZ4zwFH3yf7fq+VZFlAxLMeNKTtDic1BO03aRE
	/XGQ==
X-Gm-Message-State: APjAAAUPzvY21bIPTIsrY+0nSN4SLHglWVa6DpBPMF2EQTcbsv+u9Jjw
	zloOVNkZ94b7F9MPKCnN4FnXOw==
X-Google-Smtp-Source: APXvYqzDIqokswbpPSGjXaPbufcNNx6jdqSujx9cdXzFGreia/Syz08gyt21yJDwcPKLuEAy9GdLUw==
X-Received: by 2002:a1c:a101:: with SMTP id k1mr51057166wme.98.1563575302200; 
	Fri, 19 Jul 2019 15:28:22 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f70sm34303408wme.22.2019.07.19.15.28.20
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 19 Jul 2019 15:28:21 -0700 (PDT)
Message-ID: <a3ee2977ee2d63f1908f110d9273352815ba7d35.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Burton, Ross" <ross.burton@intel.com>, Kang Kai <kai.kang@windriver.com>
Date: Fri, 19 Jul 2019 23:28:19 +0100
In-Reply-To: <CAJTo0LbmYp-70L=Z_T0jE4xS1mR_vLXKQE18O_EpeEwD6wdroA@mail.gmail.com>
References: <20190704134520.16320-1-kai.kang@windriver.com>
	<20190704134520.16320-2-kai.kang@windriver.com>
	<CAJTo0LbmYp-70L=Z_T0jE4xS1mR_vLXKQE18O_EpeEwD6wdroA@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Poky Project <poky@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] defaultsetup.conf: enable select init manager
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
X-List-Received-Date: Fri, 19 Jul 2019 22:28:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-07-19 at 22:35 +0100, Burton, Ross wrote:
> On Thu, 4 Jul 2019 at 15:40, <kai.kang@windriver.com> wrote:
> > +++ b/meta/conf/distro/include/init-manager-systemd.inc
> > @@ -0,0 +1,6 @@
> > +# Use systemd for system initialization
> > +DISTRO_FEATURES_append = " systemd"
> > +DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " sysvinit"
> > +VIRTUAL-RUNTIME_init_manager = "systemd"
> > +VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
> > +VIRTUAL-RUNTIME_login_manager = "shadow-base"
> > diff --git a/meta/conf/distro/include/init-manager-sysvinit.inc
> > b/meta/conf/distro/include/init-manager-sysvinit.inc
> > new file mode 100644
> > index 0000000000..7725b30e1e
> > --- /dev/null
> > +++ b/meta/conf/distro/include/init-manager-sysvinit.inc
> > @@ -0,0 +1,6 @@
> > +# Use sysvinit for system initialization
> > +DISTRO_FEATURES_append = " sysvinit"
> > +DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " systemd"
> > +VIRTUAL-RUNTIME_init_manager = "sysvinit"
> > +VIRTUAL-RUNTIME_initscripts = "initscripts"
> > +VIRTUAL-RUNTIME_login_manager = "busybox"
> 
> Back when I integrated systemd into oe-core one of the use cases was
> a single distro that builds a main image using systemd, and a
> rescue/update image using sysv/busybox.  How is this possible with
> this system?

We're still missing one or two init system setup variants, I was
planning to add those and convert our autobuilder tests over to use
them rather than the fragements that are currently coded into
autobuilder-helper.

> Personally, I'd prefer to see the DISTRO_FEATURE wrangling left out
> of those files, and let the user ensure the right features are set.
> After all, systemd will refuse to build unless the systemd feature is
> enabled.

With the addition of the "none" default, users aren't being forced to
use them so that can do something custom or use a precanned default
which I think gives the best of both worlds?

Cheers,

Richard


