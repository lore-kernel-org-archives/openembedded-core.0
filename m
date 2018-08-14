Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 18D5678F73
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 10:04:08 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id d189-v6so32545259oib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 03:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FbJ9GO4plPw838b5j9X9IdLSzPryw9p+hC4N+u8GURE=;
	b=NiAIBBCGRBj9Gj0p0dzWKYXHSQe91Dg617WmDqjF3D9YJlHDnI07NAtWjUmbqBA8Tm
	QBy75FvBkUgS+lAFI8Vifq+DsTzVWysEZ2+mUNHnLHHVaEOS1KdvOph2YECZBPSLsrEx
	nVDorOHKI2hZLRNm27BEU0ablkckedCzFdObg9FrOPxW7cDNjsXuRSsDIcqwWtj46DHb
	G6T3YTUL5sm57yAghOeR1dakGN7EAlc0dLY9xswku4f4I1UhF9wJj5Aem3DgIKm3uFXH
	fTaJnbtlwodQTivuQC9+lcwTgraR6/PHBbe2P723n4ZDJkaQbhPYWfTMVM21WpurI5Sy
	m8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FbJ9GO4plPw838b5j9X9IdLSzPryw9p+hC4N+u8GURE=;
	b=Nhn1ZU1/c2OedHMCbCg9VkSmvMqKIfRZL+TqAL/2OwJfdzuEMwKXaZ/qr5XRv5R5aj
	cVV8rKoFXRkBzJnI2OvBTcCKYTGRTsM+sYajwIU9b3yujswVlTuNrl8f/a/dCJCZDUNE
	kzJBmGjFZnX8BGBQqOecz6aYQg/8PcXgz32n4u0EvP1XTIPNC24+z66p4pg7GHDIK92z
	MCGMUireAaKriKySkD6GbezhPwiAA2BWJe7alGcjExjmZwmbggp41wVoJr/CK9qXuZSy
	Zy9iheDdGAlLJGWMBmWrQrOQGCdgCGkv+jomNF7LDex7UUzo1T2BnmOeFlHoKcCR2DDt
	rIWw==
X-Gm-Message-State: AOUpUlFCGBagUvhPQA37ePw3lkIuCka+nTheV21ONxaaH8gIx5l5yRR6
	5OZJbvpKSBb1Z4IFirdSpMNEVIh6YKW8WTvZNbGjDA==
X-Google-Smtp-Source: AA+uWPzIIzT0sFgca50OD+OhK7tLZRyr4viQD2hgFwNLouGCCpdWT5NNoWL8wS2GOcxA4l6miOoFx6b1miOP/+i9P7A=
X-Received: by 2002:aca:3f41:: with SMTP id
	m62-v6mr5013906oia.18.1534241049165; 
	Tue, 14 Aug 2018 03:04:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Tue, 14 Aug 2018 03:03:48
	-0700 (PDT)
In-Reply-To: <SC1P152MB138947050EB80F8E776671CB94390@SC1P152MB1389.LAMP152.PROD.OUTLOOK.COM>
References: <SC1P152MB138947050EB80F8E776671CB94390@SC1P152MB1389.LAMP152.PROD.OUTLOOK.COM>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Aug 2018 11:03:48 +0100
Message-ID: <CAJTo0LYgDUGO=+HiWeZnb-WR554Gi=PFGsHTm42FLqBKYPX=bQ@mail.gmail.com>
To: bhas_purk <bhas_purk@hotmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: adding python modules
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
X-List-Received-Date: Tue, 14 Aug 2018 10:04:08 -0000
Content-Type: text/plain; charset="UTF-8"

If you're referring to the standard library modules then they should
be installed for you as when you say to install python3, you actually
get python3-modules.

If you want to install further non-standard modules then just add them
to the image, for example python3-pip will give you pip.

Ross

On 13 August 2018 at 23:51, bhas_purk <bhas_purk@hotmail.com> wrote:
> Hello,
> I am new to yocto, and we are using this for an Intel SOC.
> I am creating a console-image, and wanted to get python3 in the rootfs.
>
> So I added python3 in the recipe file -
> layers/meta-openembedded/meta-oe/recipes-core/packagegroups/packagegroup-basic.bb
> This gave me python3 in the rootfs and I can run ptyhon3. So that is great!
>
>
> Now I would like to add some modules to python such that they are built in,
> and I dont have to do a pip install for the modules.
>
> I see that there is a script file which generates the manifest for all
> modules will be there.
> openembedded-core/scripts/contrib/python/generate-manifest-3.5.py
>
>
> I would like to edit this file to some python modules, and am wondering how.
>
> For example, one of the existing modules in the script is defined like this-
>   m.addPackage( "${PN}-argparse", "Python command line argument parser",
> "${PN}-core ${PN}-codecs ${PN}-textutils",
>     "argparse.*" )
>
>
> So my question is, for the modules I would like to add, how do I know the
> dependencies etc? And more importantly, is this the right way to add modules
> to python3 in the rootfs.
>
>
> Thank you
> Bhaskar
>
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

