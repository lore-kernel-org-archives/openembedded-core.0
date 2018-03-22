Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 29F87605BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 09:13:50 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id j2so3094058pff.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 02:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TKsVwRQMTPsUFDmxF4VCyeP9qzwvDA0Ao7TxKdkDO3E=;
	b=D2lL82gbKoB3dSbOa+OycCXLAexGCN3ImyfrOiHMctLj9wsYraAEG5qlajEgzq7laq
	/3UbvpAMO7RIYbD3OhrYeDFjoqU+htvQRqIH4EV2g7Whg8Fj96BhDnNMSqYGEL3XC0/m
	9/8AIj86TBGumcDQBKInHEhtI6S+bD+OqA2nl/nXHBWf+z/h4To0zBLEXZm76iUA3YWz
	kpfVoJIEPrenUtJeCH/mPDRJFopmopAbwoslrdAx+vKqcpGd+qshyarVBgjLbC3M4Qgi
	V0bErnAiHDF8Ls8VttEvK/e57TAg7VebKc+5fOhj2Neadn7RWoJ+0jq588I394P0WohM
	MZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TKsVwRQMTPsUFDmxF4VCyeP9qzwvDA0Ao7TxKdkDO3E=;
	b=VGAivRaOnm5nnpe5ykEo5Qzg+3ngP+Cu74RHS9NELAHlfH1ksne4Tf/JqSpMTeZSTx
	UrsnhXqri6nbJpd1rIPRziADAAN8aRVruk+/Elv2RStysLiiFTgbyayHRz6OBQsQKEq9
	o9lkR+i8b9diJTNpBKkgylnTAgqrwYtIA1DUEAit/pLReuj4K0EfwmjbI1aURFOCTX3t
	g78FCkjtfIX/KSUk1muhsD9063CBtpGb4JI/ft241kExTCcKON84EPaYFZnQ079+VnTw
	smdzdHTiSAYEBEiPhyLA8pfNHltMVfgYzuCA6tbTBaSNcxNtT7hp/NFU04x/zERLCLqS
	+8eQ==
X-Gm-Message-State: AElRT7FLtyU+LaZ/OQATsOCHiGHMdw5/TMSXT7iUdZcuab940Osnvgzo
	z0qAsIOZJEwWT7ZS+UmPHViKJmOMbGNGkB8Nnxg=
X-Google-Smtp-Source: AG47ELs9/uYuKkqawNQi5z+lS+o3H1UxoavBB+ukKf0/Fgl/hdn4jPFJfrRgJX+RYviHsRss8vcvtdf2KmwLb0Kx/EQ=
X-Received: by 10.101.73.207 with SMTP id t15mr3122066pgs.204.1521710031389;
	Thu, 22 Mar 2018 02:13:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.241.68 with HTTP; Thu, 22 Mar 2018 02:13:20 -0700 (PDT)
In-Reply-To: <CAPGMVzF+sVEzWbTfuYdKkVHv+ktcUU7Lxdv_2C_ArEBbDiSUsw@mail.gmail.com>
References: <CAPGMVzF+sVEzWbTfuYdKkVHv+ktcUU7Lxdv_2C_ArEBbDiSUsw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Mar 2018 02:13:20 -0700
Message-ID: <CAMKF1sr+NAJEDVProHEExtHZk96Zygbiwq7+5V0wTO6KRB8pMw@mail.gmail.com>
To: Rajath C S <rajathcs.1996@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: package inclusion
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
X-List-Received-Date: Thu, 22 Mar 2018 09:13:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 21, 2018 at 9:58 PM, Rajath C S <rajathcs.1996@gmail.com> wrote:
> Can i install tensorflow and h5py (since they are not there as recipes)
> using Internet on yocto? (just the way they are installed on ubuntu or other
> host OS)
>

may be you can use on device SDK and build it natively on
your target

EXTRA_IMAGE_FEATURES_append = " tools-sdk"
IMAGE_INSTALL_append = " python coreutils findutils git zlib tar"

then checkout the sources on target and build it. You might need more
packages then keep adding them to IMAGE_INSTALL and rebuilding image

