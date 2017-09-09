Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com
	[209.85.161.174])
	by mail.openembedded.org (Postfix) with ESMTP id 40D006025F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Sep 2017 21:33:41 +0000 (UTC)
Received: by mail-yw0-f174.google.com with SMTP id q80so14840160ywg.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Sep 2017 14:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=PrsasVLTc+QQYnvBWe4F255bCa76m+YcwYHdWl04LUc=;
	b=mrxNvxU3d8pO3eUEuOpqxboTyYaQAR0n+sWSTuLytWpYYL2kjyG8spss1/KYB+7VIf
	g3y7OeM5VUSKKHQH9HeK/m4VHyLDUBCrwMcvyqWCc1Rk54jCISW2cr2B1aL09+IfTmZd
	nFna2Ar93cD0RZxRzI2vPuOKhOmiSVicjGazaUJs+ISQ3D2zq4Jso0bl+5h5ta3rIdRo
	SXoGPJBuHT+GVNlwCMVDdl1BBGJzoDp68OHPfUpf4eRFXRyqJr0pz7Ow4sB0k8hcZHP2
	rCSZcre/NEjkuSuzSbHi6jXR18EcYCilQhI3B+1HKcBe0dh3WW9ZxMVwAZJfKxN150gk
	h43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=PrsasVLTc+QQYnvBWe4F255bCa76m+YcwYHdWl04LUc=;
	b=EldEmAh8V0ZsbDuUSDhH8xdsynjMbsX5LXmGpblPVrldzCWDGBN+d4pzyLqNcJxAoi
	OBDpOkxK6UzwVmhHlTBrEALesWBlg3aZZAWn/p86L1knrkxLSKt3vyfeE2Hn4BLuwOdm
	kTbZKwKRuz+I6Q3ttXYe2Ru54AEiBx8Z1uirNwJHXu/QlCVBXJoX052TB/TPKkU+3jaS
	g2LevLWfsa0conl8XNYQWCxlKQuyhH/xbXzoklBCKvEV/nfa1eqrZibBakNt2LG9vnGm
	47dk2jjYQZ6Bb388ZKSXHLhkO8lvdksJv2xQZ/Q+0hgfeoV1Vdr56QPIMMLKiSyGOSPx
	udZQ==
X-Gm-Message-State: AHPjjUi5MF2ntMGezu1oJu4M4uVFawMdF67SGLtbyE6weMaB/JSrIVCp
	vz6POmjZUf+oiarXxwc=
X-Received: by 10.129.188.81 with SMTP id b17mr5762439ywl.438.1504992822273;
	Sat, 09 Sep 2017 14:33:42 -0700 (PDT)
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com.
	[209.85.218.53]) by smtp.gmail.com with ESMTPSA id
	s27sm1877527ywa.37.2017.09.09.14.33.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Sep 2017 14:33:40 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f53.google.com with SMTP id l74so25944170oih.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Sep 2017 14:33:40 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCpoTRRXcPMJIc98AHCvK3qywa1GKDEbkg41HSx13CYUT6P5b3EZWM4FIHCrWg2Z9VbkUdcD5BMtB2JuTkSGwQ=
X-Received: by 10.202.56.194 with SMTP id f185mr6259462oia.249.1504992820068; 
	Sat, 09 Sep 2017 14:33:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Sat, 9 Sep 2017 14:33:39 -0700 (PDT)
In-Reply-To: <20170908221221.24444-1-california.l.sullivan@intel.com>
References: <20170908221221.24444-1-california.l.sullivan@intel.com>
Date: Sat, 9 Sep 2017 18:33:39 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp5JuuuExXx+34zQqcyfaH3xXRDKSkQuTWg9gZhD1ESpg@mail.gmail.com>
Message-ID: <CAP9ODKp5JuuuExXx+34zQqcyfaH3xXRDKSkQuTWg9gZhD1ESpg@mail.gmail.com>
To: California Sullivan <california.l.sullivan@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] initramfs-framework: split setup-live and install-efi into separate recipes
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
X-List-Received-Date: Sat, 09 Sep 2017 21:33:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 8, 2017 at 7:12 PM, California Sullivan
<california.l.sullivan@intel.com> wrote:
> Having these the initramfs-framework recipe forced initramfs-framework
> users to build several tools they didn't need, and made it more
> difficult to declare the recipe as allarch.
>
> Fixes [YOCTO #12024].
>
> v2 changes:
>   * fix SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS in layer.conf
>   * bump PR of initramfs-framework
>   * add allarch to setup-live and install-efi modules, as they're just
>     shell scripts
>
> v3 changes:
>   * set PR of new recipes to 4, as the name of the packages they build
>     is the same as when they were part of the main recipe.

I'd drop this from the commit log.

> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>

... other than that,

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

