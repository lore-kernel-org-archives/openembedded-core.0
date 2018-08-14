Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9478E74576
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 08:18:49 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id j205-v6so32113867oib.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 01:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UKSNClG67N3G0fp35y1slQAB+bnUrkQRbJYN18Ij8TI=;
	b=WcN+LjFqDBYkoWz/IKjDDv4rgd9PabQrjn43rwhyuIE4PEJDyEClhxtJ38nY7NLlCM
	goT2eW0oVEPziHxMPF85qj8vCxLz56PNWhh7C79h6R/oMBhqrZold3b4YnUxzRL6bPjh
	lCNGAMdnI5oFz0V0bqvNCXYA5K2mMUxcORIPADPn0gmhw42/HbWEYXMSHF2OV3OHgoww
	UfyecbmIXfA3Hql9sz09XQcC3EmqpKwS5tPEpDn8+c+yQTzpgBAVR97YfbUncbZ9twod
	+T79pUqdDSkMEOXakAdlToAdOnNMBp2HVpfTC72HAlwVWGZT/4Nj99P10q18txXsNJvN
	PKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UKSNClG67N3G0fp35y1slQAB+bnUrkQRbJYN18Ij8TI=;
	b=fbOw5I2FLfmbBmkhwV7yDqPl6wtlg7eD9LP9UAa9lOr3PsweEm3hY+6UdLog+X1uIm
	4VPMI332sLjcYYgUYUirQjxUmnhtQKWAL/OgE2mfFmQUeU/5d62mGDdOLztfNApfeDrI
	SlPR5q5mtEqIZa7b8mTJtBrXD3XNIkSVHuDCzEjy6tNbwMk1cJg5s3gUMrXK9X+ENEHJ
	Evhc/AgxHVv4AT94OyK5YVyCnWi5we7DXdTRovAMO0bdVgUcmUfH8F6YqKv1SaEcr2ly
	mVfyXoq8S+yJD0qDujcgJijFWxc0KPvIIkBWRbpfAVIgZRChhUitkU+LObKBhLPOKjdm
	imFA==
X-Gm-Message-State: AOUpUlGzIJpxEKKSC6A2VTMbz7vV8dYq/vvmDzxZZI5ymLtXP8Fp2NGO
	BbBeMblLRPU142aHV+02vdzNVS/ZrGOcV1ylzYI=
X-Google-Smtp-Source: AA+uWPy0WMdIAJh6+zb73LziFNwnx1meK0rA1U/qPSUOu0x9Yv8TKV8mf93mbGNSGM/Mp6ZpF5+TZwEdL0HR3m/k5+M=
X-Received: by 2002:aca:e80c:: with SMTP id
	f12-v6mr23101570oih.38.1534234730621; 
	Tue, 14 Aug 2018 01:18:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Tue, 14 Aug 2018 01:18:50
	-0700 (PDT)
In-Reply-To: <SC1P152MB138947050EB80F8E776671CB94390@SC1P152MB1389.LAMP152.PROD.OUTLOOK.COM>
References: <SC1P152MB138947050EB80F8E776671CB94390@SC1P152MB1389.LAMP152.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 14 Aug 2018 10:18:50 +0200
Message-ID: <CANNYZj9kfU8RQiVFE9eL79KLqJ280gf3SOKsmTAYyOFd3NgwvA@mail.gmail.com>
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
X-List-Received-Date: Tue, 14 Aug 2018 08:18:49 -0000
Content-Type: text/plain; charset="UTF-8"

Simple - add python3-modules to the packagegroup. Sadly this seems to
be 'common knowledge' that is poorly documented.

Alex

2018-08-14 0:51 GMT+02:00 bhas_purk <bhas_purk@hotmail.com>:
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

