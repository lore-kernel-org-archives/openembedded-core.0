Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
	[209.85.208.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2A7447EEB8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 09:22:39 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id m23so1317234lje.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 02:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=uICJqsApD49mV/z1V23CzxprQVSVeTPgNM9Iqtnq0aI=;
	b=E4JrUXzgIqh0kReqbhiIF90EaTNTC7Ztx3J6gq4rbVm0FdyWmlIz+Z74UpJ5kT5hwk
	W/aHmEyIs1SEKJT1kWqlgmJrFSOBlTBM+YcO3eqgm8pAGqbRk/hMeDPF7ME756yMr6Kl
	Cuz687IzQVEdewOSHOarovCZO7LECm87+bsdxbVFeivDx+kGvMinzoCXsXEIhX8l0gBt
	wHN/bAcanO3ArRoj1j2AxgPQYCDXx0j5krvX0jw8E/xMiC9Bb3p5Mb8y0ojnbHZpZBYI
	BizBR7L9mtOxmoS81Jx/DCDe7AxeXx/xf8rJ5gBse7HqKCt+AWw7SKbW3a+eRKN5aiTX
	6ycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uICJqsApD49mV/z1V23CzxprQVSVeTPgNM9Iqtnq0aI=;
	b=e5kxokFz1wnfdHR9OSijFSCczcXb8dC8rhLksiMfv9oya8Z7jpXPGU1XSIKwJIDfhp
	lHuIHQoDy5dgGJiuigTphO8LX09h99BJSpKi1KFsUPSDXcmd1gLrt+txTuc5OtLJhgZw
	M7pw7DVMQ/sULT67IqubMtbFEOkBI3RYfF5KWEk6BRQDkFazqenzw9HBXALVYrg0e/F/
	vW4k3qReWepoRzBoFutbGHguX/hJEdaApCEZnlm8tLAgUAggcGxZxLPMzhHJeRbv4skM
	vKkt4jrFcvWWdPfqLK2ElhwaNCbKJV7xlDVeCW09rHTAvJao7qTUKx/FzTeBURKlHrwE
	+oSg==
X-Gm-Message-State: APjAAAVPNe1O78NJZQVbrxY433SyfpjCdm+QvVZgcHEsaGdjccdfjIxj
	AHqougqKX9++R9/QDcrxZnkTuEIjILykf8IM+w/xbJhd
X-Google-Smtp-Source: APXvYqy96vjoPOt01zq5mNG7KDWCjZleCZzJaMnNd+86ZaujYN5U0C66s0lGIU2aKMAZSLlw4ZurxU8dsOhvJM4DFH4=
X-Received: by 2002:a2e:8155:: with SMTP id t21mr16688054ljg.80.1562750559509; 
	Wed, 10 Jul 2019 02:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <CADySD0HgOebmE=uUJ718CBhsXv3bW7WoeXa4dp06LL=vcLd_qg@mail.gmail.com>
	<CAJTo0Lbm1DVcwKFjYBaXWsgzTGLbRRH2aFEzgTi0MAGQXQ4T_w@mail.gmail.com>
	<CADySD0E7mwou1DeeTWfjdXh3QjqM9oMDvLsVbkXMrFZCfcgdug@mail.gmail.com>
	<CY4PR12MB165398EE661D4CA2995CD0558BF60@CY4PR12MB1653.namprd12.prod.outlook.com>
	<CADySD0HHhJHacwP0HXR52dpw1SEjg60y9-RRvuNgDHJFTw46Aw@mail.gmail.com>
	<CADySD0Hz1mmT29kZF6=0=kw3Af+8+OAaKMxUvfXXPpcM+2LASw@mail.gmail.com>
	<CY4PR12MB1653A8BABBBED9BEDD00DAC38BF10@CY4PR12MB1653.namprd12.prod.outlook.com>
	<CADySD0EHCuxKuauvLxW7OE0_O1Fz--qBH+c0uqCfkjEo3EDeXw@mail.gmail.com>
In-Reply-To: <CADySD0EHCuxKuauvLxW7OE0_O1Fz--qBH+c0uqCfkjEo3EDeXw@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 10 Jul 2019 21:22:29 +1200
Message-ID: <CADySD0Ec2ZR67WSAS7hzVEzibxwku9QQ0WGxp=EXEc3DbeF7pw@mail.gmail.com>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Problems with sstate-cache in Artifactory
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
X-List-Received-Date: Wed, 10 Jul 2019 09:22:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chris,

I tried uploading sstate-cache again in Artifactory but this time used
jfrog-cli (https://www.jfrog.com/confluence/display/CLI/CLI+for+JFrog+Artif=
actory)
instead of curl and now it is working fine.

regards
Ankur

On Wed, Jul 10, 2019 at 1:39 PM Ankur Tyagi <ankur.tyagi85@gmail.com> wrote=
:
>
> On Wed, Jul 10, 2019 at 2:28 AM chris.laplante@agilent.com
> <chris.laplante@agilent.com> wrote:
> >
> > > DEBUG: For url file://5c/sstate:u-boot-ti-staging:wsl-linux-
> > > gnueabi:2019.01+gitAUTOINC+06e0b5babe:r17:wsl:3:5cdf9380b9b3f8c94a706=
344cf19554a_packagedata.tgz
> > > returning https://artifactory.local.gallagher.io/artifactory/rnd-yoct=
o-packages/sstate-cache/wsl-thud/5c/sstate%3Au-boot-ti-
> > > staging%3Awsl-linux-
> > > gnueabi%3A2019.01%2BgitAUTOINC%2B06e0b5babe%3Ar17%3Awsl%3A3%3A5cdf938=
0b9b3f8c94a706344cf19554a_packagedata.tgz;
> > > downloadfilename=3D5c/sstate:u-boot-ti-staging:wsl-linux-
> > > gnueabi:2019.01+gitAUTOINC+06e0b5babe:r17:wsl:3:5cdf9380b9b3f8c94a706=
344cf19554a_packagedata.tgz
> > > DEBUG: checkstatus: trying again
> > > DEBUG: checkstatus: trying again
> > > DEBUG: checkstatus: trying again
> > > DEBUG: checkstatus: trying again
> > > DEBUG: checkstatus() urlopen failed: HTTP Error 404: Not Found
> >
> > Is this mapping correct? Does using curl to download https://artifactor=
y.local.gallagher.io/artifactory/rnd-yocto-packages/sstate-cache/wsl-thud/5=
c/sstate%3Au-boot-ti-staging%3Awsl-linux-gnueabi%3A2019.01%2BgitAUTOINC%2B0=
6e0b5babe%3Ar17%3Awsl%3A3%3A5cdf9380b9b3f8c94a706344cf19554a_packagedata.tg=
z;downloadfilename=3D5c/sstate:u-boot-ti-staging:wsl-linux-gnueabi:2019.01+=
gitAUTOINC+06e0b5babe:r17:wsl:3:5cdf9380b9b3f8c94a706344cf19554a_packagedat=
a.tgz work?
> >
>
> Yes, curl/wget can download it. What wrong do you suspect here?
>
> Thanks
> Ankur
>
> > Chris

