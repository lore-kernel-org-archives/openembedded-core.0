Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8A56078F5D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 21:37:33 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id x197-v6so11864972oix.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 14:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=4CEsdA5YCbApVlpamC36K+b9OX7TSKfYO15jjax5wFw=;
	b=O0geEFfqeUjWf5UyQq0QWM0yEQ5gzwwrpinJPEZDV9VmqGPaKvC8L9tjrKxdZF7fk4
	c6K2UwNRd/zaZewoIODzPWOS6Q+v0LqyMbPP3Jkhg2lusGmPB7+4x8QZj0HDdIdiTUUM
	T0h5q/5zDtVfzaZ0moDT/E/8rkgHlCwP/Recjh5RRC+X0MrpiXRW21a7MU72+dWNkU37
	qsOzG1DuUjPMNCTu2a7aTLanjPcIFUUt7nXBdjruDcMWx6GQpf7B1nkNxVoOOESgOPx+
	h4svlEa7TC3G26um3glWsITEKFGuVo9TWWQblus43G0faZC159qKQbsK4GoGt98m8UYK
	YK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=4CEsdA5YCbApVlpamC36K+b9OX7TSKfYO15jjax5wFw=;
	b=kzJsQt7F8ZGamMVkNC8kcSmp47ilAZ6nqdbgbrSo1THM5gaRrR2mVpNgggeS7AaU24
	UKr8ddYR5pQfgkv8ji/3RyYHtDFVCFxINxuj95ugXTcDlNU3/pLT/pXzWDhLDIJdzgeh
	AXtCklR78VlkwwLm9BLkl5pwQ/ZYhfzYQM0vAoaeIm0auVIxVp7OFJZR4en7Nh4ThT65
	zDbFhzdwxoH+ZkJsYHN2m1LYXci6TXYCEYtJrVfchq4x1mMOeKI/mI2krQHl0CK2VMiw
	XxPjuaaGtLHeK+oWZLaq6vhdrFtoqT0T6LDLislsUyye0u0TgUZnzYcEDiccJ7Frg3jS
	pboA==
X-Gm-Message-State: APzg51CFLpGE7hcKtXoYTcwd6DGI4b0Zg8HwAp++w5q4BxU2X3BWQru6
	phXnDpC0CDbgPyYPNaEgBPnCZVSjTaCEyQ==
X-Google-Smtp-Source: ANB0VdaDuBxnjp0LXC5/V1VnRVHTp+h9gwc+70ef0zF1IOvqgMQqSbVGDYuzzPSbLSDR32LPdJhl9Q==
X-Received: by 2002:aca:ce85:: with SMTP id
	e127-v6mr4609573oig.169.1535578654081; 
	Wed, 29 Aug 2018 14:37:34 -0700 (PDT)
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com.
	[209.85.218.47]) by smtp.gmail.com with ESMTPSA id
	v202-v6sm4293168oie.47.2018.08.29.14.37.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Aug 2018 14:37:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f47.google.com with SMTP id k81-v6so5723681oib.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 14:37:32 -0700 (PDT)
X-Received: by 2002:aca:db09:: with SMTP id
	s9-v6mr4246925oig.339.1535578652173; 
	Wed, 29 Aug 2018 14:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <7AA7B88A6FC2B84F9AA5EF03A8A6FCB201348A030B@ALA-MBD.corp.ad.wrs.com>
	<bebc4ced-47eb-9cb8-4df5-4716a2dd4d11@windriver.com>
	<CAP71WjxgSESvWm=FO=O0cmY+UE82OEc3L=2ioJp9K4xuhZ_hRQ@mail.gmail.com>
	<0f31c417-75ef-fdd4-925f-de320a778275@windriver.com>
	<46251E21CF6D2D45A2D672A9B36E9FF34EC18912@fmsmsx104.amr.corp.intel.com>
	<7AA7B88A6FC2B84F9AA5EF03A8A6FCB201348A4B2F@ALA-MBD.corp.ad.wrs.com>
	<CAP9ODKoiejC--zVT=rCoT02emZ687eAxb8ZhZjcvCuNa+aBkTQ@mail.gmail.com>
	<dffdb339-f835-7ad6-2d8f-a04b20237364@windriver.com>
In-Reply-To: <dffdb339-f835-7ad6-2d8f-a04b20237364@windriver.com>
Date: Wed, 29 Aug 2018 18:37:19 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqaDGPvpaGDZm6bFSZxcvewk1tGBw0sPMox5s1bzSHHxg@mail.gmail.com>
Message-ID: <CAP9ODKqaDGPvpaGDZm6bFSZxcvewk1tGBw0sPMox5s1bzSHHxg@mail.gmail.com>
To: yang.wang@windriver.com
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	jair.de.jesus.gonzalez.plascencia@intel.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Yocto Project Bug 12372 - Automate the execution of pTest with LAVA
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
X-List-Received-Date: Wed, 29 Aug 2018 21:37:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 27, 2018 at 7:08 PM Yang Wang <yang.wang@windriver.com> wrote:
>
> On 08/26/2018 10:04 PM, Otavio Salvador wrote:
> > On Fri, Aug 24, 2018 at 11:23 AM Wang, Yang (Young)
> > <yang.wang@windriver.com> wrote:
> >> I see some good feedback from people mentioned they are working on similar solutions and should come out soon. We will continuously work on this ticket.
> > Did you consider using labgrid? It has a lot in common in current
> > infra we use in OEQA (ptest and like) and has nice capabilities to be
> > used locally and remotely.
> >
> Quickly had a look at labgrid, looks like it is using similar method to
> control devices with using configuration files, in this case, target
> controller is common, with using different type of YAML config files, it
> can control different devices. (Please correct me if I'm wrong.)
>
> I think the key point of this ticket is to run Ptest on hardware devices
> automatically and make it as common as possible for Yocto. So, no matter
> using LAVA or labgrid, the devices being controlled need to be publicly
> accessible and maintained well.
>
> Do you have examples similar to this ticket can share with us?

I don't but I think it would be worth checking with Pengutronix if
they could provide some.
-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

